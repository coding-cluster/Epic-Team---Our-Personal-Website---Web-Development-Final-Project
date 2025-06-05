# Script para detener Apache Tomcat
# Autor: Proyecto Final - Lenguajes de Computación IV

Write-Host "Deteniendo Apache Tomcat..." -ForegroundColor Red

# Buscar instalación de Tomcat
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
    Write-Host "No se encontró instalación de Tomcat" -ForegroundColor Red
    exit 1
}

Write-Host "Usando Tomcat en: $tomcatPath" -ForegroundColor Cyan

# Verificar si Tomcat está corriendo
$tomcatProcess = Get-Process -Name "java" -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -like "*catalina*" }
if (-not $tomcatProcess) {
    Write-Host "Tomcat no está corriendo" -ForegroundColor Yellow
    exit 0
}

Write-Host "Deteniendo Tomcat (PID: $($tomcatProcess.Id))..." -ForegroundColor Blue

# Método 1: Usar shutdown.bat
$shutdownScript = Join-Path $tomcatPath "bin\shutdown.bat"
if (Test-Path $shutdownScript) {
    Write-Host "Ejecutando shutdown.bat..." -ForegroundColor Blue
    Start-Process -FilePath $shutdownScript -WorkingDirectory (Join-Path $tomcatPath "bin") -Wait
    
    # Esperar a que se detenga
    $attempts = 0
    $maxAttempts = 10
    
    do {
        Start-Sleep -Seconds 2
        $attempts++
        $tomcatProcess = Get-Process -Name "java" -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -like "*catalina*" }
        
        if (-not $tomcatProcess) {
            Write-Host "Tomcat detenido correctamente!" -ForegroundColor Green
            return
        }
        
        Write-Host "Esperando que Tomcat se detenga... ($attempts/$maxAttempts)" -ForegroundColor Yellow
    } while ($attempts -lt $maxAttempts)
}

# Método 2: Forzar cierre si shutdown.bat no funcionó
$tomcatProcess = Get-Process -Name "java" -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -like "*catalina*" }
if ($tomcatProcess) {
    Write-Host "⚠️  Forzando cierre de Tomcat..." -ForegroundColor Yellow
    $tomcatProcess | Stop-Process -Force
    Start-Sleep -Seconds 2
    
    $tomcatProcess = Get-Process -Name "java" -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -like "*catalina*" }
    if (-not $tomcatProcess) {
        Write-Host "Tomcat detenido forzadamente!" -ForegroundColor Green
    } else {
        Write-Host "No se pudo detener Tomcat" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "Tomcat detenido correctamente!" -ForegroundColor Green
}

