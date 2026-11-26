param(
    [string]$ProjectRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$phaseRoot = Join-Path $ProjectRoot 'phase00'
$upstream = Join-Path $phaseRoot 'upstream'
$evidence = Join-Path $phaseRoot 'evidence'
New-Item -ItemType Directory -Force -Path $evidence | Out-Null
$log = Join-Path $evidence 'phase00-rerun.log'
"Phase 00 rerun: $(Get-Date -Format o)" | Set-Content -Encoding utf8 $log

function Run-Step([string]$Name, [string]$WorkingDirectory, [string]$Command) {
    Add-Content -Encoding utf8 $log "`n## $Name`nPS> $Command"
    Push-Location $WorkingDirectory
    try {
        $savedPreference = $ErrorActionPreference
        $ErrorActionPreference = 'Continue'
        $output = Invoke-Expression $Command 2>&1 | Out-String
        $stepExit = $LASTEXITCODE
        $ErrorActionPreference = $savedPreference
        Add-Content -Encoding utf8 $log $output
        Add-Content -Encoding utf8 $log "exit=$stepExit"
    } finally {
        Pop-Location
    }
}

Run-Step 'environment' $ProjectRoot 'py --version; git --version; node --version; npm --version; conda --version'

$kv = Join-Path $upstream 'knowledge-vault'
if (Test-Path $kv) { Run-Step 'knowledge-vault utf8 regression' $kv '$env:PYTHONUTF8="1"; py tests/test_kv.py' }

$mindcite = Join-Path $upstream 'MindCite'
if (Test-Path $mindcite) { Run-Step 'MindCite synthetic smoke' $mindcite 'py tools/smoke_test.py' }

$rkw = Join-Path $upstream 'research-knowledge-workflow\mcp-server'
if (Test-Path $rkw) { Run-Step 'Research Knowledge Workflow core tests' $rkw '$env:PYTHONPATH="src"; py -m unittest discover -s tests -v' }

$lit = Join-Path $upstream 'codex-literature-workflow'
if (Test-Path $lit) { Run-Step 'Codex Literature Workflow tests' $lit 'py -m unittest discover -s tests -v' }

$damon = Join-Path $upstream 'damon-academic-workflow'
if (Test-Path $damon) { Run-Step 'Damon example schema' $damon 'py scripts/validate_card.py examples/heavy-paper-deep-read.example.json' }

Write-Output "Wrote $log"
