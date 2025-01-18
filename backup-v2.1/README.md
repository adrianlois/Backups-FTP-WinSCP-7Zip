# Automatizar Backups FTP PowerShell v2.1
PowerShell - Automatizar Backups FTP con WinSCP y Compress-7Zip (2018)

Más info: https://www.zonasystem.com/2017/07/automatizar-copias-de-seguridad-ftps-winscp-taskschd.html

### backup-v2.1.ps1: 

Respecto a la versión 2.0, se añade la mejora de crear una clave de cifrado y descifrado de las passwords establecidas. De ese modo con el fichero generado automáticamente cifrado.key y los ficheros cifrados de las password establecidas, de ese modo se podrá ejecutar desde otros usuarios y en otros equipos.

▶ **Video demo (PoC)**: https://youtu.be/0iSXvSB15PI
<p align="center">
<a href="https://youtu.be/0iSXvSB15PI" target="_blank"><img src="https://raw.githubusercontent.com/adrianlois/Automatizar-Backups-FTP-PowerShell/master/screenshots/powershell-ftp-backup-cifrado-passwords-keyfile-v2.1-videodemo.png" 
alt="powershell-ftp-cifrado-passwords-keyfile-backup-v2.1-videodemo" width="650" /></a>
</p>

- **CrearPasswordsBackup-v2.1.ps1**: Genera un fichero único "cifrado.key", este será el fichero llave para cifrar y descifrar el resto de ficheros donde se establecieron las passwords. *(El fichero cifrado.key se le pasará al script backup-v2.1.ps1 para que pueda descifrar las passwords cifradas desde cualquier usuario del mismo equipo u otro equipo diferente).*
*(https://www.zonasystem.com/2019/01/cifrar-passwords-con-powershell.html)*

- **backup-v2.1.ps1**: Modificar los valores de las siguientes variables: (igual que la versión 2.0)

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
