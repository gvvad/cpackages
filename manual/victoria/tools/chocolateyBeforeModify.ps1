$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1

if ($(Get-Process -Name "victoria" -ErrorAction Ignore)) {
    throw "Program is running. Installation was aborted!"
}

Remove-Item -Path $startMenuPath -Recurse -ErrorAction Ignore
