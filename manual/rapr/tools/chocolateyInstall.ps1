$ErrorActionPreference = "Stop"
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    url = "https://github.com/lostindark/DriverStoreExplorer/releases/download/v0.11.42/DriverStoreExplorer.v0.11.42.zip"
    checksum = "da2c207a4a1fa61b69c40654160d6fed419ba5f4c7d69ff882ddbe80abc61993"
    checksumType = "sha256"
    unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

foreach($item in $extFiles.GetEnumerator()) {
    Install-ChocolateyShortcut `
    -ShortcutFilePath "$(Join-Path $startMenuPath $item.Name).lnk" `
    -TargetPath $(Join-Path $toolsPath $item.Value) `
    -WorkingDirectory $toolsPath `
    -RunAsAdmin
}
