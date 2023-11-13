# Sistema de Votación Desis
Interfaz que valida y guarda en una base de datos, la información ingresada en un formulario.

ENTREGA de Prueba de Diagnóstico Desis 

La entrega se encuentra en la URL pública de GitHub "https://github.com/gariasorellana/SistVotacionDesis", y está compuesta por:
- README.md (este archivo)
- abrir_conexion.php (archivo de código fuente)
- cerrar_conexion.php (archivo de código fuente)
- registro.php (archivo de código fuente)
- css/estilo.css (archivo de estilos)
- sql/dbsistvotacion.sql (archivo de sentencias sql para generar la base de datos)

Pasos para instalar el proyecto:

1) ingresar a XAMPP o equivalente, y realizar “Start” de Apache y MySQL.

2) Crear el directorio "SistVotacion" donde se publicará la interfaz, y copiar en el los archivos y directorio:
   - abrir_conexion.php 
   - cerrar_conexion.php 
   - registro.php 
   - css

3) En phpMyAdmin o equivalente, importar la base de datos desde el archivo "sql/dbsistvotacion.sql".

4) Ingresar a la url "http://localhost/SistVotacion/registro.php" para visualizará la interfaz del proyecto.

5) Una vez que en la interfaz se haya ingresado uno o más votos, es posible visualizarlos en phpMyAdmin o equivalente, realizando la consulta de base de datos "SELECT * FROM votos", que muestra el contenido de la tabla votos.

OBSERVACIONES:

En el archivo "abrir_conexion.php" se encuentran los parámetros de conexión a base de datos:
- hostDB = 'localhost';
- nombreDB = 'dbsistvotacion';
- usuarioDB = 'usrSistVotacion';
- contraseñaDB = '2YZ*Szp]Er6JQ/!';

La base de datos está compuesta por las siguientes tablas:
- Votos (sin datos, se crean en la interfaz)
- Candidatos (inventados)
- Regiones de Chile (obtenido de internet DPA)
- Comunas de Chile (obtenido de internet DPA)

Se incluyeron comentarios de implementación dentro del código

Se utilizan caracteres del servidor: UTF-8 Unicode (utf8mb4)

Las pruebas se realizaron en Google Chrome.

Tecnologías utilizadas:  
- PHP 8.2.4 (VS16 X86 64bit thread safe).
- PDO (PHP Data Objects).
- MySQL mysqlnd 8.2.4
- phpMyAdmin 5.2.1
- XAMPP Versión  8.2.4
- Apache/2.4.56 (Win64) OpenSSL/1.1.1t PHP/8.2.4
- HTML.
- CSS.
- JavaScript.
- VSCode 1.74.3

En caso de cualquier duda, consultar a Gladys Arias en 569 96462622, o gariasorellana@gmail.com, Atte.
