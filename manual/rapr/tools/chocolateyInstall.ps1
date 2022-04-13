$ErrorActionPreference = "Stop"
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    url           = "https://github.com/lostindark/DriverStoreExplorer/releases/download/v0.11.79/DriverStoreExplorer.v0.11.79.zip"
    checksum      = "6dfcfc7ed5d98664e457f886a8a70403f6472db8d51e1b1bebc89a2facfe7dcb"
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
