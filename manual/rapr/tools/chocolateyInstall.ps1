$ErrorActionPreference = "Stop"
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    url = "https://github.com/lostindark/DriverStoreExplorer/releases/download/v0.10.54/DriverStoreExplorer.v0.10.54.zip"
    checksum = "c6105f632f906f083e4c1844d36463567cbf8112053d5a1bd5fa1be86d3efc10"
    checksumType = "sha256"
    unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
