$ErrorActionPreference = "Stop"

$packageArgs = @{
    packageName = $env:ChocolateyPackageName
    fileType = "exe"
    SilentArgs = "/VERYSILENT"
    UseOnlyPackageSilentArguments = $true
    url = "https://drive.google.com/uc?export=download&id=15yIn2KE0JUaVcRSWjWjC22isealRd_wV"
    checksum = "a66ca28c485ab061e0cfa737c24e7dfbfd3d093f2e607211e65599abafe16e01"
    checksumType = "sha256"
}

Install-ChocolateyPackage @packageArgs
