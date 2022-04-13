$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    url = "https://hdd.by/Victoria/Victoria537.zip"
    checksum = "a66b7869d59bbf90b5994332bac57bcbc0b377cee9f0c59c078795ea7b4c99d1"
    checksumType = "sha256"
    unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

# different folder structure in this version. Add subfolder in lnk path.
foreach($item in $extFiles.GetEnumerator()) {
    Install-ChocolateyShortcut `
    -ShortcutFilePath "$(Join-Path $startMenuPath $item.Name).lnk" `
    -TargetPath "$(Join-Path "$(Join-Path $toolsPath "Victoria537")" $item.Value)" `
    -WorkingDirectory "$toolsPath" `
    -RunAsAdmin
}
