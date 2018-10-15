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
