<%-- 
    Document   : inicio
    Created on : 8/06/2024, 4:36:36 p. m.
    Author     : comercial1
--%>

<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
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
    <link rel="stylesheet" href="estilo.css"><!-- comment -->
    
    <title>COTIZA</title>
    
</head>
 <div id="particles-js"></div>
  <body class="background">
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
    <center>
    <h1 class="titulo" > COTIZACIONES   </h1>
    <h2 class="titulo"> B I E N V E N I D O </h2> 
    
    <div class="botones">
       
      
    <div class="btn-container">
        <a href="Cotizar.jsp">
                <br>
                <img src="cotiza.png" alt="Cotizar">
                </br>
                <br>
                <button id="tres" class="btn-outline-info" type="button"> Cotizar</button>
               </br> 
       </a>
        </div>
        <div class="btn-container">
            <a href="Responder.jsp">
                <br>
                <img src="responder.png" alt="Responder">
                </br>
            </br>
                <button id="dos" class="btn-outline-info" type="button">Responde</button>
        </br>
        </a>
        </div>
        <div class="btn-container">
            <a href="Crearusuario.jsp">
                <br>
                <img src="usuario.png" alt="Crear usuario">
               </br>
               </br>
                <button id="uno" class="btn-outline-info" type="button">Usuarios</button>
                </br>
            </a>
    </div>
    </center>
    
    <script src="script.js"></script>
    <!-- JS Particles.js -->
    <script src="particles.min.js"></script>
    <script src="app.js"></script>
    <!-- JS FontAwesome -->
    <script src="https://kit.fontawesome.com/a2e8d0339c.js"></script>
 
    
</body>
</html>