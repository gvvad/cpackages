$ErrorActionPreference = 'Stop';
# $toolsPath = Split-Path $MyInvocation.MyCommand.Definition
# Import-Module $toolsPath\helpers.psm1

$processes = Get-Process -Name "nvidia*inspector"
Stop-Process -InputObject $processes -ErrorAction Ignore
