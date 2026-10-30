$lines = Get-Content 'Neer_kavach\index.html'
$depth = 0
for ($i = 1938; $i -lt 2455; $i++) {
    $line = $lines[$i]
    $opens = ([regex]::Matches($line, '<div\b')).Count
    $closes = ([regex]::Matches($line, '</div>')).Count
    $depth += ($opens - $closes)
    if ($opens -ne $closes) {
        Write-Host "Line $($i+1) ($opens - $closes => depth=$depth): $line"
    }
}
