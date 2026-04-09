# Clean stop and start script for ProctorAI

Write-Host "--- [1/3] CLEANING ZOMBIE PROCESSES ---" -ForegroundColor Cyan
taskkill /F /IM python.exe /T 2>$null
taskkill /F /IM node.exe /T 2>$null

Write-Host "--- [2/3] STARTING BACKEND (Port 5000) ---" -ForegroundColor Cyan
# Start backend in a separate window but keep it open on error
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd backend; Write-Host 'Starting Backend...'; python app.py" -WindowStyle Normal

Write-Host "--- [3/3] STARTING FRONTEND (Port 5173) ---" -ForegroundColor Cyan
# Start frontend
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd frontend; Write-Host 'Starting Frontend...'; npm run dev" -WindowStyle Normal

Write-Host ""
Write-Host "================================================" -ForegroundColor Green
Write-Host "🚀 SERVICES RESTARTED SUCCESSFULLY" -ForegroundColor Green
Write-Host "================================================" -ForegroundColor Green
Write-Host "Backend:  http://localhost:5000"
Write-Host "Frontend: http://localhost:5173"
Write-Host "================================================" -ForegroundColor Green
Write-Host "Check the new PowerShell windows for any errors." -ForegroundColor Yellow
