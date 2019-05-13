@ECHO OFF

IF NOT EXIST "%PROGRAMFILES(X86)%" GOTO X32
IF EXIST "%PROGRAMFILES(X86)%" GOTO X64

:X32
REN kprocesshacker32.sys kprocesshacker.sys
PHx32.exe -c -ctype process -cobject ekrn.exe -caction terminate -s
TIMEOUT /T 10
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Info" /v WebActivationState /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000400\Settings" /v FailSafeServer /t REG_SZ /d "http://update.eset.com/eset_upd/ep6/" /f
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000400\Settings" /v Password /f
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000400\Settings" /v Username /f
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v ECPLicensePublicID /f
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v ECPLicensteState /f
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v ECPSeatID /f
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v @ECPLicensePublicID /f
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v @ECPLicensteState /f
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v @ECPSeatID /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000001\settings" /v selfdefense /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000001\settings" /v @selfdefense /t REG_QWORD /d 0 /f
SetACLx86.exe -on "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Info" -ot reg -actn clear -clr dacl,sacl -silent
SetACLx86.exe -on "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" -ot reg -actn clear -clr dacl,sacl -silent
PHx32.exe -c -ctype process -cobject ekrn.exe -caction terminate -s
GOTO MSG

:X64
REN kprocesshacker64.sys kprocesshacker.sys
PHx64.exe -c -ctype process -cobject ekrn.exe -caction terminate -s
TIMEOUT /T 10
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Info" /v WebActivationState /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000400\Settings" /v FailSafeServer /t REG_SZ /d "http://update.eset.com/eset_upd/ep6/" /f /REG:64
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000400\Settings" /v Password /f /REG:64
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000400\Settings" /v Username /f /REG:64
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v ECPLicensePublicID /f /REG:64
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v ECPLicensteState /f /REG:64
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v ECPSeatID /f /REG:64
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v @ECPLicensePublicID /f /REG:64
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v @ECPLicensteState /f /REG:64
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v @ECPSeatID /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000001\settings" /v selfdefense /t REG_DWORD /d 1 /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000001\settings" /v @selfdefense /t REG_QWORD /d 0 /f /REG:64
SetACLx64.exe -on "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Info" -ot reg -actn clear -clr dacl,sacl -silent
SetACLx64.exe -on "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" -ot reg -actn clear -clr dacl,sacl -silent
PHx64.exe -c -ctype process -cobject ekrn.exe -caction terminate -s
GOTO MSG

:MSG
ECHO MSGBOX "Deactivation done." > message.vbs
CALL message.vbs
DEL kprocesshacker.sys
DEL message.vbs
EXIT