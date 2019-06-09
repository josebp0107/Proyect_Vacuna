<?php include("conexionMySQL.php")?>
<?php include("includes/header.php")?>

<div class="container">
    <div class="row">
        <div class="col-md-6" style="margin: 0 auto; margin-top: 30px;">
            
                <form action="guardarRegistro.php" method="POST" class="border p-4 form" >
                    <div class="form-group">
                        <input type="text" name="idNiño" class="form-control" placeholder="Identificacion del niño">
                    </div>
                    <div class="form-group">
                        <select name="vacunas" class="form-control">
                            <option value="0">Seleccione la vacuna</option>
                            <?php 
                                $query= "SELECT * FROM registrovacuna";
                                $cargarQuery = mysqli_query($connect, $query);
                                while ($valores = mysqli_fetch_array($cargarQuery)) {
                                echo '<option value="'.$valores[idVacunas].'">'.$valores[nombreVacuna].'</option>';
                                }
                            ?>
                        </select>
                    </div>

                    <div class="form-group">
                    <select name="numeroDeDosis" class="form-control">
                        <option value="0">Seleccione el numero de dosis</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                    </div>    
                    
                
                <input type="submit" value="Guardar" class="btn btn-primary" name="guardarDosis">
                </form>
            
        </div>
    </div>
</div>

<?php include("includes/footer.php")?>