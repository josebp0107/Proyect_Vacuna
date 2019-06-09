<?php

    include("conexionMySQL.php");
    $identificacion = '';
    $nombres= '';
    $apellidos= '';
    $telefono= '';
    $correo= '';

    if  (isset($_GET['id'])) {
        $id = $_GET['id'];
        $query = "SELECT * FROM registroacudiente WHERE identificacionAcudiente = $id";
        $result = mysqli_query($connect, $query);
            if (mysqli_num_rows($result) == 1) {
                $row = mysqli_fetch_array($result);
                $identificacion = $row['identificacionAcudiente'];
                $nombres = $row['nombreEncargado'];
                $apellidos = $row['apellidoEncargado'];
                $telefono = $row['telefono'];
                $correo = $row['correo'];
            }
    }

    if (isset($_POST['actualizar'])) {

        $id = $_GET['id'];
        $identificacion = $_POST['identificacion'];
        $nombres = $_POST['nombres'];
        $apellidos = $_POST['apellidos'];
        $telefono = $_POST['telefono'];
        $correo = $_POST['correo'];
        $query = "UPDATE registroacudiente SET identificacionAcudiente = '$identificacion' ,nombreEncargado = '$nombres',apellidoEncargado = '$apellidos',telefono = '$telefono', correo = '$correo' WHERE identificacionAcudiente= '$id'";
        mysqli_query($connect, $query);
        //$_SESSION['message'] = 'Task Updated Successfully';
        //$_SESSION['message_type'] = 'warning';

        header("Location: formularioAcargo.php");
    }

?>
<?php include('includes/header.php'); ?>
<div class="container p-4">
  <div class="row">
    <div class="col-md-4 mx-auto">
      <div class="card card-body">
      <form action="formActualizarRegistroAcargo.php?id=<?php echo $_GET['id']; ?>" method="POST">
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
            <input name="telefono" type="text" class="form-control" value="<?php echo $telefono;?>" placeholder="Telefono">
        </div>
        <div class="form-group">
            <input name="correo" type="text" class="form-control" value="<?php echo $correo;?>" placeholder="Correo Electronico">
        </div>
        <button class="btn btn-success" name="actualizar">Actualizar</button>
      </form>
      </div>
    </div>
  </div>
</div>

<?php include('includes/footer.php'); ?>