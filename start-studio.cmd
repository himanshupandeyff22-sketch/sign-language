@echo off
setlocal
cd /d "%~dp0"
set "SIGN_NODE=node"
where node >nul 2>&1
if errorlevel 1 set "SIGN_NODE=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe"
if not "%SIGN_NODE%"=="node" if not exist "%SIGN_NODE%" (
  echo Node.js 22.13 or newer is required. Install Node.js, then try again.
  pause
  exit /b 1
)
if not exist "node_modules\three\build\three.module.js" (
  echo Dependencies are missing. Run npm install from this folder first.
  pause
  exit /b 1
)
echo Starting Aarav's studio at http://127.0.0.1:3000
echo Keep this window open while using the studio. Press Ctrl+C to stop.
"%SIGN_NODE%" server.mjs
pause
