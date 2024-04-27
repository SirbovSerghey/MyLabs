<?php 
	session_start()
?>

<!doctype html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Авторизация</title>
		<link rel="stylesheet" href="css/main.css">
	</head>
	<body>
		
		<!-- SignIn form -->
		<div class="registration">
			<form action="admin/login.php" method="post">
				<label>Логин</label>
				<input type="text" name="login" placeholder="Login">
				<label>Пароль</label>
				<input type="password" name="password" placeholder="Password">
				<button type="submit">Войти</button>
				<p> 
					У вас нет аккаунта? - <a href="register.php">зарегистрируйтесь</a>!
				</p>
				<?php 
					if(isset($_SESSION['message'])) {
						echo '<p class="masg">'.$_SESSION['message'].'</p>';
					}
					unset($_SESSION['message']);
				?>
			</form>
		</div>
		
	</body>
</html>