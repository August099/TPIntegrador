
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Registro"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Actualizar Orador</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-5">
            <h2>Actualizar Orador</h2>
            <form action="gestion" method="post">
                <input type="hidden" name="accion" value="confirmarActualizacion">
                <input type="hidden" name="id" value="${registro.id}">

                <div class="form-group">
                    <label for="usuario">Nombre:</label>
                    <input type="text" class="form-control" id="usuario" name="usuario" value="${registro.usuario}" required>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" class="form-control" id="email" name="email" value="${registro.email}" required>
                </div>

                <div class="form-group">
                    <label for="contrasena">Contraseña:</label>
                    <input type="text" class="form-control" id="contrasena" name="contrasena" value="${registro.contraseña}" required>
                </div>

                <div class="form-group">
                    <label for="fecha">Fecha de registro:</label>
                    <input type="date" class="form-control" id="fecha" name="fecha" value="${registro.fechaRegistro}" required>
                </div>
                
                <div class="form-group">
                    <label for="estado">Estado:</label>
                    <input type="text" class="form-control" id="estado" name="estado" value="${registro.status}" required>
                </div>

                <button type="submit" class="btn btn-primary">Actualizar</button>
                <a href="verRegistros.jsp" class="btn btn-success">Volver</a>

            </form>
        </div>
    </body>
</html>
