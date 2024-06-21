<%-- 
    Document   : inicio1
    Created on : 8/06/2024, 4:59:27 p. m.
    Author     : comercial1
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Cotiza</title>
    <link rel="shortcut icon" href="favicon.png">
    <meta charset="utf-8">  <!-- Esto sirve para poner acentos, ceñas, etc. -->
    <meta name="keywords" content="Cotizaciones, Ordenes de compra">  <!-- Esto sirve para que cuando el navegador busque palabras relacionasdas con el metadatos(comida). -->
    <meta name="description" content="Ordes de compra">  <!-- Sirve para describir la pagina web. -->
    <meta name="author" content="Valenpo">  <!-- Sirve para indicar quien es el autor de la pagina -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@200;300;400&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,900&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/38275f1481.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="estilo.css">
</head>
<body>
    <div id="particles-js"></div>
    <center>
        <h1>                     Solicitud de cotizaciones</h1>
    </center>
   <div class="container mt-10">
            <div class="row">
                <div class="col-sm">
                    <center>
                      <div class="login">
                            <h1>Iniciar Sesion </h1><br>
                             
                    <form action="login.jsp" method="post" id="desktopLoginForm">
                       <label style="color: white; font-size: 36px;">Usuario</label><br>
                       <input type="text" class="form-control" id="usuario" style="font-size: 30px;"
                                   aria-describedby="emailHelp" required="required" name="usuario" placeholder="Ingresa tu usuario" ><br>
                      

                        <div class="mb-6">
                            <label for="password" class="form-label" rgb(8, 125, 8, 0.4) style="color: white; font-size: 36px;;">Password</label><br><br>
                            <input type="password" class="form-control" id="password" style="font-size: 30px;"
                                   aria-describedby="emailHelp" required="required" name="password" placeholder="Ingresa tu contraseña"><br>
                        </div>
                        <tr></tr>
                        <td></td>
                        <a href="url"></a>
                        <br>
                        <button type="submit" class="btn btn-primary" name="login" > Login <i class="fa fa-sign-in" aria-hidden="true"></i>
                        </button>
                    </form>
                        </center>       
                    
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
 
              <%-- 
    Conexiones a bases de datos y verificaion de logueo.   
    --%>
    
    
    <%
            Connection con = null;
            Statement st = null;//sirve para procesar una sentencia SQL estatica y obtener los resultados producidos por ella
            ResultSet rs = null;
            if (request.getParameter("login") != null) {
                String user = request.getParameter("usuario");
                String password = request.getParameter("password");
                HttpSession sesion = request.getSession();
            
            try {                    
                    Class.forName("com.mysql.jdbc.Driver");//para usar el codigo mysql
                    //DriverManager: Administrador de controladores
                    con = DriverManager.getConnection("jdbc:mysql://localhost/bdcotizacion?user=root&password=");
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT * FROM admin WHERE User='"+user+"' AND Password='"+password+"';");
                    //request.getRequestDispatcher("index.jsp").forward(request, response);//redireccionar a la pagina index
                    //response.sendRedirect();
                    while(rs.next()){
                    sesion.setAttribute("logueado", "1");
                    sesion.setAttribute("usuario", rs.getString("user"));
                    sesion.setAttribute("id", rs.getString("id"));
                    response.sendRedirect("Inicio.jsp");
                    }
                     out.print("<div class= \"alert alert-danger\" role=\"alert\">Usario Incorrecto</div>");
                } catch (Exception e) {
                    out.print("<div class= \"alert alert-danger\" role=\"alert\">error base de datos</div>");
                }
            }

            /*
            if (request.getParameter("login") != null) {
                String user = request.getParameter("usuario");
                String password = request.getParameter("password");
                HttpSession sesion = request.getSession();
                if (user.equals("admin") && password.equals("123")) {
                    sesion.setAttribute("logueado", "1");
                    sesion.setAttribute("usuario", user);
                    response.sendRedirect("index.jsp");
                } else {
                    out.print("te equivocaste en usuario o contraseña");                    
                }
            }*/
        %>
    
  <style>       
    body {
    background-color:#000;
    color: #000;
    font-size: 18px;
    font-family: 'Lato', sans-serif;
    font-weight: 300;
}

</style>
    
</body>
</html>
