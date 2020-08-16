$ErrorActionPreference = "Stop"
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    url = "https://github.com/lostindark/DriverStoreExplorer/releases/download/v0.11.20/DriverStoreExplorer.v0.11.20.zip"
    checksum = "d8f37da1098e9f457fe93dd0c526ac8aedebf62825f027bfc3f04d7099823aa1"
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
