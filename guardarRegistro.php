<?php
include("conexionMySQL.php");

if (isset($_POST['guardar'])) {
    $identificacion = $_POST['identificacion'];
    $nombres = $_POST['nombres'];
    $apellidos = $_POST['apellidos'];
    $telefono = $_POST['telefono'];
    $correo = $_POST['correo'];

    $query = "INSERT INTO registroacudiente(identificacionAcudiente,nombreEncargado,apellidoEncargado,telefono,correo)
              VALUES('$identificacion','$nombres','$apellidos','$telefono','$correo')";
    $result = mysqli_query($connect, $query);

    if (!$result) {
        die("Error al insertar el registro");
    }

    $_SESSION['message'] = 'El registro se ha guardado exitosamente!';
    $_SESSION['message_type'] = 'success';
    
    header("Location: formularioAcargo.php");
}

if (isset($_POST['guardarNiño'])) {
    $identificacion = $_POST['identificacion'];
    $nombres = $_POST['nombres'];
    $apellidos = $_POST['apellidos'];
    $fechaNacimiento = $_POST['fechaNacimiento'];
    $idEncargado = $_POST['idEncargado'];

    $queryNiño = "INSERT INTO datosninos(identificacion,nombres,apellidos,fechaNacimiento,identificacionAcudiente) VALUES('$identificacion','$nombres','$apellidos','$fechaNacimiento','$idEncargado')";
    $resultNiño = mysqli_query($connect, $queryNiño);

    if (!$resultNiño) {
        die("Error al insertar el registro");
    }

    $_SESSION['message'] = 'El registro se ha guardado exitosamente!';
    $_SESSION['message_type'] = 'success';
    
    header("Location: formularioNiño.php");
}

if(isset($_POST['guardarDosis'])){
    $idNiño= $_POST['idNiño'];
    $idDosis = $_POST['vacunas'];
    $numeroDosis = $_POST['numeroDeDosis'];
   
    $queryDosis = "INSERT INTO registrodosis(idNino,idVacuna,dosis) VALUES('$idNiño','$idDosis','$numeroDosis')";
    $resultDosis = mysqli_query($connect, $queryDosis);

    if(!$resultDosis){
        die("Error al insertar el registro");
    }

    header("Location: formRegistroDosis.php");
}


?>