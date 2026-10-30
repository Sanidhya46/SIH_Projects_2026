$f = "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\index.html"
$lines = [System.IO.File]::ReadAllLines($f, [System.Text.Encoding]::UTF8)

for ($i = 0; $i -lt $lines.Length; $i++) {
    if ($lines[$i] -match "3D Model View") {
        $lines[$i] = '        <span class="icon">&#129482;</span> Interactive 3D Model &#8599;'
    }
    if ($lines[$i] -match "3D CAD Video View") {
        $lines[$i] = '        <span class="icon">&#127916;</span> 3D CAD Video & Sim'
    }
    if ($lines[$i] -match "Interactive 3D Model") {
        $lines[$i] = $lines[$i] -replace "Interactive 3D Model.*", "Interactive 3D Model &#8599;"
    }
    if ($lines[$i] -match "Dedicated Video Page") {
        $lines[$i] = $lines[$i] -replace "Dedicated Video Page.*", "Dedicated Video Page &#8599;"
    }
    if ($lines[$i] -match "Duration: 12 Seconds") {
        $lines[$i] = '            <span style="font-family:var(--font-mono); font-size:0.78rem; background:#fff; border:1px solid #cbd5e1; padding:0.25rem 0.65rem; border-radius:6px;">&#9201; Duration: 12 Seconds</span>'
    }
    if ($lines[$i] -match "Smart Tactical Helmet") {
        $lines[$i] = '            <span style="font-family:var(--font-mono); font-size:0.78rem; background:#fff; border:1px solid #cbd5e1; padding:0.25rem 0.65rem; border-radius:6px;">&#9977; Smart Tactical Helmet</span>'
    }
    if ($lines[$i] -match "Armored Sensing Gloves") {
        $lines[$i] = '            <span style="font-family:var(--font-mono); font-size:0.78rem; background:#fff; border:1px solid #cbd5e1; padding:0.25rem 0.65rem; border-radius:6px;">&#129505; Armored Sensing Gloves</span>'
    }
    if ($lines[$i] -match "415V Touch Protection") {
        $lines[$i] = '            <span style="font-family:var(--font-mono); font-size:0.78rem; background:#fff; border:1px solid #cbd5e1; padding:0.25rem 0.65rem; border-radius:6px;">&#9889; 415V Touch Protection</span>'
    }
    if ($lines[$i] -match "Switch to Interactive Simulation") {
        $lines[$i] = '            Switch to Interactive Simulation &#127918;'
    }
}

[System.IO.File]::WriteAllLines($f, $lines, [System.Text.Encoding]::UTF8)
Write-Host "Updated Saurya Rakshak with safe HTML entities!"
