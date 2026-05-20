# ============================================
# Linux Adventure Workshop - All-in-One Installer
# ============================================
# Run this ONCE per laptop in PowerShell (as Admin recommended).
# It does everything: installs WSL+Ubuntu, downloads workshop
# files, installs fun tools, and creates a desktop shortcut.
#
# Usage (PowerShell):
#   irm https://raw.githubusercontent.com/jonathanbrenes/linux-workshop/main/install-workshop.ps1 | iex
# ============================================

$ErrorActionPreference = "Stop"
$repo    = "https://raw.githubusercontent.com/jonathanbrenes/linux-workshop/main"
$appDir  = Join-Path $env:USERPROFILE ".linux-workshop"
$ps1File = Join-Path $appDir "launch-workshop.ps1"
$icoFile = Join-Path $appDir "tux.ico"
$lnkFile = Join-Path ([Environment]::GetFolderPath("Desktop")) "Linux Adventure Workshop.lnk"

Write-Host ""
Write-Host "  =========================================" -ForegroundColor Cyan
Write-Host "  Linux Adventure Workshop - Installer" -ForegroundColor Cyan
Write-Host "  =========================================" -ForegroundColor Cyan
Write-Host ""

if (-not (Test-Path $appDir)) { New-Item -ItemType Directory -Path $appDir -Force | Out-Null }

# =============================================
# STEP 1: Install WSL + Ubuntu
# =============================================
Write-Host "  [1/5] Checking WSL + Ubuntu..." -ForegroundColor Yellow

$wslReady = $false
try {
    $wslOutput = wsl --status 2>&1
    if ($LASTEXITCODE -eq 0) { $wslReady = $true }
} catch {}

if ($wslReady) {
    Write-Host "    -> WSL is already installed." -ForegroundColor DarkGray
} else {
    Write-Host "    -> Installing WSL with Ubuntu (this may take a few minutes)..." -ForegroundColor Yellow
    wsl --install -d Ubuntu --no-launch
    if ($LASTEXITCODE -eq 0) {
        Write-Host "    -> WSL + Ubuntu installed." -ForegroundColor Green
        Write-Host ""
        Write-Host "  REBOOT REQUIRED" -ForegroundColor Red
        Write-Host "  Please reboot this laptop, then:" -ForegroundColor Red
        Write-Host "    1. Open Ubuntu from the Start menu to finish first-time setup" -ForegroundColor Red
        Write-Host "    2. Run this installer again to complete the remaining steps" -ForegroundColor Red
        Write-Host ""
        return
    } else {
        Write-Host "    -> WSL install failed (exit code $LASTEXITCODE). Try running as Administrator." -ForegroundColor Red
        return
    }
}

# Check that Ubuntu distro is available
$distros = wsl -l -q 2>&1
if ($distros -notmatch "Ubuntu") {
    Write-Host "    -> Ubuntu distro not found. Installing..." -ForegroundColor Yellow
    wsl --install -d Ubuntu --no-launch
    Write-Host "    -> Open Ubuntu from the Start menu to finish first-time setup, then re-run this installer." -ForegroundColor Cyan
    return
}

Write-Host "    -> Ubuntu is ready." -ForegroundColor DarkGray

# =============================================
# STEP 2: Download & run workshop setup scripts
# =============================================
Write-Host "  [2/5] Setting up workshop files in Ubuntu..." -ForegroundColor Yellow
wsl -d Ubuntu -- bash -c "curl -sL $repo/setup.sh | bash"
Write-Host "    -> Activity folders created in ~/linux-adventure/" -ForegroundColor DarkGray

# =============================================
# STEP 3: Install fun tools (cowsay, sl, etc.)
# =============================================
Write-Host '  [3/5] Installing fun tools (cowsay, sl, cmatrix, figlet)...' -ForegroundColor Yellow
wsl -d Ubuntu -- bash -c "curl -sL $repo/bonus/setup-fun.sh | sudo bash"
Write-Host "    -> Fun tools installed." -ForegroundColor DarkGray

# =============================================
# STEP 4: Create Tux icon + launcher + shortcut
# =============================================
Write-Host "  [4/5] Creating Tux penguin icon..." -ForegroundColor Yellow
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

