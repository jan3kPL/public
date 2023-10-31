@echo off

echo Disabling transparency effects, animations, and setting display zoom...

REM Disable transparency effects
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v ColorPrevalence /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v EnableWindowColorization /t REG_DWORD /d 0 /f

REM Disable animations
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Animations /t REG_DWORD /d 0 /f

REM Set display zoom to 100%
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v LogPixels /t REG_DWORD /d 96 /f

@echo off

echo Uninstalling UWP apps...

powershell -Command "Get-AppxPackage -Name AD2F1837.myHP | Remove-AppxPackage"
echo AD2F1837.myHP uninstalled.

powershell -Command "Get-AppxPackage -Name AD2F1837.HPPCHardwareDiagnosticsWindows | Remove-AppxPackage"
echo AD2F1837.HPPCHardwareDiagnosticsWindows uninstalled.

powershell -Command "Get-AppxPackage -Name AD2F1837.HPPowerManager | Remove-AppxPackage"
echo AD2F1837.HPPowerManager uninstalled.

powershell -Command "Get-AppxPackage -Name AD2F1837.HPPrivacySettings | Remove-AppxPackage"
echo AD2F1837.HPPrivacySettings uninstalled.

powershell -Command "Get-AppxPackage -Name AD2F1837.HPQuickDrop | Remove-AppxPackage"
echo AD2F1837.HPQuickDrop uninstalled.

powershell -Command "Get-AppxPackage -Name AD2F1837.HPSupportAssistant | Remove-AppxPackage"
echo AD2F1837.HPSupportAssistant uninstalled.

powershell -Command "Get-AppxPackage -Name AD2F1837.HPSystemInformation | Remove-AppxPackage"
echo AD2F1837.HPSystemInformation uninstalled.

powershell -Command "Get-AppxPackage -Name Clipchamp.Clipchamp | Remove-AppxPackage"
echo Clipchamp.Clipchamp uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.BingNews | Remove-AppxPackage"
echo Microsoft.BingNews uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.BingWeather | Remove-AppxPackage"
echo Microsoft.BingWeather uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.GamingApp | Remove-AppxPackage"
echo Microsoft.GamingApp uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.GetHelp | Remove-AppxPackage"
echo Microsoft.GetHelp uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.MicrosoftSolitaireCollection | Remove-AppxPackage"
echo Microsoft.MicrosoftSolitaireCollection uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.People | Remove-AppxPackage"
echo Microsoft.People uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.PowerAutomateDesktop | Remove-AppxPackage"
echo Microsoft.PowerAutomateDesktop uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.Todos | Remove-AppxPackage"
echo Microsoft.Todos uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.Whiteboard | Remove-AppxPackage"
echo Microsoft.Whiteboard uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.WindowsAlarms | Remove-AppxPackage"
echo Microsoft.WindowsAlarms uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.WindowsCamera | Remove-AppxPackage"
echo Microsoft.WindowsCamera uninstalled.

powershell -Command "Get-AppxPackage -Name microsoft.windowscommunicationsapps | Remove-AppxPackage"
echo microsoft.windowscommunicationsapps uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.WindowsFeedbackHub | Remove-AppxPackage"
echo Microsoft.WindowsFeedbackHub uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.WindowsMaps | Remove-AppxPackage"
echo Microsoft.WindowsMaps uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.WindowsSoundRecorder | Remove-AppxPackage"
echo Microsoft.WindowsSoundRecorder uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.WindowsTerminal | Remove-AppxPackage"
echo Microsoft.WindowsTerminal uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.Xbox.TCUI | Remove-AppxPackage"
echo Microsoft.Xbox.TCUI uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.XboxGameOverlay | Remove-AppxPackage"
echo Microsoft.XboxGameOverlay uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.XboxGamingOverlay | Remove-AppxPackage"
echo Microsoft.XboxGamingOverlay uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.XboxSpeechToTextOverlay | Remove-AppxPackage"
echo Microsoft.XboxSpeechToTextOverlay uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.YourPhone | Remove-AppxPackage"
echo Microsoft.YourPhone uninstalled.

powershell -Command "Get-AppxPackage -Name MicrosoftCorporation.MicrosoftFamily | Remove-AppxPackage"
echo MicrosoftCorporation.MicrosoftFamily uninstalled.

powershell -Command "Get-AppxPackage -Name Microsoft.XboxIdentityProvider | Remove-AppxPackage"
echo Microsoft.XboxIdentityProvider uninstalled.

echo UWP apps uninstalled.

@echo off

:: Uninstall Win32 programs one by one
echo Uninstalling Win32 program: HP Wolf Security - Console
powershell -Command "Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq 'HP Wolf Security - Console' } | ForEach-Object { $_.Uninstall() }"
echo Win32 program 'HP Wolf Security - Console' uninstalled.

echo Uninstalling Win32 program: HP Notifications
powershell -Command "Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq 'HP Notifications' } | ForEach-Object { $_.Uninstall() }"
echo Win32 program 'HP Notifications' uninstalled.

echo Uninstalling Win32 program: HP Security Update Service
powershell -Command "Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq 'HP Security Update Service' } | ForEach-Object { $_.Uninstall() }"
echo Win32 program 'HP Security Update Service' uninstalled.

echo Uninstalling Win32 program: HP Sure Recover
powershell -Command "Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq 'HP Sure Recover' } | ForEach-Object { $_.Uninstall() }"
echo Win32 program 'HP Sure Recover' uninstalled.

echo Uninstalling Win32 program: HP Wolf Security Application Support for Sure Sense
powershell -Command "Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq 'HP Wolf Security Application Support for Sure Sense' } | ForEach-Object { $_.Uninstall() }"
echo Win32 program 'HP Wolf Security Application Support for Sure Sense' uninstalled.

echo Uninstalling Win32 program: HP System Default Settings
powershell -Command "Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq 'HP System Default Settings' } | ForEach-Object { $_.Uninstall() }"
echo Win32 program 'HP System Default Settings' uninstalled.

echo Uninstalling Win32 program: HP Connection Optimizer
powershell -Command "Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq 'HP Connection Optimizer' } | ForEach-Object { $_.Uninstall() }"
echo Win32 program 'HP Connection Optimizer' uninstalled.

echo Uninstalling Win32 program: HP Documentation
powershell -Command "Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq 'HP Documentation' } | ForEach-Object { $_.Uninstall() }"
echo Win32 program 'HP Documentation' uninstalled.

echo Win32 programs uninstalled.

echo Downloading TeamViewerQS
powershell Invoke-WebRequest -Uri "https://download.teamviewer.com/QS" -OutFile "$env:USERPROFILE\Desktop\teamviewerqs.exe"


REM Get the App Installer app ID
powershell -Command "Get-AppxPackage -Name 'App Installer' | Select-Object PackageFullName"

REM Check for an update for the App Installer app
powershell -Command "Get-AppxPackage -Name '%App Installer PackageFullName%' | Update-AppxPackage -CheckOnly"

REM Wait for user input
echo Press ENTER to continue
pause

REM Try installing Google Chrome using winget
winget install Google.Chrome

pause


shutdown /r /t 0
