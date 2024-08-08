param(
    [string]$BackupDir = "$env:USERPROFILE\vscode_backup"
)

# Directorio de configuración de VSCode
$ConfigDir = "$env:APPDATA\Code\User"

# Archivos y carpetas a copiar
$Files = @("settings.json", "keybindings.json", "snippets")

# Crear una carpeta para respaldar la configuración si no existe
if (-Not (Test-Path -Path $BackupDir)) {
    New-Item -ItemType Directory -Path $BackupDir -Force
}

# Copiar archivos de configuración si existen
foreach ($File in $Files) {
    $SourcePath = "$ConfigDir\$File"
    $DestinationPath = "$BackupDir\$File"

    if (Test-Path -Path $SourcePath) {
        Copy-Item -Path $SourcePath -Destination $BackupDir -Recurse -Force
        Write-Output "Archivo o carpeta $File copiado(a) a $BackupDir"
    }
}

# Exportar lista de extensiones
$ExtensionsFile = "$BackupDir\extensions.txt"
code --list-extensions | Out-File -FilePath $ExtensionsFile

Write-Output "Configuración exportada a $BackupDir"

