
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    Connection cnx = null;
    Statement sta = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        cnx = DriverManager.getConnection("jdbc:mysql://localhost/reportes?user=root&password=root");
        sta = cnx.createStatement();
        rs = sta.executeQuery("select * from usuario");

        while (rs.next()) {

        }
        sta.close();
        rs.close();
        cnx.close();

    } catch (Exception e) {

    }
%>