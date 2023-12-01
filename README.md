# Afterbuild packaging

## About

Project 4 for "Configuration and deployment" class. NSIS installer to crate folder, send necessary files and set value on registry, uninstaller to undo all the operations

## Requirements

- Visual studio 2022
- NSIS

## How to run

1. Open the solution in VS
2. Build the Startup project HelloReader
3. Go to the "bin" folder generated and compile the "Hello_Installer.nsi" using NSIS
4. Run the created "hello_installer.exe" and the files should be at the Hello folder in your desktop
    - The registry value should be the student number on key "SOFTWARE\Wow6432Node\Configuration2023\Project4"
