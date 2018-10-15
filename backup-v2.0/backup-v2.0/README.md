# Automatizar Backups FTP PowerShell
PowerShell - Automatizar Backups FTP con WinSCP y Compress-7Zip (2018)

Más info: https://www.zonasystem.com/2017/07/automatizar-copias-de-seguridad-ftps-winscp-taskschd.html

### backup-v2.0:

Las passwords se almacenan cifradas en ficheros separados. Está limitado a ejecutarse desde el mismo usuario y equipo que generó los ficheros de passwords.

- **CrearPasswordsBackup-v2.0.ps1**: Nos solicita una ruta a un directorio para almacenas las passwords cifradas en un fichero. Solo es necesario ejecutarlo una primera vez. Si cambiamos de usuario, equipo o formateamos Windows estas claves ya no servirán y deberemos crear unas nuevas. En caso de usar las mismas password en diferentes equipos en la versión 2.1 se soluciona este inconveniente. 

- **backup-v2.0.ps1**: Modificar los valores de las siguientes variables:

#### Paths
- $PathLocalDatos = "PathLocalDatos"
- $PathRemotoFTP = "PathRemotoFTP"
- $PathTempFichero7z = "PathTemporalFichero7z"
- $PathFicherosPasswd = "PathFicherosPassword"

#### Credenciales
- $HostServidorFTP = "ftp.miweb.com"
- $UsuarioFTP = "UsuarioFTP"
- $UsuarioEmail = "UsuarioEmail@gmail.com" 

#### Asunto y cuerpo del Email
- $AsuntoEmail = "AsuntoEmail"
- $CuerpoEmail = "TextoCuerpoEmail"