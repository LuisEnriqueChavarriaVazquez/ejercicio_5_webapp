<%-- 
    Document   : index
    Created on : 3/12/2020, 01:10:38 AM
    Author     : Luis Enrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bienvenida</title>

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="Recursos/css/materialize.css">
        <link rel="stylesheet" href="Recursos/css/estilos.css">

    </head>

    <body class="blue darken-2">

        <nav>
            <div class="nav-wrapper blue darken-4">
                <ul id="nav-mobile" class="right">
                </ul>
            </div>
        </nav>

        <section class="container">
            <br><br>
            <h3 class="white-text">Reporte Particular.</h3>
            <br>
            <section class="white-text robotoNormal row" style="font-size: 20px;">
                <%
                    Connection cnx = null;
                    Statement sta = null;
                    ResultSet rs = null;
                    
                    String cod = request.getParameter("cod");

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        cnx = DriverManager.getConnection("jdbc:mysql://localhost/reportes?user=root&password=root");
                        sta = cnx.createStatement();
                        rs = sta.executeQuery("select * from usuario where idUsuario = '" + cod + "'");

                        String usuario = "";

                %>
                <a class="waves-effect waves-light btn-large white blue-text darken-3" style="width: 100%; height: 100px; display: flex; justify-content: center; align-items: center;" onclick="gen()"><i class="material-icons left">download</i>
                    <b>Descargar el reporte completo.</b></a>
                <script>
                    function gen() {
                        var doc = new jsPDF()
                        var y = 30;
                        //var img = new Image()
                        //img.src = 'Recursos/img/ipn.jpeg'
                        //doc.addImage(img, 'jpeg', 10, 78, 12, 15)

                        doc.setFontSize(22)
                        doc.setTextColor(0, 0, 255)
                        doc.text(20, 20, 'Reporte de general.')
                        doc.setFontSize(18)
                        doc.setTextColor(0, 0, 255)
                        doc.text(20, 20 + 10, 'Listado de usuarios.')

                        doc.setFontSize(13);
                        doc.setTextColor(0, 0, 0);
                    <%                        while (rs.next()) {
                    %>

                        doc.text(20, y + 10, 'Id usuario: <%out.print(rs.getString(1));%>');
                        doc.text(20, y + 20, '  *Nombre: <%out.print(rs.getString(2));%> <%out.print(rs.getString(3));%> <%out.print(rs.getString(4));%>');
                        doc.text(20, y + 30, '  *Email: <%out.print(rs.getString(5));%>');
                        doc.text(20, y + 40, '  *Tipo Usuario: <%out.print(rs.getString(6));%>');
                        y = y + 40;

                    <%
                            }
                            sta.close();
                            rs.close();
                            cnx.close();
                        } catch (Exception e) {
                            out.print("Fallo" + e);
                        }
                    %>
                        doc.save("reporteGeneral_Ejercicio_5_Luis_Enrique_Chavarría_Vázquez.pdf");
                    }
                </script>
            </section>
        </section>





    </body>
    <script src="Recursos/js/jquery.js"></script>
    <script src="Recursos/js/materialize.min.js"></script>
    <script src="Recursos/js/implementations.js"></script>
    <script src="Recursos/js/jspdf.min.js"></script>

</html>

