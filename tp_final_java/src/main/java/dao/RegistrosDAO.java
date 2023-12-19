package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Registro;
import util.ConexionDB;

public class RegistrosDAO {
    public void agregarUsuario(Registro registro) {
        String sql = "INSERT INTO login (usuario, email, contraseña, fecha_registro, estado) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, registro.getUsuario());
            pstmt.setString(2, registro.getEmail());
            pstmt.setString(3, registro.getContraseña());
            pstmt.setDate(4, registro.getFechaRegistro());
            pstmt.setString(5, registro.getStatus());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Registro obtenerPorId(int id) {
        String sql = "SELECT * FROM login WHERE id = ?";
        try (Connection conn = ConexionDB.conectar();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Registro registro = new Registro();
                registro.setId(rs.getInt("id"));
                registro.setUsuario(rs.getString("usuario"));
                registro.setEmail(rs.getString("email"));
                registro.setContraseña(rs.getString("contraseña"));
                registro.setFechaRegistro(rs.getDate("fecha_registro"));
                registro.setStatus(rs.getString("estado"));
                return registro;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean obtenerPorNombre(String usuario) {
        String sql = "SELECT * FROM login WHERE usuario = ?";
        try (Connection conn = ConexionDB.conectar();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, usuario);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    public String obtenerEstado(String usuario) {
        String sql = "SELECT * FROM login WHERE usuario = ?";
        try (Connection conn = ConexionDB.conectar();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, usuario);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getString("estado");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Registro> obtenerTodos() {
        List<Registro> registros = new ArrayList<>();
        String sql = "SELECT * FROM login";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Registro registro = new Registro();
                registro.setId(rs.getInt("id"));
                registro.setUsuario(rs.getString("usuario"));
                registro.setEmail(rs.getString("email"));
                registro.setContraseña(rs.getString("contraseña"));
                registro.setFechaRegistro(rs.getDate("fecha_registro"));
                registro.setStatus(rs.getString("estado"));
                registros.add(registro);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return registros;
    }

    public void actualizarUsuario(Registro registro) {
        String sql = "UPDATE login SET usuario = ?, email = ?, contraseña = ?, fecha_registro = ?, estado = ? WHERE id = ?";
        try (Connection conn = ConexionDB.conectar();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, registro.getUsuario());
            pstmt.setString(2, registro.getEmail());
            pstmt.setString(3, registro.getContraseña());
            pstmt.setDate(4, registro.getFechaRegistro());
            pstmt.setString(5, registro.getStatus());
            pstmt.setInt(6, registro.getId());
            
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void actualizarEstado(String usuario) {
        String sql = "UPDATE login SET estado = ? WHERE usuario = ?";
        try (Connection conn = ConexionDB.conectar();
            PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, "Premium");
            pstmt.setString(2, usuario);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public boolean verificarUsuario(String usuario, String contraseña) {
        String sql = "SELECT * FROM login WHERE usuario = ? and contraseña = ?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, usuario);
            pstmt.setString(2, contraseña);
            ResultSet rs = pstmt.executeQuery();
            System.out.println(rs);
            if (rs.next()) {
                return true;
            }
            else{
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public void eliminarUsuario(int id) {
        String sql = "DELETE FROM login WHERE id = ?";
        try (Connection conn = ConexionDB.conectar();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
