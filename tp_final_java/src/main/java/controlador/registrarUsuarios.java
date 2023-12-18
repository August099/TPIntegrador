
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

@WebServlet("/registrarUsuario")
public class registrarUsuarios extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener datos del formulario
        String usuario = request.getParameter("usuario");
        String email = request.getParameter("email");
        String contraseña = request.getParameter("contrasena");

        // Crear un objeto Orador con los datos
        Registro registro = new Registro();
        registro.setUsuario(usuario);
        registro.setEmail(email);
        registro.setContraseña(contraseña);
        registro.setStatus("No premium");
        
        // Obtener la fecha actual
        java.util.Date fechaActual = new java.util.Date(); //es una forma de utilizar la clase sin necesitar una declaracion 'import'
        registro.setFechaRegistro(new Date(fechaActual.getTime()));
        
        // Agregar el orador a la base de datos
        RegistrosDAO registrosDAO = new RegistrosDAO();
        if (!(registrosDAO.verificarUsuario(usuario, contraseña))){
            registrosDAO.agregarUsuario(registro);
        }
        // Redireccionar a la página de visualización de oradores
        if (registrosDAO.obtenerEstado(usuario, contraseña).equals("admin")) {
            response.sendRedirect(request.getContextPath() + "/vistas/verRegistros.jsp");
        }else{
            response.sendRedirect(request.getContextPath() + "/index.html");
        }
            
    }
}
