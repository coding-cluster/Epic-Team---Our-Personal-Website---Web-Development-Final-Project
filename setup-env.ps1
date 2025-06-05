# Script para configurar variables de entorno para Tomcat
# Autor: Proyecto Final - Lenguajes de Computacion IV

Write-Host "CONFIGURANDO VARIABLES DE ENTORNO PARA TOMCAT" -ForegroundColor Cyan
Write-Host "=" * 50 -ForegroundColor Cyan

# Detectar JAVA_HOME automaticamente
Write-Host "`nDetectando instalacion de Java..." -ForegroundColor Yellow

# Buscar Java en ubicaciones comunes
$javaLocations = @(
    "C:\Program Files\Java\jdk*",
    "C:\Program Files\Java\jre*",
    "C:\Program Files (x86)\Java\jdk*",
    "C:\Program Files (x86)\Java\jre*"
)

$javaHome = $null
foreach ($location in $javaLocations) {
    $javaDirs = Get-ChildItem -Path $location -Directory -ErrorAction SilentlyContinue | Sort-Object Name -Descending
    if ($javaDirs) {
        $javaHome = $javaDirs[0].FullName
        break
    }
}

if ($javaHome) {
    Write-Host "Java encontrado en: $javaHome" -ForegroundColor Green
    
    # Configurar JAVA_HOME para la sesion actual
    $env:JAVA_HOME = $javaHome
    Write-Host "JAVA_HOME configurado para esta sesion: $env:JAVA_HOME" -ForegroundColor Green
    
    # Preguntar si quiere configurarlo permanentemente
    $response = Read-Host "Deseas configurar JAVA_HOME permanentemente? (s/n)"
    if ($response -eq 's' -or $response -eq 'S') {
        try {
            [Environment]::SetEnvironmentVariable("JAVA_HOME", $javaHome, "User")
            Write-Host "JAVA_HOME configurado permanentemente" -ForegroundColor Green
        } catch {
            Write-Host "Error al configurar JAVA_HOME permanentemente: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
} else {
    Write-Host "No se encontro instalacion de Java" -ForegroundColor Red
    Write-Host "Por favor, instala Java JDK antes de continuar" -ForegroundColor Yellow
}

# Detectar CATALINA_HOME
Write-Host "`nDetectando instalacion de Tomcat..." -ForegroundColor Yellow

$tomcatPaths = @(
    "C:\apache-tomcat-11",
    "C:\apache-tomcat-9.0.105",
    "C:\Tomcat Server"
)

$catalina_home = $null
foreach ($path in $tomcatPaths) {
    if (Test-Path $path) {
        $catalina_home = $path
        break
    }
}

if ($catalina_home) {
    Write-Host "Tomcat encontrado en: $catalina_home" -ForegroundColor Green
    
    # Configurar CATALINA_HOME para la sesion actual
    $env:CATALINA_HOME = $catalina_home
    Write-Host "CATALINA_HOME configurado para esta sesion: $env:CATALINA_HOME" -ForegroundColor Green
    
    # Preguntar si quiere configurarlo permanentemente
    $response = Read-Host "Deseas configurar CATALINA_HOME permanentemente? (s/n)"
    if ($response -eq 's' -or $response -eq 'S') {
        try {
            [Environment]::SetEnvironmentVariable("CATALINA_HOME", $catalina_home, "User")
            Write-Host "CATALINA_HOME configurado permanentemente" -ForegroundColor Green
        } catch {
            Write-Host "Error al configurar CATALINA_HOME permanentemente: $($_.Exception.Message)" -ForegroundColor Red
        }
    }
} else {
    Write-Host "No se encontro instalacion de Tomcat" -ForegroundColor Red
}

# Mostrar resumen
Write-Host "`nRESUMEN DE CONFIGURACION:" -ForegroundColor Cyan
Write-Host "JAVA_HOME (sesion actual): $env:JAVA_HOME" -ForegroundColor White
Write-Host "CATALINA_HOME (sesion actual): $env:CATALINA_HOME" -ForegroundColor White

Write-Host "`nNOTA: Para que los cambios permanentes tomen efecto," -ForegroundColor Yellow
Write-Host "es necesario reiniciar PowerShell o el sistema." -ForegroundColor Yellow

Write-Host "`n=" * 50 -ForegroundColor Cyan

