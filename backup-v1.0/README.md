# Automatizar Backups FTP PowerShell v1.0
PowerShell - Automatizar Backups FTP con WinSCP y Compress-7Zip (2018)

Más info: https://www.zonasystem.com/2017/07/automatizar-copias-de-seguridad-ftps-winscp-taskschd.html

### backup-v1.0: 

Establecer los valores deseados en las variables. Ideal para usarlo a través de una tarea programada de forma no interactiva. El inconveniente es que las passwords se guardarían en texto plano. Mejoras en la versión 2.0 y 2.1

#### Paths
- $PathLocalDatos = "PathLocalDatos"
- $PathRemotoFTP = "PathRemotoFTP"
- $PathTempFichero7z = "PathTemporalFichero7z"

#### Credenciales
- $Passwd7z = "PasswdFichero7z"
- $HostServidorFTP = "ftp.miweb.com"
- $UsuarioFTP = "UsuarioFTP"
- $PasswdFTP = "PasswdFTP"
- $UsuarioEmail = "UsuarioEmail@gmail.com" 
- $PasswdEmail = "PasswdEmail"

#### Asunto y cuerpo del Email
- $AsuntoEmail = "AsuntoEmail"
- $CuerpoEmail = "TextoCuerpoEmail"
