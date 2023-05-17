$ErrorActionPreference = "Stop"
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = "https://github.com/lostindark/DriverStoreExplorer/releases/download/v0.11.92/DriverStoreExplorer.v0.11.92.zip"
    checksum      = "b80405b180fa879ceccbc87c27febe815605bf5ff7c25f25347fc85d6eda4b5f"
    checksumType  = "sha256"
    unzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

foreach ($item in $extFiles.GetEnumerator()) {
    Install-ChocolateyShortcut `
        -ShortcutFilePath "$(Join-Path $startMenuPath $item.Name).lnk" `
        -TargetPath $(Join-Path $toolsPath $item.Value) `
        -WorkingDirectory $toolsPath `
        -RunAsAdmin
}
