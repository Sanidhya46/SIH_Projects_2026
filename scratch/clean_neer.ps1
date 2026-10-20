$path = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\index.html"
$lines = Get-Content -Path $path
$newLines = @()
for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    if ($line -match 'href="\.\./index\.html"') {
        # Check if next lines are part of the tag
        if ($line -match 'class="btn btn-outline"') {
            # Skip this line and the next 2 lines (← Main Hub and </a>)
            $i += 2
            continue
        }
        if ($line -match 'Master Hub') {
            # replace only the Master Hub link from the line
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
Write-Output "Cleaned Neer_kavach/index.html"
