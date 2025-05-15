@echo off
:: Cueverse AutoPush Script - Deploy to GitHub & Vercel

:: Navigate to your local repo
cd /d "C:\Cueverse_HQ\Websites\Cueverse_Industries"

:: Archive backup with timestamp
set dt=%date:~-4%-%date:~4,2%-%date:~7,2%_%time:~0,2%%time:~3,2%
if exist C:\Cueverse_HQ\Backups\NUL (
  echo.
) else (
  mkdir C:\Cueverse_HQ\Backups
)
powershell Compress-Archive -Path * -DestinationPath "C:\Cueverse_HQ\Backups\cueverse_%dt%.zip"

:: Git commit and push
git add .
git commit -m "Auto-push from Cueverse HQ %dt%"
git push origin main

:: Open the live site
start https://cueverse.org

echo.
echo ✅ Site pushed and backup saved as cueverse_%dt%.zip
pause
