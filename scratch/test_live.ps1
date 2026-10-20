$r1 = Invoke-WebRequest -Uri 'https://sihprojects2026.vercel.app/Saurya_Rakshak/simulation.html' -UseBasicParsing
Write-Output "=== Saurya_Rakshak/simulation.html ==="
Write-Output "StatusCode: $($r1.StatusCode)"
if ($r1.Content -match '<title>(.*?)</title>') {
    Write-Output "Title: $($matches[1])"
}
if ($r1.Content -match 'Neer Kavach') {
    Write-Output "Contains 'Neer Kavach': YES"
} else {
    Write-Output "Contains 'Neer Kavach': NO"
}
if ($r1.Content -match 'Saurya Rakshak') {
    Write-Output "Contains 'Saurya Rakshak': YES"
} else {
    Write-Output "Contains 'Saurya Rakshak': NO"
}

$r2 = Invoke-WebRequest -Uri 'https://sihprojects2026.vercel.app/Saurya_Rakshak' -UseBasicParsing
Write-Output "`n=== Saurya_Rakshak ==="
if ($r2.Content -match 'iframe.*src="([^"]+)"') {
    Write-Output "Iframe src: $($matches[1])"
}
