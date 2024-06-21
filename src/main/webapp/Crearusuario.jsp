<%-- 
    Document   : index
    Created on : 11/09/2023, 9:05 p. m.
    Author     : Natalia Posso  - Hernan Valencia
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    
    <!-- JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="particles.min.js"></script>
     
    <!<!-- Iconos -->
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
     <link rel="stylesheet" type="text/css" href="estilo.css">
    <title>Cotización</title>
    
 

    
</head>

<body>
    
    <%-- 
    Verificacion que este correctamente logueado el usuario.   
    --%>
    
     <% 
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")){
                response.sendRedirect("login.jsp");
            }
            
    
        String id = request.getParameter("id");
        String usuario = request.getParameter("usuario");
        String nombre = request.getParameter("nombre");
        String password = request.getParameter("password");

        Connection con = null;//crea la conexion libreia para usar mysql
        Statement st = null;//permite usara sentencia sql para java
        ResultSet rs = null;//guardar variable todo lo que se encuentre en la base de datos en un arreglo

    %>

    <%-- 
    Formularios de ingreso de Informacion.   
    --%>
    
    
    <h1 class="text-center mt-5 mb-5 text-white">USUARIOS</h1>

    <div class="container">
        <div class="card shadow">
            <div class="card-body">
                <form action="Guardar1.jsp" method="POST">
                    <div class="row mb-3">
                        <div class="col">
                            <label style="color: black;"> Password </label>
                            <input type="password" class="form-control mb-3" name="password">
                        </div>
                        <div class="col">
                            <label style="color: black;">Razon social</label>
                            <input type="text" class="form-control mb-3" name="razon">
                        </div>
                        <div class="col">
                            <label style="color: black;">Nit</label>
                            <input type="text" class="form-control mb-3" name="nit">
                        </div>
                        <div class="col">
                            <label style="color: black;">Correo</label>
                            <input type="text" class="form-control mb-3" name="correo">
                        </div>
                          <div class="col">
                            <label for="categoria" style="color: black;">Tipo de usuario</label>
                            <select name="categoria" id="categoria">
                            <option value="cotizador" >Cotizador</option>
                            <option value="provee">Proveedor</option>
                            <option value="administrador">Administrador</option>
                            <!-- Agrega más opciones según tu caso -->
                            </select>
                          </div>
                        <div class="col">
                            <button class="btn btn-outline-primary mb-3 mt-4" name="guardar" type="submit"><ion-icon name="save-outline"></ion-icon></button>
                        </div>
                    </div>
                </form> <!--Tabla-->

                <div class="table-container">
                <table class="table table-bordered"  >
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">User</th>
                            <th scope="col">Tipo de Usuario</th>
                            <th scope="col">Correo</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                   
                        <%try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/bdcotizacion?user=root&password=");
                                st = con.createStatement();
                                rs = st.executeQuery("SELECT * FROM `admin`;");
                                while (rs.next()) {
                                    String rowid = rs.getString(1);
                                    String rowuser = rs.getString(2);
                                    String rowtipo = rs.getString(4);                                
                                    String rowcorreo = rs.getString(7);
                                    String rownit = rs.getString(5);
                                                                 
                        %>
                        <tr>
                            <th scope="row"><%=rowid%></th>
                             <td><%=rowuser%></td>
                             <td><%=rowtipo%></td>
                             <td><%=rowcorreo%></td>
                                                                               
                            <td>
                                <a href="#"  class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#modal_<%=rowid%>"><ion-icon name="logo-stackoverflow"></ion-icon></a>
                                
                                                       
                                <a href="Eliminar_1.jsp?id=<%=rowid%>"  class="btn btn-outline-danger" onclick="javascript:if(!confirm('¿Está seguro de eliminar este registro?')) return false"><ion-icon name="trash-outline"></ion-icon></a>
                            </td>
                        </tr>

                        
                    
                        <!-- Modal de edición específico para cada registro -->
                    
              
                   
                    <div class="modal fade" id="modal_<%=rowid%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Comprar Productos</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="Proveedor.jsp" method="post">
                                        <div class="mb-3">
                                        <label for="exampleInputPassword1"  class="form-label">Categorías</label>
                                        <br>
                                        <input type="checkbox" class="Computo" id="Computo" name="Computo" >
                                        <label for="">Computo</label>
                                        <input type="checkbox" id="Accesorios" name="Accesorios">
                                         <label for="">Accesorios</label>
                                         <input type="checkbox" id="Licencias" name="Licencias">
                                         <label for="">Licencias</label>
                                         <input type="checkbox" id="software" name="software">
                                         <label for="">Software</label>
                                         <br>
                                         <input type="checkbox" class="checkbox" id="Mantenimientos" name="Mantenimientos">
                                         <label for="">Mantenimientos</label>
                                        <input type="checkbox" id="Servidores" name="Servidores">
                                         <label for="">Servidores</label>
                                         <input type="checkbox" id="Respuestos" name="Repuestos">
                                         <label for="">Repuestos</label>
                                         <input type="checkbox" id="Otros" name="Otros">
                                         <label for="">Otros</label>
                                         <input type="hidden" class="form-control mb-3" id="nit" name="nit" value="<%=rownit%>">
                                         <input type="hidden" class="form-control mb-3" id="user" name="user" value="<%=rowuser%>">
                                         <input type="hidden" class="form-control mb-3" id="tipo" name="tipo" value="<%=rowtipo%>">
                                         <input type="hidden" class="form-control mb-3" id="correo" name="correo" value="<%=rowcorreo%>">
                                         
                                                                                
                                        <button type="submit" class="btn btn-outline-primary"><ion-icon name="save-outline"></ion-icon> Guardar</button>
                                        </div>
                                    </form>
                                     
                     

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                    
               
                    
                    
                    <%
                    
                        }
                        } catch (Exception e) {
                            out.print("Error conexión MySQL" + e);
                        }
                    %>
                    </body>
                    </html>