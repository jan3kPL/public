# Ustawiam Google Chrome jako domyślną przeglądarkę
$chromePath = Get-Command "chrome.exe" | Select-Object -ExpandProperty Source
$chromeAppId = (Get-AppxPackage | Where-Object { $_.InstallLocation -eq $chromePath }).PackageFamilyName
$regPath = "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice"
Set-ItemProperty -Path $regPath -Name ProgId -Value $chromeAppId

# Ustawiam Microsoft Edge jako domyślną przeglądarkę plików PDF
$edgePath = Get-Command "msedge.exe" | Select-Object -ExpandProperty Source
$edgeAppId = (Get-AppxPackage | Where-Object { $_.InstallLocation -eq $edgePath }).PackageFamilyName
$regPath = "HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice"
Set-ItemProperty -Path $regPath -Name ProgId -Value $edgeAppId

# Wywołanie odświeżenia ustawień systemu Windows
$null = (New-Object -ComObject shell.application).ShellExecute("cmd.exe", "/c taskkill /f /im explorer.exe & start explorer.exe")

Write-Host "Google Chrome jest teraz domyślną przeglądarką internetową".
Write-Host "Microsoft Edge jest teraz domyślną przeglądarką plików PDF."

$oneNotePath = "C:\Program Files\WindowsApps\Microsoft.Office.OneNote_16001.21430.20306.0_x64__8wekyb3d8bbwe\onenoteim.exe"
$shortcutName = "OneNote.lnk"

$wshell = New-Object -ComObject WScript.Shell

$startupFolderPath = [System.IO.Path]::Combine($env:APPDATA, "Microsoft\Windows\Start Menu\Programs\Startup")

$shortcut = $wshell.CreateShortcut([System.IO.Path]::Combine($startupFolderPath, $shortcutName))
$shortcut.TargetPath = $oneNotePath
$shortcut.Save()

Write-Host "OneNote dla Windows 10 został dodany do folderu startowego i otworzy się podczas uruchamiania".

$lineToCopy = "https://tfbank-my.sharepoint.com/personal/victoria_galinska_tfbank_pl/_layouts/15/Doc.aspx?sourcedoc={c8e66b07-12c0-4b6a-a906-2bd259a88c49}&action=view&wd=target%28ONBOARDING.one%7C7e860e9e-a083-4fba-bfb5-38c9e980fde6%2FID-Theft%7C45e9d729-0844-4338-b10e-16958e7a506c%2F%29&wdorigin=NavigationUrl"

$lineToCopy | Set-Clipboard

Write-Host $lineToCopy
