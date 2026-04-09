@echo off
title AI Proctoring System — Backend
echo.
echo ============================================
echo   ProctorAI Backend   :   http://localhost:5000
echo ============================================
echo.
cd /d "%~dp0backend"
python app.py
pause
