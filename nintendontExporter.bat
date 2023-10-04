@echo off
setlocal enabledelayedexpansion

set /p "inputDirectory=Enter the path to the directory containing GC ISO files: "
set /p "outputDirectory=Enter the path to nintendont games directory: "

if not exist "%inputDirectory%" (
    echo Input directory does not exist.
    exit /b 1
)

if not exist "%outputDirectory%" (
    mkdir "%outputDirectory%"
)

for %%F in ("%inputDirectory%\*") do (
    if %%~nxF neq "" (
        set "folderName=%%~nF"
        mkdir "%outputDirectory%\!folderName!"
        copy "%%F" "%outputDirectory%\!folderName!\game.iso"
    )
)

echo Task completed.
exit /b 0
