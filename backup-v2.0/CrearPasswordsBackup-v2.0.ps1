######################
# Autor @adrianlois_ #
######################
# Backup PowerShell v2.0 #
##########################

## Establecer el path absoluto donde se almacenarán los ficheros de password cifrados
$PathFicherosPasswd = Read-Host "Establece la ruta absoluta donde se almacenarán los ficheros de passwords"

## Crear ficheros de passwords cifrados
Read-Host -AsSecureString "Password fichero comprimido 7z" | ConvertFrom-SecureString | Set-Content "$PathFicherosPasswd\passwd-7z"
Read-Host -AsSecureString "Password servidor FTP" | ConvertFrom-SecureString | Set-Content "$PathFicherosPasswd\passwd-ftp"
Read-Host -AsSecureString "Password Email Gmail" | ConvertFrom-SecureString | Set-Content "$PathFicherosPasswd\passwd-email"

## Mostrar MessageBox de los paths donde se crearon los ficheros de passwords
[System.Windows.MessageBox]::Show("Passwords generadas correctamente: 
                                    `n`n$PathFicherosPasswd\passwd-7z 
                                    `n$PathFicherosPasswd\passwd-ftp 
                                    `n$PathFicherosPasswd\passwd-email","Passwords path")