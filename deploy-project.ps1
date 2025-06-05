# Script para desplegar el proyecto en Tomcat
# Autor: Proyecto Final - Lenguajes de Computacion IV

param(
    [string]$ProjectName = "ProyectoFinal"
)

Write-Host "DESPLEGANDO PROYECTO '$ProjectName' EN TOMCAT..." -ForegroundColor Green

# Buscar instalacion de Tomcat
$tomcatPaths = @(
    "C:\apache-tomcat-11",
    "C:\apache-tomcat-9.0.105",
    "C:\Tomcat Server",
    $env:CATALINA_HOME
)

$tomcatPath = $null
foreach ($path in $tomcatPaths) {
    if ($path -and (Test-Path $path)) {
        $tomcatPath = $path
        break
    }
}

if (-not $tomcatPath) {
    Write-Host "No se encontro instalacion de Tomcat" -ForegroundColor Red
    exit 1
}

$webappsPath = Join-Path $tomcatPath "webapps"
Write-Host "Usando Tomcat en: $tomcatPath" -ForegroundColor Cyan
Write-Host "Directorio webapps: $webappsPath" -ForegroundColor Cyan

# Verificar si existe el directorio src/main/webapp
$webappSource = Join-Path $PSScriptRoot "src\main\webapp"
if (-not (Test-Path $webappSource)) {
    Write-Host "No se encontro el directorio src/main/webapp" -ForegroundColor Red
    Write-Host "Asegurate de estar en el directorio raiz del proyecto" -ForegroundColor Yellow
    exit 1
}

Write-Host "Directorio fuente: $webappSource" -ForegroundColor Cyan

# Crear directorio de destino
$deployPath = Join-Path $webappsPath $ProjectName
Write-Host "Directorio destino: $deployPath" -ForegroundColor Cyan

# Eliminar despliegue anterior si existe
if (Test-Path $deployPath) {
    Write-Host "Eliminando despliegue anterior..." -ForegroundColor Yellow
    Remove-Item $deployPath -Recurse -Force
}

# Copiar archivos
Write-Host "Copiando archivos del proyecto..." -ForegroundColor Blue
try {
    Copy-Item $webappSource $deployPath -Recurse
    Write-Host "Archivos copiados correctamente" -ForegroundColor Green
} catch {
    Write-Host "Error al copiar archivos: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}

# Verificar si Tomcat esta corriendo
$tomcatProcess = Get-Process -Name "java" -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -like "*catalina*" }
if ($tomcatProcess) {
    Write-Host "Tomcat esta corriendo" -ForegroundColor Green
    Write-Host "Proyecto disponible en: http://localhost:8080/$ProjectName" -ForegroundColor Cyan
    
    # Intentar abrir en el navegador
    Write-Host "Abriendo en el navegador..." -ForegroundColor Blue
    Start-Process "http://localhost:8080/$ProjectName"
} else {
    Write-Host "Tomcat no esta corriendo" -ForegroundColor Yellow
    Write-Host "Iniciando Tomcat..." -ForegroundColor Blue
    & "$PSScriptRoot\start-tomcat.ps1"
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Proyecto disponible en: http://localhost:8080/$ProjectName" -ForegroundColor Cyan
        Start-Process "http://localhost:8080/$ProjectName"
    }
}

Write-Host "`nDespliegue completado!" -ForegroundColor Green
Write-Host "URLs disponibles:" -ForegroundColor Cyan
Write-Host "  - Proyecto: http://localhost:8080/$ProjectName" -ForegroundColor White
Write-Host "  - Manager: http://localhost:8080/manager" -ForegroundColor White
Write-Host "  - Tomcat Home: http://localhost:8080" -ForegroundColor White
