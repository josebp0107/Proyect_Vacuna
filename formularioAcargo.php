<?php include("conexionMySQL.php")?>
<?php include("includes/header.php")?>

<div class="container p-4">
    <div class="row">

        <div class="col-md-4">

            <?php if(isset($_SESSION['message'])) { ?>
                <div class="alert alert-<?= $_SESSION['message_type']?> alert-dismissible fade show" role="alert">
                    <?= $_SESSION['message']?>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
        <?php session_unset(); } ?>

            <div class="card card-body">
                <form action="guardarRegistro.php" method="POST">
                    <div class="form-group">
                        <input type="text" name="identificacion" class="form-control" placeholder="Identificacion" autofocus>
                    </div>
                    <div class="form-group">    
                        <input type="text" name="nombres" class="form-control" placeholder="Nombres">
                    </div>
                    <div class="form-group">    
                        <input type="text" name="apellidos" class="form-control" placeholder="Apellidos">
                    </div>
                    <div class="form-group">    
                        <input type="text" name="telefono" class="form-control" placeholder="Telefono">
                    </div>
                    <div class="form-group">    
                        <input type="text" name="correo" class="form-control" placeholder="Correo Electronico">
                    </div>
                    <input type="submit" class="btn btn-success" name="guardar" value="Guardar">
                </form>

            </div>



        </div>

        <div class="col-md-8">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Identificacion</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Telefono</th>
                            <th>Correo Electronico</th>
                            <th>Accion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                            $consulta = "SELECT * FROM registroacudiente";
                            $consultaAcargos = mysqli_query($connect, $consulta);
                            while ($row = mysqli_fetch_array($consultaAcargos)) { ?>
                                <tr>
                                    <td><?php echo $row['identificacionAcudiente'] ?></td>
                                    <td><?php echo $row['nombreEncargado'] ?></td>
                                    <td><?php echo $row['apellidoEncargado'] ?></td>
                                    <td><?php echo $row['telefono'] ?></td>
                                    <td><?php echo $row['correo'] ?></td>
                                    <td>
                                        <a class="btn btn-success" href="formActualizarRegistroAcargo.php?id=<?php echo $row['identificacionAcudiente']?>">
                                        <i class="fas fa-marker"> </i>
                                    </a>
                                        <a class="btn btn-danger" href="eliminarRegistro.php?id=<?php echo $row['identificacionAcudiente']?>">
                                        <i class="far fa-trash-alt"> </i>
                                    </a>
                                    </td>
                                </tr>
                            <?php } ?>
                    </tbody>

                </table>

        </div>

    </div>
</div>  
<?php include("includes/footer.php")?>