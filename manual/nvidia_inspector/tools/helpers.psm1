$startMenuPath = Join-Path  $env:ProgramData "Microsoft\Windows\Start Menu\Programs\Nvidia Inspector"

$archive = @{
    fileName = "nvidiaInspector.zip"
    checksum = 'a11222bde0d30fd3e949e8d85b23efaa964eae68aa1f16c24b3b1d1877640a64'
    checksumType = 'sha256'
}

$extFiles = @{
    "Nvidia Inspector" = "nvidiaInspector.exe"
    "Nvidia Profile Inspector" = "nvidiaProfileInspector.exe"
}

Export-ModuleMember -Variable startMenuPath, archive, extFiles
