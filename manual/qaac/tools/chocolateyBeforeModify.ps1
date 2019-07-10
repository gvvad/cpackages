# $toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$a = Get-Process -Name "qaac*"
$b = Get-Process -Name "refalac*"
$processes = $a + $b
if ($processes) {
    Stop-Process -InputObject $processes -ErrorAction Ignore
}
