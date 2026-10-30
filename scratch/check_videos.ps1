$shell = New-Object -ComObject Shell.Application

function Get-MediaInfo($path) {
    $folder = Split-Path $path
    $file = Split-Path $path -Leaf
    $shellFolder = $shell.Namespace($folder)
    $shellFile = $shellFolder.ParseName($file)
    
    # 27 is Length/Duration in Windows Shell, 316/314 is frame width/height or similar
    $duration = $shellFolder.GetDetailsOf($shellFile, 27)
    $dimensions = $shellFolder.GetDetailsOf($shellFile, 316)
    $bitrate = $shellFolder.GetDetailsOf($shellFile, 28)
    
    Write-Host "File: $file ($folder)"
    Write-Host "  Duration: $duration"
    Write-Host "  Dimensions: $dimensions"
    Write-Host "  Bitrate: $bitrate"
    Write-Host "  Size: $( (Get-Item $path).Length ) bytes"
}

Get-MediaInfo "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\Neer_kavach.mp4"
Get-MediaInfo "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\scratch\gemini_generated_video.mp4"
Get-MediaInfo "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\model_3d_video.mp4"
