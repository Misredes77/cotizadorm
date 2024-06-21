<%-- 
    Document   : index
    Created on : 11/09/2023, 9:05 p. m.
    Author     : Hernan Valencia - Natalia Posso
--%>


<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
     <%-- 
    html formulario para pedir usuario y contraseña   
    --%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
              crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"
              integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
              crossorigin="anonymous">
        <title>login</title>
    </head>
    <body>

        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="login.jsp" method="post">
                        <div class="mb-3">
                            <label for="usuario" class="form-label">Usuario</label>
                            <input type="text" class="form-control" id="usuario" "
                                   aria-describedby="emailHelp" required="required" name="usuario" placeholder="Ingresa tu usuario">
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" 
                                   aria-describedby="emailHelp" required="required" name="password" placeholder="Ingresa tu contraseña">
                        </div>
                        <a href="url"></a>
                        <button type="submit" class="btn btn-primary" name="login">Login <i class="fa fa-sign-in" aria-hidden="true"></i>
                        </button>

                    </form>
                </div>
            </div>
        </div>
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
                    con = DriverManager.getConnection("jdbc:mysql://localhost/bdusuarios?user=root&password=");
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT * FROM admin WHERE User='"+user+"' AND Password='"+password+"';");
                    //request.getRequestDispatcher("index.jsp").forward(request, response);//redireccionar a la pagina index
                    //response.sendRedirect();
                    while(rs.next()){
                    sesion.setAttribute("logueado", "1");
                    sesion.setAttribute("usuario", rs.getString("user"));
                    sesion.setAttribute("id", rs.getString("id"));
                    response.sendRedirect("index.jsp");
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
    </body>
</html>