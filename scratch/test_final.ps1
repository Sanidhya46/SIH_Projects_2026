$saurya = curl.exe -sL https://sihprojects2026.vercel.app/Saurya_Rakshak
$hasHub = [bool]($saurya -match 'Master Hub')
$hasSim = [bool]($saurya -match 'Saurya_Rakshak/simulation')
Write-Output "Saurya portal: Has Master Hub = $hasHub | Has Saurya Sim = $hasSim"

$sauryaSim = curl.exe -sL https://sihprojects2026.vercel.app/Saurya_Rakshak/simulation
$hasNeerInSauryaSim = [bool]($sauryaSim -match 'Neer Kavach')
$hasSauryaInSauryaSim = [bool]($sauryaSim -match 'Saurya Rakshak')
Write-Output "Saurya sim: Has Neer = $hasNeerInSauryaSim | Has Saurya = $hasSauryaInSauryaSim"

$neer = curl.exe -sL https://sihprojects2026.vercel.app/Neer_kavach
$hasHubNeer = [bool]($neer -match 'Master Hub')
$hasSimNeer = [bool]($neer -match 'Neer_kavach/simulation')
Write-Output "Neer portal: Has Master Hub = $hasHubNeer | Has Neer Sim = $hasSimNeer"

$neerSim = curl.exe -sL https://sihprojects2026.vercel.app/Neer_kavach/simulation
$hasSauryaInNeerSim = [bool]($neerSim -match 'Saurya Rakshak')
$hasNeerInNeerSim = [bool]($neerSim -match 'Neer Kavach')
Write-Output "Neer sim: Has Saurya = $hasSauryaInNeerSim | Has Neer = $hasNeerInNeerSim"
