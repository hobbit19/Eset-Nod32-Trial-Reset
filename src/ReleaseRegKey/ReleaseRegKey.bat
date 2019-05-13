@ECHO OFF

IF NOT EXIST "%PROGRAMFILES(X86)%" GOTO 32BIT
IF EXIST "%PROGRAMFILES(X86)%" GOTO 64BIT

:64BIT
SetACLx64.exe -on "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Info"  -ot reg -actn clear -clr dacl,sacl -silent
SetACLx64.exe -on "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" -ot reg -actn clear -clr dacl,sacl -silent
GOTO FIN

:32BIT
SetACLx86.exe -on "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Info"  -ot reg -actn clear -clr dacl,sacl -silent
SetACLx86.exe -on "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" -ot reg -actn clear -clr dacl,sacl -silent
GOTO FIN

:FIN
EXIT