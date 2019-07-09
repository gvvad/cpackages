# $toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$a = Get-Process -Name "qaac*"
$b = Get-Process -Name "refalac*"

Stop-Process -InputObject $($a+$b) -ErrorAction Ignore
