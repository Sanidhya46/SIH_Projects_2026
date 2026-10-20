# Windows Native HTTP Server using .NET HttpListener
param([int]$Port = 5000)

$Root = $PSScriptRoot
if (-not $Root) { $Root = Get-Location }

$listener = New-Object System.Net.HttpListener
$prefix = "http://localhost:$Port/"
$listener.Prefixes.Add($prefix)

try {
    $listener.Start()
    Write-Host "==========================================================" -ForegroundColor Cyan
    Write-Host "  SIH Projects Dual Portal is running locally!" -ForegroundColor Green
    Write-Host "  Main Portal:           http://localhost:$Port/" -ForegroundColor Yellow
    Write-Host "  Neer Kavach:           http://localhost:$Port/#neer-kavach" -ForegroundColor Cyan
    Write-Host "  Saurya Rakshak:        http://localhost:$Port/#saurya-rakshak" -ForegroundColor Yellow
    Write-Host "  Neer Kavach Sim:       http://localhost:$Port/Neer_kavach/simulation.html" -ForegroundColor White
    Write-Host "  Saurya Rakshak Sim:    http://localhost:$Port/Saurya_Rakshak/simulation.html" -ForegroundColor White
    Write-Host "==========================================================" -ForegroundColor Cyan
    Write-Host "  Press Ctrl+C in this console to stop the server." -ForegroundColor Gray
} catch {
    Write-Host "Error starting listener: $_" -ForegroundColor Red
    exit 1
}

$mimeTypes = @{
    ".html" = "text/html; charset=utf-8"
    ".htm"  = "text/html; charset=utf-8"
    ".css"  = "text/css; charset=utf-8"
    ".js"   = "application/javascript; charset=utf-8"
    ".json" = "application/json; charset=utf-8"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".jpeg" = "image/jpeg"
    ".webp" = "image/webp"
    ".gif"  = "image/gif"
    ".svg"  = "image/svg+xml"
    ".ico"  = "image/x-icon"
    ".mp4"  = "video/mp4"
    ".webm" = "video/webm"
}

while ($listener.IsListening) {
    try {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response

        $urlPath = [System.Uri]::UnescapeDataString($request.Url.LocalPath).TrimStart('/')
        if ([string]::IsNullOrWhiteSpace($urlPath)) {
            $urlPath = "index.html"
        }

        $filePath = Join-Path $Root $urlPath

        if (Test-Path $filePath -PathType Container) {
            $filePath = Join-Path $filePath "index.html"
        }

        if (Test-Path $filePath -PathType Leaf) {
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            $mime = "application/octet-stream"
            if ($mimeTypes.ContainsKey($ext)) {
                $mime = $mimeTypes[$ext]
            }

            $bytes = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentType = $mime
            $response.ContentLength64 = $bytes.Length
            $response.Headers.Add("Access-Control-Allow-Origin", "*")
            $response.OutputStream.Write($bytes, 0, $bytes.Length)
        } else {
            $response.StatusCode = 404
            $msg = [System.Text.Encoding]::UTF8.GetBytes("404 Not Found: $urlPath")
            $response.ContentType = "text/plain"
            $response.ContentLength64 = $msg.Length
            $response.OutputStream.Write($msg, 0, $msg.Length)
        }

        $response.Close()
    } catch {
        # continue loop on client abort
    }
}
