$content = Get-Content 'Neer_kavach\index.html' -Raw

# Check all view divs
$viewMatches = [regex]::Matches($content, '(?s)<div[^>]+id="(view-[^"]+)"[^>]*>')
Write-Host "Found views:"
foreach ($vm in $viewMatches) {
    Write-Host "  " $vm.Groups[1].Value "at index" $vm.Index
}

# Check if view-simulation is inside another div
# Let's count open divs before each view
foreach ($vm in $viewMatches) {
    $before = $content.Substring(0, $vm.Index)
    $openDivs = ([regex]::Matches($before, '<div\b')).Count
    $closeDivs = ([regex]::Matches($before, '</div>')).Count
    $diff = $openDivs - $closeDivs
    Write-Host "View $($vm.Groups[1].Value) depth (open - close): $diff"
}
