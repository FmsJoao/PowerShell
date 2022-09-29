param($diretorio)

$ErrorActionPreference = "Stop"

. .\ShaFile.Ps1

$arquivos = Get-ChildItem $diretorio -File
# a
foreach ($item in $arquivos.FullName){
    $hashItem = Get-FileSHA1 $item
    Write-Host "O Hash do arquivo $item eh $hashItem ! "
}