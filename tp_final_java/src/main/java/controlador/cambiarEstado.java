package controlador;

import dao.RegistrosDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.http.HttpSession;


@WebServlet("/vistas/cambiarEstado")
public class cambiarEstado extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener datos del formulario
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("contrasena");

        RegistrosDAO registrosDAO = new RegistrosDAO();
        HttpSession session = request.getSession();
        //verifica que el usuario al que esta intentando dar el premium sea el mismo que tiene la sesion iiciada
        // ademas verifica que ese usuario-contraseña pertenezca a un usuario existente
        if (registrosDAO.verificarUsuario(usuario, contraseña) && ((String) session.getAttribute("usuario")).equals(usuario)){
                registrosDAO.actualizarEstado(usuario);
                response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            // Autenticación fallida
            request.setAttribute("error", "error");
            request.getRequestDispatcher("Premium.jsp").forward(request, response);
        }
    }
}
