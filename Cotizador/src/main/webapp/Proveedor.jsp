<%-- 
    Document   : index
    Created on : 11/09/2023, 9:05 p. m.
    Author     : Natalia Posso  - Hernan Valencia
--%>


<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar</title>
    </head>
    <body>
        
         
        
        <% 
            String id = request.getParameter("id");
            String computo = request.getParameter("Computo");
            String nit = request.getParameter("nit");
            String user = request.getParameter("user");
            String categoria = request.getParameter("categoria");
            String correo = request.getParameter("correo");
            String tipo = request.getParameter("tipo");
            
            String accesorios = request.getParameter("Accesorios");
            String licencias = request.getParameter("Licencias");
            String software = request.getParameter("Software");
            String mantenimientos = request.getParameter("Mantenimientos");
            String servidores = request.getParameter("Servidores");
            String repuestos = request.getParameter("Repuestos");
            String otros = request.getParameter("Otros");
         
                        
            Connection con = null;//crea la conexion libreia para usar mysql
            Statement st = null;//permite usara sentencia sql para java
            
                try {

                    Class.forName("com.mysql.jdbc.Driver");//para usar el codigo mysql
                    //DriverManager: administrador de controladores
                    con = DriverManager.getConnection("jdbc:mysql://localhost/bdcotizacion?user=root&password=");
                    st = con.createStatement();
                        
                   
                          if (computo != null){                 
                             st.executeUpdate("INSERT INTO proveedores (User, TipoUser, correo, categoria) values ('" + user + "','" + tipo + "','" + correo + "','" + "Computo" + "');");
                          }
                          if (accesorios != null){                 
                             st.executeUpdate("INSERT INTO proveedores (User, TipoUser, correo, categoria) values ('" + user + "','" + tipo + "','" + correo + "','" + "Accesorios" + "');");
                          }
                          if (licencias != null){                 
                             st.executeUpdate("INSERT INTO proveedores (User, TipoUser, correo, categoria) values ('" + user + "','" + tipo + "','" + correo + "','" + "Licencias" + "');");
                          }
                          if (software != null){                 
                             st.executeUpdate("INSERT INTO proveedores (User, TipoUser, correo, categoria) values ('" + user + "','" + tipo + "','" + correo + "','" + "Software" + "');");
                          }
                          if (mantenimientos != null){                 
                             st.executeUpdate("INSERT INTO proveedores (User, TipoUser, correo, categoria) values ('" + user + "','" + tipo + "','" + correo + "','" + "Mantenimientos" + "');");
                          }
                          if (servidores != null){                 
                             st.executeUpdate("INSERT INTO proveedores (User, TipoUser, correo, categoria) values ('" + user + "','" + tipo + "','" + correo + "','" + "Servidores" + "');");
                          }
                          if (repuestos != null){                 
                             st.executeUpdate("INSERT INTO proveedores (User, TipoUser, correo, categoria) values ('" + user + "','" + tipo + "','" + correo + "','" + "Repuestos" + "');");
                          }
                          if (otros != null){                 
                             st.executeUpdate("INSERT INTO proveedores (User, TipoUser, correo, categoria) values ('" + user + "','" + tipo + "','" + correo + "','" + "Otros" + "');");
                          }
                          
                          
                          
                          
                          
                          
                             request.getRequestDispatcher("Crearusuario.jsp").forward(request, response);//redireccionar
                    //response.sendRedirect("index.jsp");
                } catch (Exception e) {
                    out.print(e);
                } finally {}
                

        %>
    </body>
</html>
