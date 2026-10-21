Add-Type -AssemblyName System.Drawing
$imgPath = "C:\Users\Sahil\.gemini\antigravity-ide\brain\ba39bc2a-1d90-4269-b00d-5f3aa232d408\.user_uploaded\media_1792558972666.png"
$bmp = New-Object System.Drawing.Bitmap($imgPath)
$pTopLeft = $bmp.GetPixel(0, 0)
Write-Output "Top-Left Pixel: A=$($pTopLeft.A), R=$($pTopLeft.R), G=$($pTopLeft.G), B=$($pTopLeft.B)"

# Find column non-white/non-transparent coverage
$w = $bmp.Width
$h = $bmp.Height
$colHasContent = @()
for ($x = 0; $x -lt $w; $x++) {
    $hasContent = $false
    for ($y = 0; $y -lt $h; $y++) {
        $p = $bmp.GetPixel($x, $y)
        # Check if not transparent and not near pure white
        if ($p.A -gt 20 -and ($p.R -lt 250 -or $p.G -lt 250 -or $p.B -lt 250)) {
            $hasContent = $true
            break
        }
    }
    $colHasContent += $hasContent
}
$bmp.Dispose()

# Print intervals of content
$inContent = $false
$start = 0
for ($x = 0; $x -lt $w; $x++) {
    if ($colHasContent[$x] -and -not $inContent) {
        $inContent = $true
        $start = $x
    } elseif (-not $colHasContent[$x] -and $inContent) {
        $inContent = $false
        Write-Output "Content block: X=$start to $($x-1) (width = $($x - $start))"
    }
}
if ($inContent) {
    Write-Output "Content block: X=$start to $($w-1) (width = $($w - $start))"
}
