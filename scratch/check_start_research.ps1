$lines = Get-Content 'Neer_kavach\index.html'
for ($i = 1938; $i -lt 1970; $i++) {
    $line = $lines[$i]
    $opens = ([regex]::Matches($line, '<div\b')).Count
    $closes = ([regex]::Matches($line, '</div>')).Count
    if ($opens -ne $closes) {
        Write-Host "Line $($i+1) ($opens - $closes): $line"
    }
}
