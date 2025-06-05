#Skript folderite interaktiivseks varundamiseks.
#Autor: Robin Roosmaa
#Viimati muudetud 05/06/2025

#Skripti kasutamiseks on vajalik 7zip aplikatsioon, mille default asukoht on siin seadistatud. Vajadusel muuta enda seadistusele vastavaks.
$7zipPath = "C:\Program Files\7-Zip\7z.exe"
#Kontrollitakse, kas määratud 7zip asukoht eksisteerib ja kui ei siis teatatakse seda kasutajale.
if (-not (Test-Path -Path $7zipPath -PathType Leaf)) {
    throw "7 zip file '$7zipPath' not found"
}
#Kergemaks kasutamiseks loodud 7zip alias.
Set-Alias 7zip $7zipPath

#Kuupäeva formaati, mida lisatakse varundusfaili lõppu saab muuta siin.
$Date = Get-Date -Format "dd/MM/yyyy_HH_mm"

#Kui 7zip leiti küsitakse kasutajalt folderit, mida soovitakse varundada.
$Source = Read-Host "Sisestage forlderi, mida varundada:"
#Kontrollitakse selle folderi olemasolu ja juhul kui seda pole teatatakse kasutajat.
if (-not (Test-Path -Path $Source)){
    Write-Output "Kausta $Source ei leitud, skript seiskub."
    exit
}

#Siis küsitakse kasutajalt folderit, millesse varundusfaili luua ja kontrollitakse ka selle olemasolu.
$Target = Read-Host "Valige asukoht kuhu varundada:"
if (-not (Test-Path -Path $Target)){
    Write-Output "Kausta $Target ei leitud, skript seiskub."
    exit
}

#Luuakse muutuja korduva varundusfaili nime jaoks.
$VarFile = "$Target\var_$Date.7z"

#Teostatakse varundus .7z failiks, mille väljund on peidetud.
7zip a -mx=9 $VarFile $Source | Out-Null

#Kontrollitakse soovitud faili olemasolu ja teatatakse tulemust kasutajale. Ebaõnnestumise puhul pakutakse ka põhjendust, miks see võis ebaõnnestuda.
if (Test-Path -Path $VarFile){
    Write-Output "Varundusfail tekkis asukohta: $VarFile"
}else{
    Write-Output "Varundusfaili loomine ebaõnnestus. Käivita skript administraatorina või kasutage kaustasid, kus on teie kasutajal kirjutamisõigus."
}