@echo off

REM Disable transparency effects
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v ColorPrevalence /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM" /v EnableWindowColorization /t REG_DWORD /d 0 /f

REM Disable animations
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Animations /t REG_DWORD /d 0 /f

REM Set display zoom to 100%
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v LogPixels /t REG_DWORD /d 96 /f

echo Disabling transparency effects, animations, and setting display zoom...

echo Uninstalling UWP apps...
:: Uninstall UWP apps
powershell -Command "Get-AppxPackage -Name AD2F1837.HPPCHardwareDiagnosticsWindows, AD2F1837.HPPowerManager, AD2F1837.HPPrivacySettings, AD2F1837.HPQuickDrop, AD2F1837.HPSupportAssistant, AD2F1837.HPSystemInformation, AD2F1837.myHP, Clipchamp.Clipchamp, Microsoft.BingNews, Microsoft.BingWeather, Microsoft.GamingApp, Microsoft.GetHelp, Microsoft.MicrosoftSolitaireCollection, Microsoft.People, Microsoft.PowerAutomateDesktop, Microsoft.Todos, Microsoft.Whiteboard, Microsoft.WindowsAlarms, Microsoft.WindowsCamera, microsoft.windowscommunicationsapps, Microsoft.WindowsFeedbackHub, Microsoft.WindowsMaps, Microsoft.WindowsSoundRecorder, Microsoft.WindowsTerminal, Microsoft.XboxGameCallableUI, Microsoft.Xbox.TCUI, Microsoft.XboxGameOverlay, Microsoft.XboxGamingOverlay, Microsoft.XboxSpeechToTextOverlay, Microsoft.YourPhone, MicrosoftCorporation.MicrosoftFamily, Microsoft.XboxIdentityProvider | Remove-AppxPackage"

echo UWP apps uninstalled.

echo Uninstalling Win32 programs...
:: Uninstall Win32 programs
powershell -Command "Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq 'HP Wolf Security - Console' -or $_.Name -eq 'HP Notifications' -or $_.Name -eq 'HP Security Update Service' -or $_.Name -eq 'HP Sure Recover' -or $_.Name -eq 'HP Wolf Security Application Support for Sure Sense' -or $_.Name -eq 'HP System Default Settings' -or $_.Name -eq 'HP Wolf Security' -or $_.Name -eq 'ICS' -or $_.Name -eq 'HP Sure Run Module' } | ForEach-Object { $_.Uninstall() }"

echo Win32 programs uninstalled.

echo Script completed. Please restart your computer for changes to take effect.
pause
