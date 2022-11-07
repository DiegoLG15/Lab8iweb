package Daos;

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
            ResultSet rs = stmt.executeQuery( "SELECT idhechizos,nombre,potencia,precisión,nivel_aprendizaje, COALESCE(hechizos_idhechizos, ''), elemento FROM lab8.hechizos h\n" +
                    "INNER JOIN lab8.elemento el\n" +
                    "ON h.elemento_idelemento = el.idelemento");
            while (rs.next()) {
                Hechizo hechizo = new Hechizo();

                hechizo.setIdHechizo(rs.getInt(1));
                hechizo.setNombreHechizo(rs.getString(2));
                hechizo.setPotenciaDeHechizo(rs.getInt(3));
                hechizo.setPrecisionDeHechizo(rs.getInt(  4));
                hechizo.setNivelAprendizaje(rs.getInt(5));
                hechizo.setHechizoBase(rs.getInt(6));
                hechizo.setElemento(rs.getString(7));

                listaHechizos.add(hechizo);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return listaHechizos;

    }

    public void registrarHechizo(Hechizo hechizo) {

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "INSERT INTO enemigos (nombre, potencia, precisión, nivel_aprendizaje, hechizos_idhechizos,elemento_idelemento) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, hechizo.getNombreHechizo());
            pstmt.setInt(2, hechizo.getPotenciaDeHechizo());
            pstmt.setInt(3, hechizo.getPrecisionDeHechizo());
            pstmt.setInt(4, hechizo.getNivelAprendizaje());
            pstmt.setInt(5, hechizo.getHechizoBase());
            pstmt.setString(6, hechizo.getElemento());

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
        String sql = "SELECT idhechizos, hechizos_idhechizos FROM lab8.hechizos;\n" +
                "DELETE FROM lab8.hechizos WHERE hechizos_idhechizos=?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idHechizo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



}
