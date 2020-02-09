$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1

Remove-Item -Path $startMenuPath -Recurse -ErrorAction Ignore
