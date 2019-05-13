@ECHO OFF

IF NOT EXIST "%PROGRAMFILES(X86)%" GOTO X32
IF EXIST "%PROGRAMFILES(X86)%" GOTO X64

:X32
REN kprocesshacker32.sys kprocesshacker.sys
PHx32.exe -c -ctype process -cobject ekrn.exe -caction terminate -s
TIMEOUT /T 10
DEL "%ALLUSERSPROFILE%\ESET\ESET Endpoint Security\License" /S /Q /F
DEL "%ALLUSERSPROFILE%\ESET\ESET Endpoint Antivirus\License" /S /Q /F
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\LicenseInfo" /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Info" /v WebActivationState /t REG_DWORD /d 4353 /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000400\Settings" /v FailSafeServer /t REG_SZ /d "http://update.eset.com/eset_eval/" /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000400\Settings" /v Password /t REG_BINARY /d 50D6A3E9EEF093F2686447AD80C86175DC3153BC /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000400\Settings" /v Username /t REG_BINARY /d 5748522d3133323435373638 /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v ECPLicensePublicID /t REG_BINARY /d 48414C2D393030302D574852 /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v ECPLicensteState /t REG_DWORD /d 4353 /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v ECPSeatID /t REG_BINARY /d 64633032646363342d316536312d343335652d396432342d653939316165616264353061 /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v @ECPLicensePublicID /t REG_QWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v @ECPLicensteState /t REG_QWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v @ECPSeatID /t REG_QWORD /d 0 /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000001\settings" /v selfdefense /t REG_DWORD /d 1 /f
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000001\settings" /v @selfdefense /t REG_QWORD /d 0 /f
SetACLx86.exe -on "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Info"  -ot reg -actn ace -ace "n:System;p:set_val;m:deny"
SetACLx86.exe -on "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" -ot reg -actn ace -ace "n:System;p:set_val;m:deny"
PHx32.exe -c -ctype process -cobject ekrn.exe -caction terminate -s
GOTO MSG

:X64
REN kprocesshacker64.sys kprocesshacker.sys
PHx64.exe -c -ctype process -cobject ekrn.exe -caction terminate -s
TIMEOUT /T 10
DEL "%ALLUSERSPROFILE%\ESET\ESET Endpoint Security\License" /S /Q /F
DEL "%ALLUSERSPROFILE%\ESET\ESET Endpoint Antivirus\License" /S /Q /F
REG DELETE "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\LicenseInfo" /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Info" /v WebActivationState /t REG_DWORD /d 4353 /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000400\Settings" /v FailSafeServer /t REG_SZ /d "http://update.eset.com/eset_eval/" /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000400\Settings" /v Password /t REG_BINARY /d 50D6A3E9EEF093F2686447AD80C86175DC3153BC /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000400\Settings" /v Username /t REG_BINARY /d 5748522d3133323435373638 /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v ECPLicensePublicID /t REG_BINARY /d 48414C2D393030302D574852 /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v ECPLicensteState /t REG_DWORD /d 4353 /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v ECPSeatID /t REG_BINARY /d 64633032646363342d316536312d343335652d396432342d653939316165616264353061 /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v @ECPLicensePublicID /t REG_QWORD /d 0 /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v @ECPLicensteState /t REG_QWORD /d 0 /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" /v @ECPSeatID /t REG_QWORD /d 0 /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000001\settings" /v selfdefense /t REG_DWORD /d 1 /f /REG:64
REG ADD "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000001\settings" /v @selfdefense /t REG_QWORD /d 0 /f /REG:64
SetACLx64.exe -on "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Info" -ot reg -actn ace -ace "n:System;p:set_val;m:deny"
SetACLx64.exe -on "HKLM\SOFTWARE\ESET\ESET Security\CurrentVersion\Plugins\01000600\Settings\EKRN_CFG" -ot reg -actn ace -ace "n:System;p:set_val;m:deny"
PHx64.exe -c -ctype process -cobject ekrn.exe -caction terminate -s
GOTO MSG

:MSG
ECHO MSGBOX "Activation done." > message.vbs
CALL message.vbs
DEL kprocesshacker.sys
DEL message.vbs
EXIT