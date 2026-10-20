$path = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\index.html"
$c = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
$c = $c -replace '(?s)<a href="\.\./index\.html"[^>]*>.*?</a>\s*·?\s*', ''
[System.IO.File]::WriteAllText($path, $c, [System.Text.Encoding]::UTF8)
Write-Output "Done regex replace in Neer_kavach"
