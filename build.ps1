# =====================================================
# Hugo Website Build & Deploy Script
# =====================================================
# Usage:
#   .\build.ps1           # Build only
#   .\build.ps1 -Deploy   # Build and deploy to MyWebsite
#   .\build.ps1 -Serve    # Start development server
#   .\build.ps1 -Clean    # Clean build artifacts
# =====================================================

param(
    [switch]$Deploy,
    [switch]$Serve,
    [switch]$Clean,
    [switch]$Minify = $true
)

$ErrorActionPreference = "Stop"

# Configuration
$HugoSource = $PSScriptRoot
$DeployTarget = "C:\Users\vaibh\OneDrive\Documents\GitHub\MyWebsite"
$PublicFolder = Join-Path $HugoSource "public"

# Colors for output
function Write-Success { param($msg) Write-Host "✓ $msg" -ForegroundColor Green }
function Write-Info { param($msg) Write-Host "→ $msg" -ForegroundColor Cyan }
function Write-Warning { param($msg) Write-Host "⚠ $msg" -ForegroundColor Yellow }
function Write-Error { param($msg) Write-Host "✗ $msg" -ForegroundColor Red }

# Banner
Write-Host ""
Write-Host "╔══════════════════════════════════════════╗" -ForegroundColor Magenta
Write-Host "║     Hugo Website Build Script            ║" -ForegroundColor Magenta
Write-Host "╚══════════════════════════════════════════╝" -ForegroundColor Magenta
Write-Host ""

# Check Hugo is installed
try {
    $hugoVersion = hugo version 2>&1
    Write-Info "Hugo found: $($hugoVersion -split ' ' | Select-Object -First 2 | Join-String -Separator ' ')"
} catch {
    Write-Error "Hugo is not installed or not in PATH"
    exit 1
}

# Development server mode
if ($Serve) {
    Write-Info "Starting development server..."
    Write-Host ""
    Write-Host "  Local:   http://localhost:1313/" -ForegroundColor Yellow
    Write-Host "  Press Ctrl+C to stop" -ForegroundColor Gray
    Write-Host ""
    Set-Location $HugoSource
    hugo server -D --disableFastRender
    exit 0
}

# Clean mode
if ($Clean) {
    Write-Info "Cleaning build artifacts..."
    if (Test-Path $PublicFolder) {
        Remove-Item -Path $PublicFolder -Recurse -Force
        Write-Success "Removed public/ folder"
    } else {
        Write-Warning "public/ folder doesn't exist"
    }
    exit 0
}

# Pre-build checks
Write-Info "Running pre-build checks..."

# Check that custom.css exists
$customCss = Join-Path $HugoSource "static\css\custom.css"
if (-not (Test-Path $customCss)) {
    Write-Warning "custom.css not found - creating empty file"
    New-Item -Path $customCss -ItemType File -Force | Out-Null
}

# Check theme exists
$themePath = Join-Path $HugoSource "themes\hugo-profile"
if (-not (Test-Path $themePath)) {
    Write-Error "Theme not found at $themePath"
    exit 1
}
Write-Success "Theme found"

# Check config exists
$configPath = Join-Path $HugoSource "config.yaml"
if (-not (Test-Path $configPath)) {
    Write-Error "config.yaml not found"
    exit 1
}
Write-Success "Config found"

# Build
Write-Host ""
Write-Info "Building site..."
Set-Location $HugoSource

if ($Minify) {
    hugo --minify
} else {
    hugo
}

if ($LASTEXITCODE -ne 0) {
    Write-Error "Hugo build failed"
    exit 1
}
Write-Success "Build completed"

# Get build stats
$fileCount = (Get-ChildItem -Path $PublicFolder -Recurse -File).Count
$folderSize = "{0:N2} MB" -f ((Get-ChildItem -Path $PublicFolder -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB)
Write-Info "Generated $fileCount files ($folderSize)"

# Deploy mode
if ($Deploy) {
    Write-Host ""
    Write-Info "Deploying to $DeployTarget..."
    
    if (-not (Test-Path $DeployTarget)) {
        Write-Error "Deploy target doesn't exist: $DeployTarget"
        exit 1
    }
    
    # Copy files
    Copy-Item -Path "$PublicFolder\*" -Destination $DeployTarget -Recurse -Force
    Write-Success "Files copied to deployment folder"
    
    # Show reminder
    Write-Host ""
    Write-Warning "Remember to commit and push changes in MyWebsite!"
    Write-Host "  cd `"$DeployTarget`"" -ForegroundColor Gray
    Write-Host "  git add ." -ForegroundColor Gray
    Write-Host "  git commit -m `"Update site`"" -ForegroundColor Gray
    Write-Host "  git push" -ForegroundColor Gray
}

Write-Host ""
Write-Success "Done!"
