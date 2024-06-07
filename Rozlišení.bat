@rem Získání aktuálního rozlišení
rem Nahraďte "MonitorID" ID vašeho monitoru.
rem Muzete ho zjistit v Nastavení -> System -> Obrazovka -> Upřesnit nastavení zobrazení -> Vlastnosti adaptéru zobrazení -> Karta "Zobrazení".

set "currentResolution=1920x1080"
for /f "tokens=1-4 delims=," %%a in ('wmic monitor get mode,id ^| findstr /i "DesktopMonitor1"') do (
  set "currentResolution=%%a - %%b x %%c %%d"
)

@rem Přepnutí rozlišení
if "%currentResolution%" == "1920x1080" (
  echo Přepínám na rozlišení 2450x1440.
  wmic monitor set mode "2450x1440" id %monitorID%
) else (
  echo Přepínám na rozlišení 1920x1080.
  wmic monitor set mode "1920x1080" id %monitorID%
)

echo Rozlišení bylo přepnuto na "%currentResolution%".

pause
