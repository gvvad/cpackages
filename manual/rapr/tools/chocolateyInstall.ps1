$ErrorActionPreference = "Stop"
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    url = "https://github.com/lostindark/DriverStoreExplorer/releases/download/v0.11.64/DriverStoreExplorer.v0.11.64.zip"
    checksum = "4aa2635570ee9ec7aea16dea783e9dada5fb388f3ca2f7b64eb401e81059c42a"
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
