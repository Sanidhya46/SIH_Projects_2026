Start-Sleep -Seconds 12
$sim = curl.exe -sL https://sihprojects2026.vercel.app/Saurya_Rakshak/simulation
$hasStats = [bool]($sim -match 'thirteen thousand eight hundred thirty-seven')
$hasScriptBtn = [bool]($sim -match 'btn-show-script')
$hasForearms = [bool]($sim -match 'forearmR')
Write-Output "Live Deployment Check: Has NCRB Stats = $hasStats | Has Script Modal Button = $hasScriptBtn | Has Corrected Forearms = $hasForearms"
