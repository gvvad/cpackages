$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    url = "https://hdd.by/Victoria/Victoria536.zip"
    checksum = "c1a661f859a584b594716ba23e9d2f8e12261c2af513d107a0358bc25a6b898e"
    checksumType = "sha256"
    unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

foreach($item in $extFiles.GetEnumerator()) {
    Install-ChocolateyShortcut `
    -ShortcutFilePath "$(Join-Path $startMenuPath $item.Name).lnk" `
    -TargetPath "$(Join-Path $toolsPath $item.Value)" `
    -WorkingDirectory "$toolsPath" `
    -RunAsAdmin
}
