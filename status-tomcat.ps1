# Script para verificar el estado de Apache Tomcat
# Autor: Proyecto Final - Lenguajes de Computacion IV

Write-Host "ESTADO DE APACHE TOMCAT" -ForegroundColor Cyan
Write-Host "=" * 40 -ForegroundColor Cyan

# Verificar procesos de Tomcat
$tomcatProcess = Get-Process -Name "java" -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -like "*catalina*" }

if ($tomcatProcess) {
    Write-Host "Estado: CORRIENDO" -ForegroundColor Green
    Write-Host "PID: $($tomcatProcess.Id)" -ForegroundColor White
    Write-Host "Memoria: $([math]::Round($tomcatProcess.WorkingSet / 1MB, 2)) MB" -ForegroundColor White
    Write-Host "Tiempo de ejecucion: $((Get-Date) - $tomcatProcess.StartTime)" -ForegroundColor White
    
    # Verificar conectividad
    Write-Host "`nVerificando conectividad..." -ForegroundColor Yellow
    
    try {
        $response = Invoke-WebRequest -Uri "http://localhost:8080" -TimeoutSec 5 -ErrorAction Stop
        Write-Host "Servidor web: ACCESIBLE" -ForegroundColor Green
        Write-Host "URL: http://localhost:8080" -ForegroundColor Cyan
        Write-Host "Codigo de respuesta: $($response.StatusCode)" -ForegroundColor White
    }
    catch {
        Write-Host "Servidor web: NO ACCESIBLE" -ForegroundColor Red
        Write-Host "El proceso existe pero el servidor web no responde" -ForegroundColor Yellow
    }
    
    # Verificar manager
    try {
        $managerResponse = Invoke-WebRequest -Uri "http://localhost:8080/manager" -TimeoutSec 5 -ErrorAction Stop
        Write-Host "Manager: ACCESIBLE" -ForegroundColor Green
    }
    catch {
        Write-Host "Manager: NO ACCESIBLE" -ForegroundColor Yellow
    }
    
} else {
    Write-Host "Estado: DETENIDO" -ForegroundColor Red
    Write-Host "No hay procesos de Tomcat ejecutandose" -ForegroundColor Yellow
}

# Verificar puertos
Write-Host "`nVerificando puertos..." -ForegroundColor Yellow
$ports = @(8080, 8443, 8005, 8009)

foreach ($port in $ports) {
    $connection = netstat -an | Select-String ":$port "
    if ($connection) {
        Write-Host "Puerto ${port}: EN USO" -ForegroundColor Green
    } else {
        Write-Host "Puerto ${port}: LIBRE" -ForegroundColor Red
    }
}

# Buscar instalacion de Tomcat
Write-Host "`nInstalaciones de Tomcat encontradas:" -ForegroundColor Yellow
$tomcatPaths = @(
    "C:\apache-tomcat-11",
    "C:\apache-tomcat-9.0.105",
    "C:\Tomcat Server"
)

$found = $false
foreach ($path in $tomcatPaths) {
    if (Test-Path $path) {
        Write-Host "$path" -ForegroundColor Green
        $found = $true
        
        # Verificar version si existe el archivo
        $versionFile = Join-Path $path "RELEASE-NOTES"
        if (Test-Path $versionFile) {
            $version = Get-Content $versionFile -TotalCount 10 | Select-String "Apache Tomcat Version" | Select-Object -First 1
            if ($version) {
                Write-Host "  Version: $($version.Line.Trim())" -ForegroundColor Cyan
            }
        }
    }
}

if (-not $found) {
    Write-Host "No se encontraron instalaciones de Tomcat" -ForegroundColor Red
}

# Verificar JAVA_HOME
Write-Host "`nVariable JAVA_HOME:" -ForegroundColor Yellow
if ($env:JAVA_HOME) {
    Write-Host "$env:JAVA_HOME" -ForegroundColor Green
} else {
    Write-Host "No configurada" -ForegroundColor Red
}

# Verificar CATALINA_HOME
Write-Host "`nVariable CATALINA_HOME:" -ForegroundColor Yellow
if ($env:CATALINA_HOME) {
    Write-Host "$env:CATALINA_HOME" -ForegroundColor Green
} else {
    Write-Host "No configurada" -ForegroundColor Yellow
}

Write-Host "`n" -ForegroundColor White
Write-Host "=" * 40 -ForegroundColor Cyan
