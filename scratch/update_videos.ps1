$nv = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\video.html"
$cN = [System.IO.File]::ReadAllText($nv)
$cN = $cN.Replace('href="index.html"', 'href="/Neer_kavach"')
$cN = $cN.Replace('← Main Portal', '← Neer Kavach Portal')
$cN = $cN.Replace('href="simulation.html"', 'href="/Neer_kavach/simulation"')
[System.IO.File]::WriteAllText($nv, $cN)

$sv = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\video.html"
$cS = [System.IO.File]::ReadAllText($sv)
$cS = $cS.Replace('href="index.html"', 'href="/Saurya_Rakshak"')
$cS = $cS.Replace('← Main Portal', '← Saurya Rakshak Portal')
$cS = $cS.Replace('href="simulation.html"', 'href="/Saurya_Rakshak/simulation"')
[System.IO.File]::WriteAllText($sv, $cS)

Write-Output "Updated both video.html files with absolute clean URLs"
