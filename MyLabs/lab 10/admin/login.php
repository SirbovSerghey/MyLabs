<?php 
	
	session_start();
	
	if (!isset($_SESSION['user'])) {
		header('Location: ../index.php');
	}
	
	require_once "connect.php";
	
	$login = $_POST['login'];
	$password = md5($_POST['password']);
	
	$check_admin = mysqli_query($connect, "SELECT * from Manager WHERE login = '$login' AND password = '$password'");
	$check_user = mysqli_query($connect, "SELECT * FROM Parent WHERE name = '$login' AND password = '$password'");
	
	echo mysqli_num_rows($check_admin);
	echo mysqli_num_rows($check_user);
	
	if (mysqli_num_rows($check_admin) > 0){
		
		$user = mysqli_fetch_assoc($check_admin);
		$_SESSION['user'] = [
			"id" => $user['id_manager'],
			"name" => $user['name'],
		];
		
		header('Location: ../');
		
	}
	else if (mysqli_num_rows($check_user) > 0) {
		$user = mysqli_fetch_assoc($check_user);
		$_SESSION['user'] = [
			"id" => $user['id_par'],
			"name" => $user['login'],
		];
		
		header('Location: ../parentPage.php');
		
	}
	else {
		$_SESSION['message'] = 'Неверный логин или пароль!';
		header('Location: ../index.php');
	}
	
?>