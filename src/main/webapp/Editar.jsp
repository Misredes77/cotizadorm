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
            
            String vlran = request.getParameter("valrcot");
            String id = request.getParameter("id");
            String costom = request.getParameter("costom");
            String codigo = request.getParameter("codigo");
            String descripcion = request.getParameter("descripcion");
            //String descripcion = "descripcion1";
            String cantidad = request.getParameter("cantidad");
            String valrcot = request.getParameter("valrcot");
            String proveedor = request.getParameter("proveedor");
            String codigo1 = request.getParameter("codigo1");
            String codigo2 = request.getParameter("codigo2");
            String tiempos1 = request.getParameter("tiempos");
            String observa = request.getParameter("observacion");
            String fileUpload = request.getParameter("fileUpload");
            
            
            Float vlrc =  Float.parseFloat(valrcot);
            Float tot =  Float.parseFloat(valrcot)*Float.parseFloat(cantidad);
            Float cos1 =  Float.parseFloat(costom);
           
            
         
                        
            Connection con = null;//crea la conexion libreia para usar mysql
            Statement st = null;//permite usara sentencia sql para java
            
            try {

                    Class.forName("com.mysql.jdbc.Driver");//para usar el codigo mysql
                    //DriverManager: administrador de controladores
                    con = DriverManager.getConnection("jdbc:mysql://localhost/bdcotizacion?user=root&password=");
                    st = con.createStatement();
                        
                   
                         // if (codigo1 == "1"){                 
                          if ("1".equals(codigo1)){ 
                             st.executeUpdate("UPDATE cotizaciones SET vlrunidad='" + vlrc + "',  total='" + tot + "',  proveedor='" + proveedor + "', costo1='" + vlrc + "', descripcion1='" + descripcion + "', proveedor1='" + proveedor + "', codigo1='" + codigo + "', codigom='" + codigo + "', descripcionm='" + descripcion + "', codigo2='" + "1" + "', costom='" + vlrc + "', estado='" + "1" + "', tiempo1='" + tiempos1 + "', observa1='" + observa + "' WHERE id='" + id + "';");
                          } else {
                             if ("1".equals(codigo2)){
                                 if (vlrc < cos1){
                                   st.executeUpdate("UPDATE cotizaciones SET vlrunidad='" + vlrc + "',  total='" + tot + "',  proveedor='" + proveedor + "', costo2='" + vlrc + "', descripcion2='" + descripcion + "', proveedor2='" + proveedor + "', codigo2='" + codigo + "', codigom='" + codigo + "', descripcionm='" + descripcion + "', costom='" + vlrc + "', estado='" + "2" + "', tiempo2='" + tiempos1 + "', observa2='" + observa + "' WHERE id='" + id + "';");
                                 } else {
                                   st.executeUpdate("UPDATE cotizaciones SET costo2='" + vlrc + "', descripcion2='" + descripcion + "', proveedor2='" + proveedor + "', codigo2='" + codigo + "', estado='" + "2" + "', tiempo2='" + tiempos1 + "', observa2='" + observa + "' WHERE id='" + id + "';");
                                 }
                            
                             } else {
                                 if (vlrc < cos1){                             
                                  st.executeUpdate("UPDATE cotizaciones SET vlrunidad='" + vlrc + "',  total='" + tot + "',  proveedor='" + proveedor + "', costo3='" + vlrc + "', descripcion3='" + descripcion + "', proveedor3='" + proveedor + "', codigo3='" + codigo + "', estado='" + "1" + "', codigom='" + codigo + "', descripcionm='" + descripcion + "', costom='" + vlrc + "', estado='" + "3" + "', tiempo3='" + tiempos1 + "', observa3='" + observa + "' WHERE id='" + id + "';"); 
                                 }else {
                                  st.executeUpdate("UPDATE cotizaciones SET costo3='" + vlrc + "', descripcion3='" + descripcion + "', proveedor3='" + proveedor + "', codigo3='" + codigo + "', estado='" + "3" + "', tiempo3='" + tiempos1 + "', observa3='" + observa + "' WHERE id='" + id + "';");
                                 }
                             }                
                                
                          }       
                                                  
                    request.getRequestDispatcher("Responder.jsp").forward(request, response);//redireccionar
                    //response.sendRedirect("index.jsp");
                } catch (Exception e) {
                    out.print(e);
                } finally {}
                

        %>
    </body>
</html>
