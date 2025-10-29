:: Reset VS Code C++ configuration
:: This script recreates the .vscode directory with default configuration files
:: for C++ development using GCC on Windows.
:: Make sure to adjust paths if your MinGW installation is located elsewhere.
:: Modified: Line 17(<path_to_bin>)
@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

:: Check if it is running with administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Request administrator privileges to modify system environment variables...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Running with administrator privileges...

:: Please modify your MinGW bin directory path here
set "MingwBinPath=<path_to_bin>(Needs to be modified)"

:: Check if the specified path exists
if not exist "%MingwBinPath%" (
    echo Error: The path "!MingwBinPath!" does not exist.
    pause
    exit /b 1
)

echo Target path: "!MingwBinPath!"

:: Query the current system PATH variable from the registry
for /f "tokens=2*" %%A in ('reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path 2^>nul') do set "CurrentPath=%%B"

:: Check if it has already been added
echo !CurrentPath! | find /i "!MingwBinPath!" >nul
if !errorlevel! equ 0 (
    echo The path is already in the system PATH environment variable.
    pause
    exit /b
)

:: Ask the user if they want to add it
echo Do you want to add the above path to the system PATH environment variable? [Y/N]
set /p userConfirm=
if /i not "!userConfirm!"=="Y" (
    echo Operation canceled.
    pause
    exit /b
)

:: Add the new path to the existing PATH and write it to the registry with REG_EXPAND_SZ type
set "NewPath=!CurrentPath!;!MingwBinPath!"
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path /t REG_EXPAND_SZ /d "!NewPath!" /f >nul

if !errorlevel! equ 0 (
    echo Successfully added the path to the system environment variable!
    echo Note: You need to restart the command prompt or some applications for the changes to take effect.
) else (
    echo Error adding environment variable.
)

pause