<?php
  // se abre la conexion a la base de datos
  include("abrir_conexion.php");

  // se buscarán las regiones y comunas que se encuentran relacionadas en la base de datos
  // y se creará una relación entre los combos de Región y Comuna
  $sql = 'SELECT reg.ordenRegion AS ordRegion, reg.nombreRegion AS nombreRegion, com.codComuna AS codComuna, com.nombreComuna AS nombreComuna FROM Regiones reg INNER JOIN Comunas com ON com.codRegion = reg.codRegion ORDER BY reg.nombreRegion, com.nombreComuna';

  try {
      $data = $pdo->query($sql)->fetchAll(PDO::FETCH_ASSOC);
  } catch (PDOException $e) {
      include("cerrar_conexion.php");
      error_log($e->getMessage(),0);
      die($e->getMessage());
  }

  $nombreRegiones = array_unique(array_column($data, 'nombreRegion'));
  $ordRegiones = array_unique(array_column($data, 'ordRegion'));

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Votación</title>
    <link rel="stylesheet" href="css/estilo.css">

    <script type="text/javascript">

      // Valida el rut con su cadena completa "XXXXXXXX-X"
      var Fn = {
          validaRut : function (rutCompleto) {
              rutCompleto = rutCompleto.replace("‐","-");
              rutCompleto = rutCompleto.replaceAll(".","");
              if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test( rutCompleto ))
                  return false;
              var tmp   = rutCompleto.split('-');
              var digv  = tmp[1]; 
              var rut   = tmp[0];
              if ( digv == 'K' ) digv = 'k' ;
                  return (Fn.dv(rut) == digv );
          },
          dv : function(T){
              var M=0,S=1;
              for(;T;T=Math.floor(T/10))
                  S=(S+T%10*(9-M++%6))%11;
              return S?S-1:'k';
          }
      }
      // Se valida que Alias contenga solo letras y números.
      function validaAlias(event){
        if (((event.charCode>=48 && event.charCode<=57) || (event.charCode>=65 && event.charCode<=90)  || (event.charCode>=97 && event.charCode<=122) ))
          return true;
        else
          return false;
      } 

      // esta funcion modifica el RUT ingresado para que se muestre con puntos y guion
      function formatRUT(RUT) {
        RUT.value=RUT.value.replace(/[.-]/g, '').replace( /^(\d{1,2})(\d{3})(\d{3})(\w{1})$/, '$1.$2.$3-$4')
      }

      function validaRut(event){
        if ( (event.charCode>=48 && event.charCode<=57) || (event.charCode==75 || event.charCode==107 || event.charCode==45 || event.charCode==46) )
          return true;
        else
          return false; 
      }

      function validaForm(event) {

         // Se valida que Nombre y Apellido no queden en Blanco
        if (document.formVoto.NombreYApellido.value.trim().length==0) {
          alert('Nombre y Apellido es requerido');
          return false;
        }

        if ((document.formVoto.Alias.value.trim().length<6)) {
          alert('Alias es requerido, y debe contener al menos 6 digitos o letras');
          return false;
        }

        // Uso de la función
        if ((Fn.validaRut( document.formVoto.RUT.value ))==false){
          alert('RUT es requerido, y debe tener formato de Rut Chileno valido');
          return false;
        }

        if (document.formVoto.email.value.trim().length!=0) {
            emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
            if (!emailRegex.test(document.formVoto.email.value)) {
              alert('El formato del email es inválido');
              return false;
            }
        }

        var select = document.getElementById("Region"); 
        var selectedOption = select.options[select.selectedIndex]; 
        if(selectedOption.value==-1) 
        {
            alert('Región es requerido');
            return false;
        }

        var select = document.getElementById("Comuna"); 
        var selectedOption = select.options[select.selectedIndex]; 
        if(selectedOption.value==-1) 
        {
            alert('Comuna es requerido');
            return false;
        }

        // Se verifica que se elijan al menos dos opciones en el Checkbox “Como se enteró de Nosotros”
        $cuenta = 0;
        document.querySelectorAll(`input[id="chk"]`).forEach(element => {
            if(element.checked) {
              $cuenta = $cuenta+1;
            }
        });

        if($cuenta<2) {
          alert("Seleccione al menos dos opciones en Cómo se enteró de Nosotros");
          return false;
        } 

        document.formVoto.submit();
        return true;
      }

    </script>
