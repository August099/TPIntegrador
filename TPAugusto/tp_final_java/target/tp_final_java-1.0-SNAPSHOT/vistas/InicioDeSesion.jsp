
<%@page import="dao.RegistrosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
 
<head> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    
    <link rel="stylesheet" href="../Styles/EstiloSesion.css">
    <title>Inicio de sesion</title>
  
</head>

<body class="fondo" style="height: 100vh;">
    <header>
        <nav class="navbar navbar-expand-lg bg-body-tertiary nav-color">
          <div class="container-fluid">
              <img src="../Images/ARock (1).png" alt="" class="img-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active estilo" aria-current="page" href="../index.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link estilo" href="#">Descargas</a>
                </li>

                <%
                    RegistrosDAO registro = new RegistrosDAO();
                    if(session.getAttribute("usuario") != null && registro.obtenerEstado((String) session.getAttribute("usuario")).equals("No premium")){
                %>
                <li class="nav-item">
                  <a class="nav-link estilo" href="Premium.jsp">Premium</a>
                </li>
                <%}%>
                <%if(session.getAttribute("usuario") == null){%>
                <li class="nav-item">
                    <a class="nav-link estilo" href="InicioDeSesion.jsp">Iniciar sesion</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link estilo" href="Registrar.jsp">Registrarse</a>
                </li>
                <%}%>

                <%
                    if(session.getAttribute("usuario") != null && registro.obtenerEstado((String) session.getAttribute("usuario")).equals("admin")){
                %>
                <li class="nav-item">
                    <a class="nav-link estilo" href="verRegistros.jsp">Administracion</a>
                </li>
                <%}%>

                <%if(session.getAttribute("usuario") != null){%>
                <li class="nav-item">
                    <form action="../cerrar" method="POST">
                        <button type="submit" class="nav-link estilo" href="#">Cerrar sesion</button>
                    </form>
                </li>
                <%}%>

              </ul>
              <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Buscar">
                <button class="btn btn-outline-success estilo-buscar" type="submit">Buscar</button>
              </form>
            </div>
          </div>
        </nav>
    </header>
    <section>
    <div style="background-color: rgba(160,180,170,0.3); border-radius: 30px; margin-left: 20px; margin-right: 20px;">
        
        
        <!-- formulario: antes de enviarse, valida que el usuario y la contraseña pertenezcan a
            un usuario existente, si no es el caso, marca error.-->
        <form class="row g-0 my-5" style="padding: 10px" action="verificarSesion" method="POST">
            <!-- boton(link) atras -->
            <div class="col-3"></div>
            <div class="col-6 mb-auto">
                <h2 style="margin-bottom: 30px; width: auto">Iniciar sesion</h2>
            </div>
            <div class="col-3"></div>
            <div class="col-3"></div>
            <div class="col-6 m-auto">
                <label for="usuario" class="form-label">Nombre de usuario</label>
                <%if (request.getAttribute("error") == "error"){%>
                <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Nombre de usuario o contraseña incorrecto." required>
                <%}else{%>
                <input type="text" class="form-control" id="usuario" name="usuario" required>
                <%}%>
            </div>
            <div class="col-3"></div>
            <div class="col-3"></div>
            <div class="col-6 m-auto">
                <label for="contrasena" class="form-label">Contraseña</label>
                <%if (request.getAttribute("error") == "error"){%>
                <input type="text" class="form-control" id="contrasena" name="contrasena" placeholder="Nombre de usuario o contraseña incorrecto." required>
                <%}else{%>
                <input type="text" class="form-control" id="contrasena" name="contrasena" required>
                <%}%>
            </div>
            <div class="col-3"></div>
            <div class="botones">
                <button class="btn btn-success" type="submit" id="Enviar" style="margin-left: 25% !important;">ENVIAR</button>
                <a href="Registrar.jsp" class="btn btn-primary" style="margin-right: 4% !important">REGISTRARSE</a>   
            </div>
        </form>
    </div>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>