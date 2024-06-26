# Cesta k původnímu souboru
$originalFile = "C:\Users\user\File.txt"

# Cesta k cílové složce záloh
$backupFolder = "C:\Users\user\Desktop\"

# Získání aktuálního data a času
$currentTime = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

# Vytvoření nového názvu souboru s časovým razítkem
$newFilename = Join-Path $backupFolder ("{0}_{1}{2}" -f (Get-Item $originalFile).BaseName, $currentTime, (Get-Item $originalFile).Extension)

# Kopírování souboru
Copy-Item -Path $originalFile -Destination $newFilename

Write-Output "Soubor byl úspěšně zálohován jako: $newFilename"
