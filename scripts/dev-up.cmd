@echo off
setlocal

set MODE=%1
set OPENFLAG=%2
set ARGS=

if /I "%MODE%"=="dev" (
  set ARGS=-UseDevFrontend
)

if /I "%OPENFLAG%"=="open" (
  set ARGS=%ARGS% -OpenBrowser
)

pwsh -NoProfile -ExecutionPolicy Bypass -File scripts/dev-up.ps1 %ARGS%
set EXITCODE=%ERRORLEVEL%

exit /b %EXITCODE%
