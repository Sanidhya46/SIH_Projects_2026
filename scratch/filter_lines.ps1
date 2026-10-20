$path = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\index.html"
$lines = [System.IO.File]::ReadAllLines($path)
$filtered = @()
foreach ($l in $lines) {
    if ($l -notmatch '\.\./index\.html') {
        $filtered += $l
    }
}
[System.IO.File]::WriteAllLines($path, $filtered)
Write-Output "Lines before: $($lines.Count), after: $($filtered.Count)"
