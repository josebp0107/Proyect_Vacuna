<?php

include("conexionMySQL.php");

    if(isset($_GET['id'])) {
    $id = $_GET['id'];
    $query = "DELETE FROM registroacudiente WHERE identificacionAcudiente = $id";
    $result = mysqli_query($connect, $query);
    if(!$result) {
        die("Query Failed.");
    }
    $_SESSION['message'] = 'Registro eliminado satisfactoriamente!';
    $_SESSION['message_type'] = 'danger';

    header('Location: formularioAcargo.php');
    }
    

    if(isset($_GET['id'])) {
        $id = $_GET['id'];
        $queryNiño = "DELETE FROM datosninos WHERE identificacion = $id";
        $resultNiño = mysqli_query($connect, $queryNiño);
        if(!$resultNiño) {
            die("Query Failed.");
        }
        $_SESSION['message'] = 'Registro eliminado satisfactoriamente!';
        $_SESSION['message_type'] = 'danger';
    
        header('Location: formularioNiño.php');
        }
?>