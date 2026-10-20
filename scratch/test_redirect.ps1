$req = [System.Net.HttpWebRequest]::Create("https://sihprojects2026.vercel.app/Saurya_Rakshak/simulation.html")
$req.AllowAutoRedirect = $true
$resp = $req.GetResponse()
Write-Output "Final URL: $($resp.ResponseUri)"
$stream = $resp.GetResponseStream()
$reader = New-Object System.IO.StreamReader($stream)
$body = $reader.ReadToEnd()
Write-Output "Length: $($body.Length)"
if ($body -match '<title>(.*?)</title>') {
    Write-Output "Title: $($matches[1])"
}
if ($body -match 'Neer Kavach') {
    Write-Output "Found 'Neer Kavach' in body"
}
if ($body -match 'Saurya Rakshak') {
    Write-Output "Found 'Saurya Rakshak' in body"
}
