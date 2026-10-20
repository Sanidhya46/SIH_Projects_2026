try {
    $req = [System.Net.HttpWebRequest]::Create("https://sihprojects2026.vercel.app/Saurya_Rakshak/simulation.html")
    $req.AllowAutoRedirect = $false
    $resp = $req.GetResponse()
    Write-Output "Status: $($resp.StatusCode)"
} catch [System.Net.WebException] {
    $r = $_.Exception.Response
    Write-Output "Status: $($r.StatusCode.value__)"
    Write-Output "Location: $($r.Headers['Location'])"
}
