# Guía Completa de Scripts para Apache Tomcat
## Proyecto Final - Lenguajes de Computación IV

---

## 📋 Índice

1. [Introducción](#introducción)
2. [Requisitos Previos](#requisitos-previos)
3. [Scripts Disponibles](#scripts-disponibles)
4. [Configuración Inicial](#configuración-inicial)
5. [Flujo de Trabajo Recomendado](#flujo-de-trabajo-recomendado)
6. [Guía de Uso Detallada](#guía-de-uso-detallada)
7. [Solución de Problemas](#solución-de-problemas)
8. [URLs Importantes](#urls-importantes)
9. [Comandos de Emergencia](#comandos-de-emergencia)

---

## 🚀 Introducción

Este proyecto incluye una colección completa de scripts automatizados para gestionar Apache Tomcat de manera eficiente. Los scripts están diseñados para simplificar las tareas de desarrollo y despliegue, eliminando la necesidad de configuraciones manuales complejas.

### Tipos de Scripts Incluidos:
- **PowerShell (.ps1)**: Scripts principales con funcionalidad completa
- **Batch (.bat)**: Wrappers para ejecutar scripts PowerShell fácilmente

---

## ⚙️ Requisitos Previos

### Software Necesario:
- ✅ **Java JDK 8+** (Oracle JDK o OpenJDK)
- ✅ **Apache Tomcat 9.0+** (se busca automáticamente en rutas comunes)
- ✅ **Windows PowerShell 5.0+**

### Permisos de Ejecución:
Si es la primera vez que ejecutas scripts de PowerShell, es posible que necesites cambiar la política de ejecución:

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

---

## 📁 Scripts Disponibles

### Scripts PowerShell Principales (.ps1)

| Script | Función | Descripción |
|--------|---------|-------------|
| `start-tomcat.ps1` | ▶️ Iniciar Tomcat | Inicia el servidor Apache Tomcat y verifica que esté funcionando |
| `stop-tomcat.ps1` | ⏹️ Detener Tomcat | Detiene el servidor de forma segura o forzada si es necesario |
| `restart-tomcat.ps1` | 🔄 Reiniciar Tomcat | Detiene y vuelve a iniciar el servidor |
| `status-tomcat.ps1` | 📊 Estado del Servidor | Muestra información detallada del estado de Tomcat |
| `deploy-project.ps1` | 🚀 Desplegar Proyecto | Despliega automáticamente el proyecto web en Tomcat |
| `setup-env.ps1` | ⚙️ Configurar Entorno | Configura variables de entorno JAVA_HOME y CATALINA_HOME |
| `tomcat-help.ps1` | ❓ Ayuda | Muestra ayuda rápida de todos los comandos |

### Scripts Batch (.bat)

| Script | Equivalente PowerShell | Uso |
|--------|----------------------|-----|
| `start.bat` | `start-tomcat.ps1` | Doble clic para iniciar Tomcat |
| `stop.bat` | `stop-tomcat.ps1` | Doble clic para detener Tomcat |
| `deploy.bat` | `deploy-project.ps1` | Doble clic para desplegar proyecto |

---

## 🔧 Configuración Inicial

### 1. Primera Configuración del Entorno

```powershell
# Ejecutar desde la carpeta del proyecto
.\setup-env.ps1
```

Este script:
- 🔍 Detecta automáticamente la instalación de Java
- 🔍 Detecta automáticamente la instalación de Tomcat
- ⚙️ Configura variables de entorno temporales
- 💾 Opcionalmente configura variables permanentes

### 2. Verificar la Configuración

```powershell
.\status-tomcat.ps1
```

---

## 🔄 Flujo de Trabajo Recomendado

### Para Desarrollo Diario:

```powershell
# 1. Iniciar el servidor Tomcat
.\start-tomcat.ps1

# 2. Desplegar tu proyecto
.\deploy-project.ps1

# 3. [Realizar cambios en el código...]

# 4. Re-desplegar después de cambios
.\deploy-project.ps1

# 5. Al terminar el día
.\stop-tomcat.ps1
```

### Para Resolución de Problemas:

```powershell
# 1. Verificar el estado
.\status-tomcat.ps1

# 2. Reiniciar si hay problemas
.\restart-tomcat.ps1

# 3. Verificar que funcione
.\status-tomcat.ps1
```

---

## 📖 Guía de Uso Detallada

### ▶️ Iniciar Tomcat

```powershell
.\start-tomcat.ps1
```

**Qué hace:**
- Busca automáticamente la instalación de Tomcat en rutas comunes
- Verifica si Tomcat ya está corriendo (evita duplicados)
- Ejecuta el script `startup.bat` de Tomcat
- Espera hasta 20 segundos para verificar que el servidor responda
- Muestra las URLs importantes una vez iniciado

**Salida esperada:**
```
INICIANDO APACHE TOMCAT...
Usando Tomcat en: C:\apache-tomcat-9.0.105
Ejecutando startup.bat...
Tomcat iniciado correctamente!
Servidor disponible en: http://localhost:8080
Manager: http://localhost:8080/manager
```

### ⏹️ Detener Tomcat

```powershell
.\stop-tomcat.ps1
```

**Qué hace:**
- Identifica procesos de Tomcat en ejecución
- Intenta detener usando `shutdown.bat` (método seguro)
- Si no responde, fuerza el cierre del proceso
- Verifica que el servidor se haya detenido completamente

**Salida esperada:**
```
Deteniendo Apache Tomcat...
Usando Tomcat en: C:\apache-tomcat-9.0.105
Deteniendo Tomcat (PID: 1234)...
Ejecutando shutdown.bat...
Tomcat detenido correctamente!
```

### 🔄 Reiniciar Tomcat

```powershell
.\restart-tomcat.ps1
```

**Qué hace:**
- Ejecuta `stop-tomcat.ps1`
- Espera 3 segundos para asegurar el cierre completo
- Ejecuta `start-tomcat.ps1`
- Verifica que ambas operaciones sean exitosas

### 📊 Verificar Estado

```powershell
.\status-tomcat.ps1
```

**Información que muestra:**
- ✅ Estado del proceso (corriendo/detenido)
- 🆔 PID del proceso
- 💾 Uso de memoria
- ⏰ Tiempo de ejecución
- 🌐 Conectividad web (puerto 8080)
- 🔧 Estado del Manager
- 🔌 Estado de puertos (8080, 8443, 8005, 8009)
- 📁 Instalaciones de Tomcat encontradas
- ⚙️ Variables de entorno JAVA_HOME y CATALINA_HOME

### 🚀 Desplegar Proyecto

```powershell
# Despliegue básico
.\deploy-project.ps1

# Despliegue con nombre personalizado
.\deploy-project.ps1 -ProjectName "MiProyecto"
```

**Qué hace:**
1. Busca la carpeta `src\main\webapp` en el directorio actual
2. Localiza la instalación de Tomcat
3. Elimina despliegue anterior si existe
4. Copia todos los archivos del proyecto a `webapps/[ProjectName]`
5. Verifica si Tomcat está corriendo
6. Si no está corriendo, lo inicia automáticamente
7. Abre el proyecto en el navegador predeterminado

**Estructura de despliegue:**
```
webapps/
└── ProyectoFinal/          # o el nombre que especifiques
    ├── index.jsp
    ├── css/
    │   └── styles.css
    ├── js/
    │   └── script.js
    └── WEB-INF/
        └── web.xml
```

### ⚙️ Configurar Variables de Entorno

```powershell
.\setup-env.ps1
```

**Proceso interactivo:**
1. **Detección de Java**: Busca en rutas comunes como:
   - `C:\Program Files\Java\jdk*`
   - `C:\Program Files\Java\jre*`
   - `C:\Program Files (x86)\Java\jdk*`

2. **Detección de Tomcat**: Busca en:
   - `C:\apache-tomcat-11`
   - `C:\apache-tomcat-9.0.105`
   - `C:\Tomcat Server`

3. **Configuración temporal**: Se aplica a la sesión actual de PowerShell

4. **Configuración permanente**: Pregunta si quieres guardar en variables de usuario

### ❓ Obtener Ayuda

```powershell
.\tomcat-help.ps1
```

Muestra una referencia rápida de todos los comandos, ejemplos de uso y solución de problemas comunes.

---

## 🛠️ Solución de Problemas

### Problema: "No se encontró instalación de Tomcat"

**Causas posibles:**
- Tomcat no está instalado
- Tomcat está en una ruta no estándar
- Variable CATALINA_HOME no configurada

**Soluciones:**
1. Ejecutar `.\setup-env.ps1` para configurar automáticamente
2. Instalar Tomcat en una ruta estándar
3. Configurar manualmente CATALINA_HOME:
   ```powershell
   $env:CATALINA_HOME = "C:\ruta\a\tu\tomcat"
   ```

### Problema: "No se encontró instalación de Java"

**Soluciones:**
1. Instalar Java JDK desde [Oracle](https://www.oracle.com/java/technologies/downloads/) u [OpenJDK](https://openjdk.org/)
2. Ejecutar `.\setup-env.ps1` después de la instalación
3. Configurar manualmente JAVA_HOME:
   ```powershell
   $env:JAVA_HOME = "C:\Program Files\Java\jdk-11.0.x"
   ```

### Problema: "Puerto 8080 está ocupado"

**Diagnóstico:**
```powershell
netstat -ano | findstr :8080
```

**Soluciones:**
1. Cambiar el puerto en `server.xml` de Tomcat
2. Detener el proceso que usa el puerto
3. Usar un puerto alternativo

### Problema: "Tomcat no responde después de iniciar"

**Pasos de diagnóstico:**
1. Verificar logs:
   ```powershell
   Get-Content "C:\ruta\tomcat\logs\catalina.out" -Tail 50
   ```
2. Verificar estado:
   ```powershell
   .\status-tomcat.ps1
   ```
3. Reiniciar completamente:
   ```powershell
   .\restart-tomcat.ps1
   ```

### Problema: "Error de permisos al ejecutar scripts"

**Solución:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Problema: "El proyecto no se despliega correctamente"

**Verificaciones:**
1. Asegúrate de que existe `src\main\webapp\`
2. Verifica que `web.xml` esté en `WEB-INF\`
3. Comprueba permisos de escritura en `webapps\`
4. Revisar logs de Tomcat para errores específicos

---

## 🌐 URLs Importantes

### URLs Principales:

| URL | Descripción | Uso |
|-----|-------------|-----|
| `http://localhost:8080` | Página principal de Tomcat | Verificar que Tomcat funciona |
| `http://localhost:8080/ProyectoFinal` | Tu proyecto desplegado | Acceder a tu aplicación |
| `http://localhost:8080/manager` | Manager de aplicaciones | Gestionar aplicaciones web |
| `http://localhost:8080/host-manager` | Manager de hosts | Gestionar hosts virtuales |

### URLs de Desarrollo:

| URL | Archivo | Descripción |
|-----|---------|-------------|
| `http://localhost:8080/ProyectoFinal/` | `index.jsp` | Página principal |
| `http://localhost:8080/ProyectoFinal/css/styles.css` | `styles.css` | Estilos CSS |
| `http://localhost:8080/ProyectoFinal/js/script.js` | `script.js` | JavaScript |

---

## 🚨 Comandos de Emergencia

### Forzar Detención de Tomcat:
```powershell
# Encontrar y matar proceso de Tomcat
Get-Process -Name "java" | Where-Object { $_.CommandLine -like "*catalina*" } | Stop-Process -Force
```

### Limpiar Puertos Bloqueados:
```powershell
# Ver qué proceso usa el puerto 8080
netstat -ano | findstr :8080

# Matar proceso por PID (reemplaza XXXX con el PID real)
taskkill /PID XXXX /F
```

### Verificar Instalaciones:
```powershell
# Verificar Java
java -version

# Verificar variables de entorno
echo $env:JAVA_HOME
echo $env:CATALINA_HOME
```

### Acceso Rápido a Logs:
```powershell
# Ver últimas líneas del log de Tomcat
Get-Content "C:\apache-tomcat-*\logs\catalina.out" -Tail 20 -Wait
```

---

## 📝 Notas Importantes

### Buenas Prácticas:
- ✅ Siempre usar `.\stop-tomcat.ps1` antes de cerrar la computadora
- ✅ Verificar el estado con `.\status-tomcat.ps1` si hay problemas
- ✅ Usar nombres de proyecto descriptivos en `.\deploy-project.ps1`
- ✅ Mantener copias de seguridad de `web.xml` y configuraciones importantes

### Estructura de Archivos Requerida:
```
Proyecto/
├── src/
│   └── main/
│       └── webapp/
│           ├── index.jsp          # Requerido
│           ├── css/
│           ├── js/
│           └── WEB-INF/
│               └── web.xml        # Requerido
└── [scripts de tomcat]
```

### Variables de Entorno Importantes:
- `JAVA_HOME`: Ruta al JDK de Java
- `CATALINA_HOME`: Ruta de instalación de Tomcat
- `PATH`: Debe incluir `%JAVA_HOME%\bin`

---

## 🆘 Soporte y Contacto

Si encuentras problemas no cubiertos en esta guía:

1. **Revisar logs de Tomcat**: `logs\catalina.out`
2. **Ejecutar diagnóstico**: `.\status-tomcat.ps1`
3. **Consultar documentación oficial**: [Apache Tomcat Documentation](https://tomcat.apache.org/tomcat-9.0-doc/)

---

**Proyecto Final - Lenguajes de Computación IV**  
Universidad Autónoma de Aguascalientes  
*Creado con ❤️ para simplificar el desarrollo web con Java*
