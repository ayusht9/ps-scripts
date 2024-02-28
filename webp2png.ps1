$webpFiles = Get-ChildItem -Filter *.webp

foreach ($webpFile in $webpFiles) {

    $pngFile = [System.IO.Path]::ChangeExtension($webpFile.FullName, "png")

    $convertCommand = "magick `"$($webpFile.FullName)`" `"$($pngFile)`""

    Invoke-Expression $convertCommand

    Write-Host "Converted $($webpFile.Name)"
}
