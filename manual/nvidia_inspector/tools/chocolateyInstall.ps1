$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    file = Join-Path $toolsPath $archive.fileName
    checksum = $archive.checksum
    checksumType = $archive.checksumType
    unzipLocation  = $toolsPath
}

Write-Output "Nvidia Inspector is going to be installed in '$toolsPath'"
Install-ChocolateyZipPackage @packageArgs

Remove-Item -Path $packageArgs.file -ErrorAction Ignore

foreach($item in $extFiles.GetEnumerator()) {
    Install-ChocolateyShortcut `
    -ShortcutFilePath "$(Join-Path $startMenuPath $item.Name).lnk" `
    -TargetPath $(Join-Path $toolsPath $item.Value) `
    -WorkingDirectory $toolsPath `
    -RunAsAdmin
}
