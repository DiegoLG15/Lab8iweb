package Daos;

import Beans.Hechizo;
import Beans.Heroe;

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
            ResultSet rs = stmt.executeQuery( "SELECT * FROM lab8.hechizos");
            while (rs.next()) {
                Hechizo hechizo = new Hechizo();

                hechizo.setIdHechizo(rs.getInt(1));
                hechizo.setNombreHechizo(rs.getString(2));
                hechizo.setPotenciaDeHechizo(rs.getInt(3));
                hechizo.setPrecisionDeHechizo(rs.getInt(  4));
                hechizo.setNivelAprendizaje(rs.getInt(5));
                hechizo.setHechizoBase(rs.getInt(6));
                hechizo.setIdElemento(rs.getInt(7));

                listaHechizos.add(hechizo);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return listaHechizos;

    }

    public void registrarHechizo(Hechizo hechizo) {

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "INSERT INTO lab8.hechizos (nombre, potencia, precisión, nivel_aprendizaje, hechizos_idhechizos,elemento_idelemento) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, hechizo.getNombreHechizo());
            pstmt.setInt(2, hechizo.getPotenciaDeHechizo());
            pstmt.setInt(3, hechizo.getPrecisionDeHechizo());
            pstmt.setInt(4, hechizo.getNivelAprendizaje());
            pstmt.setInt(5, hechizo.getHechizoBase());
            pstmt.setInt(6, hechizo.getIdElemento());

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
        String sql = "DELETE from lab8.hechizos WHERE idhechizos = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idHechizo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void actualizarHechizo(int IdHechizo, String NombreHechizo,int PotenciaDeHechizo, int PrecisionDeHechizo, int NivelAprendizaje, int HechizoBase, int IdElemento) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "UPDATE lab8.hechizos SET nombre = ?, potencia = ?, precisión = ?, nivel_aprendizaje = ?, hechizos_idhechizos = ?, elemento_idelemento = ?  WHERE idhechizos = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {


            pstmt.setString(1, NombreHechizo);
            pstmt.setInt(2, PotenciaDeHechizo);
            pstmt.setInt(3, PrecisionDeHechizo);
            pstmt.setInt(4, NivelAprendizaje);
            pstmt.setInt(5, HechizoBase);
            pstmt.setInt(6, IdElemento);
            pstmt.setInt(7, IdHechizo);


            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public Hechizo buscarPorIdH(int idHechizo){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "SELECT * FROM lab8.hechizos WHERE idHechizos = ?";
        Hechizo hechizo = null;

        try(Connection conn = DriverManager.getConnection(url, "root", "root");
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idHechizo);

            try (ResultSet rs = pstmt.executeQuery()){
                if (rs.next()){
                    hechizo = new Hechizo();

                    hechizo.setIdHechizo(rs.getInt(1));
                    hechizo.setNombreHechizo(rs.getString(2));
                    hechizo.setPotenciaDeHechizo(rs.getInt(3));
                    hechizo.setPrecisionDeHechizo(rs.getInt(  4));
                    hechizo.setNivelAprendizaje(rs.getInt(5));
                    hechizo.setHechizoBase(rs.getInt(6));
                    hechizo.setIdElemento(rs.getInt(7));
                }
            }

        }
        catch (SQLException e){
            throw new RuntimeException();
        }

        return hechizo;
    }
    public void borrarHechizosMismaBase(int idHechizo){

        ArrayList<Hechizo> listaHechizos=obtenerListaHechizo();
        System.out.println(idHechizo);
        for (Hechizo hechizo1:listaHechizos){
            if(hechizo1.getHechizoBase() == idHechizo){
                borrarHechizosMismaBase(hechizo1.getIdHechizo());
            }
        }
        borrarHechizo(idHechizo);

    }
}

