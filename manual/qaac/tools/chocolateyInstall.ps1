$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    url = "https://github.com/nu774/qaac/releases/download/v2.80/qaac_2.80.zip"
    checksum = "1a746d7d68fe8429c99ee172ac4e8640d11e80909be47567ae24b6ad99bddae9"
    checksumType = "sha256"
    unzipLocation  = $toolsPath
}

Write-Output "qacc is going to be installed in '$toolsPath'"
Install-ChocolateyZipPackage @packageArgs
