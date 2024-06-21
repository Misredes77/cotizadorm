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

     <title style="color: black">Cotización</title>
</head>

<body>
   
   <div id="particles-js"></div>
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
    
    
    <h1 class="text-center mt-5 mb-5 text-white">Cotizaciones</h1>

    <div class="container">
        <div class="card shadow">
            <div class="card-body">
               <!-- <form action="Guardar.jsp" method="POST">
                    <div class="row mb-3">
                        <div class="col">
                            <label style="color: black;"> Codigo a cotizar</label>
                            <input type="text" class="form-control mb-3" name="codigo">
                        </div>
                        <div class="col">
                            <label style="color: black;">Descripcion a cotizar</label>
                            <input type="text" class="form-control mb-3" name="descripcion">
                        </div>
                        <div class="col">
                            <label style="color: black;">Cantidad a cotizar</label>
                            <input type="text" class="form-control mb-3" name="cantidad">
                        </div>
                        <div class="col">
                            <label for="categoria" style="color: black;">Selecione Categoria</label>
                            <select name="categoria" id="categoria">
                            <option value="Computo">Computo</option>
                            <option value="Accesorios">Accesorios</option>
                            <option value="Licencias">Licencias</option>
                            <option value="Sophos">Sophos</option>
                            <option value="Fortinet">Fortinet</option>
            
                            </select>
                          </div>
                        <div class="col">
                            <button class="btn btn-outline-primary mb-3 mt-4" name="guardar" type="submit"><ion-icon name="save-outline"></ion-icon></button>
                        </div>
                    </div>
                </form> <!--Tabla--> -->

                <div class="table-container">
                <table class="table table-bordered"  >
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Codigo a cotizar</th>
                            <th scope="col">Descripcion a cotizar</th>
                            <th scope="col">Cantidad a cotizar</th>
                            <th scope="col">Valor Cotizado</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                   
                        <%try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/bdcotizacion?user=root&password=");
                                st = con.createStatement();
                                rs = st.executeQuery("SELECT * FROM `cotizaciones` WHERE `estado` != 3 ;");
                                while (rs.next()) {
                                    String rowid = rs.getString(1);
                                    String rowcodigo = rs.getString(2);
                                    String rowdescripcion = rs.getString(3);
                                    String rowcantidad = rs.getString(4);                                   
                                    String rowvlrunidad = rs.getString(6); 
                                    String rowproveedor = rs.getString(9);
                                    String rowcategoria = rs.getString(12);
                                    String rowcodigo1 = rs.getString(16);
                                    String rowcodigo2 = rs.getString(20);
                                    String rowcodigom = rs.getString(10);
                                    String rowdescripcionm = rs.getString(11);
                                    String rowcostom = rs.getString(28);
                                    String rowestado = rs.getString(14);
                                    

                                
                     
                                                                  
                        %>
                        
                       
                        <tr>
                            <th scope="row"><%=rowid%></th>
                            <td><%=rowcodigo%></td>
                            <td><%=rowdescripcion%></td>
                             <td><%=rowcantidad%></td>
                             <td><%=rowvlrunidad%></td>
                             <td><%=rowcategoria%></td>
                              
                              
                             
                            <td>
                                <a href="#"  class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#modal_<%=rowid%>"><ion-icon name="create-outline"></ion-icon></a>
                                
                                                       
                    <!--            <a href="Eliminar.jsp?id=<%=rowid%>"  class="btn btn-outline-danger" onclick="javascript:if(!confirm('¿Está seguro de eliminar este registro?')) return false"><ion-icon name="trash-outline"></ion-icon></a> -->
                            </td>
                        </tr>

                        
                       
                                             <!-- Modal de edición específico para cada registro -->
                    
              
                   
                    <div class="modal fade" id="modal_<%=rowid%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Responder Cotizacion</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="Editar.jsp?codigo1=<%=rowcodigo1%>" method="post">
                                        <label>Codigo</label>
                                        <input type="text" class="form-control mb-3" id="codigo" name="codigo" value="<%=rowcodigo%>">
                                        <label>Descripcion</label>
                                        <input type="text" class="form-control mb-3" id="descripcion" name="descripcion" value="<%=rowdescripcion%>">
                                        <label>Cantidad a Cotizar</label>
                                        <input type="text" class="form-control mb-3" id="cantidad" name="cantidad" value="<%=rowcantidad%>">
                                        <label>Valor unitario cotizado</label>
                                        <input type="text" class="form-control mb-3" id="vlrcot" name="valrcot" value="0">
                                        <label>Timpo de Entrega en dias</label>
                                        <input type="text" class="form-control mb-3" id="tiempos" name="tiempos" value="1">
                                        <label>Observaciones</label>
                                        <input type="text" class="form-control mb-3" id="observacion" name="observacion" value="Observaciones: ">
                                        <label>Proveedor</label>
                                        <label>Upload File</label>
                                        <input type="file" class="form-control mb-3" id="fileUpload" name="fileUpload" accept="*/*">
                                        <input type="text" class="form-control mb-3" id="proveedor" name="proveedor" value=usuario>
                                        <input type="hidden" class="form-control mb-3" id="codigo1" name="codigo1" value="<%=rowcodigo1%>">
                                        <input type="hidden" class="form-control mb-3" id="codigo2" name="codigo2" value="<%=rowcodigo2%>">
                                        <input type="hidden" name="costom" value="<%=rowcostom%>"> 
                                        <input type="hidden" name="id" value="<%=rowid%>">
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-outline-primary"><ion-icon name="save-outline"></ion-icon> Guardar</button>
                                        </div>
                                    </form>
                                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                                      
    <script src="script.js"></script>
    <!-- JS Particles.js -->
    <script src="particles.min.js"></script>
    <script src="app.js"></script>
    <!-- JS FontAwesome -->
    <script src="https://kit.fontawesome.com/a2e8d0339c.js"></script>
                    

                    
                    
                    <%
                    
                        }
                        } catch (Exception e) {
                            out.print("Error conexión MySQL" + e);
                        }
                    %>
                    </body>
                    </html>