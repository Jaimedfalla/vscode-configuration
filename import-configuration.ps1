param(
    [string]$BackupDir = "$env:USERPROFILE\vscode_backup"
)

# Directorio de configuración de VSCode
$ConfigDir = "$env:APPDATA\Code\User"

# Archivos y carpetas a copiar
$Files = @("settings.json", "keybindings.json", "snippets")

# Copiar archivos de respaldo a la configuración
foreach ($File in $Files) {
    Copy-Item -Path "$BackupDir\$File" -Destination $ConfigDir -Recurse -Force
}

# Instalar extensiones
Get-Content -Path "$BackupDir\extensions.txt" | ForEach-Object { code --install-extension $_ }

Write-Output "Configuración importada desde $BackupDir"
