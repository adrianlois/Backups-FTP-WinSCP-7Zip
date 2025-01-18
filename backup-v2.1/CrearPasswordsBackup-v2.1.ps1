##########################
# Backup PowerShell v2.1 #
##########################

## Establecer el path absoluto donde se almacenarán los ficheros de password cifrados
$PathFicherosPasswd = Read-Host "Establece la ruta absoluta donde se almacenarán los ficheros de passwords"

## Crear fichero de CifradoKeyFile.key
$CifradoKeyFile = New-Object Byte[] 32
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($CifradoKeyFile)
$CifradoKeyFile | out-file "$PathFicherosPasswd\CifradoKeyFile.key"

## Crear ficheros de passwords cifrados
Read-Host -AsSecureString "Password fichero comprimido 7z" | ConvertFrom-SecureString -key (Get-Content "$PathFicherosPasswd\CifradoKeyFile.key") | set-content "$PathFicherosPasswd\passwd-7z"
Read-Host -AsSecureString "Password servidor FTP" | ConvertFrom-SecureString -key (Get-Content "$PathFicherosPasswd\CifradoKeyFile.key") | set-content "$PathFicherosPasswd\passwd-ftp"
Read-Host -AsSecureString "Password Email Gmail" | ConvertFrom-SecureString -key (Get-Content "$PathFicherosPasswd\CifradoKeyFile.key") | set-content "$PathFicherosPasswd\passwd-email"

## Mostrar MessageBox de los paths donde se crearon los ficheros de passwords
[System.Windows.MessageBox]::Show("Passwords generadas correctamente: 
                                    `n`n$PathFicherosPasswd\CifradoKeyFile.key 
                                    `n`n$PathFicherosPasswd\passwd-7z 
                                    `n$PathFicherosPasswd\passwd-ftp 
                                    `n$PathFicherosPasswd\passwd-email","Passwords path")
