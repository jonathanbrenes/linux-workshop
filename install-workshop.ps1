# ============================================
# 🐧 Linux Adventure Workshop — Installer
# ============================================
# Run this ONCE per laptop in PowerShell.
# It creates a desktop shortcut with a Tux icon
# that launches Edge + Ubuntu side by side.
#
# Usage (PowerShell):
#   irm https://raw.githubusercontent.com/jonathanbrenes/linux-workshop/main/install-workshop.ps1 | iex
# ============================================

$ErrorActionPreference = "Stop"
$appDir  = Join-Path $env:USERPROFILE ".linux-workshop"
$ps1File = Join-Path $appDir "launch-workshop.ps1"
$icoFile = Join-Path $appDir "tux.ico"
$lnkFile = Join-Path ([Environment]::GetFolderPath("Desktop")) "Linux Adventure Workshop.lnk"

Write-Host ""
Write-Host "  === Linux Adventure Workshop Installer ===" -ForegroundColor Cyan
Write-Host ""

# --- Create app folder ---
if (-not (Test-Path $appDir)) { New-Item -ItemType Directory -Path $appDir -Force | Out-Null }

# --- Generate Tux icon from emoji ---
Write-Host "  [1/3] Creating Tux penguin icon..." -ForegroundColor Yellow
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Forms

$sizes = @(256, 64, 48, 32, 16)
$images = @()

foreach ($sz in $sizes) {
    $bmp = New-Object System.Drawing.Bitmap($sz, $sz)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.SmoothingMode = "AntiAlias"
    $g.TextRenderingHint = "AntiAliasGridFit"
    $g.Clear([System.Drawing.Color]::White)
    $fontSize = [math]::Floor($sz * 0.75)
    $font = New-Object System.Drawing.Font("Segoe UI Emoji", $fontSize, [System.Drawing.FontStyle]::Regular)
    $sf = New-Object System.Drawing.StringFormat
    $sf.Alignment = "Center"
    $sf.LineAlignment = "Center"
    $rect = New-Object System.Drawing.RectangleF(0, 0, $sz, $sz)
    $g.DrawString([char]::ConvertFromUtf32(0x1F427), $font, [System.Drawing.Brushes]::Black, $rect, $sf)
    $g.Dispose()
    $font.Dispose()
    $images += $bmp
}

# Write multi-size ICO file
$ms = New-Object System.IO.MemoryStream
$bw = New-Object System.IO.BinaryWriter($ms)

# ICO header
$bw.Write([UInt16]0)       # reserved
$bw.Write([UInt16]1)       # type: icon
$bw.Write([UInt16]$sizes.Count)

$headerSize = 6 + ($sizes.Count * 16)
$dataOffset = $headerSize
$pngDataList = @()

foreach ($bmp in $images) {
    $pngStream = New-Object System.IO.MemoryStream
    $bmp.Save($pngStream, [System.Drawing.Imaging.ImageFormat]::Png)
    $pngBytes = $pngStream.ToArray()
    $pngStream.Dispose()
    $pngDataList += ,($pngBytes)

    $w = if ($bmp.Width -ge 256) { 0 } else { $bmp.Width }
    $h = if ($bmp.Height -ge 256) { 0 } else { $bmp.Height }

    $bw.Write([byte]$w)           # width
    $bw.Write([byte]$h)           # height
    $bw.Write([byte]0)            # color palette
    $bw.Write([byte]0)            # reserved
    $bw.Write([UInt16]1)          # color planes
    $bw.Write([UInt16]32)         # bits per pixel
    $bw.Write([UInt32]$pngBytes.Length)  # data size
    $bw.Write([UInt32]$dataOffset)      # data offset
    $dataOffset += $pngBytes.Length
}

foreach ($pngBytes in $pngDataList) {
    $bw.Write($pngBytes)
}

[System.IO.File]::WriteAllBytes($icoFile, $ms.ToArray())
$bw.Dispose()
$ms.Dispose()
foreach ($bmp in $images) { $bmp.Dispose() }

Write-Host "    -> $icoFile" -ForegroundColor DarkGray

# --- Download launch script ---
Write-Host "  [2/3] Downloading launcher script..." -ForegroundColor Yellow

$launchScript = @'
# Linux Adventure Workshop — Split-Screen Launcher
Add-Type -AssemblyName System.Windows.Forms
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class WinAPI {
    [DllImport("user32.dll")]
    public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);
    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
}
"@

$screen = [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea
$halfW  = [int]($screen.Width / 2)
$h      = $screen.Height
$left   = $screen.X
$top    = $screen.Y

Start-Process "msedge.exe" "--new-window https://linux.brenes.info"
Start-Sleep -Seconds 3

$edge = Get-Process -Name msedge -ErrorAction SilentlyContinue |
        Where-Object { $_.MainWindowHandle -ne 0 } |
        Select-Object -First 1

if ($edge) {
    [WinAPI]::ShowWindow($edge.MainWindowHandle, 9) | Out-Null
    [WinAPI]::SetWindowPos($edge.MainWindowHandle, [IntPtr]::Zero,
        $left, $top, $halfW, $h, 0x0040) | Out-Null
}

Start-Process "wt.exe" "-p Ubuntu"
Start-Sleep -Seconds 2

$wt = Get-Process -Name WindowsTerminal -ErrorAction SilentlyContinue |
      Where-Object { $_.MainWindowHandle -ne 0 } |
      Select-Object -First 1

if ($wt) {
    [WinAPI]::ShowWindow($wt.MainWindowHandle, 9) | Out-Null
    [WinAPI]::SetWindowPos($wt.MainWindowHandle, [IntPtr]::Zero,
        ($left + $halfW), $top, $halfW, $h, 0x0040) | Out-Null
}
'@

Set-Content -Path $ps1File -Value $launchScript -Encoding UTF8
Write-Host "    -> $ps1File" -ForegroundColor DarkGray

# --- Create desktop shortcut ---
Write-Host "  [3/3] Creating desktop shortcut..." -ForegroundColor Yellow

$ws = New-Object -ComObject WScript.Shell
$shortcut = $ws.CreateShortcut($lnkFile)
$shortcut.TargetPath = "powershell.exe"
$shortcut.Arguments = "-ExecutionPolicy Bypass -WindowStyle Hidden -File `"$ps1File`""
$shortcut.IconLocation = $icoFile
$shortcut.Description = "Open Edge + Ubuntu side by side for the Linux Adventure Workshop"
$shortcut.WorkingDirectory = $env:USERPROFILE
$shortcut.Save()

Write-Host "    -> $lnkFile" -ForegroundColor DarkGray
Write-Host ""
Write-Host "  Done! Look for 'Linux Adventure Workshop' on your Desktop." -ForegroundColor Green
Write-Host "  Double-click the Tux penguin to launch the workshop." -ForegroundColor Green
Write-Host ""
