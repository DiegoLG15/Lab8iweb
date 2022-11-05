package Daos;

import Beans.Enemigo;
import Beans.Hechizo;

import java.sql.*;
import java.util.ArrayList;

public class HechizoDao {
    public ArrayList<Hechizo> obtenerListaHechizo() {

        ArrayList<Hechizo> listaHechizos = new ArrayList<>();

        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/lab8";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            //ResultSet rs = stmt.executeQuery("SELECT * FROM usuarios");
            ResultSet rs = stmt.executeQuery( "SELECT * FROM hechizos");
            while (rs.next()) {
                Hechizo hechizo = new Hechizo();

                hechizo.setNombre(rs.getString(2));

                hechizo.setPotenciaDeHechizo(rs.getInt(3));
                hechizo.setPrecisionDeHechizo(rs.getInt(  4));
                hechizo.setNivelAprendizaje(rs.getInt(5));
                hechizo.setElemento(rs.getString(6));


                listaHechizos.add(hechizo);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return listaHechizos;

    }

    public void registrarHechizo(Hechizo hechizo) {

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "INSERT INTO enemigos (nombre, potencia, precisión, nivel_aprendizaje, elemento_idelemento) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, hechizo.getNombre());
            pstmt.setInt(2, hechizo.getPotenciaDeHechizo());
            pstmt.setInt(3, hechizo.getPrecisionDeHechizo());
            pstmt.setInt(4, hechizo.getNivelAprendizaje());
            pstmt.setString(5, hechizo.getElemento());

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    public void borrarHechizo(int idHechizo) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "DELETE FROM lab8.hechizos WHERE idhechizo = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idHechizo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
