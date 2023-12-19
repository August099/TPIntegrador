<%@page import="dao.RegistrosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
 



<head> 
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <script src="https://kit.fontawesome.com/fae5ac15d7.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="Styles/estilos.css">
  <title>Inicio</title>
  
</head>

<body>
  <!-- navbar -->
  <header>
    <nav class="navbar navbar-expand-lg bg-body-tertiary nav-color">
      <div class="container-fluid">
          <img src="Images/ARock (1).png" alt="" class="img-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a class="nav-link active estilo" aria-current="page" href="index.jsp">Inicio</a>
            </li>
            <li class="nav-item">
              <a class="nav-link estilo" href="#">Descargas</a>
            </li>
            
            <%
                RegistrosDAO registro = new RegistrosDAO();
                if(session.getAttribute("usuario") != null && registro.obtenerEstado((String) session.getAttribute("usuario")).equals("No premium")){
            %>
            <li class="nav-item">
              <a class="nav-link estilo" href="vistas/Premium.jsp">Premium</a>
            </li>
            <%}%>
            <%if(session.getAttribute("usuario") == null){%>
            <li class="nav-item">
                <a class="nav-link estilo" href="vistas/InicioDeSesion.jsp">Iniciar sesion</a>
            </li>
            <li class="nav-item">
                <a class="nav-link estilo" href="vistas/Registrar.jsp">Registrarse</a>
            </li>
            <%}%>
            
            <%
                if(session.getAttribute("usuario") != null && registro.obtenerEstado((String) session.getAttribute("usuario")).equals("admin")){
            %>
            <li class="nav-item">
                <a class="nav-link estilo" href="vistas/verRegistros.jsp">Administracion</a>
            </li>
            <%}%>
            
            <%if(session.getAttribute("usuario") != null){%>
            <li class="nav-item">
                <form action="cerrar" method="POST">
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

  <main class="container-fluid fondo">
    <section class="p-2">
       <%if(session.getAttribute("usuario") != null){%>
       <h3 style="text-align: center; text-shadow: 3px 3px 4px rgb(74, 102, 91); color: azure;">BIENVENIDO <%= session.getAttribute("usuario") %></h3>
       <hr style="width: 99%; color: whitesmoke;">
       <%}%>
      <h3 style="text-align: center; text-shadow: 3px 3px 4px rgb(74, 102, 91); color: azure;">EMBLEMAS DEL ROCK NACIONAL</h3>
              <!-- cartas de artistas -->
              <div class="row justify-content-center px-5">
                <div class="col-xl-2 col-md-4 col-4">
                  <div class="card my-1" style="width: 100%;">
                    <img src="Images/gustavo.jpg" class="card-img-top img-fluid" alt="...">
                    <div class="card-body">
                      <h4 class="card-title text-body">Gustavo Cerati</h4>
                      <a href="#" class="btn btn-primary">Discografia</a>
                    </div>
                  </div>
                </div>
                <div class="col-xl-2 col-md-4 col-4">
                  <div class="card my-1" style="width: 100%;">
                    <img src="Images/charly.jpg" class="card-img-top img-fluid" alt="...">
                    <div class="card-body">
                      <h4 class="card-title text-body">Charly Garcia</h4>
                      <a href="#" class="btn btn-primary">Discografia</a>
                    </div>
                  </div>
                </div>
                <div class="col-xl-2 col-md-4 col-4">
                  <div class="card my-1" style="width: 100%;">
                    <img src="Images/Calamaro.jpg" class="card-img-top img-fluid" alt="...">
                    <div class="card-body">
                      <h4 class="card-title text-body">Andres Calamaro</h4>
                      <a href="#" class="btn btn-primary">Discografia</a>
                    </div>
                  </div>
                </div>
                <div class="col-xl-2 col-md-4 col-4">
                  <div class="card my-1" style="width: 100%;">
                    <img src="Images/fito.jpg" class="card-img-top img-fluid" alt="...">
                    <div class="card-body">
                      <h4 class="card-title text-body">Fito Paez</h4>
                      <a href="#" class="btn btn-primary">Discografia</a>
                    </div>
                  </div>
                </div>
                <div class="col-xl-2 col-md-4 col-4">
                  <div class="card my-1" style="width: 100%;">
                    <img src="Images/Lspinetta.jpg" class="card-img-top img-fluid" alt="...">
                    <div class="card-body">
                      <h4 class="card-title text-body">Luis Spinetta</h4>
                      <a href="#" class="btn btn-primary">Discografia</a>
                    </div>
                  </div>
                </div>
                <div class="col-xl-2 col-md-4 col-4">
                  <div class="card my-1" style="width: 100%;">
                    <img src="Images/pappo2.jpg" class="card-img-top img-fluid" alt="...">
                    <div class="card-body">
                      <h4 class="card-title text-body">Pappo</h4>
                      <a href="#" class="btn btn-primary">Discografia</a>
                    </div>
                  </div>
                </div>


              </div>
        
      



    </section>
    <section class="p-2">
      <h3 style="text-align: center; text-shadow: 3px 3px 4px rgb(74, 102, 91); color: azure; margin-block: 20px;">Bandas que podrian gustarte</h3>

      <div id="carouselExample" class="carousel slide mt-1">
        <div class="carousel-inner w-75 mx-auto">
          <div class="carousel-item active">
            <!-- cartas de bandas -->
            
            <div class="grupo-tarjetas">
              <div class="tarjeta">
                  <img src="Images/lostipitos.jpg" alt="" class="img-bandas">
                  
                  <button class="boton"> 
                    Los tipitos
                  </button>
                  
              </div>
              <div class="tarjeta">
                  <img src="Images/estelares.jpg" alt="" class="img-bandas">
                  <button class="boton"> 
                    Estelares
                  </button>
              </div>
              <div class="tarjeta">
                  <img src="Images/babasonicos.jpg" alt="" class="img-bandas">
                  <button class="boton">
                    Babasonicos
                  </button>
              </div>
              <div class="tarjeta">
                  <img src="Images/cyp.jpg" alt="" class="img-bandas">
                  <button class="boton">
                    Ciro y los persas
                  </button>
              </div>
            </div>
          
              
          </div>
          <div class="carousel-item">

            <div class="grupo-tarjetas">
              <div class="tarjeta">
                  <img src="Images/jovenespor.png" alt="" class="img-bandas">
                  
                  <button class="boton"> 
                    Jovenes pordioseros
                  </button>
                  
              </div>
              <div class="tarjeta">
                  <img src="Images/guasones.jpg" alt="" class="img-bandas">
                  <button class="boton"> 
                    Guasones
                  </button>
              </div>
              <div class="tarjeta">
                  <img src="Images/lpg.jpg" alt="" class="img-bandas">
                  <button class="boton">
                    Los Perez Garcia
                  </button>
              </div>
              <div class="tarjeta">
                  <img src="Images/manchader.jpg" alt="" class="img-bandas">
                  <button class="boton">
                    Mancha de Rolando
                  </button>
              </div>
            </div>

          </div>
          <div class="carousel-item">

            <div class="grupo-tarjetas">
              <div class="tarjeta">
                  <img src="Images/callejeros.jpg" alt="" class="img-bandas">
                  
                  <button class="boton"> 
                    Callejeros
                  </button>
                  
              </div>
              <div class="tarjeta">
                  <img src="Images/Airbag.jpg" alt="" class="img-bandas">
                  <button class="boton"> 
                    Airbag
                  </button>
              </div>
              <div class="tarjeta">
                  <img src="Images/arbol.jpg" alt="" class="img-bandas">
                  <button class="boton">
                    Arbol
                  </button>
              </div>
              <div class="tarjeta">
                  <img src="Images/ratablanca.jpg" alt="" class="img-bandas">
                  <button class="boton">
                    Rata blanca
                  </button>
              </div>
            </div>
            
          </div>
        </div>
        <button class="carousel-control-prev boton-carrusel-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next boton-carrusel-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

    </section>
    <h3 style="text-align: center; text-shadow: 3px 3px 4px rgb(74, 102, 91); color: azure; margin-block: 20px;">Shows que deberias ver</h3>
    <section class="px-2" style="padding-bottom: 35px;">
            <!-- shows videos -->
      <div id="carouselExample2" class="carousel slide">
        <div class="carousel-inner">
          <div class="carousel-item p-5 active">
            <div class="w-75 m-auto sombra-video">
              <div class="ratio" style="--bs-aspect-ratio: 45%;">
                <iframe src="https://www.youtube.com/embed/ltOusQV2ogU?si=-BVKM_TJsBoQ3OJc" title="YouTube video" allowfullscreen></iframe>
              </div>
            </div>
          </div>
          <div class="carousel-item p-5">
            <div class="w-75 m-auto sombra-video">
              <div class="ratio" style="--bs-aspect-ratio: 45%;">
                <iframe src="https://www.youtube.com/embed/xk7fSD6MZeg?si=Yq2B0Kc6mRcGf0UC" title="YouTube video" allowfullscreen></iframe>
              </div>
            </div>
          </div>
          <div class="carousel-item p-5">
            <div class="w-75 m-auto sombra-video">
              <div class="ratio" style="--bs-aspect-ratio: 45%;">
                <iframe src="https://www.youtube.com/embed/JMzihl_sStA?si=G6TPymo2dqznv2c-" title="YouTube video" allowfullscreen></iframe>
              </div>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev boton-carrusel-prev" type="button" data-bs-target="#carouselExample2" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next boton-carrusel-next" type="button" data-bs-target="#carouselExample2" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      
      
    </section>

    

  </main>

  <footer class="pie-de-pagina">
      <div class="row ajuste-telefono w-100">
        <!-- imagen y nombre de la pagina -->
        <div class="col-2">
          <div class="orden">
            <img class="img-fluid" src="Images/ARock (1).png" alt="">
            <h2 style="color: rgb(150, 24, 24); margin-left: 5px;">ARock</h2>
          </div>
        </div>
        <!-- columnas de informacion -->
        <div class="col-6">
          <div class="centrar-celu" style="display: flex; align-items: start;">
            <dl>
              <dt>COMPAÑÍA</dt>

              <dd>
                <a href="">Acerca de</a>
              </dd>
              <dd>
                <a href="">Empleo</a>
              </dd>
              <dd>
                <a href="">For the Record</a>
              </dd>
            </dl>
            <dl>
        
              <dt>COMUNIDADES</dt>

              <dd>
                <a href="">Para artistas</a>
              </dd>
              <dd>
                <a href="">Desarrolladores</a>
              </dd>
              <dd>
                <a href="">Publicidad</a>
              </dd>
              <dd>
                <a href="">Inversionistas</a>
              </dd>
              <dd>
                <a href="">Proveedores</a>
              </dd>

            </dl>
            <dl>
              <dt>ENLACES ÚTILES</dt>

              <dd>
                <a href="">Ayuda</a>
              </dd>
              <dd>
                <a href="">Reproductor web</a>
              </dd>
              <dd>
                <a href="">App móvil gratis</a>
              </dd>
            </dl>
          </div>
        </div>
        <!-- redes sociales -->
        <div class="col-4">
          <div class="p-2 redes">
            <h5 class="texto-pie-de-pagina">Siguenos en nuestras redes:</h5>
            <div class="" style="display: flex; justify-content: center; align-items: center;">
              <a class="boton-redes" href="https://www.instagram.com/">
                <i class="fa-brands fa-square-instagram fa-fw" style="color: #ebe6e6;"></i>
              </a>
              <a class="boton-redes" href="https://twitter.com/?lang=es">
                <i class="fa-sharp fa-solid fa-x fa-fw" style="color: #ebe6e6;"></i>
              </a>
              <a class="boton-redes" href="https://www.facebook.com/?locale=es_LA">
                <i class="fa-brands fa-facebook fa-fw" style="color: #ebe6e6;"></i>
              </a>
              <a class="boton-redes" href="https://web.whatsapp.com/">
                <i class="fa-brands fa-whatsapp fa-fw" style="color: #ebe6e6;"></i>
              </a>
              <a class="boton-redes" href="https://www.tiktok.com/es/">
                <i class="fa-brands fa-tiktok fa-fw" style="color: #ebe6e6;"></i>
              </a>
            </div>
          </div>
        </div>
      </div>
      <hr style="width: 99%; color: whitesmoke;">
      <!-- espacio de informacion legal -->
      <div class="legal">
        <a style="margin-left: 10px; font-size: x-small;" href="">Legal</a>
        <a style="margin-left: 10px; font-size: x-small;" href="">Centro de privacidad</a>
        <a style="margin-left: 10px; font-size: x-small;" href="">Política de Privacidad</a>
        <a style="margin-left: 10px; font-size: x-small;" href="">Cookies</a>
        <a style="margin-left: 10px; font-size: x-small;" href="">Sobre los anuncios</a>
        <a style="margin-left: 10px; font-size: x-small;" href="">Accesibilidad</a>
        <h5 class="copy">© 2023 ARock</h5>
        
      </div>

      
  </footer>
  <link rel="stylesheet" href="Styles/estilos.css">
</body>
