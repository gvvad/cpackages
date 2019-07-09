$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName = "qacc"
    url = "https://github.com/nu774/qaac/releases/download/v2.68/qaac_2.68.zip"
    checksum = "8067826564d182a239a2347b40d52369c4a378b7df7918bd156138bf904168d0"
    checksumType = "sha256"
    unzipLocation  = $toolsPath
}

Write-Output "qacc is going to be installed in '$toolsPath'"
Install-ChocolateyZipPackage @packageArgs
