$paths = @(
    "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\index.html",
    "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\video.html",
    "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\index.html",
    "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\video.html"
)

foreach ($p in $paths) {
    if (Test-Path $p) {
        $raw = [System.IO.File]::ReadAllText($p, [System.Text.Encoding]::UTF8)
        
        # Replace broken mojibake
        $raw = $raw.Replace([string][char]0x00f0 + [string][char]0x0178 + [string][char]0x00a7 + [string][char]0x0160, "[3D]")
        $raw = $raw.Replace("ðŸ§Š", "[3D]")
        $raw = $raw.Replace("â†—", "->")
        $raw = $raw.Replace("ðŸŽ¬", "[Video]")
        $raw = $raw.Replace("ðŸŽ®", "[Sim]")
        $raw = $raw.Replace("â ±ï¸ ", "[Time]")
        $raw = $raw.Replace("ðŸ“ ", "[Module]")
        $raw = $raw.Replace("ðŸŒŠ", "[Valve]")
        $raw = $raw.Replace("âš¡", "[Power]")
        $raw = $raw.Replace("â›‘ï¸ ", "[Helmet]")
        $raw = $raw.Replace("ðŸ§¤", "[Gloves]")
        $raw = $raw.Replace("Â·", "·")
        
        # Replace Tripo mentions
        $raw = $raw.Replace("(Tripo3D)", "")
        $raw = $raw.Replace("Tripo3D Physical CAD Digital Twin", "Interactive 3D CAD Digital Twin")
        $raw = $raw.Replace("Launch Tripo3D Model", "Launch 3D CAD Model")
        $raw = $raw.Replace("Tripo3D Model", "3D CAD Model")
        $raw = $raw.Replace("Tripo3D", "3D CAD Twin")
        
        [System.IO.File]::WriteAllText($p, $raw, [System.Text.Encoding]::UTF8)
        Write-Host "Processed $p"
    }
}
