# ============================================
# Linux Adventure Workshop — Split-Screen Launcher
# Opens Edge (left) + Windows Terminal Ubuntu (right)
# ============================================

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

# --- Launch Edge on the left ---
Start-Process "msedge.exe" "--new-window https://linux.brenes.info"
Start-Sleep -Seconds 3

$edge = Get-Process -Name msedge -ErrorAction SilentlyContinue |
        Where-Object { $_.MainWindowHandle -ne 0 } |
        Select-Object -First 1

if ($edge) {
    [WinAPI]::ShowWindow($edge.MainWindowHandle, 9) | Out-Null   # SW_RESTORE
    [WinAPI]::SetWindowPos($edge.MainWindowHandle, [IntPtr]::Zero,
        $left, $top, $halfW, $h, 0x0040) | Out-Null              # SWP_SHOWWINDOW
}

# --- Launch Windows Terminal with Ubuntu on the right ---
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

Write-Host "Workshop launched!" -ForegroundColor Green
