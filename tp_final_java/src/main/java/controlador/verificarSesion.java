package controlador;

import dao.RegistrosDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.http.HttpSession;

@WebServlet("/vistas/verificarSesion")
public class verificarSesion extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener datos del formulario
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("contrasena");

        
        RegistrosDAO registrosDAO = new RegistrosDAO();
        //verifica que el usuario exista
        if (registrosDAO.verificarUsuario(usuario, contraseña)){
                //asigna la sesion con el nombre de usuario
                HttpSession session = request.getSession();
                session.setAttribute("usuario", usuario);

                // Redireccionar a la página de administracion si tiene el estado "admin",
                // de lo contrario redirige al index
                if (registrosDAO.obtenerEstado(usuario).equals("admin")) {
                    response.sendRedirect(request.getContextPath() + "/vistas/verRegistros.jsp");
                }else{
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                }
        } else {
            // Autenticación fallida
            request.setAttribute("error", "error");
            request.getRequestDispatcher("InicioDeSesion.jsp").forward(request, response);
        }
        
            
    }
}

