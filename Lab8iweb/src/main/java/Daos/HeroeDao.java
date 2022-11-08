package Daos;

import Beans.Heroe;
import Servlets.Servlet;
import jakarta.servlet.RequestDispatcher;

import java.sql.*;
import java.text.DecimalFormat;
import java.util.ArrayList;
public class HeroeDao {

    public ArrayList<Heroe> obtenerlistaHeroes(){

        ArrayList<Heroe> listaHeroes = new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "SELECT idHeroes,nombre,edad,nivel,puntosDeExperiencia,pareja,genero_idgenero,claseHeroe_idclase,ataque FROM heroes";

        try(Connection connection = DriverManager.getConnection(url,"root","root");
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){
                Heroe heroe = new Heroe();

                heroe.setIdHeroe(rs.getInt(1));
                heroe.setNombre(rs.getString(2));
                heroe.setEdad(rs.getInt(3));
                heroe.setNivel(rs.getInt(  4));
                heroe.setPuntosDeExperiencia(5);
                heroe.setPareja(rs.getInt(6));
                heroe.setGenero(rs.getInt(7));
                heroe.setClase(rs.getInt(8));
                heroe.setAtaque (rs.getInt(9));

                listaHeroes.add(heroe);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaHeroes;
    }

    public ArrayList<Heroe> cantidadNullsParejas(){

        ArrayList<Heroe> listaHeroes = new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "SELECT idHeroes,nombre,edad,nivel,puntosDeExperiencia,pareja,genero_idgenero,claseHeroe_idclase,ataque FROM heroes";

        try(Connection connection = DriverManager.getConnection(url,"root","root");
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){
                Heroe heroe = new Heroe();

                heroe.setIdHeroe(rs.getInt(1));
                heroe.setNombre(rs.getString(2));
                heroe.setEdad(rs.getInt(3));
                heroe.setNivel(rs.getInt(  4));
                heroe.setPuntosDeExperiencia(5);
                heroe.setPareja(rs.getInt(6));
                heroe.setGenero(rs.getInt(7));
                heroe.setClase(rs.getInt(8));
                heroe.setAtaque (rs.getInt(9));

                if (heroe.getPareja()==0){
                    listaHeroes.add(heroe);
                }

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaHeroes;
    }



    public void guardarHeroe(Heroe heroe){

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "INSERT INTO heroes (nombre,edad,nivel,puntosDeExperiencia,pareja,genero_idgenero,claseHeroe_idclase,ataque) VALUES (?,?,?,?,?,?,?,?)";

        try(Connection connection = DriverManager.getConnection(url,"root","root");
            PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1,heroe.getNombre());
            pstmt.setInt(2,heroe.getEdad());
            pstmt.setInt(3,heroe.getNivel());
            pstmt.setDouble(4,heroe.getPuntosDeExperiencia());
            pstmt.setInt(5,heroe.getPareja());
            pstmt.setInt(6,heroe.getGenero());
            pstmt.setInt(7,heroe.getClase());
            pstmt.setInt(8, heroe.getAtaque());

            pstmt.executeUpdate();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void actualizarParejaHeroe(int idHeroe,int parejaId){

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "UPDATE heroes SET pareja = ? WHERE idHeroes = ?";

        try(Connection connection = DriverManager.getConnection(url,"root","root");
            PreparedStatement pstmt = connection.prepareStatement(sql)) {

            ArrayList<Heroe> listaHeroes=obtenerlistaHeroes();

            for (Heroe heroe:listaHeroes){
                if (heroe.getIdHeroe()==parejaId){
                    heroe.setPareja(idHeroe);
                    pstmt.setInt(1,idHeroe);
                    pstmt.setInt(2,parejaId);
                } else if (heroe.getIdHeroe()==0) {
                    pstmt.setNull(1,Types.INTEGER);
                    pstmt.setInt(2, parejaId);
                }
            }


            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void borrarHeroe(int idHeroes){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "DELETE from heroes WHERE idHeroes = ?";

        try(Connection connection = DriverManager.getConnection(url,"root","root");
            PreparedStatement pstmt=connection.prepareStatement(sql))
        {

            pstmt.setInt(1,idHeroes);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public Heroe buscarPorId(int idHeroe){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "SELECT * FROM heroes WHERE  idHeroes= ?";
        Heroe heroe = null;

        try(Connection conn = DriverManager.getConnection(url, "root", "root");
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idHeroe);

            try (ResultSet rs = pstmt.executeQuery()){
                if (rs.next()){
                    heroe = new Heroe();

                    heroe.setIdHeroe(rs.getInt(1));
                    heroe.setNombre(rs.getString(2));
                    heroe.setEdad(rs.getInt(3));
                    heroe.setNivel(rs.getInt(  4));
                    heroe.setPuntosDeExperiencia(rs.getInt(5));
                    heroe.setPareja(rs.getInt(6));
                    heroe.setGenero(rs.getInt(7));
                    heroe.setClase(rs.getInt(8));
                    heroe.setAtaque (rs.getInt(9));
                }
            }

        }
        catch (SQLException e){
            throw new RuntimeException();
        }

        return heroe;
    }
    public void actualizarHeroe(Heroe heroe){

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "UPDATE heroes SET idHeroes = ?, nombre = ?, edad = ?, nivel = ?, puntosDeExperiencia = ?, pareja = ?, genero_idgenero = ?, claseHeroe_idclase = ?,ataque = ? WHERE idHeroes = ?";

        try(Connection connection = DriverManager.getConnection(url,"root","root");
            PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1,heroe.getIdHeroe());
            pstmt.setString(2,heroe.getNombre());
            pstmt.setInt(3,heroe.getEdad());
            pstmt.setInt(4,heroe.getNivel());
            pstmt.setDouble(5,heroe.getPuntosDeExperiencia());
            pstmt.setInt(6,heroe.getPareja());
            pstmt.setInt(7,heroe.getGenero());
            pstmt.setInt(8,heroe.getClase());
            pstmt.setInt(9, heroe.getAtaque());
            pstmt.setInt(10,heroe.getIdHeroe());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
    public ArrayList<Heroe> buscarHeroes(String nombreuser){
        ArrayList<Heroe> listaHeroes = new ArrayList<>();

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "SELECT * FROM heroes WHERE lower(nombre) like ?";

        try(Connection conn = DriverManager.getConnection(url, "root", "root");
            PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, "%"+nombreuser+"%");

            try (ResultSet rs = pstmt.executeQuery()){
                while (rs.next()){
                    Heroe heroe = new Heroe();

                    heroe.setIdHeroe(rs.getInt(1));
                    heroe.setNombre(rs.getString(2));
                    heroe.setEdad(rs.getInt(3));
                    heroe.setNivel(rs.getInt(  4));
                    heroe.setPuntosDeExperiencia(5);
                    heroe.setPareja(rs.getInt(6));
                    heroe.setGenero(rs.getInt(7));
                    heroe.setClase(rs.getInt(8));
                    heroe.setAtaque (rs.getInt(9));

                    listaHeroes.add(heroe);

                }
            }

        }catch (SQLException e){
            throw new RuntimeException();
        }

        return listaHeroes;
    }
}
