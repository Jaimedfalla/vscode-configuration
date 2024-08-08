# Exportar la configuración de Visual Studio Code

```shell
.\export-configuration.ps1 -BackupDir "ruta_folder"
```

# Importar la configuración a Visual Studio Code

```shell
.\import-configuration.ps1 -BackupDir "ruta_folder"
```

> Donde el valor de la variable *BackupDir* es opcional, si el valor no se asigna, se tomará el valor de la variable de entorno __env:USERPROFILE__
