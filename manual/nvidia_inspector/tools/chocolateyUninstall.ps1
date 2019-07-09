$ErrorActionPreference = 'Stop';
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
Import-Module $toolsPath\helpers.psm1

Remove-Item -Path $startMenuPath -Recurse -ErrorAction Ignore

# foreach($item in $extFiles.GetEnumerator()) {
    # Remove-Item -Path "$(Join-Path $startMenuPath $item.Name).lnk" -ErrorAction Ignore
# }
