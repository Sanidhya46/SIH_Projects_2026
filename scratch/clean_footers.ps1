$pathN = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\index.html"
$cN = [System.IO.File]::ReadAllText($pathN)
$cN = $cN -replace '(?s)<a href="/Neer_kavach/simulation"[^>]*>3D Working Simulation</a>\s*·\s*', '<a href="/Neer_kavach/simulation" style="color:var(--brand-primary); text-decoration:none;">3D Working Simulation ↗</a>'
[System.IO.File]::WriteAllText($pathN, $cN)

$pathS = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\index.html"
$cS = [System.IO.File]::ReadAllText($pathS)
$cS = $cS -replace '(?s)<a href="/Saurya_Rakshak/simulation"[^>]*>12-Scene Working Simulation</a>\s*·\s*', '<a href="/Saurya_Rakshak/simulation" style="color:var(--brand-dark); text-decoration:none;">12-Scene Working Simulation ↗</a>'
[System.IO.File]::WriteAllText($pathS, $cS)

Write-Output "Cleaned footers for both projects"
