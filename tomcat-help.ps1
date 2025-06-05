# Script de ayuda para comandos de Tomcat
# Autor: Proyecto Final - Lenguajes de Computacion IV

Write-Host "GUIA DE COMANDOS DE TOMCAT" -ForegroundColor Cyan
Write-Host "=" * 50 -ForegroundColor Cyan

Write-Host "`nCOMANDOS PRINCIPALES:" -ForegroundColor Yellow
Write-Host "  .\start-tomcat.ps1" -ForegroundColor Green
Write-Host "    Inicia el servidor Apache Tomcat" -ForegroundColor White

Write-Host "  .\stop-tomcat.ps1" -ForegroundColor Green
Write-Host "    Detiene el servidor Apache Tomcat" -ForegroundColor White

Write-Host "  .\restart-tomcat.ps1" -ForegroundColor Green
Write-Host "    Reinicia el servidor Apache Tomcat" -ForegroundColor White

Write-Host "  .\status-tomcat.ps1" -ForegroundColor Green
Write-Host "    Muestra el estado actual del servidor" -ForegroundColor White

Write-Host "  .\deploy-project.ps1" -ForegroundColor Green
Write-Host "    Despliega el proyecto actual en Tomcat" -ForegroundColor White

Write-Host "  .\tomcat-help.ps1" -ForegroundColor Green
Write-Host "    Muestra esta ayuda" -ForegroundColor White

Write-Host "  .\setup-env.ps1" -ForegroundColor Green
Write-Host "    Configura variables de entorno JAVA_HOME y CATALINA_HOME" -ForegroundColor White

Write-Host "`nEJEMPLOS DE USO:" -ForegroundColor Yellow
Write-Host "  # Iniciar Tomcat desde cualquier directorio del proyecto" -ForegroundColor Gray
Write-Host "  .\start-tomcat.ps1" -ForegroundColor Cyan

Write-Host "  # Desplegar con nombre personalizado" -ForegroundColor Gray
Write-Host "  .\deploy-project.ps1 -ProjectName `"MiProyecto`"" -ForegroundColor Cyan

Write-Host "  # Ver estado completo del servidor" -ForegroundColor Gray
Write-Host "  .\status-tomcat.ps1" -ForegroundColor Cyan

Write-Host "`nURLS IMPORTANTES:" -ForegroundColor Yellow
Write-Host "  http://localhost:8080" -ForegroundColor Cyan
Write-Host "    Pagina principal de Tomcat" -ForegroundColor White

Write-Host "  http://localhost:8080/manager" -ForegroundColor Cyan
Write-Host "    Manager de aplicaciones web" -ForegroundColor White

Write-Host "  http://localhost:8080/ProyectoFinal" -ForegroundColor Cyan
Write-Host "    Tu proyecto desplegado (despues del deploy)" -ForegroundColor White

Write-Host "`nPERMISOS:" -ForegroundColor Yellow
Write-Host "  Si es la primera vez que ejecutas estos scripts," -ForegroundColor White
Write-Host "  puede que necesites cambiar la politica de ejecucion:" -ForegroundColor White
Write-Host "  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser" -ForegroundColor Cyan

Write-Host "`nFLUJO DE TRABAJO RECOMENDADO:" -ForegroundColor Yellow
Write-Host "  1. .\start-tomcat.ps1        # Iniciar servidor" -ForegroundColor White
Write-Host "  2. .\deploy-project.ps1      # Desplegar proyecto" -ForegroundColor White
Write-Host "  3. [Desarrollar...]          # Hacer cambios" -ForegroundColor White
Write-Host "  4. .\deploy-project.ps1      # Re-desplegar" -ForegroundColor White
Write-Host "  5. .\stop-tomcat.ps1         # Detener al terminar" -ForegroundColor White

Write-Host "`nSOLUCION DE PROBLEMAS:" -ForegroundColor Yellow
Write-Host "  - Si Tomcat no inicia: verifica JAVA_HOME" -ForegroundColor White
Write-Host "  - Si el puerto 8080 esta ocupado: cambia el puerto en server.xml" -ForegroundColor White
Write-Host "  - Si hay errores de permisos: ejecuta como administrador" -ForegroundColor White
Write-Host "  - Para ver logs: revisa la carpeta logs/ en Tomcat" -ForegroundColor White

Write-Host "`n" -ForegroundColor White
Write-Host "=" * 50 -ForegroundColor Cyan
Write-Host "Para mas informacion, consulta la documentacion de Apache Tomcat" -ForegroundColor Cyan
