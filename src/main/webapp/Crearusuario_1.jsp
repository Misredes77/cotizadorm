<%-- 
    Document   : Crearusuario
    Created on : 11/06/2024, 10:59:49 p. m.
    Author     : comercial1
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/jpg" href="favicon.png"/>    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="estilo.css">
    <title>Cotización</title>
</head>
<body class="background">
    <div class="form">
        <form>
            <div class="mb-3">
                <label for="exampleInputPassword1"  class="form-label">Nombre</label>
                <input type="text" class="form-control" id="">
            </div>            
            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Nit</label>
                <input type="number" class="form-control" id="">
            </div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Email</label>
                <input type="email" class="form-control" id="" aria-describedby="emailHelp">
            </div>
            <div class="mb-3">
                <label for="exampleInputPassword1"  class="form-label">Categorías</label>
                <br>
                <input type="checkbox" class="checkbox">
                <label for="">Categoría 1</label>
                <input type="checkbox">
                <label for="">Categoría 2</label>
                <input type="checkbox">
                <label for="">Categoría 3</label>
                <input type="checkbox">
                <label for="">Categoría 4</label>
                <br>
            </div>
            <div>
            <right>
                <select id="">
                    <option id="categ" value="" style="color: white">Seleccione una categoría</option>
                    <option value="">Administrador</option>
                    <option value="">Cotizador</option>
                    <option value="">Proveedor</option>
                </select>                
                </right>      
            </div>
                <br>            
            <button id="btn" class="btn btn-outline-info" type="submit">Guardar</button>
          </form>
    </div>

    <style>
      
        .form{
            margin-right: 40%;
            margin-top: 10%;
            margin-left:  20%;
            outline: none;
        }

        .mb-3{
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            color: rgb(70, 157, 195);
            font-weight: bold;  
            font-size: 20px;
            border-color:  rgb(70, 157, 195);
            border-radius: 5cap;
        }

        .form-control:focus{
            outline: 3px solid rgb(70, 157, 195);;
        }       
        
        .btn-outline-info{            
            font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
            color: rgb(70, 157, 195);
            font-weight: bold;            
            border: none;
            font-size: 25px;
          }
        
        .btn-outline-info:hover{
            background-color: rgb(70, 157, 195);
            color: white;
        } 

        #btn:active{
            background-color:white;
            color: rgb(70, 157, 195);
        }

    </style>    
</body>
</html>











