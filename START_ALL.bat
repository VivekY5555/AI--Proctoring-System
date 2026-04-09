@echo off
title AI Proctoring System — Full Stack
echo.
echo Starting Backend on http://localhost:5000
start "ProctorAI Backend" cmd /k "cd /d ""%~dp0backend"" && python app.py"
timeout /t 3 /nobreak >nul
echo Starting Frontend on http://localhost:5173
start "ProctorAI Frontend" cmd /k "cd /d ""%~dp0frontend"" && npm run dev"
echo.
echo Both servers launching... open http://localhost:5173 in your browser.
pause
