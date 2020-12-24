<%-- 
    Document   : editUsuarioForm
    Created on : 3/12/2020, 01:28:52 AM
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

    <body class="blue-grey darken-2" style="margin-bottom: 200px;">
    
        <nav>
            <div class="nav-wrapper blue-grey darken-4">
                <ul id="nav-mobile" class="right">
                    <li><a href="badges.html">Volver al inicio.</a></li>
                </ul>
            </div>
        </nav>

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

                while (rs.next()) {
        %>

        <section class="container">
            <br><br>
            <h3 class="white-text">Editar usuario.</h3>
            <div class="mainBox z-depth-4" style="border-radius: 50px;">
                <div class="titleForm blue-grey darken-4 robotoRegular white-text">Datos de usuario.</div>
                <div class="formularioUsuario blue-grey darken-3">
                    <div class="row">
                        <form class="col s12">
                            <div class="row">
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">account_circle</i>
                                    <input value="<%out.print(rs.getString(2));%>" id="icon_prefix_nombre" type="text" class="white-text" name="nombreUsuario" required>
                                    <label for="icon_prefix_nombre">Nombre(s)</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">looks_one</i>
                                    <input value="<%out.print(rs.getString(3));%>" id="icon_prefix_paterno" type="text" class="white-text" name="paterno" required>
                                    <label for="icon_prefix_paterno">Apellido paterno</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">looks_two</i>
                                    <input value="<%out.print(rs.getString(4));%>" id="icon_prefix_materno" type="text" class="white-text" name="materno" required>
                                    <label for="icon_prefix_materno">Apellido materno</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">alternate_email</i>
                                    <input value="<%out.print(rs.getString(5));%>" id="icon_prefix_email" type="email" class="white-text" name="email" required>
                                    <label for="icon_prefix_email">Email</label>
                                </div>
                                <br><br>
                                <div class="input-field col s12">
                                    <i class="material-icons prefix white-text">how_to_reg</i>
                                    <input value="<%out.print(rs.getString(6));%>" id="icon_prefix_alias" type="text" class="white-text" name="tipoUsuario" required>
                                    <label for="icon_prefix_alias">Tipo de usuario</label>
                                </div>
                                <div class="containerEnvioSign">
                                    <button
                                        name="btnEditarUsuario"
                                        class="z-depth-4 btn-large waves-effect waves-teal white btnEnvio text-darken-4 blue-grey-text robotoGrueso"
                                        type="submit">
                                        Actualizar.
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <%
                }
            } catch (Exception e) {
                out.print("Fallo" + e);
            }

            if (request.getParameter("btnEditarUsuario") != null) {
                String nombreUsuario = request.getParameter("nombreUsuario");
                String paterno = request.getParameter("paterno");
                String materno = request.getParameter("materno");
                String alias = request.getParameter("tipoUsuario");
                String email = request.getParameter("email");

                try {
                    sta.executeUpdate("update usuario set nombre='" + nombreUsuario + "', paterno='" + paterno + "', materno='" + materno + "', email='" + email + "', tipoUsuario='" + alias + "' where email = '" + email + "'");
                   
                } catch (Exception e) {
                    out.print(e + " " +cod);
                }
            }

        %>

    </body>
    <script src="Recursos/js/jquery.js"></script>
        <script src="https://smtpjs.com/v3/smtp.js"></script>
    <script src="Recursos/js/materialize.min.js"></script>
    <script src="Recursos/js/implementations.js"></script>

</html>
