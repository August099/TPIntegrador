
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
import javax.servlet.http.HttpSession;

@WebServlet("/vistas/registrarUsuario")
public class registrarUsuarios extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener datos del formulario
        String usuario = request.getParameter("usuario");
        String email = request.getParameter("email");
        String contraseña = request.getParameter("contrasena");
        String contraseña2 = request.getParameter("contrasena2");
        
        // Agregar el usuario a la base de datos
        //primero instanciamos la clase RegistrosDAO para obtener sus metodos
        RegistrosDAO registrosDAO = new RegistrosDAO();
        // verifica que el nombre no este en uso
        if (!(registrosDAO.obtenerPorNombre(usuario)) && usuario.length() > 3){ 
            // verifica que las contraseñas para validar sean iguales
            if (contraseña.equals(contraseña2) && contraseña.length() > 3){
                //verifica que el email tenga un arroba
                if (arroba(email)){
                    //si se cumplio todo, crea una instancia registro y guarda los datos del formulario
                    Registro registro = new Registro();
                    registro.setUsuario(usuario);
                    registro.setEmail(email);
                    registro.setContraseña(contraseña);
                    registro.setStatus("No premium");

                    // Obtener la fecha actual
                    java.util.Date fechaActual = new java.util.Date(); 
                    registro.setFechaRegistro(new Date(fechaActual.getTime()));
                    //agregamos a la base de datos el registro
                    registrosDAO.agregarUsuario(registro);
                    //asigna la sesion con el nombre de usuario
                    HttpSession session = request.getSession();
                    session.setAttribute("usuario", usuario);

                    // Redireccionar a la página de administracion si tiene el estado
                    // "admin" de lo contrario lo redirige al index
                    if (registrosDAO.obtenerEstado(usuario).equals("admin")) {
                        response.sendRedirect(request.getContextPath() + "/vistas/verRegistros.jsp");
                    }else{
                        response.sendRedirect(request.getContextPath() + "/index.jsp");
                    }
                }else{
                    // Autenticación fallida
                    request.setAttribute("error", "email");
                    request.getRequestDispatcher("Registrar.jsp").forward(request, response);
                }
            } else{
                // Autenticación fallida
                if (contraseña.length() > 3) {
                    request.setAttribute("error", "contraseñas");
                    request.getRequestDispatcher("Registrar.jsp").forward(request, response);
                } else{
                    request.setAttribute("error", "Lcontraseñas");
                    request.getRequestDispatcher("Registrar.jsp").forward(request, response);
                }
                
            }
        } else {
            // Autenticación fallida
            if (usuario.length() > 3) {
                request.setAttribute("error", "Nombre de usuario en uso");
                request.getRequestDispatcher("Registrar.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Nombre corto");
                request.getRequestDispatcher("Registrar.jsp").forward(request, response);
            }
            
        }
        
            
    }
    //funcion que comprueba si una cadena tiene el carcter '@'
    private boolean arroba(String email){
        boolean arroba = false;
        for (int i = 0; i < email.length(); i++) {
            if (email.charAt(i) == '@'){
                arroba = true;
            }
        }
        return arroba;
    }
}
