try {
    $wc = New-Object System.Net.WebClient
    $wc.DownloadString("https://sihprojects2026.vercel.app/Saurya_Rakshak/simulation.html")
} catch {
    $res = $_.Exception.Response
    if ($res) {
        Write-Output "Status: $($res.StatusCode)"
        foreach ($key in $res.Headers.AllKeys) {
            Write-Output "$key : $($res.Headers[$key])"
        }
    } else {
        Write-Output "No response object: $($_.Exception.Message)"
    }
}
