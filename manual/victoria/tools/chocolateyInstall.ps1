$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1
Write-Output $toolsPath
$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    url = "http://hdd.by/Victoria/Victoria528.zip"
    checksum = "c97ef1f900ef3b3441179dbfd670c24d8b397f78f9459979662a8214b5b2dd60"
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
