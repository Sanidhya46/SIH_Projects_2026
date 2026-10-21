$path = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\index.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)

# Replace all variations of KavachSetu / Kavach Setu
$content = $content -replace 'KavachSetu Specification:', 'Saurya Rakshak Gateway Specification:'
$content = $content -replace 'KavachSetu Ecosystem', 'Saurya Rakshak Industrial Safety Ecosystem'
$content = $content -replace 'KavachSetu Features Spec', 'Saurya Rakshak Features Spec'
$content = $content -replace 'KavachSetu', 'Saurya Rakshak'
$content = $content -replace 'Kavach Setu', 'Saurya Rakshak'
$content = $content -replace 'kavachsetu', 'saurya rakshak'

[System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
Write-Output "Replaced all KavachSetu references in Saurya_Rakshak/index.html"
