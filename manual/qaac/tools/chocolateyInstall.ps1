$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    url = "https://github.com/nu774/qaac/releases/download/v2.71/qaac_2.71.zip"
    checksum = "f224f1da1e4fc1bd1096025dbb0eea9b4392422abb77810338ecb226b4497aa8"
    checksumType = "sha256"
    unzipLocation  = $toolsPath
}

Write-Output "qacc is going to be installed in '$toolsPath'"
Install-ChocolateyZipPackage @packageArgs
