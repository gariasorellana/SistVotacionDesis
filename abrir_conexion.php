<?php 
	// Parametros para la conexion a la base de datos utilizando PDO por seguridad
	$hostDB = 'localhost';
	$nombreDB = 'dbsistvotacion';
	$usuarioDB = 'usrSistVotacion';
	$contrasenyaDB = '2YZ*Szp]Er6JQ/!';
	$hostPDO = "mysql:host=$hostDB;dbname=$nombreDB;";

	// conectar a la base de datos
	try {
		$pdo = new PDO($hostPDO, $usuarioDB, $contrasenyaDB);
		$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$pdo->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES 'utf8mb4'");
		$pdo->query("SET NAMES 'utf8mb4'");
		$pdo->exec("SET NAMES 'utf8mb4'; SET lc_messages = 'es_ES'");
	} catch (PDOException $e) {
		error_log($e->getMessage(),0);
		die($e->getMessage());
	}
?>