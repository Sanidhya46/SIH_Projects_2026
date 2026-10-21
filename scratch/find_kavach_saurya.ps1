$files = Get-ChildItem -Path "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak" -Recurse -File -Include *.html,*.js,*.css,*.json
foreach ($f in $files) {
    $matches = Select-String -Path $f.FullName -Pattern "kavach" -CaseSensitive:$false
    if ($matches) {
        Write-Output "File: $($f.FullName) - Found $($matches.Count) occurrences"
        $matches | ForEach-Object {
            Write-Output "  Line $($_.LineNumber): $($_.Line.Trim())"
        }
    }
}
