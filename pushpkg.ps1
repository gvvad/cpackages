$CHOCO_SOURCE = "https://push.chocolatey.org/"
$fItem = $null
try {
    $fItem = Get-ChildItem -Path $args[0] -ErrorAction Stop
}
catch {
    Write-Output "File: $($args[0]) not found"
    return
}

Write-Output "Pushing $($fItem.Name) file in $CHOCO_SOURCE"
choco push $fItem.FullName --source $CHOCO_SOURCE