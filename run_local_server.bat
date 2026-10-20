@echo off
title SIH Projects Local Server
echo Starting SIH Projects Local Web Server...
powershell -ExecutionPolicy Bypass -NoProfile -File "%~dp0serve.ps1" -Port 5000
pause