</head>

<body>
  <div class="static">
    <div>
      <h2>FORMULARIO DE VOTACIÓN:</h2>
    </div>
    <table>
      <form method="POST" action="registro.php" name="formVoto" id="formVoto"> 
      <tr>
        <div>
          <td><label for="NombreYApellido" class=texto >Nombre y Apellido (*)</label></td>
          <td><input type="text" name="NombreYApellido" id="NombreYApellido" class=input required></td>
        </div>
      </tr>
      <tr>
        <div>
          <td><label for="Alias" class=texto>Alias (*)</label></td>
          <td><input type="text" name="Alias" id="Alias" class=input minlength="6" pattern="[a-zA-Z0-9]+" onkeypress='return validaAlias(event)' placeholder="6+ digitos y letras" required></td>
          <!-- Se valida que Alias tenga una cantidad de caracteres mayor a 5
                y con la función 'ValidaAlias' se verifica que contenga sólo letras y números -->
        </div>
      </tr>
      <tr>
        <div>
          <td><label for="RUT" class=texto>RUT (*)</label></td>
          <td><input type="text" name="RUT" id="RUT" class="input" maxlength="12" onkeyup="formatRUT(this)" onkeypress='return validaRut(event)' placeholder="Ej:12.345.678-K" required></td>
              <!--Por ser RUT chileno se restringue que no tenga mas de 12 caracteres de largo, incluidos los puntos y guión
                  y se verifica que cumpla el Formato de Chile-->
        </div>
      </tr>
      <tr>
        <div>
          <td><label for="email" class=texto>Email </label></td>
          <td><input type="email" name="email" id="email" class=input></td>
        </div>
      </tr>
      <tr>
        <div>
          <td><label for="Region" class=texto>Región (*)</label></td>
          <td>
              <!-- Se define el combo de regiones como un campo requerido para que no quede en blanco
                  y en el momento de seleccionar una nueva region, a travez de la funcion 'cambia' 
                  se desplegarán sus comunas asociadas en el combo comunas-->
              <select name="Region" id="Region" class=input onchange="cambia()" required>
                <option value="-1"></option>
                <?php
                foreach ($nombreRegiones as $k => $nombreRegion) {?>
                    <option value="<?php echo $ordRegiones[$k]; ?>"><?php echo $nombreRegion; ?></option><?php
                }?>
            </select>
          </td>
        </div>
      </tr>
      <tr>
        <div>
          <td><label for="Comuna" class=texto>Comuna (*)</label></td>
          <td><select name="Comuna" id="Comuna" class=input required></select></td>
        </div>
      </tr>
      <tr>
        <div>
          <td><label for="Candidato" class=texto>Candidato </label></td>
          <td>
            <select name="Candidato" id="Candidato" class=input >
            <option value="-1"></option>
            <?php

              // se buscarán los candidatos en la base de datos
              try {
                  $sql = $pdo->prepare('SELECT idCandidato, nombreCandidato FROM Candidatos;');
                  $sql->execute();
                  $dato = $sql->fetchAll();
                  foreach ($dato as $registro) { ?>
                      <option value="<?php echo $registro['idCandidato']; ?>"><?php echo $registro['nombreCandidato']; ?></option><?php
                  }
                  // cerrar conexión de base de datos
                  include("cerrar_conexion.php");
              } catch (PDOException $e) {
                  if ($e->getCode()== 2300) {
                      // Violación de restricciones de integridad por RUT duplicado
                      echo "<script>alert(Ingreso duplicado, ya registro su voto con anterioridad);</script>";
                  } else {
                      error_log($e->getMessage(),0);
                      die($e->getMessage() );
                  }
              }
            ?>
            </select>
          </td>
        </div>
      </tr>
      <tr>
        <div>
          <td><label for="chk" class=texto>Como se enteró de Nosotros (*)</label></td>
          <td>
            <input type="checkbox" name="chk[]" id="chk" value="Web">Web
            <input type="checkbox" name="chk[]" id="chk" value="TV">TV
            <input type="checkbox" name="chk[]" id="chk" value="Redes">Redes Sociales
            <input type="checkbox" name="chk[]" id="chk" value="Amigo">Amigo
          </td>
        </div>
      </tr>
      <tr>
        <div>
          <td><input type="button" value="Votar" name="btn_Votar" id="btn_Votar" class=botonVotar onclick="return validaForm(event)"></td>
          <td></td>
        </div>
      </tr>
      </form>   
    </table>
    <?php
      
      $NombreYApellido ="";
      $Alias ="";
      $RUT ="";
      $email ="";
      $ordRegion ="";
      $codComuna ="";
      $idCandidato ="";
      $chkWeb =0;
      $chkTV =0;
      $chkRedes =0;
      $chkAmigo =0;
      
      // se presiono el boton votar que es de tipo submit
      if (!empty($_POST))
      {      
        $errors = [];
        // Se valida que Nombre y Apellido no queden en Blanco
        if (empty($_POST['NombreYApellido'])) {
          $errors[] = "El campo Nombre y Apellido es requerido";
        }

        // Se valida que el Email ingresado corresponda a un formato valido con (FILTER_VALIDATE_EMAIL
        if (!empty($_POST['email'])) {
            if (!filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
              $errors[] = "El formato del email es inválido";
            }
        }

        // Se verifica que se elijan al menos dos opciones en el Checkbox “Como se enteró de Nosotros”
        $cuenta = 0;
      
        if (isset($_POST['chk'][0])){
          $chk = $_POST['chk'][0];
          $cuenta = $cuenta+1; 
          switch ($chk) {
            case "Web":   $chkWeb = 1; break;
            case "TV":    $chkTV = 1; break;
            case "Redes": $chkRedes = 1; break;
            case "Amigo": $chkAmigo = 1; 
          }
        } 

        if (isset($_POST['chk'][1])){
          $chk = $_POST['chk'][1];
          $cuenta = $cuenta+1; 
          switch ($chk) {
            case "Web":   $chkWeb = 1; break;
            case "TV":    $chkTV = 1; break;
            case "Redes": $chkRedes = 1; break;
            case "Amigo": $chkAmigo = 1; 
          }
        } 

        if (isset($_POST['chk'][2])){
          $chk = $_POST['chk'][2];
          $cuenta = $cuenta+1; 
          switch ($chk) {
            case "Web":   $chkWeb = 1; break;
            case "TV":    $chkTV = 1; break;
            case "Redes": $chkRedes = 1; break;
            case "Amigo": $chkAmigo = 1; 
          }
        } 
        
        if (isset($_POST['chk'][3])){
          $chk = $_POST['chk'][3];
          $cuenta = $cuenta+1; 
          switch ($chk) {
            case "Web":   $chkWeb = 1; break;
            case "TV":    $chkTV = 1; break;
            case "Redes": $chkRedes = 1; break;
            case "Amigo": $chkAmigo = 1; 
          }
        } 

        if($cuenta<2) {
          $errors[] = "Seleccione al menos dos opciones en Cómo se enteró de Nosotros";
        } 

        // Se debe validar la duplicación de votos por RUT.

        if (empty($errors)) {
          // Si no hay errores, se grabará el voto en la base de datos
          $NombreYApellido = $_POST['NombreYApellido'];
          $Alias = $_POST['Alias'];
          $RUT = $_POST['RUT'];
          $email = $_POST['email'];
          
          if(!($_POST['Candidato']==-1)) {
            $idCandidato = $_POST['Candidato'];
          }

          if(!($_POST['Region']==-1)) {
            $ordRegion = $_POST['Region'];
          }

          if(!($_POST['Comuna']==-1))
            $codComuna = $_POST['Comuna'];

          include("abrir_conexion.php");

          // grabar el voto en la base de datos
          try {
            $sql = $pdo->prepare('INSERT INTO votos(NombreYApellido,Alias,RUT,email,ordRegion,codComuna,idCandidato,seEnteroEnWeb,seEnteroEnTV,seEnteroEnRedes,seEnteroEnAmigo) VALUES (trim(:NombreYApellido),trim(:Alias),trim(:RUT),trim(:email),trim(:ordRegion),trim(:codComuna),trim(:idCandidato),:chkWeb,:chkTV,:chkRedes,:chkAmigo)');
            $sql->execute(
              array(
                'NombreYApellido'  => $NombreYApellido,
                'Alias'            => $Alias,
                'RUT'              => $RUT,
                'email'            => $email,
                'ordRegion'        => $ordRegion,
                'codComuna'        => $codComuna,
                'idCandidato'      => $idCandidato,
                'chkWeb'           => $chkWeb,
                'chkTV'            => $chkTV,
                'chkRedes'         => $chkRedes,
                'chkAmigo'         => $chkAmigo
              )
            );
            echo '<script type="application/javascript">alert("Su voto se ha ingresado correctamente, gracias por su participación");</script>';

          } catch (PDOException $e) {
            if (($e->getCode())== 23000) {
                // Violación de restricciones de integridad por RUT duplicado
                echo '<script type="application/javascript">alert("Ingreso duplicado, ya registro su voto con anterioridad");</script>';
            } else {
                error_log($e->getMessage(),0);
                die($e->getMessage());
            }
          }
          include("cerrar_conexion.php");

        } else {
          // Si hay errores se muestran
          echo '<script type="application/javascript">alert("';
          foreach ($errors as $error) {
            echo $error;
          }
          echo '")</script>';
        }
      }
    ?>
  </div>
