package controlador;

import dao.RegistrosDAO;
import modelo.Registro;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/vistas/gestion")
public class gestionar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        RegistrosDAO registroDAO = new RegistrosDAO();

        // Inicializar id antes del switch para que esté disponible en todos los casos
        int idUsuario = Integer.parseInt(request.getParameter("id"));

        switch (accion) {
            case "actualizar":
                Registro registro = registroDAO.obtenerPorId(idUsuario);
                request.setAttribute("registro", registro); 
                request.getRequestDispatcher("actualizar.jsp").forward(request, response);
                break;
            case "confirmarActualizacion":
                Registro usuarioActualizado = new Registro();
                usuarioActualizado.setId(idUsuario);
                usuarioActualizado.setUsuario(request.getParameter("usuario"));
                usuarioActualizado.setEmail(request.getParameter("email"));
                usuarioActualizado.setContraseña(request.getParameter("contrasena"));
                usuarioActualizado.setStatus(request.getParameter("estado"));
                // Asume que el método setFechaAlta acepta un java.sql.Date
                usuarioActualizado.setFechaRegistro(java.sql.Date.valueOf(request.getParameter("fecha")));

                registroDAO.actualizarUsuario(usuarioActualizado);
                response.sendRedirect("verRegistros.jsp");
                break;
            case "eliminar":
                registroDAO.eliminarUsuario(idUsuario);
                response.sendRedirect("verRegistros.jsp");
                break;
            default:
                response.sendRedirect("verRegistros.jsp");
                break;
        }
    }
}