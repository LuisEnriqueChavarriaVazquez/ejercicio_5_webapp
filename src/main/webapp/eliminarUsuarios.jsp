<%-- 
    Document   : eliminarUsuarios
    Created on : 6/12/2020, 09:02:57 AM
    Author     : Luis Enrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    Connection cnx = null;
    Statement sta = null;
    ResultSet rs = null;
    
    String cod = request.getParameter("cod");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        cnx = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_c9e0d9166df15f8?user=b9c4fbb5b28bfe&password=fc9160a6");
        sta = cnx.createStatement();
        sta.executeUpdate("delete from usuario where idUsuario = '"+cod+"'");
        request.getRequestDispatcher("despliegueUsuarios.jsp").forward(request,response);
        sta.close();
        rs.close();
        cnx.close();

    } catch (Exception e) {
        out.print("Fallo" + e);
    }
%>