#Skript näidisek, kuidas cmdlette sundida inglise keelde.
#Autor: Bing Writer AI, kohandanud ja tõlkinud Robin Roosmaa
#Viimati muudetud 05/06/2025

#Loome muutuja, mis sunnib ajutiselt lokaliseeringu US inglise keeleks.
$Keel = [System.Globalization.CultureInfo]::CreateSpecificCulture("en-US")

#Anname näiteks Get-Date cmdletile muutuja, mida saame kasutada cmdleti keele määramiseks.
$Kuupäev = Get-Date

#Kasutades loodud muutujaid saame muutuja väärtuseks tänase nädalapäeva 
$Nädalapäev = $Kuupäev.ToString("dddd", $Keel)

#Tulemuse kuvamine.
Write-Output "Today is: $Nädalapäev"