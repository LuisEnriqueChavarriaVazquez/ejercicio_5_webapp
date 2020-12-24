

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
            <h3 class="white-text">Listado.</h3>
            <br>
            <table class="striped responsive-table blue-grey lighten-3 z-depth-4" style="border-radius: 20px;">
                <thead>
                    <tr>
                        <th class="centeredTextTitleTable">Id</th>
                        <th class="centeredTextTitleTable">Nombre.</th>
                        <th class="centeredTextTitleTable">Email.</th>
                        <th class="centeredTextTitleTable">Tipo de usuario</th>
                        <th class="centeredTextTitleTable">Opciones</th>
                    </tr>
                </thead>
                <tbody>

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
                    %>
                    <tr>
                        <td class="columnasDespliegue"><b>
                                <a  href="generarPdfParticular.jsp?cod=<%out.print(rs.getString(1));%>"
                                    class=" blue darken-4 waves-light btn z-depth-2"
                                    style="border-radius: 20px;"><i class="material-icons right">article</i>ID: <%out.print(rs.getString(1));%></a>
                            </b></td>
                        <td class="columnasDespliegue centeredTextTitleTable"><%out.print(rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4));%></td>
                        <td class="columnasDespliegue centeredTextTitleTable"><%out.print(rs.getString(5));%></td>
                        <td class="columnasDespliegue centeredTextTitleTable"><%out.print(rs.getString(6));%></td>
                        <td class="centeredOptions centeredTextTitleTable">
                            <a  href="editUsuarioForm.jsp?cod=<%out.print(rs.getString(1));%>"
                                class="waves-effect waves-light btn btnOptions blue darken-3 topButton"><i
                                    class="material-icons left">edit</i></a>
                            <a data-target="modal<%out.print(rs.getString(1));%>" class="modal-trigger waves-effect waves-light btn btnOptions grey darken-3 waves-effect bottomButton"><i class="material-icons left">delete</i></a>
                        </td>
                    </tr>
                    
                    


                    <!-- Modal Structure -->
                <div id="modal<%out.print(rs.getString(1));%>" class="modal">
                    <div class="modal-content">
                        <h4>Confirmación de borrado.</h4>
                        <p>¿En verdad desea eliminar al usuario <b><%out.print(rs.getString(2));%></b>?</p>
                    </div>
                    <div class="modal-footer">
                        <a href="eliminarUsuarios.jsp?cod=<%out.print(rs.getString(1));%>" class="modal-close waves-effect waves-green btn green darken-3"><i class="material-icons left">done</i>Agree</a>
                    </div>
                </div>
                <%
                        }
                        sta.close();
                        rs.close();
                        cnx.close();

                    } catch (Exception e) {
                        out.print("Fallo" + e);
                    }
                %>

                
                

                </tbody>
            </table>
                <br><br>
                <a href="generarPdf.jsp" style="width: 100%;" class="waves-effect waves-light btn white blue-text"><i class="material-icons left">article</i>Reportes generales</a>
        </section>
                
                <div class="fixed-action-btn">
                <a href="addUsuario.jsp" class="btn-floating btn-large waves-effect waves-light blue darken-4"><i class="material-icons">add</i></a>
                </div>
    </body>
    <script src="Recursos/js/jquery.js"></script>
    <script src="Recursos/js/materialize.min.js"></script>
    <script src="Recursos/js/implementations.js"></script>

</html>
