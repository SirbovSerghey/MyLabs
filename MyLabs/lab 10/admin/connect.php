<?php 
	
	$connect = mysqli_connect('localhost', 'root', '', 'lab10');
	
	if (!$connect) {
		die('Error connect to DataBase!');
	}
	
?>