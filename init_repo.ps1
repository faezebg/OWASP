# init_repo.ps1
# اجرای محلی برای مقداردهی گیت و ایجاد شش کامیت معنی‌دار
[CmdletBinding()]
param(
    [string]$Name = "Nine",
    [string]$Email = "nine@example.com",
    [string]$Remote = ""
)

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git در سیستم شما نصب نیست. لطفاً Git را نصب کنید و سپس این اسکریپت را اجرا کنید." -ForegroundColor Red
    exit 1
}

git init
git config user.name "$Name"
git config user.email "$Email"

Write-Host "Creating 6 structured commits..." -ForegroundColor Cyan

# Commit 1: app.py
if (Test-Path app.py) {
    git add app.py
    git commit -m "Initial: add app.py (main application)" || Write-Host "commit skipped (no changes)"
}

# Commit 2: app-safe.py
if (Test-Path app-safe.py) {
    git add app-safe.py
    git commit -m "Add app-safe.py (safer example for comparisons)" || Write-Host "commit skipped (no changes)"
}

# Commit 3: cracker.py
if (Test-Path cracker.py) {
    git add cracker.py
    git commit -m "Add cracker.py (password analysis/cracking utility)" || Write-Host "commit skipped (no changes)"
}

# Commit 4: password lists
$lists = @('passProbablyList.txt','passwords.txt','passwords-safe.txt')
foreach ($f in $lists) {
    if (Test-Path $f) { git add $f }
}
if ((git status --porcelain) -ne $null) {
    git commit -m "Add password lists and samples" || Write-Host "commit skipped (no changes)"
}

# Commit 5: templates
if (Test-Path templates) {
    git add templates
    git commit -m "Add HTML templates (templates/index.html)" || Write-Host "commit skipped (no changes)"
}

# Commit 6: README and .gitignore
if (Test-Path README.md) { git add README.md }
if (Test-Path .gitignore) { git add .gitignore }
if ((git status --porcelain) -ne $null) {
    git commit -m "Add README and .gitignore; document publishing steps" || Write-Host "commit skipped (no changes)"
}

Write-Host "Local git history prepared." -ForegroundColor Green

if ($Remote -ne "") {
    Write-Host "Adding remote and pushing to origin/main..." -ForegroundColor Cyan
    git branch -M main
    if (-not (git remote get-url origin 2>$null)) {
        git remote add origin $Remote
    }
    git push -u origin main
}

Write-Host "Done. برای انتشار از ".\init_repo.ps1 -Name 'Your Name' -Email 'you@example.com' -Remote '<REMOTE_URL>'" استفاده کنید." -ForegroundColor Green
