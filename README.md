# VSCode-Cpp-GCC-Configurator

An automated script designed specifically for C++ beginners and developers who wish to simplify the VSCode configuration process.

# Portable VS Code — Usage Instructions

## 1. Configuration

- Before running any programs, when switching computers, run ".\built.bat" in the integrated terminal to add the compiler to the system PATH and configure the runtime environment.

- Before use, check configuration files (.json, .bat) to ensure VS Code points to the correct compiler and workspace.

- If you don't want to carry many files, keep only built.bat and built_vscode.bat; running built_vscode.bat will automatically generate tasks.json, launch.json and other files required for running and debugging. Precautions, Before use, modify the paths of each compiler in the.json file!

## 2. Running

1. Script execution: run "run.bat" directly in the integrated terminal.

2. Debugging and running: since the scripts already configure the JSON files, press Ctrl+F5 and select the "C++ Debug" task to run.

## 3. Advanced commands

- Console vs terminal: in launch.json change the "externalConsole" value — true for external console, false for integrated terminal.

- Compiler invocation: change the compiler used in tasks.json, launch.json, and c_cpp_properties.json (the compiler must be added to the PATH).

## 4. Start quickly

- The.JSON file has been configured in the repository. VSCode can automatically recognize it and use it quickly