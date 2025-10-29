:: Reset VS Code C++ configuration
:: This script recreates the .vscode directory with default configuration files
:: for C++ development using GCC on Windows.
:: Make sure to adjust paths if your MinGW installation is located elsewhere.
:: Modified: Line 29(g++.exe), Line 46(g++.exe), Line 64(g++.exe), Line 87(gdb.exe).
@echo off
chcp 65001 >nul
echo Reset VS Code C++ configuration...

:: Recreate .vscode directory
if exist ".vscode" rmdir ".vscode" /S /Q
mkdir ".vscode"

:: Create c_cpp_properties.json
(
echo {
echo     "configurations": [
echo         {
echo             "name": "Win32",
echo             "includePath": [
echo                 "${workspaceFolder}/**"
echo             ],
echo             "defines": [
echo                 "_DEBUG",
echo                 "UNICODE",
echo                 "_UNICODE"
echo             ],
echo             "windowsSdkVersion": "10.0.22000.0",
echo             "compilerPath": "<path_to_g++.exe>(Needs to be modified)",
echo             "cStandard": "c17",
echo             "cppStandard": "c++14",
echo             "intelliSenseMode": "windows-gcc-x64"
echo         }
echo     ],
echo     "version": 4
echo }
) > ".vscode\c_cpp_properties.json"

:: Create tasks.json
(
echo {
echo     "tasks": [
echo         {
echo             "type": "cppbuild",
echo             "label": "C/C++: g++.exe generates active files",
echo             "command": "<path_to_g++.exe>(Needs to be modified)",
echo             "args": [
echo                 "-g",
echo                 "-std=c++14",
echo                 "-O2",
echo                 "-Wall",
echo                 "-fdiagnostics-color=always",
echo                 "${file}",
echo                 "-o",
echo                 "${fileDirname}\\\\${fileBasenameNoExtension}.exe"
echo             ],
echo             "options": {
echo                 "cwd": "${fileDirname}"
echo             },
echo             "problemMatcher": [
echo                 "$gcc"
echo             ],
echo             "group": "build",
echo             "detail": "Compiler: <path_to_g++.exe>(Needs to be modified)"
echo         }
echo     ],
echo     "version": "2.0.0"
echo }
) > ".vscode\tasks.json"

:: Create launch.json - Fix console issue
(
echo {
echo     "version": "0.2.0",
echo     "configurations": [
echo         {
echo             "name": "C++ Debug",
echo             "type": "cppdbg",
echo             "request": "launch",
echo             "program": "${fileDirname}\\\\${fileBasenameNoExtension}.exe",
echo             "args": [],
echo             "stopAtEntry": false,
echo             "cwd": "${fileDirname}",
echo             "environment": [],
echo             "externalConsole": true,
echo             "MIMode": "gdb",
echo             "miDebuggerPath": "<path_to_gdb.exe>(Needs to be modified)",
echo             "setupCommands": [
echo                 {
echo                     "description": "Enable pretty printing for gdb",
echo                     "text": "-enable-pretty-printing",
echo                     "ignoreFailures": false
echo                 }
echo             ],
echo             "preLaunchTask": "C/C++: g++.exe generates active files"
echo         }
echo     ]
echo }
) > ".vscode\launch.json"

echo.
echo ✓ Configuration reset complete!
echo.
echo Usage instructions:
echo 1. Open any .cpp file in VS Code
echo 2. Press F5 to start debugging (using external console)
echo 3. The console will automatically pause after the program finishes running
echo.
pause