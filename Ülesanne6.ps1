#Skript, mis prindib muutujatest infot nii terminali kui ka desktopile.
#Autor: Robin Roosmaa
#Viimati muudetud: 26:05:2025

#Skript salvestab muutujad ja kasutab neid terminalile ja valitud asukohta faili sisuna.
$nimi = "Robin Roosmaa"
$mail = "Robin.Roosmaa@vikk.ee"
${tänane kuupäev} = Get-Date -Format "dddd_MM/dd/yyyy_HH_mm"
$fail = "skriptimine_${tänane kuupäev}.txt"
Write-Output "Tere mina olen:"
Write-Output $nimi
Write-Output ""
Write-Output "Minu e-post on: $mail"
Write-Output ""
Write-Output "Täna on ${tänane kuupäev}"
Write-Output "See on hea päev skriptimiseks!"
Write-Output ""
Add-Content "C:\Users\student\Desktop\$fail" "Tere mina olen:
$nimi

Minu e-post on: $mail

Täna on ${tänane kuupäev}
See on hea päev skriptimiseks!"
Write-Output "Fail $fail on loodud asukohta C:\Users\student\Desktop"