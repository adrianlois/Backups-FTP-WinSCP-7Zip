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

![email_backup_log_enviado_gmail_powershel](https://raw.githubusercontent.com/adrianlois/Automatizar-Backups-FTP-PowerShell/master/screenshots-test/email_envio_backup_log_gmail_powershell.png)


### instalar-modulos.ps1:

Es necesario instalar los módulos: WinSCP y Compress-7Zip
- WinSCP: https://github.com/dotps1/WinSCP/wiki/New-WinSCPSession
- Compress-7Zip: https://www.powershellgallery.com/packages/7Zip4Powershell/1.8.0

## Ficheros PowerShell Backup


## -- Versiones automatizadas (no interactivas): v1.0, v2.0, v2.1 --

Estas versiones son pensadas para lanzar el script de backup de Powershell en una tarea programada de Windows.


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


### backup-v2.1.ps1: 

Respecto a la versión 2.0, se añade la mejora de crear una clave de cifrado y descifrado de las passwords establecidas. De ese modo con el fichero generado automáticamente cifrado.key y los ficheros cifrados de las password establecidas, de ese modo se podrá ejecutar desde otros usuarios y en otros equipos.

- **CrearPasswordsBackup-v2.1.ps1**: Genera un fichero único "cifrado.key", este será el fichero llave para cifrar y descifrar el resto de ficheros donde se establecieron las passwords.

- **backup-v2.1.ps1**: Modificar los valores de las siguientes variables: (igual que la versión 2.0)

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


## -- Versiones interactivas: v3.0, v4.0 --

Estas versiones están pensadas para ejecutar el script de Powershell de forma manual, introducir los datos críticos y que no se almacenen ni en texto plano ni cifrados en el equipo local.


### backup-v3.0.ps1:

Se solicitan los valores de passwords de forma interactiva sin almacenarlas en texto plano en el fichero .ps1. A diferencia de backup.ps1, no se guardarán las passwords en texto plano en el fichero .ps1.

![backup-interactivo-passwords-7z-ftp-gmail](https://raw.githubusercontent.com/adrianlois/Automatizar-Backups-FTP-PowerShell/master/screenshots-test/backupv2-interactivo-passwords-7z-ftp-gmail.png)


### backup-v4.0.ps1: 

Establecer los valores de todos los datos incluídas las passwords a través de un formulario de forma interactiva. Al igual que backup-v2.ps1, no se guardarán el resto de datos en el fichero .ps1.

![datos_backup-7z-ftp-gmail](https://raw.githubusercontent.com/adrianlois/Automatizar-Backups-FTP-PowerShell/master/screenshots-test/backupv3-datos_passwords-7z-ftp-gmail.png)
