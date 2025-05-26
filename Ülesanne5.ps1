#Skript arvuti andmete kuvamiseks
#Autor: Robin Roosmaa ISK24
#Viimati muudetud:26:05:2025

#Skript tühjendab terminali ja täidab selle soovitud andmetega arvuti kohta.
clear
$env:COMPUTERNAME
Write-Output "******************************"
(Get-WMIObject win32_operatingsystem).name
Write-Output "******************************"
Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Ethernet0 | Format-Wide IPAddress
Write-Output "******************************"
Get-WmiObject Win32_PhysicalMemory | Format-Wide Capacity
Write-Output "******************************"
Get-WmiObject Win32_Processor | Select-Object -ExpandProperty Name
Write-Output "******************************"
Get-CimInstance win32_VideoController | Select-Object VideoProcessor | Format-Wide
Write-Output "******************************"
Get-LocalUser | Select-Object Name | Format-Table