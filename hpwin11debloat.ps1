	# powershell.exe -ExecutionPolicy Bypass -File "C:\Users\user\Downloads\hpwin11debloat.ps1"

$UninstallPackages = @(
    "AD2F1837.HPJumpStarts"
    "AD2F1837.HPPCHardwareDiagnosticsWindows"
    "AD2F1837.HPPowerManager"
    "AD2F1837.HPPrivacySettings"
    "AD2F1837.HPSupportAssistant"
    "AD2F1837.HPSureShieldAI"
    "AD2F1837.HPSystemInformation"
    "AD2F1837.HPQuickDrop"
    "AD2F1837.HPWorkWell"
    "AD2F1837.myHP"
    "AD2F1837.HPDesktopSupportUtilities"
    "AD2F1837.HPQuickTouch"
    "AD2F1837.HPEasyClean"
    "AD2F1837.HPSystemInformation"
    "Clipchamp.Clipchamp"
    "Microsoft.BingNews"
    "Microsoft.BingWeather"
    "Microsoft.GamingApp"
    "Microsoft.GetHelp"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.People"
    "Microsoft.PowerAutomateDesktop"
    "Microsoft.Teams"
    "Microsoft.Todos"
    "Microsoft.Whiteboard"
    "Microsoft.WindowsAlarms"
    "Microsoft.WindowsCamera"
    "microsoft.windowscommunicationsapps"
    "Microsoft.WindowsFeedbackHub"
    "Microsoft.WindowsMaps"
    "Microsoft.WindowsSoundRecorder"
    "Microsoft.WindowsTerminal"
    "Microsoft.Xbox.TCUI"
    "Microsoft.XboxGameOverlay"
    "Microsoft.XboxGamingOverlay"
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.YourPhone"
    "MicrosoftCorporationII.MicrosoftFamily"
    "Microsoft.XboxIdentityProvider"
    "Microsoft.Getstarted"
    "Microsoft.549981C3F5F10"
    "Microsoft.ZuneVideo"
)

# List of programs to uninstall
$UninstallPrograms = @(
    "HP Audio Control"
    "HP Client Security Manager"
    "HP Connection Optimizer"
    "HP Documentation"
    "HP MAC Address Manager"
    "HP Notifications"
    "HP PC Hardware Diagnostics Windows"
    "HP Power Manager"
    "HP Privacy Settings"
    "HP QuickDrop"
    "HP Security Update Service"
    "HP System Default Settings"
    "HP System Information"
    "HP Support Assistant"
    "HP Sure Click"
    "HP Sure Click Security Browser"
    "HP Sure Run"
    "HP Sure Run Module"
    "HP Sure Recover"
    "HP Sure Sense"
    "HP Sure Sense Installer"
    "HP Wolf Security"
    "HP Wolf Security - Console"
    "HP Wolf Security Application Support for Sure Sense"
    "HP Wolf Security Application Support for Windows"
    "ICS"
)

$HPidentifier = "AD2F1837"

$InstalledPackages = Get-AppxPackage -AllUsers `
            | Where-Object {($UninstallPackages -contains $_.Name) -or ($_.Name -match "^$HPidentifier")}

$ProvisionedPackages = Get-AppxProvisionedPackage -Online `
            | Where-Object {($UninstallPackages -contains $_.DisplayName) -or ($_.DisplayName -match "^$HPidentifier")}

$InstalledPrograms = Get-Package | Where-Object {$UninstallPrograms -contains $_.Name}

# Remove appx provisioned packages - AppxProvisionedPackage
ForEach ($ProvPackage in $ProvisionedPackages) {

    Write-Host -Object "Attempting to remove provisioned package: [$($ProvPackage.DisplayName)]..."

    Try {
        $Null = Remove-AppxProvisionedPackage -PackageName $ProvPackage.PackageName -Online -ErrorAction Stop
        Write-Host -Object "Successfully removed provisioned package: [$($ProvPackage.DisplayName)]"
    }
    Catch {Write-Warning -Message "Failed to remove provisioned package: [$($ProvPackage.DisplayName)]"}
}

# Remove appx packages - AppxPackage
ForEach ($AppxPackage in $InstalledPackages) {
                                            
    Write-Host -Object "Attempting to remove Appx package: [$($AppxPackage.Name)]..."

    Try {
        $Null = Remove-AppxPackage -Package $AppxPackage.PackageFullName -AllUsers -ErrorAction Stop
        Write-Host -Object "Successfully removed Appx package: [$($AppxPackage.Name)]"
    }
    Catch {Write-Warning -Message "Failed to remove Appx package: [$($AppxPackage.Name)]"}
}

# Remove installed programs
$InstalledPrograms | ForEach-Object {

    Write-Host -Object "Attempting to uninstall: [$($_.Name)]..."

    Try {
        $Null = $_ | Uninstall-Package -AllVersions -Force -ErrorAction Stop
        Write-Host -Object "Successfully uninstalled: [$($_.Name)]"
    }
    Catch {Write-Warning -Message "Failed to uninstall: [$($_.Name)]"}
}

# Fallback attempt 1 to remove HP Wolf Security using msiexec
Try {
    MsiExec /x "{0E2E04B0-9EDD-11EB-B38C-10604B96B11E}" /qn /norestart
    Write-Host -Object "Fallback to MSI uninistall for HP Wolf Security initiated"
}
Catch {
    Write-Warning -Object "Failed to uninstall HP Wolf Security using MSI - Error message: $($_.Exception.Message)"
}

# Fallback attempt 2 to remove HP Wolf Security using msiexec
Try {
    MsiExec /x "{4DA839F0-72CF-11EC-B247-3863BB3CB5A8}" /qn /norestart
    Write-Host -Object "Fallback to MSI uninistall for HP Wolf 2 Security initiated"
}
Catch {
    Write-Warning -Object  "Failed to uninstall HP Wolf Security 2 using MSI - Error message: $($_.Exception.Message)"
}


Invoke-WebRequest -Uri "https://download.teamviewer.com/QS" -OutFile "$env:USERPROFILE\Desktop\teamviewerqs.exe"

Restart-Computer


#To do
#map network drive
#download and set wallpapers 
#disable anims, transparency, set display zoom

#Install Apps using WinGet
winget install Google.Chrome Jabra.Direct Poly.PlantronicsHub Microsoft.Teams Adobe.Acrobat.Reader.64-bit 7zip.7zip 9WZDNCRFJ3PZ microsoft.teams

