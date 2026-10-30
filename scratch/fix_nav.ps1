$path = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\simulation.html"
$content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
$cleanNav = '<div id="nav-back"><span>&#127754; Neer Kavach Simulation</span> &middot; <a href="index.html">&larr; Return to Neer Kavach Portal</a></div>'
$content = [regex]::Replace($content, '<div id="nav-back">.*?Return to Neer Kavach Portal</a></div>', $cleanNav)
[System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
Write-Host "Neer_kavach simulation.html nav-back fixed successfully."
