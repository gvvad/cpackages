$ErrorActionPreference = "Stop"
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    url = "https://github.com/lostindark/DriverStoreExplorer/releases/download/v0.10.58/DriverStoreExplorer.v0.10.58.zip"
    checksum = "607cb0f552d9921ce14f3477ca539a2e8356453433b38aa9d0d48f69a0df0d6e"
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
