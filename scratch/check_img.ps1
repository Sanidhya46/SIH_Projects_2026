Add-Type -AssemblyName System.Drawing
$imgPath = "C:\Users\Sahil\.gemini\antigravity-ide\brain\ba39bc2a-1d90-4269-b00d-5f3aa232d408\.user_uploaded\media_1792558972666.png"
$img = [System.Drawing.Image]::FromFile($imgPath)
Write-Output "Image Dimensions: $($img.Width) x $($img.Height)"
$img.Dispose()
