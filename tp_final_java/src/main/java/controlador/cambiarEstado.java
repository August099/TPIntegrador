package controlador;

import dao.RegistrosDAO;
import modelo.Registro;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

@WebServlet("/cambiarEstado")
public class cambiarEstado extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener datos del formulario
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("contrasena");

        // Agregar el orador a la base de datos
        RegistrosDAO registrosDAO = new RegistrosDAO();
        if (registrosDAO.verificarUsuario(usuario, contraseña)){
            registrosDAO.actualizarEstado(usuario);
        }

        // Redireccionar a la página de visualización de oradores
        if (registrosDAO.obtenerEstado(usuario, contraseña).equals("admin")) {
            response.sendRedirect(request.getContextPath() + "/vistas/verRegistros.jsp");
        }else{
            response.sendRedirect(request.getContextPath() + "/index.html");
        }
    }
}
