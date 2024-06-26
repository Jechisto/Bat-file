@echo off
setlocal

:: Cesta k původnímu souboru
set "original_file=C:\Users\Aries_Jech\Documents\SK_Odberatele.ods"

:: Cesta k cílové složce záloh
set "backup_folder=C:\Users\Aries_Jech\Desktop\"

:: Získání aktuálního data a času
for /f "tokens=1-4 delims=. " %%a in ('date /t') do (set mydate=%%c-%%b-%%a)
for /f "tokens=1-2 delims=:" %%a in ('time /t') do (set mytime=%%a-%%b)
set timestamp=%mydate%_%mytime%

:: Získání názvu souboru a přípony
for %%i in ("%original_file%") do (
    set "filename=%%~ni"
    set "extension=%%~xi"
)

:: Vytvoření nového názvu souboru s časovým razítkem
set "new_filename=%backup_folder%\%filename%_%timestamp%%extension%"

:: Kopírování souboru
copy "%original_file%" "%new_filename%"

echo Soubor byl úspěšně zálohován jako: %new_filename%

endlocal