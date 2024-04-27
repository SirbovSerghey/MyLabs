<?php 
	
	session_start();
	require_once 'connect.php';
	
	$login = $_POST['login'];
	$telefon = $_POST['telefon'];
	$password = md5($_POST['password']);
	$confirm_password = md5($_POST['confirm_password']);
	
	if ($password === $confirm_password) {
		mysqli_query($connect, "INSERT INTO `Parent` (`id_par`, `name`, `telefon`, `password`) VALUES (NULL, '$login', '$telefon', '$password')");
		$_SESSION['message'] = 'Регистрация прошла успешно';
		header('Location: ../index.php');
	}
	else {
		$_SESSION['message'] = 'Пароли не совпадают';
		header('Location: ../register.php');
	}
	
?>