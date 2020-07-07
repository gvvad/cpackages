$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1

Get-Process -Name "victoria" -ErrorAction Ignore | Stop-Process -ErrorAction Ignore
Remove-Item -Path $startMenuPath -Recurse -ErrorAction Ignore
