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
            <%
            if (session.getAttribute("usuario") != null){
            %> 
            <h2>Hola <%=session.getAttribute("usuario")%>, aqui tienes la lista de usuarios.</h2>
            <%
                }else{
            %> 
            <h2>Lista de usuarios</h2>
            <%
                }
            %> 
            
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
                        // Crear una instancia de registrosDAO para acceder a la base de datos
                        RegistrosDAO registrosDAO = new RegistrosDAO();

                        // Obtener la lista de registros desde la base de datos
                        List<Registro> registros = registrosDAO.obtenerTodos();

                        if (registros != null && !registros.isEmpty()) {
                            // Iterar sobre la lista de usuarios y mostrar sus datos en la tabla
                            for (Registro registro : registros) {
                    %>
                    <tr>
                        <td><%= registro.getId()%></td>
                        <td><%= registro.getUsuario()%></td>
                        <td><%= registro.getEmail()%></td>
                        <td><%= registro.getContraseña()%></td>
                        <td><%= registro.getStatus()%></td>
                        <td><%= registro.getFechaRegistro()%></td>
                        <td>
                            <div class="d-flex">
                                <!-- Formulario para actualizar -->
                                <form action="gestion" method="post" class="mr-2">
                                    <input type="hidden" name="accion" value="actualizar">
                                    <input type="hidden" name="id" value="<%= registro.getId()%>">
                                    <button type="submit" class="btn btn-warning btn-block">Actualizar</button>
                                </form>

                                <!-- Formulario para eliminar -->
                                <form action="gestion" method="post">
                                    <input type="hidden" name="accion" value="eliminar">
                                    <input type="hidden" name="id" value="<%= registro.getId()%>">
                                    <button type="submit" class="btn btn-danger btn-block">Eliminar</button>
                                </form>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="6">No hay usuarios registrados.</td>
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