$path = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\index.html"
$lines = [System.IO.File]::ReadAllLines($path)
$filtered = @()
foreach ($l in $lines) {
    if ($l -notmatch '\.\./index\.html') {
        $filtered += $l
    }
}
[System.IO.File]::WriteAllLines($path, $filtered)
Write-Output "Lines before: $($lines.Count), after: $($filtered.Count)"

$test = Get-Content $path | Select-String -Pattern 'index.html'
Write-Output "Remaining index.html occurrences in Saurya_Rakshak: $($test.Count)"
foreach ($t in $test) {
    Write-Output "  Line $($t.LineNumber): $($t.Line.Trim())"
}
