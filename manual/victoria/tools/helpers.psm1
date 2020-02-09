$commonProgramsPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonPrograms)
$startMenuPath = Join-Path  $commonProgramsPath "Victoria"

$extFiles = @{
    "Victoria $env:packageVersion" = "victoria.exe"
}

Export-ModuleMember -Variable startMenuPath, extFiles
