@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

REM Check Windows Version
ver | findstr /i "5\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_nt5x
ver | findstr /i "5\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_nt5x
ver | findstr /i "5\.2\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_nt5x
ver | findstr /i "6\.0\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_nt6x
ver | findstr /i "6\.1\." > nul
IF %ERRORLEVEL% EQU 0 goto ver_nt6x
ver | findstr /i "6\.2\." > nul
if %ERRORLEVEL% EQU 0 goto ver_nt6x
ver | findstr /i "6\.3\." > nul
if %ERRORLEVEL% EQU 0 goto ver_nt6x
ver | findstr /i "10\.0\." > nul
if %ERRORLEVEL% EQU 0 goto ver_nt6x
goto warn_and_exit

:ver_nt5x
bootcfg /raw /a /safeboot:network /id 1
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v "*UndoSB" /t REG_SZ /d "bootcfg /raw /fastdetect /id 1"
SHUTDOWN -r -f -t 07
goto end

:ver_nt6x
bcdedit /set {current} safeboot network
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce /v "*UndoSB" /t REG_SZ /d "bcdedit /deletevalue {current} safeboot"
SHUTDOWN -r -f -t 07
goto end

:warn_and_exit
echo Machine OS cannot be determined.

:end 

cls
echo.
echo Windows will boot to Safe Mode in less than a minute!
echo.
echo WScript.Sleep^(WScript.Arguments^(0^)^) >"%temp%sleep.vbs" && cscript "%temp%sleep.vbs" 2000 >nul