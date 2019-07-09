$job = Get-ChildItem -Path ".\manual\" -Recurse -Include *.nuspec

New-Item -Path ".\build\" -ItemType Directory -ErrorAction Ignore | Out-Null
foreach ($item in $job) {
    Write-Output "Building:" $item.FullName
    choco pack "$($item.FullName)" --outputdirectory ".\build\"
}
