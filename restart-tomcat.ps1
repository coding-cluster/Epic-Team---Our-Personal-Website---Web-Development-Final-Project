# Script para reiniciar Apache Tomcat
# Autor: Proyecto Final - Lenguajes de Computación IV

Write-Host "Reiniciando Apache Tomcat..." -ForegroundColor Cyan

# Detener Tomcat primero
Write-Host "Paso 1: Deteniendo Tomcat..." -ForegroundColor Yellow
& "$PSScriptRoot\stop-tomcat.ps1"

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error al detener Tomcat" -ForegroundColor Red
    exit 1
}

# Esperar un momento
Write-Host "Esperando 3 segundos..." -ForegroundColor Yellow
Start-Sleep -Seconds 3

# Iniciar Tomcat
Write-Host "Paso 2: Iniciando Tomcat..." -ForegroundColor Yellow
& "$PSScriptRoot\start-tomcat.ps1"

if ($LASTEXITCODE -eq 0) {
    Write-Host "Tomcat reiniciado correctamente!" -ForegroundColor Green
} else {
    Write-Host "Error al reiniciar Tomcat" -ForegroundColor Red
    exit 1
}

