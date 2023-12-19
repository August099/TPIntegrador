package controlador;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.http.HttpSession;


@WebServlet("/cerrar")
public class cerrarSesion extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            //obtenemos desde que ventana se apreto para que devolverlo al index no de error
            
            /* asigna null a la sesion y refresca la pagina */
            HttpSession session = request.getSession();
            session.setAttribute("usuario", null);
            
            request.getRequestDispatcher("index.jsp").forward(request, response);
                
            
        }
    }

