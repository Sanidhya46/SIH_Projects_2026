$lines = Get-Content 'Neer_kavach\index.html'
for ($i = 1957; $i -lt 2445; $i++) {
    $line = $lines[$i]
    if ($line -match 'class="repo-card"') {
        # Check this card
        $cardLines = @()
        $j = $i
        while ($j -lt 2445 -and ($j -eq $i -or $lines[$j] -notmatch 'class="repo-card"')) {
            $cardLines += $lines[$j]
            $j++
        }
        $cText = $cardLines -join "`n"
        $o = ([regex]::Matches($cText, '<div\b')).Count
        $c = ([regex]::Matches($cText, '</div>')).Count
        if ($o -ne $c) {
            Write-Host "Card at line $($i+1): opens=$o, closes=$c (diff $($o - $c))"
            Write-Host $lines[$i+4]
        }
    }
}
