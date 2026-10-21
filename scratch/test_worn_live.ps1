$sim = curl.exe -sL https://sihprojects2026.vercel.app/Saurya_Rakshak/simulation
$hasWornHelmet = [bool]($sim -match 'wornHelmet')
$hasWornGloves = [bool]($sim -match 'wornGloveL')
$hasWornDetector = [bool]($sim -match 'wornDetector')
Write-Output "Worn Helmet: $hasWornHelmet | Worn Gloves: $hasWornGloves | Worn Detector: $hasWornDetector"
