# Automatizar Backups FTP PowerShell
PowerShell - Automatizar Backups FTP con WinSCP y Compress-7Zip (2018)

Más info: https://www.zonasystem.com/2017/07/automatizar-copias-de-seguridad-ftps-winscp-taskschd.html

## Procedimientos
1. Se establecen las variables
2. Se comprimen los datos en un único fichero comprimido temporal
3. Se envía el fichero comprimido a un servidor FTP
4. Se genera un único log de las acciones realizadas
5. Se envía el log por correo vía Gmail
6. Se eliminan los temporales creados en el proceso

### Envío log cuenta Gmail (Google)
Para el envío del log vía Gmail es necesario activar el acceso a "Aplicaciones menos seguras" en la cuenta Google. 
https://myaccount.google.com/lesssecureapps

![ejecucion_app_menos_seguras_gmail](https://raw.githubusercontent.com/adrianlois/Automatizar-Backups-FTPES-Batchfile/master/screenshots-test/ejecucion_app_menos_seguras_gmail.png)

![email_backup_log_enviado_gmail_powershel](https://raw.githubusercontent.com/adrianlois/Automatizar-Backups-FTP-PowerShell/master/screenshots-test/email_backup_log_enviado_gmail_powershell.png)


### instalar-modulos.ps1:

Es necesario instalar los módulos: WinSCP y Compress-7Zip
- WinSCP: https://github.com/dotps1/WinSCP/wiki/New-WinSCPSession
- Compress-7Zip: https://www.powershellgallery.com/packages/7Zip4Powershell/1.8.0

## Ficheros PowerShell Backup

### backup-v1.ps1: 

Establecer los valores deseados en las variables. Ideal para usarlo a través de una tarea programada de forma no interactiva. El inconveniente es que las passwords se guardarían en texto plano.

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


### backup-v2.ps1:

Se solicitan los valores de passwords de forma interactiva sin almacenarlas en texto plano en el fichero .ps1. A diferencia de backup.ps1, no se guardarán las passwords en texto plano en el fichero .ps1.

![backup-interactivo-passwords-7z-ftp-gmail](https://raw.githubusercontent.com/adrianlois/Automatizar-Backups-FTP-PowerShell/master/screenshots-test/backup-interactivo-passwords-7z-ftp-gmail.png)


### backup-v3.ps1: 

Establecer los valores de todos los datos incluídas las passwords a través de un formulario de forma interactiva. Al igual que backup-v2.ps1, no se guardarán el resto de datos en el fichero .ps1.

![datos_backup-7z-ftp-gmail](https://raw.githubusercontent.com/adrianlois/Automatizar-Backups-FTP-PowerShell/master/screenshots-test/datos_backup-7z-ftp-gmail.png)
