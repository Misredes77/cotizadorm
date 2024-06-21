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
         
    <script src="script.js"></script>
    <!-- JS Particles.js -->
    <script src="particles.min.js"></script>
    <script src="app.js"></script>
    <!-- JS FontAwesome -->
    <script src="https://kit.fontawesome.com/a2e8d0339c.js"></script>
 
    
    
    <title>Cotización</title>
    <link rel="stylesheet" href="estilo.css">
    <link rel="stylesheet" type="text/css" href="estilo.css">
  
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
    
   <div id="particles-js"></div>  
    <h1 class="text-center mt-5 mb-5 text-white">Cotizaciones</h1>

    <div class="container">
        <div class="card shadow">
            <div class="card-body">
                <form action="Guardar.jsp" method="POST">
                    <div class="row mb-3">
                        <div class="col">
                            <label style="color: black;"> Codigo a cotizar</label>
                            <input type="text" class="form-control mb-3" name="codigo" required>
                        </div>
                        <div class="col">
                            <label style="color: black;">Descripcion a cotizar</label>
                            <input type="text" class="form-control mb-3" name="descripcion" required>
                        </div>
                        <div class="col">
                            <label style="color: black;">Cantidad a cotizar</label>
                            <input type="number" class="form-control mb-3" name="cantidad" required>
                        </div>
                        <div class="col">
                            <label for="categoria" style="color: black;">Selecione Categoria</label>
                            <select name="categoria" id="categoria">
                            <option value="Computo">Computo</option>
                            <option value="Accesorios">Accesorios</option>
                            <option value="Licencias">Licencias</option>
                            <option value="Software">Software</option>
                            <option value="Mantenimientos">Mantenimientos</option>
                            <option value="Servidores">Servidores</option>
                            <option value="Servidores">Repuestos</option>
                            <option value="Servidores">Otros</option>
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
                            <th scope="col">Codigo a cotizar</th>
                            <th scope="col">Descripcion a cotizar</th>
                            <th scope="col">Cantidad a cotizar</th>
                            <th scope="col">Mejor Valoro</th>
                            <th scope="col">Mejor Proveedor</th>
                            <th scope="col">Codigo Cotizado</th>
                            <th scope="col">Desc. Cotizada</th>
                            <th scope="col">Cantidad Cotizaciones</th>
                            <th scope="col">Categoria</th>
                            <th scope="col">Proveedor1</th>
                            <th scope="col">Costo1</th>
                            <th scope="col">codigo1</th>
                            <th scope="col">Descripcion1</th>
                            <th scope="col">Tiempo Entrega1</th>
                            <th scope="col">Observaciones1</th>
                            <th scope="col">Proveedor2</th>
                            <th scope="col">Costo2</th>
                            <th scope="col">codigo2</th>
                            <th scope="col">Descripcion2</th>
                            <th scope="col">Tiempo Entrega2</th>
                            <th scope="col">Observaciones2</th>
                            <th scope="col">Proveedor3</th>
                            <th scope="col">Costo3</th>
                            <th scope="col">codigo3</th>
                            <th scope="col">Descripcion3</th>
                            <th scope="col">Tiempo Entrega3</th>
                            <th scope="col">Observaciones3</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                   
                        <%try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/bdcotizacion?user=root&password=");
                                st = con.createStatement();
                                rs = st.executeQuery("SELECT * FROM `cotizaciones`;");
                                while (rs.next()) {
                                    String rowid = rs.getString(1);
                                    String rowcodigo = rs.getString(2);
                                    String rowdescripcion = rs.getString(3);
                                    String rowcantidad = rs.getString(4);                                   
                                    String rowvlrunidad = rs.getString(6); 
                                    String rowproveedor = rs.getString(9);
                                    String rowcategoria = rs.getString(12);
                                    String rowcodigom = rs.getString(10);
                                    String rowdescripcionm = rs.getString(11);
                                    String rowcostom = rs.getString(28);
                                    String rowproveedor1 = rs.getString(19);
                                    String rowcosto1 = rs.getString(18);
                                    String rowcodigo1 = rs.getString(16);
                                    String rowdescripcion1 = rs.getString(17);
                                    String rowtiempo1 = rs.getString(29);
                                    String rowobserva1 = rs.getString(32);
                                    String rowproveedor2 = rs.getString(23);
                                    String rowcosto2 = rs.getString(22);
                                    String rowcodigo2 = rs.getString(20);
                                    String rowdescripcion2 = rs.getString(21);
                                    String rowtiempo2 = rs.getString(30);
                                    String rowobserva2 = rs.getString(33);
                                    String rowproveedor3 = rs.getString(27);
                                    String rowcosto3 = rs.getString(26);
                                    String rowcodigo3 = rs.getString(24);
                                    String rowdescripcion3 = rs.getString(25);
                                    String rowtiempo3 = rs.getString(31);
                                    String rowobserva3 = rs.getString(34);                             
                                    String rowestado = rs.getString(14);
                                    
                                                                  
                        %>
                        <tr>
                            <th scope="row"><%=rowid%></th>
                            <td><%=rowcodigo%></td>
                            <td><%=rowdescripcion%></td>
                             <td><%=rowcantidad%></td>
                             <td><%=rowvlrunidad%></td>
                             <td><%=rowproveedor%></td>
                              <td><%=rowcodigom%></td>
                              <td><%=rowdescripcionm%></td>
                              <td><%=rowestado%></td>
                              <td><%=rowcategoria%></td>
                              <td><%=rowproveedor1%></td>
                              <td><%=rowcosto1%></td>
                              <td><%=rowcodigo1%></td>
                              <td><%=rowdescripcion1%></td>
                              <td><%=rowtiempo1%></td>
                              <td><%=rowobserva1%></td>
                              <td><%=rowproveedor2%></td>
                              <td><%=rowcosto2%></td>
                              <td><%=rowcodigo2%></td>
                              <td><%=rowdescripcion2%></td>
                              <td><%=rowtiempo2%></td>
                              <td><%=rowobserva2%></td>
                              <td><%=rowproveedor3%></td>
                              <td><%=rowcosto3%></td>
                              <td><%=rowcodigo3%></td>
                              <td><%=rowdescripcion3%></td>
                              <td><%=rowtiempo3%></td>
                              <td><%=rowobserva3%></td>
                              
                              
                              
                             
                            <td>
                        <!--        <a href="#"  class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#modal_<%=rowid%>"><ion-icon name="create-outline"></ion-icon></a>
                        -->        
                                                       
                                <a href="Eliminar.jsp?id=<%=rowid%>"  class="btn btn-outline-danger" onclick="javascript:if(!confirm('¿Está seguro de eliminar este registro?')) return false"><ion-icon name="trash-outline"></ion-icon></a>
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
                                    <form action="Editar.jsp?codigo1=<%=rowcodigo1%>" method="post">
                                        <label>Codigo</label>
                                        <input type="text" class="form-control mb-3" id="codigo" name="codigo" value="<%=rowcodigo%>">
                                        <label>Descripcion</label>
                                        <input type="text" class="form-control mb-3" id="descripcion" name="descripcion" value="<%=rowdescripcion%>">
                                        <label>Cantidad a Cotizar</label>
                                        <input type="text" class="form-control mb-3" id="cantidad" name="cantidad" value="<%=rowcantidad%>">
                                        <label>Valor unitario cotizado</label>
                                        <input type="text" class="form-control mb-3" id="vlrcot" name="valrcot" value="0">
                                        <label>Proveedor</label>
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
                    

                    
                    
                    <%
                    
                        }
                        } catch (Exception e) {
                            out.print("Error conexión MySQL" + e);
                        }
                    %>
   
     <script src="script.js"></script>
    <!-- JS Particles.js -->
    <script src="particles.min.js"></script>
    <script src="app.js"></script>
    <!-- JS FontAwesome -->
    <script src="https://kit.fontawesome.com/a2e8d0339c.js"></script>
 
            
            
            
            </body>
                    </html>