# Automatizar Backups FTP PowerShell v2.0
PowerShell - Automatizar Backups FTP con WinSCP y Compress-7Zip (2018)

Más info: https://www.zonasystem.com/2017/07/automatizar-copias-de-seguridad-ftps-winscp-taskschd.html

### backup-v2.0:

Las passwords se almacenan cifradas en ficheros separados. Está limitado a ejecutarse desde el mismo usuario y equipo que generó los ficheros de passwords.

▶ **Video demo (PoC)**: https://youtu.be/YGRDsgpRlS0
<p align="center">
<a href="https://youtu.be/YGRDsgpRlS0" target="_blank"><img src="https://raw.githubusercontent.com/adrianlois/Automatizar-Backups-FTP-PowerShell/master/screenshots/powershell-ftp-cifrado-passwords-backup-v2.0-videodemo.png" 
alt="powershell-ftp-cifrado-passwords-keyfile-backup-v2.1-videodemo" width="650" /></a>
</p>

- **CrearPasswordsBackup-v2.0.ps1**: Nos solicita una ruta a un directorio para almacenas las passwords cifradas en un fichero. Solo es necesario ejecutarlo una primera vez. Si cambiamos de usuario, equipo o formateamos Windows estas claves ya no servirán y deberemos crear unas nuevas. En caso de usar las mismas password en diferentes equipos en la versión 2.1 se soluciona este inconveniente.
*(https://www.zonasystem.com/2019/01/cifrar-passwords-con-powershell.html)*

- **backup-v2.0.ps1**: Modificar los valores de las siguientes variables:

#### Paths
- $PathLocalDatos = "PathLocalDatos"
- $PathRemotoFTP = "PathRemotoFTP"
- $PathTempFichero7z = "PathTemporalFichero7z"
- $PathFicherosPasswd = "PathFicherosPassword"

#### Credenciales
- $HostServidorFTP = "ftp.miweb.com"
- $UsuarioFTP = "UsuarioFTP"
- $UsuarioEmail = "Usuario@gmail.com" 

#### Asunto y cuerpo del Email
- $AsuntoEmail = "AsuntoEmail"
- $CuerpoEmail = "TextoCuerpoEmail"
