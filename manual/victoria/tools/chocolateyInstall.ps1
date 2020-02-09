$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1
Write-Output $toolsPath
$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    url = "http://hdd.by/Victoria/Victoria523.zip"
    checksum = "42c00b2eca910663e12d89ffe0ba10aaee39fc5872c6253ca8defa2f24c0e002"
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
