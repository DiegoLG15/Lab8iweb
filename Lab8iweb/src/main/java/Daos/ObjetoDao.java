package Daos;

import Beans.Heroe;
import Beans.Objeto;

import java.sql.*;
import java.util.ArrayList;

public class ObjetoDao {

    public ArrayList<Objeto> obtenerlistaObjetos(){

        ArrayList<Objeto> listaObjetos= new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "SELECT idobjeto,objeto,descripcion,peso FROM objeto";

        try(Connection connection = DriverManager.getConnection(url,"root","root");
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){
                Objeto objeto = new Objeto();

                objeto.setIdobjeto(rs.getInt(1));
                objeto.setObjeto(rs.getString(2));
                objeto.setDescripcion(rs.getString(3));
                objeto.setPeso(rs.getDouble(  4));

                listaObjetos.add(objeto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaObjetos;
    }

    public ArrayList<Objeto> obtenerlistaObjetosPorNombre(){

        ArrayList<Objeto> listaObjetos= new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "SELECT idobjeto,objeto,descripcion,peso FROM objeto ORDER BY objeto";

        try(Connection connection = DriverManager.getConnection(url,"root","root");
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){
                Objeto objeto = new Objeto();

                objeto.setIdobjeto(rs.getInt(1));
                objeto.setObjeto(rs.getString(2));
                objeto.setDescripcion(rs.getString(3));
                objeto.setPeso(rs.getDouble(  4));

                listaObjetos.add(objeto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaObjetos;
    }
    public void guardarObjeto(Objeto objeto){

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "INSERT INTO objeto (objeto,descripcion,peso) VALUES (?,?,?)";

        try(Connection connection = DriverManager.getConnection(url,"root","root");
            PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1,objeto.getObjeto());
            pstmt.setString(2,objeto.getDescripcion());
            pstmt.setDouble(3,objeto.getPeso());

            pstmt.executeUpdate();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Objeto buscarPorId(int idObjeto){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "SELECT * FROM objeto WHERE  idobjeto= ?";
        Objeto objeto = null;

        try(Connection conn = DriverManager.getConnection(url, "root", "root");
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idObjeto);

            try (ResultSet rs = pstmt.executeQuery()){
                if (rs.next()){
                    objeto = new Objeto();

                    objeto.setIdobjeto(rs.getInt(1));
                    objeto.setObjeto(rs.getString(2));
                    objeto.setDescripcion(rs.getString(3));
                    objeto.setPeso(rs.getDouble(  4));
                }
            }

        }
        catch (SQLException e){
            throw new RuntimeException();
        }

        return objeto;
    }

    public void actualizarObjeto(Objeto objeto){

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "UPDATE objeto SET idobjeto=?, objeto = ?, descripcion = ?, peso = ? WHERE idobjeto = ?";

        try(Connection connection = DriverManager.getConnection(url,"root","root");
            PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1,objeto.getIdobjeto());
            pstmt.setString(2,objeto.getObjeto());
            pstmt.setString(3,objeto.getDescripcion());
            pstmt.setDouble(4,objeto.getPeso());
            pstmt.setInt(5,objeto.getIdobjeto());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public void borrarObjeto(int idObjeto){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "DELETE from objeto WHERE idobjeto = ?";

        try(Connection connection = DriverManager.getConnection(url,"root","root");
            PreparedStatement pstmt=connection.prepareStatement(sql))
        {

            pstmt.setInt(1,idObjeto);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
