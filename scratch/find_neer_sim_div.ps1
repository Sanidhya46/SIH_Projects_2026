$content = Get-Content -Path "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\index.html"
for ($i = 680; $i -lt $content.Count; $i++) {
    if ($content[$i] -match 'id="view-simulation"') {
        Write-Output "Found at line $($i+1)"
        $start = [Math]::Max(0, $i - 2)
        $end = [Math]::Min($content.Count - 1, $i + 35)
        for ($k = $start; $k -le $end; $k++) {
            Write-Output "$($k+1): $($content[$k])"
        }
        break
    }
}
