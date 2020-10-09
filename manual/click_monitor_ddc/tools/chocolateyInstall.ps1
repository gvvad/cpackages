$ErrorActionPreference = "Stop"

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    fileType = "exe"
    SilentArgs = "/VERYSILENT"
    UseOnlyPackageSilentArguments = $true
    url = "https://clickmonitorddc.bplaced.net/setup_ClickMonitorDDC_7_2.exe"
    checksum = "a66ca28c485ab061e0cfa737c24e7dfbfd3d093f2e607211e65599abafe16e01"
    checksumType = "sha256"
}

Install-ChocolateyPackage @packageArgs
