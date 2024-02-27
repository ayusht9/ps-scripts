# Get all MP4 files in the current directory
$mp4Files = Get-ChildItem -Filter *.mp4

# Loop through each MP4 file and convert to MP3
foreach ($mp4File in $mp4Files) {
    # Create output MP3 file name by replacing the extension
    $mp3File = [System.IO.Path]::ChangeExtension($mp4File.FullName, "mp3")

    # Construct the ffmpeg command
    $ffmpegCommand = "ffmpeg -i `"$($mp4File.FullName)`" -vn -acodec mp3 -ab 320k -ar 44100 `"$($mp3File)`""

    # Execute the ffmpeg command
    Invoke-Expression $ffmpegCommand

    Write-Host "Converted $($mp4File.Name) to $($mp3File.Name)"
}
