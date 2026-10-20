try {
    $req = [System.Net.HttpWebRequest]::Create("https://sihprojects2026.vercel.app/Saurya_Rakshak/simulation.html")
    $req.AllowAutoRedirect = $false
    $resp = $req.GetResponse()
    Write-Output "Status: $($resp.StatusCode)"
} catch [System.Net.WebException] {
    $resp = $_.Exception.Response
    Write-Output "Status: $($resp.StatusCode)"
    Write-Output "Location: $($resp.Headers['Location'])"
}
