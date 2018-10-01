######################
# Autor @adrianlois_ #
######################

# Quitar restricciones de ejecución de scripts
Set-ExecutionPolicy Unrestricted -scope LocalMachine -Force

# Instalación de módulos 7Zip4Powershell y WinSCP.
Install-Module -Name 7Zip4Powershell -Verbose -Force
Install-Module -Name WinSCP -Verbose -Force