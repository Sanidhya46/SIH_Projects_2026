Start-Sleep -Seconds 12

Write-Output "=== 1. Checking Asset Downloads ==="
$helmetStatus = (curl.exe -s -o nul -w "%{http_code}" https://sihprojects2026.vercel.app/Saurya_Rakshak/assets/helmet.png)
$glovesStatus = (curl.exe -s -o nul -w "%{http_code}" https://sihprojects2026.vercel.app/Saurya_Rakshak/assets/gloves_pair.png)
$podStatus = (curl.exe -s -o nul -w "%{http_code}" https://sihprojects2026.vercel.app/Saurya_Rakshak/assets/hazard_detector.png)
Write-Output "Helmet PNG: $helmetStatus | Gloves PNG: $glovesStatus | Detector PNG: $podStatus"

Write-Output "`n=== 2. Checking Simulation Content ==="
$sim = curl.exe -sL https://sihprojects2026.vercel.app/Saurya_Rakshak/simulation
$hasWearablesDock = [bool]($sim -match 'Connected Wearables Monitor')
$hasHazardTriggers = [bool]($sim -match 'Interactive Hazard Triggers')
$hasKavachSetu = [bool]($sim -match 'KavachSetu')
Write-Output "Has Wearables Dock = $hasWearablesDock | Has Triggers = $hasHazardTriggers | Has KavachSetu = $hasKavachSetu"

Write-Output "`n=== 3. Checking Portal Content ==="
$portal = curl.exe -sL https://sihprojects2026.vercel.app/Saurya_Rakshak
$portalHasKavachSetu = [bool]($portal -match 'KavachSetu')
$portalHasGallery = [bool]($portal -match 'Physical Wearable Hardware Gallery')
Write-Output "Portal Has KavachSetu = $portalHasKavachSetu | Has HW Gallery = $portalHasGallery"
