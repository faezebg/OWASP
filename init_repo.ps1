# init_repo.ps1
# اجرای محلی برای مقداردهی گیت و ایجاد کامیت‌ها
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git در سیستم شما نصب نیست. لطفاً Git را نصب کنید و سپس این اسکریپت را اجرا کنید." -ForegroundColor Red
    exit 1
}

git init
git config user.name "Nine"
git config user.email "nine@example.com"

git add app.py app-safe.py cracker.py
git commit -m "Initial: add core application scripts (app, app-safe, cracker)"

git add passProbablyList.txt passwords.txt passwords-safe.txt templates/index.html
git commit -m "Add password lists and HTML template"

git add README.md
git commit -m "Add README with project overview and publish instructions"

git add .gitignore
git commit -m "Add .gitignore"

git commit --allow-empty -m "Docs: expand README and publishing notes"

Write-Host "Local git history created. برای انتشار، ریپوزیتوری جدید در گیت‌هاب بسازید و remote را اضافه کرده و push کنید." -ForegroundColor Green
