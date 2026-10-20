$path = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\index.html"
$lines = Get-Content -Path $path
$newLines = @()
for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    if ($line -match 'href="\.\./index\.html"') {
        if ($line -match 'class="btn btn-outline"') {
            $i += 2
            continue
        }
        if ($line -match 'Master Hub') {
            $line = $line -replace '<a href="\.\./index\.html"[^>]*>Master Hub</a>\s*·?\s*', ''
            if ($line.Trim() -ne '') {
                $newLines += $line
            }
            continue
        }
    }
    $newLines += $line
}
[System.IO.File]::WriteAllLines($path, $newLines, [System.Text.Encoding]::UTF8)
Write-Output "Cleaned Saurya_Rakshak/index.html"
