# Get all WebP files in the current directory
$webpFiles = Get-ChildItem -Filter *.webp

# Loop through each WebP file and convert to PNG
foreach ($webpFile in $webpFiles) {
    # Create output PNG file name by replacing the extension
    $pngFile = [System.IO.Path]::ChangeExtension($webpFile.FullName, "png")

    # Construct the ImageMagick command
    $convertCommand = "magick `"$($webpFile.FullName)`" `"$($pngFile)`""

    # Execute the ImageMagick command
    Invoke-Expression $convertCommand

    Write-Host "Converted $($webpFile.Name)"
}
