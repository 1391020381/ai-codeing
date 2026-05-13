#Requires -Version 5.1
<#
.SYNOPSIS
  Run gofmt -w on the .go files involved, then go run with the same arguments.
.EXAMPLE
  .\go-run-with-rewrite.ps1 *.go
  .\go-run-with-rewrite.ps1 main.go helper.go
#>
$ErrorActionPreference = "Stop"

$runArgs = @()
if ($args.Count -eq 0) {
  $runArgs = @(Get-ChildItem -Path . -Filter "*.go" -File | ForEach-Object { $_.Name })
  if ($runArgs.Count -eq 0) {
    Write-Error "No .go files in current directory. Pass files or run from a folder with *.go."
    exit 1
  }
} else {
  $runArgs = @($args)
}

$goPaths = @()
foreach ($p in $runArgs) {
  if ($p -like "*.go" -and (Test-Path -LiteralPath $p -PathType Leaf)) {
    $goPaths += (Resolve-Path -LiteralPath $p).Path
  }
}
if ($goPaths.Count -gt 0) {
  & gofmt -w @goPaths
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}

& go run @runArgs
exit $LASTEXITCODE
