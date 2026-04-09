@echo off
title AI Proctoring System — Frontend
echo.
echo ============================================
echo   ProctorAI Frontend  :  http://localhost:5173
echo ============================================
echo.
cd /d "%~dp0frontend"
npm run dev
pause
