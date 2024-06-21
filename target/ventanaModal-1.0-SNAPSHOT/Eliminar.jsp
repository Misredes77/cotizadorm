<%-- 
    Document   : index
    Created on : 11/09/2023, 9:05 p. m.
    Author     : Natalia Posso  - Hernan Valencia
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar</title>
    </head>
    <body>
        <%
            
            Connection con = null;//crea la conexion libreia para usar mysql
            Statement st = null;//permite usara sentencia sql para java
            
                try {
                    Class.forName("com.mysql.jdbc.Driver");//para usar el codigo mysql
                    //DriverManager: administrador de controladores
                    con = DriverManager.getConnection("jdbc:mysql://localhost/bdcotizacion?user=root&password=");
                    st = con.createStatement();
                    st.executeUpdate("DELETE FROM cotizaciones where id='"+request.getParameter("id")+"';");  
                    request.getRequestDispatcher("Cotizar.jsp").forward(request, response);//redireccionar
                    //response.sendRedirect("index.jsp");
                } catch (Exception e) {
                    out.print(e);
                }            
        %>
    </body>
</html>
