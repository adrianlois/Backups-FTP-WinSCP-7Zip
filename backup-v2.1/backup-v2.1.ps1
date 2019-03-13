######################
# Autor @adrianlois_ #
######################
# Backup PowerShell v2.1 #
##########################

#################################
## Inicio Establecer Variables ##

# Fecha y hora
    $FechaActual = Get-Date -uformat "%d-%m-%Y"
    $FechaHoraActual = Get-Date -uformat "%d/%m/%Y - %H:%M:%S"
# Paths
    $PathLocalDatos = "PathLocalDatos"
    $PathRemotoFTP = "PathRemotoFTP"
    $PathTempFichero7z = "PathTempFichero7z"
    $PathFicherosPasswd = "PathFicherosPassword"
    $NombreBackupTemp = "Backup_"
    $TempFichero7z = "$PathtempFichero7z$NombreBackupTemp$FechaActual.7z"
# Credenciales
    $Passwd7z = Get-Content "$PathFicherosPasswd\passwd-7z" | ConvertTo-SecureString -Key (Get-Content "$PathFicherosPasswd\CifradoKeyFile.key")
    $HostServidorFTP = "HostServidorFTP"
    $UsuarioFTP = "UsuarioFTP"
    $PasswdFTP = "passwd-ftp"
    $UsuarioEmail = "UsuarioEmail@gmail.com" 
    $PasswdEmail = "passwd-email"
# Asunto y cuerpo del Email
    $AsuntoEmail = "AsuntoEmail"
    $CuerpoEmail = "CuerpoEmail"
# Convertir a string segura, obtención de password desde los ficheros cifrados
    $SecPasswdFTP = Get-Content "$PathFicherosPasswd\$PasswdFTP" | ConvertTo-SecureString -Key (Get-Content "$PathFicherosPasswd\CifradoKeyFile.key")
    $CredencialesFTP = New-Object System.Management.Automation.PsCredential($UsuarioFTP,$SecPasswdFTP)
    $SecPasswdEmail = Get-Content "$PathFicherosPasswd\$PasswdEmail" | ConvertTo-SecureString -Key (Get-Content "$PathFicherosPasswd\CifradoKeyFile.key")
    $CredencialesEmail = New-Object System.Management.Automation.PSCredential ($UsuarioEmail, $SecPasswdEmail)
# Log
    $LogBackupFTP = "$PathtempFichero7z$NombreBackupTemp$FechaActual.log"
# Comprobaciones Test-Path
    $TestBackup7z = "$PathTempFichero7z$NombreBackupTemp*.7z"
    $TestBackupLog = "$PathTempFichero7z$NombreBackupTemp*.log"

## Fin Establecer Varibles ##
#############################


# Comprobrar si ya existe algún fichero de log o backup anteriores
if (Test-Path ($TestBackup7z, $TestBackupLog)) { 
    Remove-Item -Path ($TestBackup7z, $TestBackupLog) -Recurse -Force 
    }

## Compresión de datos ##
Compress-7Zip -Path $pathLocalDatos -ArchiveFileName $TempFichero7z -Password $Passwd7z -EncryptFilenames

## Enviar backup al servidor FTP ##
    # Crear nueva sesión FTP
    New-WinSCPSession -SessionOption (New-WinSCPSessionOption -HostName $HostServidorFTP -Protocol Ftp -Credential $CredencialesFTP) -SessionLogPath $LogBackupFTP -DebugLogLevel 2
    # Eliminar el viejo fichero comprimido de datos del servidor FTP
    Remove-WinSCPItem -Path $PathRemotoFTP/Backup*.zip
    # Subir el nuevo fichero comprimido de datos al servidor FTP
    Send-WinSCPItem -LocalPath $TempFichero7z -RemotePath $PathRemotoFTP
    # Cerrar sesión FTP
    Remove-WinSCPSession

## Enviar log de backup vía email Gmail ##
Send-MailMessage -From $UsuarioEmail -To $UsuarioEmail -Subject "$AsuntoEmail - $FechaHoraActual" -Body "$CuerpoEmail - $FechaHoraActual" -Attachments $LogBackupFTP -SmtpServer smtp.gmail.com -UseSsl -Credential $CredencialesEmail

## Eliminar logs ##
# Conservar el fichero de log, eliminar solo el fichero temporal backup 7z
Remove-Item -Path $TempFichero7z -Recurse -Force
# En el caso de querer eliminar también el log de backup, descomentar la siguiente lí­nea
# Remove-Item -Path $logBackupFTP -Recurse -Force

# Salir
exit
