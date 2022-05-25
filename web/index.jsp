<%-- 
    Document   : index
    Created on : 21 abr. 2022, 17:57:08
    Author     : Freddy
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    </head>
    <body>

        <%
            // CONECTANDO A LA BASE DE DATOS
            Connection con;
            String url = "jdbc:mysql://localhost:3306/registro";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            ResultSet rs;

            ps = con.prepareStatement("select * from usuario");
            rs = ps.executeQuery();
        %>

        <h1> Tarea </h1>
        <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">Buscar por DNI </span>
            <input type="text" class="form-control sm-6" placeholder="ingrese dni a buscar" aria-label="ingrese dni a buscar" aria-describedby="basic-addon1">
        </div>
        <table>
            <tr>
                <th>ID</th>
                <th>DNI</th>
                <th>NOMBRE</th>
                <th>ACCIONES</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td> <%= rs.getInt("codiUsua")%> </td>
                <td> <%= rs.getString("logiUsua")%> </td>
               
                <td> 
                    <button type="button" class="btn btn-warning">Editar</button>
                    <button type="button" class="btn btn-danger">Eliminar</button>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
