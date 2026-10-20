Start-Sleep -Seconds 10

Write-Output "=== 1. Testing /Saurya_Rakshak ==="
$rSaurya = curl.exe -sL https://sihprojects2026.vercel.app/Saurya_Rakshak
if ($rSaurya -match 'iframe.*src="([^"]+)"') {
    Write-Output "Iframe src: $($matches[1])"
}
if ($rSaurya -match 'Master Hub') {
    Write-Output "WARNING: Found Master Hub in Saurya_Rakshak"
} else {
    Write-Output "Clean: Zero Master Hub links in Saurya_Rakshak"
}

Write-Output "`n=== 2. Testing /Saurya_Rakshak/simulation ==="
$rSauryaSim = curl.exe -sL https://sihprojects2026.vercel.app/Saurya_Rakshak/simulation
if ($rSauryaSim -match '<title>(.*?)</title>') {
    Write-Output "Title: $($matches[1])"
}
if ($rSauryaSim -match 'Neer Kavach') {
    Write-Output "WARNING: Found Neer Kavach in Saurya simulation"
} else {
    Write-Output "Clean: 100% Saurya Rakshak, zero cross mentions"
}

Write-Output "`n=== 3. Testing /Neer_kavach ==="
$rNeer = curl.exe -sL https://sihprojects2026.vercel.app/Neer_kavach
if ($rNeer -match 'iframe.*src="([^"]+)"') {
    Write-Output "Iframe src: $($matches[1])"
}
if ($rNeer -match 'Master Hub') {
    Write-Output "WARNING: Found Master Hub in Neer_kavach"
} else {
    Write-Output "Clean: Zero Master Hub links in Neer_kavach"
}

Write-Output "`n=== 4. Testing /Neer_kavach/simulation ==="
$rNeerSim = curl.exe -sL https://sihprojects2026.vercel.app/Neer_kavach/simulation
if ($rNeerSim -match '<title>(.*?)</title>') {
    Write-Output "Title: $($matches[1])"
}
if ($rNeerSim -match 'Saurya Rakshak') {
    Write-Output "WARNING: Found Saurya Rakshak in Neer simulation"
} else {
    Write-Output "Clean: 100% Neer Kavach, zero cross mentions"
}
