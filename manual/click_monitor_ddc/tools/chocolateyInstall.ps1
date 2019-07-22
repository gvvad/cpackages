# $toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    fileType = "exe"
    SilentArgs = "/VERYSILENT"
    UseOnlyPackageSilentArguments = $true
    url = "https://clickmonitorddc.bplaced.net/setup_ClickMonitorDDC_7_0.exe"
    checksum = "0c3b35ff2929afbbf2467a0bcba6a62dc15babcb451331523a9e8d0d2d1e2fcf"
    checksumType = "sha256"
}

Write-Output "Click Monitor DDC is going to be installed."
Install-ChocolateyPackage @packageArgs
