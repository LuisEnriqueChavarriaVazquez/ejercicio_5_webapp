<%-- 
    Document   : addUsuario
    Created on : 3/12/2020, 01:31:39 AM
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

    <body class="blue darken-2" style="margin-bottom: 200px;">
       
        <nav>
            <div class="nav-wrapper blue darken-4">
                <ul id="nav-mobile" class="right">
                    
                </ul>
            </div>
        </nav>

        <section class="container">
            <br><br>
            <h3 class="white-text">Agregar usuario.</h3>
            <div class="mainBox z-depth-4" style="border-radius: 50px;">
                <div class="titleForm blue darken-4 robotoRegular white-text">Datos de registro (nuevo usuario)</div>
                <div class="formularioUsuario blue darken-3">
                    <div class="row">
                        <form class="col s12">
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">account_circle</i>
                                    <input id="icon_prefix_nombre" type="text" class="white-text" name="nombre" required>
                                    <label for="icon_prefix_nombre">Nombre(s)</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">looks_one</i>
                                    <input id="icon_prefix_paterno" type="text" class="white-text" name="paterno" required>
                                    <label for="icon_prefix_paterno">Apellido paterno</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">looks_two</i>
                                    <input id="icon_prefix_materno" type="text" class="white-text" name="materno" required>
                                    <label for="icon_prefix_materno">Apellido materno</label>
                                </div>
                                <br><br>
                                
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">alternate_email</i>
                                    <input id="icon_prefix_email" type="email" class="white-text" name="email" required>
                                    <label for="icon_prefix_email">Email</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">how_to_reg</i>
                                    <input id="icon_prefix_alias" type="text" class="white-text" name="tipoUsuario" required>
                                    <label for="icon_prefix_alias">Tipo de usuario</label>
                                </div>
                                
                                
                                <div class="containerEnvioSign">
                                    <button
                                        name="btnAgregarUsuarios"
                                        class="z-depth-4 btn-large waves-effect waves-teal white btnEnvio text-darken-4 blue-grey-text robotoGrueso"
                                        type="submit">
                                        Agregar.
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <%
            if (request.getParameter("btnAgregarUsuarios") != null) {
                Connection cnx = null;
                Statement sta = null;
                ResultSet rs = null;

                String nom = request.getParameter("nombre");
                String paterno = request.getParameter("materno");
                String materno = request.getParameter("paterno");
                String alias = request.getParameter("tipoUsuario");
                String email = request.getParameter("email");

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    cnx = DriverManager.getConnection("jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_c9e0d9166df15f8?user=b9c4fbb5b28bfe&password=fc9160a6");
                    sta = cnx.createStatement();
                    rs = sta.executeQuery("select max(idUsuario)+1 from usuario");

                    String idUsuario = "";
                    while (rs.next()) {
                        idUsuario = rs.getString(1);
                    }

                    sta.executeUpdate("insert into usuario values('" + idUsuario + "','" + nombre + "', '" + paterno + "', '" + materno + "', '" + email + "', '" + alias + "')");
            
                    sta.close();
                    rs.close();
                    cnx.close();

                } catch (Exception e) {
                    out.print("Fallo" + e);
                }
            }
        %>


    </body>
    <script src="Recursos/js/jquery.js"></script>
        <script src="https://smtpjs.com/v3/smtp.js"></script>
    <script src="Recursos/js/materialize.min.js"></script>
    <script src="Recursos/js/implementations.js"></script>

</html>
