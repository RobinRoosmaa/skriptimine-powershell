#Skript, mis võtab samast kaustast tekst faili sisu ja teeb sellest array.
#Autor: Robin Roosmaa
#Viimati muudetud: 26:05:2025

#Skript võtab enda asukoha muutujasse.
$skriptiAsukoht = $MyInvocation.MyCommand.Path
$dir = Split-Path $skriptiAsukoht
#Skript loeb soovitud faili sisu, mis peab asuma skriptiga samas kaustas.
$emailid = Get-Content -path $dir\emailid.txt
#Skript lõigub faili sisu array-ks komade põhjal. Lisab lõppu minu emaili. Loeb Array pikkuse ja prindib esimese ja viimase elemendi kasutajale.
$mass = $emailid.split(",")
$mass += "Robin.Roosmaa@vikk.ee"
$mass.Length
$mass[0, -1]