# Automatizar Backups FTP PowerShell
PowerShell - Automatizar Backups FTP con WinSCP y Compress-7Zip (2018)

Más info: https://www.zonasystem.com/2017/07/automatizar-copias-de-seguridad-ftps-winscp-taskschd.html

> **instalar-modulos.ps1**: Es necesario instalar los módulos: WinSCP y Compress-7Zip
- WinSCP: https://github.com/dotps1/WinSCP/wiki/New-WinSCPSession
- Compress-7Zip: https://www.powershellgallery.com/packages/7Zip4Powershell/1.8.0

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

![Aplicaciones menos seguras Google](https://raw.githubusercontent.com/adrianlois/Automatizar-Backups-FTPES-Batchfile/master/screenshots-test/ejecucion_app_menos_seguras_gmail.png)

> **backup.ps1**: establecer los valores deseados en las variables

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
