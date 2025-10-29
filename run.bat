:: Reset VS Code C++ configuration
:: You need to modify the paths to match your MinGW installation(Line 4)
@echo off
"<path_to_g++.exe>(Needs to be modified)" -std=c++14 -O2 -Wall -o code.exe code.cpp && code.exe
pause