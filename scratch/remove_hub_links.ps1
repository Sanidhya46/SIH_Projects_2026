# 1. Update Neer_kavach/index.html
$neerPath = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\index.html"
$neerContent = [System.IO.File]::ReadAllText($neerPath, [System.Text.Encoding]::UTF8)

# Remove sidebar external navigation (Master Hub)
$neerContent = $neerContent -replace '(?s)<div class="nav-category">External Navigation</div>\s*<a href="\.\./index\.html" class="nav-btn" style="text-decoration:none;">\s*<span class="icon">.*?</span>\s*Main Hub Directory\s*</a>', ''

# Remove top quickbar Main Hub button
$neerContent = $neerContent -replace '(?s)<a href="\.\./index\.html" class="btn btn-outline">\s*← Main Hub\s*</a>', ''

# Remove footer Master Hub link
$neerContent = $neerContent -replace '<a href="\.\./index\.html" style="color:var\(--brand-primary\); text-decoration:none;">Master Hub</a>\s*·\s*', ''

# Ensure iframe and buttons point to clean /Neer_kavach/simulation
$neerContent = $neerContent.Replace('href="/Neer_kavach/simulation.html"', 'href="/Neer_kavach/simulation"')
$neerContent = $neerContent.Replace('src="/Neer_kavach/simulation.html"', 'src="/Neer_kavach/simulation"')
$neerContent = $neerContent.Replace('src="simulation.html"', 'src="/Neer_kavach/simulation"')

[System.IO.File]::WriteAllText($neerPath, $neerContent, [System.Text.Encoding]::UTF8)
Write-Output "Updated Neer_kavach/index.html"

# 2. Update Neer_kavach/simulation.html
$neerSimPath = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\simulation.html"
$neerSim = [System.IO.File]::ReadAllText($neerSimPath, [System.Text.Encoding]::UTF8)
$neerSim = $neerSim -replace '<div id="nav-back">.*?</div>', '<div id="nav-back"><span>🌊 Neer Kavach Simulation</span> · <a href="/Neer_kavach">← Return to Neer Kavach Portal</a></div>'
[System.IO.File]::WriteAllText($neerSimPath, $neerSim, [System.Text.Encoding]::UTF8)
Write-Output "Updated Neer_kavach/simulation.html"

# 3. Update Saurya_Rakshak/index.html
$sauryaPath = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\index.html"
$sauryaContent = [System.IO.File]::ReadAllText($sauryaPath, [System.Text.Encoding]::UTF8)

# Remove sidebar external navigation (Master Hub)
$sauryaContent = $sauryaContent -replace '(?s)<div class="nav-category">External Links</div>\s*<a href="\.\./index\.html" class="nav-btn">\s*<span class="icon">.*?</span>\s*Master Hub Directory\s*</a>', ''

# Remove top quickbar Main Hub button
$sauryaContent = $sauryaContent -replace '(?s)<a href="\.\./index\.html" class="btn btn-outline">\s*← Main Hub\s*</a>', ''

# Remove footer Master Hub link
$sauryaContent = $sauryaContent -replace '<a href="\.\./index\.html" style="color:var\(--brand-dark\); text-decoration:none;">Master Hub</a>\s*·\s*', ''

# Ensure iframe and buttons point to clean /Saurya_Rakshak/simulation
$sauryaContent = $sauryaContent.Replace('href="/Saurya_Rakshak/simulation.html"', 'href="/Saurya_Rakshak/simulation"')
$sauryaContent = $sauryaContent.Replace('src="/Saurya_Rakshak/simulation.html"', 'src="/Saurya_Rakshak/simulation"')
$sauryaContent = $sauryaContent.Replace('src="simulation.html"', 'src="/Saurya_Rakshak/simulation"')

[System.IO.File]::WriteAllText($sauryaPath, $sauryaContent, [System.Text.Encoding]::UTF8)
Write-Output "Updated Saurya_Rakshak/index.html"

# 4. Update Saurya_Rakshak/simulation.html
$sauryaSimPath = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\simulation.html"
$sauryaSim = [System.IO.File]::ReadAllText($sauryaSimPath, [System.Text.Encoding]::UTF8)
$sauryaSim = $sauryaSim -replace '<div id="nav">.*?</div>', '<div id="nav"><span>⚡ Saurya Rakshak Simulation</span> · <a href="/Saurya_Rakshak">← Return to Saurya Rakshak Portal</a></div>'
[System.IO.File]::WriteAllText($sauryaSimPath, $sauryaSim, [System.Text.Encoding]::UTF8)
Write-Output "Updated Saurya_Rakshak/simulation.html"
