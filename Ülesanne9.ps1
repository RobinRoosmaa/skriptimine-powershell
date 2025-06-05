#Skript ühe folderi teistesse kopeerimiseks nädalapäevapõhiselt.
#Autor: Robin Roosmaa
#Viimati muudetud 05/06/2025

#Muutujad varundatava folderi määramiseks ja kõigi nädalapäevade folderite määramiseks
$Varundatav = "C:\Windows\Temp"
$ESMASP = "C:\Varundus\Mon"
$TEISIP = "C:\Varundus\Tue"
$KOLMAP = "C:\Varundus\Wed"
$NELJAP = "C:\Varundus\Thu"
$REEDE = "C:\Varundus\Fri"
$LAUP = "C:\Varundus\Sat"
$PÜHAP = "C:\Varundus\Sun"

#Kuna skripti loomis seade oli eesti keelne andis Get-Date mulle eestikeelsed nädalapäevad.
#Kuna skript ei töötaks arvutis, kus seadme keel pole Eesti keel sunnin Get-Date väljundi Inglise keelde. Selleks teeme paar lisa sammu.

#Loome muutuja, mis sunnib ajutiselt lokaliseeringu US inglise keeleks.
$Keel = [System.Globalization.CultureInfo]::CreateSpecificCulture("en-US")

#Anname Get-Date cmdletile muutuja, mida saame kasutada cmdleti keele määramiseks.
$Kuupäev = Get-Date

#Kasutades loodud muutujaid saame muutuja väärtuseks tänase nädalapäeva Inglise keeles.
$Päev = $Kuupäev.ToString("dddd", $Keel)

#Kuna sooviti, et kasutajale kuvatakse nädalapäeva Eesti keeles teeme seda siiski seadme kohalikku keelt kasutades.
Write-Output "Täna on $(Get-Date -Format "dddd")"

#Kontrollime, kas määratud varundatava folderi sees on .log faile ja kui pole teatame sellest kasutajale andes ka põhjendusi, miks skript peatus.
if (Test-Path -Path $Varundatav\*.log){
    Write-Output "Folderis $Varundatav on .log laiendiga failid olemas, asun varundama"
}else{
    Write-Output "Folderist $Varundatav ei leitud .log laiendiga faile või asukohta ennast ei leitud. Kontrollige folderi $Varundatav olemasolu või muutke see skriptis teiseks asukohaks, milles on .log failid."
    exit
}

#Log failide kopeerimine kuupäeva põhjal. Skript kopeerib kõigil päevadel, mis on sisse kommenteeritud.
#Soovi korral saab igat nädalapäeva välja kommenteerida alustades soovitud nädalapäeva elseif reast.
#Enne kopeerimist kontrollitakse ka nädalapäevale määratud sihtkoha olemasolu ja siis kopeeritakse kõik originaalsed failid sama nimega nagu need olid. 
#Samal nädalapäeval korduval käivitusel kirjutatakse eelnevad üle.
#
#If lause, mis on alati väär, et saaks välja kommenteerida ka esmaspäeva.
if($false) {
#
#Esmaspäeviti kopeerimine soovitud folderisse.
}elseif ($Päev -like "Monday"){
    if (Test-Path -Path $ESMASP){
    Copy-Item -Path $Varundatav\*.log -Destination $ESMASP -Recurse -Force
    Write-Output "Varundus tehti kausta $ESMASP. Skripti samal nädalapäeval uuesti käivitamine kirjutab need üle uutega."
    exit
    }else{
    Write-Output "Tänase päeva folderit ei leitud. Kontrolli, kas folder $ESMASP eksisteerib või muuda see skriptis soovitud folderiks."
    exit
    }
#
#Teisipäeviti kopeerimine soovitud folderisse.
}elseif ($Päev -like "Tuesday"){
    if (Test-Path -Path $TEISIP){
    Copy-Item -Path $Varundatav\*.log -Destination $TEISIP -Recurse -Force
    Write-Output "Varundus tehti kausta $TEISIP. Skripti samal nädalapäeval uuesti käivitamine kirjutab need üle uutega."
    exit
    }else{
    Write-Output "Tänase päeva folderit ei leitud. Kontrolli, kas folder $TEISIP eksisteerib või muuda see skriptis soovitud folderiks."
    exit
    }
#
#Kolmapäeviti kopeerimine soovitud folderisse.
}elseif ($Päev -like "Wednesday"){
    if (Test-Path -Path $KOLMAP){
    Copy-Item -Path $Varundatav\*.log -Destination $KOLMAP -Recurse -Force
    Write-Output "Varundus tehti kausta $KOLMAP. Skripti samal nädalapäeval uuesti käivitamine kirjutab need üle uutega."
    exit
    }else{
    Write-Output "Tänase päeva folderit ei leitud. Kontrolli, kas folder $KOLMAP eksisteerib või muuda see skriptis soovitud folderiks."
    exit
    }
#
#Neljapäeviti kopeerimine soovitud folderisse.
}elseif ($Päev -like "Thursday"){
    if (Test-Path -Path $NELJAP){
    Copy-Item -Path $Varundatav\*.log -Destination $NELJAP -Recurse -Force
    Write-Output "Varundus tehti kausta $NELJAP. Skripti samal nädalapäeval uuesti käivitamine kirjutab need üle uutega."
    exit
    }else{
    Write-Output "Tänase päeva folderit ei leitud. Kontrolli, kas folder $NELJAP eksisteerib või muuda see skriptis soovitud folderiks."
    exit
    }
#
#Reedeti kopeerimine soovitud folderisse.
}elseif ($Päev -like "Friday"){
    if (Test-Path -Path $REEDE){
    Copy-Item -Path $Varundatav\*.log -Destination $REEDE -Recurse -Force
    Write-Output "Varundus tehti kausta $REEDE. Skripti samal nädalapäeval uuesti käivitamine kirjutab need üle uutega."
    exit
    }else{
    Write-Output "Tänase päeva folderit ei leitud. Kontrolli, kas folder $REEDE eksisteerib või muuda see skriptis soovitud folderiks."
    exit
    }
#
#Laupäeviti kopeerimine soovitud folderisse.
#}elseif ($Päev -like "Saturday"){
#    if (Test-Path -Path $LAUP){
#    Copy-Item -Path $Varundatav\*.log -Destination $LAUP -Recurse -Force
#    Write-Output "Varundus tehti kausta $LAUP. Skripti samal nädalapäeval uuesti käivitamine kirjutab need üle uutega."
#    exit
#    }else{
#    Write-Output "Tänase päeva folderit ei leitud. Kontrolli, kas folder $LAUP eksisteerib või muuda see skriptis soovitud folderiks."
#    exit
#    }
#
#Pühapäeviti kopeerimine soovitud folderisse.
#}elseif ($Päev -like "Sunday"){
#    if (Test-Path -Path $PÜHAP){
#    Copy-Item -Path $Varundatav\*.log -Destination $PÜHAP -Recurse -Force
#    Write-Output "Varundus tehti kausta $PÜHAP. Skripti samal nädalapäeval uuesti käivitamine kirjutab need üle uutega."
#    exit
#    }else{
#    Write-Output "Tänase päeva folderit ei leitud. Kontrolli, kas folder $PÜHAP eksisteerib või muuda see skriptis soovitud folderiks."
#    exit
#    }
#
#Juhul kui kuupäev on välja kommenteeritud ja faile ei kopeerita, teatatakse seda kasutajale.
}else{
    Write-Output "Tänasel nädalapäeval faile ei varundata. Selle muutmiseks kommenteerige sisse tänase kuupäeva lõik skriptis."
}