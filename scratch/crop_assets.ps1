Add-Type -AssemblyName System.Drawing
$imgPath = "C:\Users\Sahil\.gemini\antigravity-ide\brain\ba39bc2a-1d90-4269-b00d-5f3aa232d408\.user_uploaded\media_1792558972666.png"
$bmp = New-Object System.Drawing.Bitmap($imgPath)

$blocks = @(
    @{ Name = "helmet"; X1 = 28; X2 = 335 },
    @{ Name = "glove_palm"; X1 = 373; X2 = 558 },
    @{ Name = "glove_back"; X1 = 564; X2 = 747 },
    @{ Name = "gloves_pair"; X1 = 370; X2 = 748 },
    @{ Name = "hazard_detector"; X1 = 785; X2 = 942 }
)

$outDir = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\assets"
if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir -Force }

# Copy full original image too
Copy-Item $imgPath "$outDir\gear_full.png" -Force

foreach ($b in $blocks) {
    $x1 = $b.X1
    $x2 = $b.X2
    $y1 = $bmp.Height
    $y2 = 0
    for ($x = $x1; $x -le $x2; $x++) {
        for ($y = 0; $y -lt $bmp.Height; $y++) {
            $p = $bmp.GetPixel($x, $y)
            if ($p.A -gt 15) {
                if ($y -lt $y1) { $y1 = $y }
                if ($y -gt $y2) { $y2 = $y }
            }
        }
    }
    
    # Add a 2px padding if possible
    $cropX = [Math]::Max(0, $x1 - 2)
    $cropY = [Math]::Max(0, $y1 - 2)
    $cropW = [Math]::Min($bmp.Width - $cropX, ($x2 - $x1) + 4)
    $cropH = [Math]::Min($bmp.Height - $cropY, ($y2 - $y1) + 4)
    
    $rect = New-Object System.Drawing.Rectangle($cropX, $cropY, $cropW, $cropH)
    $cropped = $bmp.Clone($rect, $bmp.PixelFormat)
    $targetPath = "$outDir\$($b.Name).png"
    $cropped.Save($targetPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $cropped.Dispose()
    Write-Output "Saved $($b.Name).png: ${cropW}x${cropH} at ($cropX, $cropY)"
}

$bmp.Dispose()
