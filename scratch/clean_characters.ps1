$files = @(
    "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\index.html",
    "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\video.html",
    "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Neer_kavach\simulation.html",
    "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\index.html",
    "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\video.html",
    "c:\Users\Sahil\OneDrive\Desktop\SIH_Projects\Saurya_Rakshak\simulation.html"
)

foreach ($f in $files) {
    if (Test-Path $f) {
        $content = [System.IO.File]::ReadAllText($f, [System.Text.Encoding]::UTF8)
        
        # Replace common mojibake sequences
        $content = $content.Replace("ðŸ§Š", "🧊")
        $content = $content.Replace("â†—", "↗")
        $content = $content.Replace("ðŸŽ¬", "🎬")
        $content = $content.Replace("ðŸŽ®", "🎮")
        $content = $content.Replace("â ±ï¸ ", "⏱️ ")
        $content = $content.Replace("ðŸ“ ", "📦 ")
        $content = $content.Replace("ðŸŒŠ", "🌊 ")
        $content = $content.Replace("âš¡", "⚡ ")
        $content = $content.Replace("â›‘ï¸ ", "⛑️ ")
        $content = $content.Replace("ðŸ§¤", "🧤 ")
        $content = $content.Replace("Â·", "·")
        $content = $content.Replace("â€¢", "•")
        $content = $content.Replace("â€"", "—")

        # Replace Tripo branding with professional English terms
        $content = $content.Replace("3D Model View (Tripo3D)", "3D Model View")
        $content = $content.Replace("Tripo3D Physical CAD Digital Twin", "Interactive 3D CAD Digital Twin")
        $content = $content.Replace("Tripo3D Model", "3D CAD Model")
        $content = $content.Replace("Launch Tripo3D Model", "Launch 3D CAD Model")

        [System.IO.File]::WriteAllText($f, $content, [System.Text.Encoding]::UTF8)
        Write-Output "Cleaned $f"
    }
}