$ms = New-Object System.IO.MemoryStream
$bw = New-Object System.IO.BinaryWriter($ms)
$bw.Write([UInt16]0); $bw.Write([UInt16]1); $bw.Write([UInt16]$sizes.Count)

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
    $bw.Write([byte]$w); $bw.Write([byte]$h); $bw.Write([byte]0); $bw.Write([byte]0)
    $bw.Write([UInt16]1); $bw.Write([UInt16]32)
    $bw.Write([UInt32]$pngBytes.Length); $bw.Write([UInt32]$dataOffset)
    $dataOffset += $pngBytes.Length
}
foreach ($pngBytes in $pngDataList) { $bw.Write($pngBytes) }

[System.IO.File]::WriteAllBytes($icoFile, $ms.ToArray())
$bw.Dispose(); $ms.Dispose()
foreach ($bmp in $images) { $bmp.Dispose() }
Write-Host "    -> $icoFile" -ForegroundColor DarkGray

# =============================================
# STEP 5: Create launcher script + desktop shortcut
# =============================================
Write-Host "  [5/5] Creating desktop shortcut..." -ForegroundColor Yellow

$nl = [Environment]::NewLine
$hereOpen = [char]64 + [char]34
$hereClose = [char]34 + [char]64
$launchScript = '# Linux Adventure Workshop - Split-Screen Launcher' + $nl
$launchScript += 'Add-Type -AssemblyName System.Windows.Forms' + $nl
$launchScript += "Add-Type $hereOpen" + $nl
$launchScript += 'using System;' + $nl
$launchScript += 'using System.Runtime.InteropServices;' + $nl
$launchScript += 'public class WinAPI {' + $nl
$launchScript += '    [DllImport("user32.dll")]' + $nl
$launchScript += '    public static extern bool SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);' + $nl
$launchScript += '    [DllImport("user32.dll")]' + $nl
$launchScript += '    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);' + $nl
$launchScript += '}' + $nl
$launchScript += $hereClose + $nl
$launchScript += '' + $nl
$launchScript += '$screen = [System.Windows.Forms.Screen]::PrimaryScreen.WorkingArea' + $nl
$launchScript += '$halfW  = [int]($screen.Width / 2)' + $nl
$launchScript += '$h      = $screen.Height' + $nl
$launchScript += '$left   = $screen.X' + $nl
$launchScript += '$top    = $screen.Y' + $nl
$launchScript += '' + $nl
$launchScript += 'Start-Process "msedge.exe" "--new-window https://linux.brenes.info"' + $nl
$launchScript += 'Start-Sleep -Seconds 3' + $nl
$launchScript += '' + $nl
$launchScript += '$edge = Get-Process -Name msedge -ErrorAction SilentlyContinue |' + $nl
$launchScript += '        Where-Object { $_.MainWindowHandle -ne 0 } |' + $nl
$launchScript += '        Select-Object -First 1' + $nl
$launchScript += '' + $nl
$launchScript += 'if ($edge) {' + $nl
$launchScript += '    [WinAPI]::ShowWindow($edge.MainWindowHandle, 9) | Out-Null' + $nl
$launchScript += '    [WinAPI]::SetWindowPos($edge.MainWindowHandle, [IntPtr]::Zero,' + $nl
$launchScript += '        $left, $top, $halfW, $h, 0x0040) | Out-Null' + $nl
$launchScript += '}' + $nl
$launchScript += '' + $nl
$launchScript += 'Start-Process "wt.exe" "-p Ubuntu"' + $nl
$launchScript += 'Start-Sleep -Seconds 2' + $nl
$launchScript += '' + $nl
$launchScript += '$wt = Get-Process -Name WindowsTerminal -ErrorAction SilentlyContinue |' + $nl
$launchScript += '      Where-Object { $_.MainWindowHandle -ne 0 } |' + $nl
$launchScript += '      Select-Object -First 1' + $nl
$launchScript += '' + $nl
$launchScript += 'if ($wt) {' + $nl
$launchScript += '    [WinAPI]::ShowWindow($wt.MainWindowHandle, 9) | Out-Null' + $nl
$launchScript += '    [WinAPI]::SetWindowPos($wt.MainWindowHandle, [IntPtr]::Zero,' + $nl
$launchScript += '        ($left + $halfW), $top, $halfW, $h, 0x0040) | Out-Null' + $nl
$launchScript += '}'

Set-Content -Path $ps1File -Value $launchScript -Encoding UTF8

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
Write-Host "  All done! Laptop is ready for the workshop." -ForegroundColor Green
Write-Host "  Double-click the Tux penguin on the Desktop to launch." -ForegroundColor Green
Write-Host ""
