<?php 
	
	session_start();
	
	if (!isset($_SESSION['user'])) {
		header('Location: index.php');
	}
	
	require_once "admin/connect.php";
	
?>

<!doctype html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Главная страница</title>
		<link rel="stylesheet" href="css/main.css">
	</head>
	<body>
		
		<!-- Parent page -->
		<h2 align="center">Список событий</h2>
		<?php 
			
			$query = "SELECT e.id_ev, e.name AS event_name, d.address as address, d.telefon as telefon, dep.date as date, dep.hour as hour, e.mentor as mentor, e.nr_seats as available_seats, e.price as price FROM Event e INNER JOIN Dep_Date_Hour dep ON e.id_ev = dep.id_ev INNER JOIN Crafti_Department d ON dep.id_dep = d.id_dep";
			$result = mysqli_query($connect, $query);
			
			echo "<table border='1'>";
			echo "<tr><th>Название события</th><th>Адрес департамента</th><th>Телефон</th><th>Дата</th><th>Время</th><th>Ментор</th><th>Свободные места</th><th>Цена</th></tr>";
			while ($row = mysqli_fetch_assoc($result)) {
				echo "<tr>";
					echo "<td>" . $row['event_name'] . "</td>";
					echo "<td>" . $row['address'] . "</td>";
					echo "<td>" . $row['telefon'] . "</td>";
					echo "<td>" . $row['date'] . "</td>";
					echo "<td>" . $row['hour'] . "</td>";
					echo "<td>" . $row['mentor'] . "</td>";
					echo "<td>" . $row['available_seats'] . "</td>";
					echo "<td>" . $row['price'] . "</td>";
					echo "<td>";
					echo "<form class='registrate' action='admin/process_registration.php' method='post'>";
					echo "<input type='hidden' name='event_id' value='". $row['id_ev'] ."'>";
					echo "<input class='regButton' type='submit' value='Записать ребенка'>";
					echo "</form>";
					echo "</td>";
				echo "</tr>";
			}
			echo "</table>";
			echo "<br /><a href='admin/logout.php'>Выйти</a>"
		?>
		
	</body>
</html>