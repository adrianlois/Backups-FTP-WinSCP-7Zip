#####################
# Autor @adrianlois_
#####################

## Inicio Prerequisitos ##
# En caso necesario, descomentar las líneas 6, 9 y 10. O ejecutarlas a parte en Windows Powershell como Administrador.

# Quitar restricciones de ejecución de scripts
# Set-ExecutionPolicy Unrestricted -scope LocalMachine -Force

# Instalación de módulos 7Zip4Powershell y WinSCP.
# Install-Module -Name 7Zip4Powershell -Verbose -Force
# Install-Module -Name WinSCP -Verbose -Force
## Fin Prerequisitos ##

## Inicio Variables ##
# Fecha y hora
    $fechaActual = Get-Date -uformat "%d-%m-%Y"
    $fechaHoraActual = Get-Date -uformat "%d/%m/%Y - %H:%M:%S"
# Paths
    $pathLocalDatos = "pathLocalDatos"
    $pathRemotoFTP = "pathRemotoFTP"
    $pathTempFichero7z = "pathTemporalFichero7z"
    $tempFichero7z = "$pathtempFichero7z-$fechaActual.7z"
# Credenciales
    $usuarioFTP = "usuarioFTP"
    $passwdFTP = "passwdFTP"
    $passwd7z = "passwdFichero7z"
    $servidorFTP = "ftp.miweb.com"
    $usuarioEmail = "usuarioEmail@gmail.com" 
    $passwdEmail = "passwdEmail"
# Asunto y cuerpo del Email
    $asuntoEmail = "asuntoEmail"
    $cuerpoEmail = "textoCuerpoEmail"
# Get-Credencial automatizado no interactivo
    $secPasswdFTP = ConvertTo-SecureString $passwdFTP -AsPlainText -Force
    $credencialesFTP = New-Object System.Management.Automation.PSCredential ($usuarioFTP, $secPasswdFTP)
    $secPasswdEmail = ConvertTo-SecureString $passwdEmail -AsPlainText -Force
    $credencialesEmail = New-Object System.Management.Automation.PSCredential ($usuarioEmail, $secPasswdEMail)
# Log
    $logBackupFTP = "$pathtempFichero7z-$fechaActual.log"
# Comprobaciones Test-Path
    $testBackup7z = "$pathTempFichero7z*.7z"
    $testBackupLog = "$pathTempFichero7z*.log"
## Fin Varibles ##

# Comprobrar si ya existe algún fichero de log o backup anteriores
if (Test-Path ($testBackup7z, $testBackupLog)) { 
    Remove-Item -Path ($testBackup7z, $testBackupLog) -Recurse -Force 
    }

## Compresión de datos ##
Compress-7Zip -Path $pathLocalDatos -ArchiveFileName $tempFichero7z -Password $passwd7z -EncryptFilenames

## Enviar backup al servidor FTP ##
    # Crear nueva sesión FTP
    New-WinSCPSession -SessionOption (New-WinSCPSessionOption -HostName $servidorFTP -Protocol Ftp -Credential $credencialesFTP) -SessionLogPath $logBackupFTP -DebugLogLevel 2
    # Subir el fichero comprimido de datos al servidor FTP
    Send-WinSCPItem -LocalPath $tempFichero7z -RemotePath $pathRemotoFTP
    # Cerrar sesión FTP
    Remove-WinSCPSession

## Enviar log de backup vía email Gmail ##
Send-MailMessage -From $usuarioEmail -To $usuarioEmail -Subject "$asuntoEmail - $fechaHoraActual" -Body "$cuerpoEmail - $fechaHoraActual" -Attachments $logBackupFTP -SmtpServer smtp.gmail.com -UseSsl -Credential $credencialesEmail

## Eliminar logs ##
# Conservar el fichero de log, eliminar solo el fichero temporal backup 7z
Remove-Item -Path $tempFichero7z -Recurse -Force
# En el caso de querer eliminar también el log de backup, descomentar la siguiente línea
# Remove-Item -Path $logBackupFTP -Recurse -Force

# Salir
exit
