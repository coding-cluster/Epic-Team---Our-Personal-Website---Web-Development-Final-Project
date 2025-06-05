# Script para iniciar Apache Tomcat
# Autor: Proyecto Final - Lenguajes de Computacion IV

Write-Host "INICIANDO APACHE TOMCAT..." -ForegroundColor Green

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
    Write-Host "Por favor, verifica que Tomcat este instalado en alguna de estas rutas:" -ForegroundColor Yellow
    $tomcatPaths | ForEach-Object { Write-Host "  - $_" -ForegroundColor Yellow }
    exit 1
}

Write-Host "Usando Tomcat en: $tomcatPath" -ForegroundColor Cyan

# Verificar si Tomcat ya esta corriendo
$tomcatProcess = Get-Process -Name "java" -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -like "*catalina*" }
if ($tomcatProcess) {
    Write-Host "Tomcat ya esta corriendo (PID: $($tomcatProcess.Id))" -ForegroundColor Yellow
    Write-Host "Accede a: http://localhost:8080" -ForegroundColor Green
    exit 0
}

# Iniciar Tomcat
$startupScript = Join-Path $tomcatPath "bin\startup.bat"
if (Test-Path $startupScript) {
    Write-Host "Ejecutando startup.bat..." -ForegroundColor Blue
    Start-Process -FilePath $startupScript -WorkingDirectory (Join-Path $tomcatPath "bin")
    
    # Esperar un momento para que inicie
    Start-Sleep -Seconds 3
    
    # Verificar que haya iniciado
    $attempts = 0
    $maxAttempts = 10
    
    do {
        Start-Sleep -Seconds 2
        $attempts++
        try {
            $response = Invoke-WebRequest -Uri "http://localhost:8080" -TimeoutSec 5 -ErrorAction Stop
            Write-Host "Tomcat iniciado correctamente!" -ForegroundColor Green
            Write-Host "Servidor disponible en: http://localhost:8080" -ForegroundColor Green
            Write-Host "Manager: http://localhost:8080/manager" -ForegroundColor Cyan
            return
        }
        catch {
            Write-Host "Esperando que Tomcat inicie... ($attempts/$maxAttempts)" -ForegroundColor Yellow
        }
    } while ($attempts -lt $maxAttempts)
    
    Write-Host "Tomcat puede estar iniciando aun. Verifica en http://localhost:8080" -ForegroundColor Yellow
} else {
    Write-Host "No se encontro el script startup.bat en $startupScript" -ForegroundColor Red
    exit 1
}
