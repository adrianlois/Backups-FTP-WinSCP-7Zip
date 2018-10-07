######################
# Autor @adrianlois_ #
######################

# Añadiendo las librerías para el formulario
[void][System.reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void][System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 

#######################
## Inicio Formulario ##

# Creación del formulario
$Formulario = New-Object System.Windows.Forms.Form
$Formulario.Size = New-Object System.Drawing.Size(335,545) 
$Formulario.Text = "Establecer Datos Backup"

## Inicio Labels, TextAreas y Buttons ##

# Path ficheros locales
$LabelPathFLocal = New-Object System.Windows.Forms.Label
    $LabelPathFLocal.Location = New-Object System.Drawing.Size(30,20) 
    $LabelPathFLocal.Size = New-Object System.Drawing.Size(260,20) 
    $LabelPathFLocal.Text = "Ruta de los ficheros locales (ej: C:\Mis archivos):"
        $Formulario.Controls.Add($LabelPathFLocal)
$BoxPathLocal = New-Object System.Windows.Forms.Textbox
    $BoxPathLocal.Location = New-Object System.Drawing.point(30,40)
    $BoxPathLocal.Size = New-Object System.Drawing.Size(260,20)
    $BoxPathLocal.Text = ''
        $Formulario.Controls.Add($BoxPathLocal)

# Path donde remoto servidor FTP
$LabelPathRemotoFTP = New-Object System.Windows.Forms.Label
    $LabelPathRemotoFTP.Location = New-Object System.Drawing.Size(30,70) 
    $LabelPathRemotoFTP.Size = New-Object System.Drawing.Size(260,20) 
    $LabelPathRemotoFTP.Text = "Ruta del servidor remoto FTP (ej: /backup):"
        $Formulario.Controls.Add($LabelPathRemotoFTP)
$BoxPathRemotoFTP = New-Object System.Windows.Forms.Textbox
    $BoxPathRemotoFTP.Location = New-Object System.Drawing.point(30,90)
    $BoxPathRemotoFTP.Size = New-Object System.Drawing.Size(260,20)
    $BoxPathRemotoFTP.Text = ''
        $Formulario.Controls.Add($BoxPathRemotoFTP)

# Path fichero temporal comprimido 7zip
$LabelPathFichero7z = New-Object System.Windows.Forms.Label
    $LabelPathFichero7z.Location = New-Object System.Drawing.Size(30,120) 
    $LabelPathFichero7z.Size = New-Object System.Drawing.Size(260,20) 
    $LabelPathFichero7z.Text = "Ruta del fichero temporal comprimido 7zip (ej: D:\):"
        $Formulario.Controls.Add($LabelPathFichero7z)
$BoxPathFichero7z = New-Object System.Windows.Forms.Textbox
    $BoxPathFichero7z.Location = New-Object System.Drawing.point(30,140)
    $BoxPathFichero7z.Size = New-Object System.Drawing.Size(260,20)
    $BoxPathFichero7z.Text = ''
        $Formulario.Controls.Add($BoxPathFichero7z)

# Host del servidor FTP
$LabelHostServidorFTP = New-Object System.Windows.Forms.Label
    $LabelHostServidorFTP.Location = New-Object System.Drawing.Size(30,170) 
    $LabelHostServidorFTP.Size = New-Object System.Drawing.Size(260,20) 
    $LabelHostServidorFTP.Text = "Host servidor FTP (ej: ftp.misitio.com):"
        $Formulario.Controls.Add($LabelHostServidorFTP)
$BoxHostServidorFTP = New-Object System.Windows.Forms.Textbox
    $BoxHostServidorFTP.Location = New-Object System.Drawing.point(30,190)
    $BoxHostServidorFTP.Size = New-Object System.Drawing.Size(260,20)
    $BoxHostServidorFTP.Text = ''
        $Formulario.Controls.Add($BoxHostServidorFTP)

# Usuario servidor FTP
$LabelUsuarioFTP = New-Object System.Windows.Forms.Label
    $LabelUsuarioFTP.Location = New-Object System.Drawing.Size(30,220) 
    $LabelUsuarioFTP.Size = New-Object System.Drawing.Size(260,20) 
    $LabelUsuarioFTP.Text = "Usuario servidor FTP:"
        $Formulario.Controls.Add($LabelUsuarioFTP)
$BoxUsuarioFTP = New-Object System.Windows.Forms.Textbox
    $BoxUsuarioFTP.Location = New-Object System.Drawing.point(30,240)
    $BoxUsuarioFTP.Size = New-Object System.Drawing.Size(260,20)
    $BoxUsuarioFTP.Text = ''
        $formulario.Controls.Add($BoxUsuarioFTP)

# Usuario e-mail Gmail
$LabelUsuarioEmail = New-Object System.Windows.Forms.Label
    $LabelUsuarioEmail.Location = New-Object System.Drawing.Size(30,270) 
    $LabelUsuarioEmail.Size = New-Object System.Drawing.Size(260,20) 
    $LabelUsuarioEmail.Text = "Usuario e-mail Gmail (sin @gmail.com):"
        $Formulario.Controls.Add($LabelUsuarioEmail)
$BoxUsuarioEmail = New-Object System.Windows.Forms.Textbox
    $BoxUsuarioEmail.Location = New-Object System.Drawing.point(30,290)
    $BoxUsuarioEmail.Size = New-Object System.Drawing.Size(260,20)
    $BoxUsuarioEmail.Text = ''
        $Formulario.Controls.Add($BoxUsuarioEmail)

# Asunto del mensaje e-mail Gmail
$LabelAsuntoEmail = New-Object System.Windows.Forms.Label
    $LabelAsuntoEmail.Location = New-Object System.Drawing.Size(30,320) 
    $LabelAsuntoEmail.Size = New-Object System.Drawing.Size(260,20) 
    $LabelAsuntoEmail.Text = "Asunto del e-mail Gmail:"
        $Formulario.Controls.Add($LabelAsuntoEmail)
$BoxAsuntoEmail = New-Object System.Windows.Forms.Textbox
    $BoxAsuntoEmail.Location = New-Object System.Drawing.point(30,340)
    $BoxAsuntoEmail.Size = New-Object System.Drawing.Size(260,20)
    $BoxAsuntoEmail.Text = ''
        $Formulario.Controls.Add($BoxAsuntoEmail)

# Cuerpo del mensaje e-mail Gmail
$LabelCuerpoEmail = New-Object System.Windows.Forms.Label
    $LabelCuerpoEmail.Location = New-Object System.Drawing.Size(30,370) 
    $LabelCuerpoEmail.Size = New-Object System.Drawing.Size(260,20) 
    $LabelCuerpoEmail.Text = "Cuerpo del e-mail Gmail:"
        $Formulario.Controls.Add($LabelCuerpoEmail)
$BoxCuerpoEmail = New-Object System.Windows.Forms.Textbox
    $BoxCuerpoEmail.Location = New-Object System.Drawing.point(30,390)
    $BoxCuerpoEmail.Size = New-Object System.Drawing.Size(260,20)
    $BoxCuerpoEmail.Text = ''
        $Formulario.Controls.Add($BoxCuerpoEmail)

# Botón para establecer las passwords
$BotonPasswd = New-Object System.Windows.Forms.Button
    $BotonPasswd.Text = "Establecer Passwords"
    $BotonPasswd.Location = New-Object System.Drawing.point(95,430)
    $BotonPasswd.Size = New-Object System.Drawing.Size(140,35)
    $BotonPasswd.Add_Click({$formulario.Close()})
        $Formulario.Controls.Add($BotonPasswd)

# Label del Autor
$LabelAutor = New-Object System.Windows.Forms.Label
    $LabelAutor.Location = New-Object System.Drawing.Size(210,480) 
    $LabelAutor.Size = New-Object System.Drawing.Size(205,20) 
    $LabelAutor.Text = "by @adrianlois_"
        $Formulario.Controls.Add($LabelAutor)

## Fin Labels, TextAreas y Buttons ##

# Mostrar el diálogo del formulario
$Formulario.ShowDialog()

## Fin Formulario ##
####################

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

#########################################
## Inicio Recoger Variables Formulario ##

    $ValorBoxPathLocal = $BoxPathLocal.Text
    $ValorBoxPathRemotoFTP = $BoxPathRemotoFTP.Text
    $ValorBoxPathFichero7z = $BoxPathFichero7z.Text
    $ValorBoxHostServidorFTP = $BoxHostServidorFTP.Text
    $ValorBoxUsuarioFTP = $BoxUsuarioFTP.Text
    $ValorBoxUsuarioEmail = $BoxUsuarioEmail.Text
    $ValorBoxAsuntoEmail = $BoxAsuntoEmail.Text
    $ValorBoxCuerpoEmail = $BoxCuerpoEmail.Text

## Fin Recoger Variables Formulario ##
######################################

#################################
## Inicio Establecer Variables ##

# Fecha y hora
    $FechaActual = Get-Date -uformat "%d-%m-%Y"
    $FechaHoraActual = Get-Date -uformat "%d/%m/%Y - %H:%M:%S"
# Paths
    $PathLocalDatos = "$ValorBoxPathLocal"
    $PathRemotoFTP = "$ValorBoxPathRemotoFTP"
    $PathTempFichero7z = "$ValorBoxPathFichero7z"
    $NombreBackupTemp = "Backup-"
    $TempFichero7z = "$PathtempFichero7z$NombreBackupTemp$FechaActual.7z"
# Credenciales
    $Passwd7z = "$PlainPasswd7z"
    $HostServidorFTP = "$ValorBoxHostServidorFTP"
    $UsuarioFTP = "$ValorBoxUsuarioFTP"
    $PasswdFTP = "$PlainPasswdFTP"
    $UsuarioEmail = "$ValorBoxUsuarioEmail@gmail.com" 
    $PasswdEmail = "$PlainPasswdEmail"
# Asunto y cuerpo del Email
    $AsuntoEmail = "$ValorBoxAsuntoEmail"
    $CuerpoEmail = "$ValorBoxCuerpoEmail"
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
    # Subir el fichero comprimido de datos al servidor FTP
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

# Salir
exit
