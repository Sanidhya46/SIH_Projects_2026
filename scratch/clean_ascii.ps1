$paths = @(
    "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\index.html",
    "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\video.html",
    "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\index.html",
    "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\video.html"
)

foreach ($p in $paths) {
    if (Test-Path $p) {
        $lines = [System.IO.File]::ReadAllLines($p, [System.Text.Encoding]::UTF8)
        $newLines = [System.Collections.Generic.List[string]]::new()
        
        foreach ($line in $lines) {
            $l = $line
            # Replace Tripo3D branding
            $l = $l.Replace("(Tripo3D)", "")
            $l = $l.Replace("Tripo3D Physical CAD Digital Twin", "Interactive 3D CAD Digital Twin")
            $l = $l.Replace("Launch Tripo3D Model", "Launch 3D CAD Model")
            $l = $l.Replace("Tripo3D Model", "3D CAD Model")
            $l = $l.Replace("Tripo3D", "3D CAD Twin")
            
            # Replace regex patterns of mojibake characters using unicode ranges
            $l = [System.Text.RegularExpressions.Regex]::Replace($l, "[\u00C2\u00C3\u00E0-\u00EF][\u0080-\u00BF\u0160\u0178\u00A0-\u00FF\u2000-\u206F]{1,3}", "")
            
            # Fix empty icons or arrows
            $l = $l.Replace('class="icon"></span>', 'class="icon">🎮</span>')
            $l = $l.Replace('>  ↗', '> ↗')
            
            $newLines.Add($l)
        }
        
        [System.IO.File]::WriteAllLines($p, $newLines, [System.Text.Encoding]::UTF8)
        Write-Host ("Cleaned: " + $p)
    }
}
