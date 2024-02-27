$webmFiles = Get-ChildItem -Filter *.webm

foreach ($webmFile in $webmFiles) {
    $mp4File = [System.IO.Path]::ChangeExtension($webmFile.FullName, "mp4")

    $ffmpegCommand = "ffmpeg -i `"$($webmFile.FullName)`" -c:v libx264 -c:a aac -strict experimental `"$($mp4File)`""
    # use present flag with fast, faster, ultrafast options for faster speed with lower compression efficiency

    Invoke-Expression $ffmpegCommand

    Write-Host "Converted $($webmFile.Name) to $($mp4File.Name)"
}
