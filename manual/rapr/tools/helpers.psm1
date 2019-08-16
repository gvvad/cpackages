$commonProgramsPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonPrograms)
$startMenuPath = Join-Path  $commonProgramsPath "RAPR"

$extFiles = @{
    "Driver Store Explorer [RAPR]" = "rapr.exe"
}

Export-ModuleMember -Variable extFiles, startMenuPath
