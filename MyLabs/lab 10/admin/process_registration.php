<?php 
	
	session_start();
	
	if (!isset($_SESSION['user'])) {
		header('Location: ../index.php');
	}
	
	require_once "connect.php";

?>

<!doctype html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Авторизация</title>
		<link rel="stylesheet" href="../css/main.css">
	</head>
	<body>
	
		<div class="registration">
			<form action='process_registration.php' method='post'>
				<input type='hidden' name='event_id' value='<?php echo $row['id_ev']; ?>'>
				<label for="child_name">Имя ребенка:</label><br>
				<input type="text" id="child_name" name="child_name" required><br>
				<label for="child_birth">Дата рождения ребенка:</label><br>
				<input type="date" id="child_birth" name="child_birth" required><br>
				<input class='regButton' type='submit' value='Записать ребенка'>
			</form>
		</div>

	</body>
</html>

<?php
	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		$depDH_id = 1;
		$child_name = $_POST['child_name'];
		$child_birth = $_POST['child_birth'];
		
		$par_id = $_SESSION['user']['id'];
		
		$insert_child_query = "INSERT INTO Child (name, birth, id_par) VALUES ('$child_name', '$child_birth', '$par_id')";
		mysqli_query($connect, $insert_child_query);
		
		$child_id = mysqli_insert_id($connect); //get child id that was added above
		$birth = $_POST['child_birth'];
		$insert_registration_query = "INSERT INTO Registration (date, id_depDH, id_child) VALUES ('$child_birth', '$depDH_id', '$child_id')";
		mysqli_query($connect, $insert_registration_query);
		
		header('Location: ../parentPage.php');
	}
?>