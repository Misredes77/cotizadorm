<%-- 
    Document   : index
    Created on : 11/09/2023, 9:05 p. m.
    Author     : Natalia Posso - Hernan Valencia
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>





<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guardar</title>
    </head>
    <body>
        
         <% 
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")){
                response.sendRedirect("login.jsp");
            }
            
    
        String usuario = request.getParameter("usuario");
        String nombre = request.getParameter("nombre");
        String password = request.getParameter("password");

        
    %>
        
        
        
        
        
        <%  
                if (request.getParameter("guardar") != null){
                String id = request.getParameter("id");
                String codigo = request.getParameter("codigo");
                String descripcion = request.getParameter("descripcion");
                String cantidad = request.getParameter("cantidad");
                String vlrunidad = request.getParameter("vlrunidad");
                String categoria = request.getParameter("categoria");
                Float can =  Float.parseFloat(cantidad);
                
                
                  
                                
                try {
                Connection con = null;
                Statement st = null;
                
                Class.forName("com.mysql.jdbc.Driver");//para usar el codigo mysql
                //administrador de controladores
                con = DriverManager.getConnection("jdbc:mysql://localhost/bdcotizacion?user=root&password=");
                st = con.createStatement();
                st.executeUpdate("INSERT INTO cotizaciones (codigo, descripcion, cantidad, categoria, codigo1, costom, estado) values ('" + codigo + "', '" + descripcion + "', '" + can + "', '" + categoria + "', '" + "1" + "', '" + 0 + "', '" + 0 + "');");
          //      st.executeUpdate("INSERT INTO cotizaciones (cedula ,codigo, descripcion, cantidad) values ('" + usuario + "','" + usuario + "','" + codigo + "', '" + descripcion + "', '" + can + "');");
                response.sendRedirect("http://localhost:8080/FormularioModal/Cotizar.jsp");
                }catch (Exception e){
                    out.print(e);
                }
               }
                %>
        

        
                
                
                
    </body>
</html>
