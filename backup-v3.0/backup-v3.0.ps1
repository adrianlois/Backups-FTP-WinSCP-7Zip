##########################
# Backup PowerShell v3.0 #
##########################

#################################
## Inicio Establecer Passwords ##

# Establecer la password fichero comprimido 7zip
$LeerPasswd7z = Read-Host -AsSecureString "Establecer la password del fichero comprimido 7zip" 
    $PlainPasswd7z = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($LeerPasswd7z)) 

# Establecer la password del servidor FTP
$LeerPasswdFTP = Read-Host -AsSecureString "Establecer la password del servidor FTP" 
    $PlainPasswdFTP = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($LeerPasswdFTP)) 

# Establecer la password del e-mail Gmail
$LeerPasswdEmail = Read-Host -AsSecureString "Establecer la password del e-mail Gmail" 
    $PlainPasswdEmail = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($LeerPasswdEmail)) 

## Fin Establecer Passwords ##
##############################

#################################
## Inicio Establecer Variables ##

# Fecha y hora
    $FechaActual = Get-Date -uformat "%d-%m-%Y"
    $FechaHoraActual = Get-Date -uformat "%d/%m/%Y - %H:%M:%S"
# Paths
    $PathLocalDatos = "PathLocalDatos"
    $PathRemotoFTP = "PathRemotoFTP"
    $PathTempFichero7z = "PathTempFichero7z"
    $NombreBackupTemp = "Backup_"
    $TempFichero7z = "$PathtempFichero7z$NombreBackupTemp$FechaActual.7z"
# Credenciales
    $Passwd7z = "$PlainPasswd7z"
    $HostServidorFTP = "HostServidorFTP"
    $UsuarioFTP = "UsuarioFTP"
    $PasswdFTP = "$PlainPasswdFTP"
    $UsuarioEmail = "Usuario@gmail.com" 
    $PasswdEmail = "$PlainPasswdEmail"
# Asunto y cuerpo del Email
    $AsuntoEmail = "AsuntoEmail"
    $CuerpoEmail = "CuerpoEmail"
# Get-Credencial automatizado no interactivo, convertir a string segura
    $SecPasswdFTP = ConvertTo-SecureString $PasswdFTP -AsPlainText -Force
    $CredencialesFTP = New-Object System.Management.Automation.PSCredential ($UsuarioFTP, $SecPasswdFTP)
    $SecPasswdEmail = ConvertTo-SecureString $PasswdEmail -AsPlainText -Force
    $CredencialesEmail = New-Object System.Management.Automation.PSCredential ($UsuarioEmail, $SecPasswdEMail)
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
    Remove-WinSCPItem -Path $PathRemotoFTP/Backup*.7z
    # Subir el nuevo fichero comprimido de datos al servidor FTP
    Send-WinSCPItem -LocalPath $TempFichero7z -RemotePath $PathRemotoFTP
    # Cerrar sesión FTP
    Remove-WinSCPSession

## Enviar log de backup vía email Gmail ##
Send-MailMessage -From $UsuarioEmail -To $UsuarioEmail -Subject "$AsuntoEmail - $FechaHoraActual" -Body "$CuerpoEmail - $FechaHoraActual" -Attachments $LogBackupFTP -SmtpServer smtp.gmail.com -UseSsl -Credential $CredencialesEmail

## Eliminar logs ##
# Conservar el fichero de log, eliminar solo el fichero temporal backup 7z
Remove-Item -Path $TempFichero7z -Recurse -Force
# En el caso de querer eliminar también el log de backup, descomentar la siguiente línea
# Remove-Item -Path $logBackupFTP -Recurse -Force

# Liberar los valores de passwords de los objetos SecureString almacenados en memoria (esta memoria se encuentra en una zona distinta donde no accede el recolector de basura)
$ptr1 = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PlainPasswd7z)
[System.Runtime.InteropServices.Marshal]::ZeroFreeCoTaskMemUnicode($ptr1)
$ptr2 = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PlainPasswdFTP)
[System.Runtime.InteropServices.Marshal]::ZeroFreeCoTaskMemUnicode($ptr2)
$ptr3 = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PlainPasswdEmail)
[System.Runtime.InteropServices.Marshal]::ZeroFreeCoTaskMemUnicode($ptr3)

# Salir
exit