</body>
<script type="application/javascript">

    // esta funcion se activa cada vez que se realiza una seleccion en la combobox de Regiones
    function cambia() {
  
        // se crea el array comunas que tendra la asociacion de Regiones y Communas
        // por ejemplo: Comunas[1] = [ { id: 15101, name: "Arica" }, { id: 15102, name: "Camarones" }, { id: 15202, name: "General Lagos" }, { id: 15201, name: "Putre" } ];
        // en el subindice de Comunas se indica un orden numerico que tiene en su tabla de la base de datos la Region asociada a las comunas contenidas
        const Comunas = Array();
        <?php
            foreach($ordRegiones as $ordRegion) {
                $Comunas = array_values(array_filter($data, function($row) use ($ordRegion) {
                    return $row['ordRegion'] === $ordRegion;
                } ));?>
                Comunas[<?php echo $ordRegion;?>] = [ <?php
                for ($i = 0; $i < count($Comunas) - 1; $i++ ) {
                    ?>{ id: <?php echo $Comunas[$i]['codComuna']; ?>, name: "<?php echo $Comunas[$i]['nombreComuna']; ?>" }, <?php
                }
                ?>{ id: <?php echo $Comunas[$i]['codComuna']; ?>, name: "<?php echo $Comunas[$i]['nombreComuna']; ?>" } ];<?php
            }?>

            let ownComunas = Comunas[document.getElementById('Region').value];
          
            let ComunaDropdown = document.getElementById('Comuna');
            ComunaDropdown.innerText = null;

            // se crearan los elementos de la combobox Comunas, asociadas a la Region actualmente seleccionada en la combobox de Regiones
            var option = document.createElement('option');     
            option.text = "";
            option.value = -1;
            ComunaDropdown.appendChild(option);
          
            ownComunas.forEach( function(c) {
                var option = document.createElement('option');     
                option.text = c.name;
                option.value = c.id;
                ComunaDropdown.appendChild(option);
            } )
    }
</script>
</html>