$startMenuPath = Join-Path  $env:ProgramData "Microsoft\Windows\Start Menu\Programs\Nvidia Inspector"

$archive = @{
    fileName = "nvidiaInspector.zip"
    checksum = '91d399e3b2528828f173878e55f297bd'
    checksumType = 'md5'
}

$extFiles = @{
    "Nvidia Inspector" = "nvidiaInspector.exe"
    "Nvidia Profile Inspector" = "nvidiaProfileInspector.exe"
}

Export-ModuleMember -Variable startMenuPath, archive, extFiles
