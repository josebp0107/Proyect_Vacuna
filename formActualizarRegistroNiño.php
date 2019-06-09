<?php

    include("conexionMySQL.php");
    $identificacion = '';
    $nombres= '';
    $apellidos= '';
    $fechaNacimiento= '';
    $idEncargado= '';

    if  (isset($_GET['id'])) {
        $id = $_GET['id'];
        $query = "SELECT * FROM datosninos WHERE identificacion = $id";
        $result = mysqli_query($connect, $query);
            if (mysqli_num_rows($result) == 1) {
                $row = mysqli_fetch_array($result);
                $identificacion = $row['identificacion'];
                $nombres = $row['nombres'];
                $apellidos = $row['apellidos'];
                $fechaNacimiento = $row['fechaNacimiento'];
                $idEncargado = $row['identificacionAcudiente'];
            }
    }

    if (isset($_POST['actualizar'])) {

        $id = $_GET['id'];
        $identificacion = $_POST['identificacion'];
        $nombres = $_POST['nombres'];
        $apellidos = $_POST['apellidos'];
        $fechaNacimiento = $_POST['fechaNacimiento'];
        $idEncargado = $_POST['idEncargado'];
        $query = "UPDATE datosninos SET identificacion = '$identificacion' ,nombres = '$nombres',apellidos = '$apellidos',fechaNacimiento = '$fechaNacimiento', identificacionAcudiente = '$idEncargado' WHERE identificacion= '$id'";
        mysqli_query($connect, $query);
        //$_SESSION['message'] = 'Task Updated Successfully';
        //$_SESSION['message_type'] = 'warning';

        header("Location: formularioNiño.php");
    }

?>
<?php include('includes/header.php'); ?>
<div class="container p-4">
  <div class="row">
    <div class="col-md-4 mx-auto">
      <div class="card card-body">
      <form action="formActualizarRegistroNiño.php?id=<?php echo $_GET['id']; ?>" method="POST">
        <div class="form-group">
          <input name="identificacion" type="text" class="form-control" value="<?php echo $identificacion; ?>" placeholder="Identificacion">
        </div>
        <div class="form-group">
            <input name="nombres" type="text" class="form-control" value="<?php echo $nombres;?>" placeholder="Nombres">
        </div>
        <div class="form-group">
            <input name="apellidos" type="text" class="form-control" value="<?php echo $apellidos;?>" placeholder="Apellidos">
        </div>
        <div class="form-group">
            <input name="fechaNacimiento" type="date" class="form-control" value="<?php echo $fechaNacimiento;?>" >
        </div>
        <div class="form-group">
            <input name="idEncargado" type="text" class="form-control" value="<?php echo $idEncargado;?>" placeholder="Identificacion del acudiente">
        </div>
        <button class="btn btn-success" name="actualizar">Actualizar</button>
      </form>
      </div>
    </div>
  </div>
</div>

<?php include('includes/footer.php'); ?>