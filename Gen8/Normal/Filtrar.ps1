# Leer contenido completo
$contenido = Get-Content "lista.txt" -Raw

# Separar por espacios o comas
$items = $contenido -split "[,\s]+" | Where-Object { $_ -ne "" }

# Quitar los que empiezan con s_ y los que terminan en -f
$filtrados = $items | Where-Object {
    ($_ -notmatch "^s_") -and
    ($_ -notmatch "-f$")
}

# Quitar duplicados y ordenar
$final = $filtrados | Sort-Object -Unique

# Guardar resultado
$final | Set-Content "lista_unificada.txt"

Write-Host "Lista unificada creada."
Write-Host "Total final:" $final.Count