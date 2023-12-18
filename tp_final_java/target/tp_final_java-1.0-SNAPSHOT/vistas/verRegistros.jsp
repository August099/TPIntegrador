<%@page import="dao.RegistrosDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Registro"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de usuarios</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Lista de usuarios</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Email</th>
                        <th>Contraseña</th>
                        <th>Estado</th>
                        <th>Fecha del registro</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Crear una instancia de OradoresDAO para acceder a la base de datos
                        RegistrosDAO registrosDAO = new RegistrosDAO();

                        // Obtener la lista de oradores desde la base de datos
                        List<Registro> registros = registrosDAO.obtenerTodos();

                        if (registros != null && !registros.isEmpty()) {
                            // Iterar sobre la lista de oradores y mostrar sus datos en la tabla
                            for (Registro registro : registros) {
                    %>
                    <tr>
                        <td><%= registro.getId()%></td>
                        <td><%= registro.getUsuario()%></td>
                        <td><%= registro.getEmail()%></td>
                        <td><%= registro.getContraseña()%></td>
                        <td><%= registro.getStatus()%></td>
                        <td><%= registro.getFechaRegistro()%></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5">No hay usuarios registrados.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <!-- Botón para volver al índice -->
            <a href="../" class="btn btn-success">Volver</a>   
        </div>
    </body>
</html>