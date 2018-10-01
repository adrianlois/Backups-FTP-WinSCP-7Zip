# Automatizar-Backups-FTPES-PowerShell
PowerShell - Automatizar Backups FTPES con WinSCP y Compress-7Zip (2018)

instalar-modulos.ps1: Es necesario instalar los módulos WinSCP y Compress-7Zip

- 1. Se establecen las variables
- 2. Se comprimen los datos en un único fichero comprimido temporal
- 3. Se envía el fichero comprimido a un servidor FTP de modo seguro
- 4. Se genera un único log de las acciones realizadas
- 5. Se envía el log por correo vía Gmail
- 6. Se eliminan los temporales creados en el proceso

backup.ps1: establecer los valores deseados en las variables

# Paths
- $pathLocalDatos = "pathLocalDatos"
- $pathRemotoFTP = "pathRemotoFTP"
- $pathTempFichero7z = "pathTemporalFichero7z"

# Credenciales
- $usuarioFTP = "usuarioFTP"
- $passwdFTP = "passwdFTP"
- $passwd7z = "passwdFichero7z"
- $servidorFTP = "ftp.miweb.com"
- $usuarioEmail = "usuarioEmail@gmail.com" 
- $passwdEmail = "passwdEmail"

# Asunto y cuerpo del Email
- $asuntoEmail = "asuntoEmail"
- $cuerpoEmail = "textoCuerpoEmail"

Más info: https://www.zonasystem.com/2017/07/automatizar-copias-de-seguridad-ftps-winscp-taskschd.html
