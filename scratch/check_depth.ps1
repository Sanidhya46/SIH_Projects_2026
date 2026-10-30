$lines = Get-Content 'Neer_kavach\index.html'
$depth = 0
for ($i = 0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]
    $opens = ([regex]::Matches($line, '<div\b')).Count
    $closes = ([regex]::Matches($line, '</div>')).Count
    $depth += ($opens - $closes)
    
    if ($line -match 'id="view-') {
        Write-Host "Line $($i+1): $line | Current div depth: $depth"
    }
    if ($depth -lt 0) {
        Write-Host "ALERT: Line $($i+1) caused depth to drop to ${depth} : $line"
        break
    }
}
