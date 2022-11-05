package Daos;

import Beans.Heroe;

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
        String sql = "SELECT idHeroes,nombre,edad,nivel,puntosDeExperiencia,pareja,genero,clase,ataque FROM heroes,genero,claseheroe Where genero_idgenero=idgenero and claseHeroe_idclase=idclase;";

        try(Connection connection = DriverManager.getConnection(url,"root","root");
            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){

            while(rs.next()){
                Heroe heroe = new Heroe();

                heroe.setIdHeroe(rs.getInt(1));
                heroe.setNombre(rs.getString(2));
                heroe.setEdad(rs.getInt(3));
                heroe.setNivel(rs.getInt(  4));
                int nivel=heroe.getNivel();
                DecimalFormat numeroFormateado = new DecimalFormat("#.00");
                if(nivel>0 && nivel<=15){
                    double puntos=Math.pow(nivel,3) *  (24+(nivel+1.0)/3.0)/50.0;
                    double valorfinal = Math.round(puntos*100d)/100d;
                    heroe.setPuntosDeExperiencia(valorfinal);
                }else if (nivel>=16 && nivel<=35){
                    double puntos=Math.pow(nivel,3) *  (14+nivel)/50.0;
                    double valorfinal = Math.round(puntos*100d)/100d;
                    heroe.setPuntosDeExperiencia(valorfinal);
                }else if (nivel>=36 && nivel<=100){
                    double puntos=Math.pow(nivel,3) *  (32+nivel/2)/50.0;
                    double valorfinal = Math.round(puntos*100d)/100d;
                    heroe.setPuntosDeExperiencia(valorfinal);
                }
                heroe.setPareja(rs.getString(6));
                heroe.setGenero(rs.getString(7));
                heroe.setClase(rs.getString(8));
                heroe.setAtaque (rs.getInt(9));

                listaHeroes.add(heroe);
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
        String sql = "INSERT INTO heroes (idHeroes,nombre,edad,nivel,puntosDeExperiencia,pareja,genero_idgenero,claseHeroe_idclase,ataque) VALUES (?,?,?,?,?,?,?,?,?)";

        try(Connection connection = DriverManager.getConnection(url,"root","root");
            PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1,heroe.getIdHeroe());
            pstmt.setString(2,heroe.getNombre());
            pstmt.setInt(3,heroe.getEdad());
            pstmt.setInt(4,heroe.getNivel());
            pstmt.setDouble(5,heroe.getPuntosDeExperiencia());
            pstmt.setString(6,heroe.getPareja());
            pstmt.setString(7,heroe.getGenero());
            pstmt.setString(8,heroe.getClase());
            pstmt.setNull(9, heroe.getAtaque());

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
                    heroe.setPareja(rs.getString(6));
                    heroe.setGenero(rs.getString(7));
                    heroe.setClase(rs.getString(8));
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
            pstmt.setString(6,heroe.getPareja());
            pstmt.setString(7,heroe.getGenero());
            pstmt.setString(8,heroe.getClase());
            pstmt.setInt(9, heroe.getAtaque());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }
}
