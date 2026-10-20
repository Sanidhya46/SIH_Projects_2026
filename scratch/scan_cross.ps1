Write-Output "=== Checking Neer_kavach for Saurya mentions ==="
Get-ChildItem -Path "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach" -Recurse -File | ForEach-Object {
    $matches = Select-String -Path $_.FullName -Pattern "Saurya|Rakshak|master hub|hub-brand|../index.html" -CaseSensitive:$false
    if ($matches) {
        Write-Output "$($_.Name): $($matches.Count) matches"
        $matches | Select-Object -First 5 | ForEach-Object { Write-Output "  Line $($_.LineNumber): $($_.Line.Trim())" }
    }
}

Write-Output "`n=== Checking Saurya_Rakshak for Neer mentions ==="
Get-ChildItem -Path "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak" -Recurse -File | ForEach-Object {
    $matches = Select-String -Path $_.FullName -Pattern "Neer|Kavach|master hub|hub-brand|../index.html" -CaseSensitive:$false
    if ($matches) {
        Write-Output "$($_.Name): $($matches.Count) matches"
        $matches | Select-Object -First 5 | ForEach-Object { Write-Output "  Line $($_.LineNumber): $($_.Line.Trim())" }
    }
}
