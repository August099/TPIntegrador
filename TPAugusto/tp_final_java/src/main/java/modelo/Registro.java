
package modelo;

import java.sql.Date;

public class Registro {
    private int id;
    private String usuario;
    private String email;
    private String contraseña;
    private Date fechaRegistro;
    private String status;

    // Constructor
    public Registro() {
    }

    // Getters y setters

    public int getId() {
        return id;
    }

    
    public void setId(int id) {
        this.id = id;
    }

    
    public String getUsuario() {
        return usuario;
    }

    
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    
    public String getEmail() {
        return email;
    }

    
    public void setEmail(String email) {
        this.email = email;
    }

    
    public String getContraseña() {
        return contraseña;
    }

    
    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    
    public Date getFechaRegistro() {
        return fechaRegistro;
    }

    
    public void setFechaRegistro(Date fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    
    public String getStatus() {
        return status;
    }

    
    public void setStatus(String status) {
        this.status = status;
    }

    
}
