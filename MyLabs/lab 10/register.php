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
			<form action="admin/SignUp.php" method="post">
				<label>Логин</label>
				<input type="text" name="login" placeholder="Login">
				<label>Телефон</label>
				<input type="text" name="telefon" placeholder="Phone">
				<label>Пароль</label>
				<input type="password" name="password" placeholder="Password">
				<label>Подтвердите пароль</label>
				<input type="password" name="confirm_password" placeholder="Password">
				<button type="submit">Зарегистрироваться</button>
				<p> 
					У вас уже есть аккаунт? - <a href="index.php">войдите</a>!
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