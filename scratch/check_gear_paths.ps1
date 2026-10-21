// Test loading the textures in Node or powershell
Add-Type -AssemblyName System.Drawing
$h = Test-Path "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\assets\helmet.png"
$g1 = Test-Path "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\assets\glove_palm.png"
$g2 = Test-Path "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\assets\glove_back.png"
$p = Test-Path "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\assets\hazard_detector.png"
Write-Output "Assets exist: Helmet=$h, GlovePalm=$g1, GloveBack=$g2, Pod=$p"
