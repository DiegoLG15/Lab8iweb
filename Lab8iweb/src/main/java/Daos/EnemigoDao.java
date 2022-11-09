package Daos;

import Beans.Enemigo;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;

public class EnemigoDao {
    public ArrayList<Enemigo> obtenerListaEnemigos() {

        ArrayList<Enemigo> listaEnemigos = new ArrayList<>();

        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/lab8";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            //ResultSet rs = stmt.executeQuery("SELECT * FROM usuarios");
            ResultSet rs = stmt.executeQuery( "SELECT * FROM lab8.enemigos e\n" +
                    "INNER JOIN lab8.clase_enemigos class\n" +
                    "ON e.clase_enemigos_idclase_enemigos = class.idclase_enemigos\n" +
                    "LEFT JOIN lab8.objeto o\n" +
                    "ON e.objeto_idobjeto = o.idobjeto\n" +
                    "LEFT JOIN lab8.genero g\n" +
                    "ON e.genero_idgenero = g.idgenero");
            while (rs.next()) {
                Enemigo enemigo = new Enemigo();

                enemigo.setIdEnemigo(1);
                enemigo.setNombre(rs.getString(2));
                enemigo.setAtaque(rs.getInt(3));
                enemigo.setExperienciaxDerrota(rs.getInt(  4));
                enemigo.setObjetoDejado(rs.getString("objeto"));
                enemigo.setProbDejarObjeto(rs.getInt(8));
                enemigo.setGenero(rs.getString("genero"));
                enemigo.setClase(rs.getInt("clase_enemigos_idclase_enemigos"));

                listaEnemigos.add(enemigo);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return listaEnemigos;

    }
    public  String obtenerClaseMasComun(){
        String clase = " ";
        ArrayList<Integer> cantClase = new ArrayList<>();
        ArrayList< String > nombreClase = new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/lab8";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            //ResultSet rs = stmt.executeQuery("SELECT * FROM usuarios");
            ResultSet rs = stmt.executeQuery( "SELECT * FROM lab8.enemigos e\n" +
                    "INNER JOIN lab8.clase_enemigos class\n" +
                    "ON e.clase_enemigos_idclase_enemigos = class.idclase_enemigos\n" +
                    "LEFT JOIN lab8.objeto o\n" +
                    "ON e.objeto_idobjeto = o.idobjeto\n" +
                    "LEFT JOIN lab8.genero g\n" +
                    "ON e.genero_idgenero = g.idgenero");
            while (rs.next()) {
                Enemigo enemigo = new Enemigo();
                enemigo.setClase(rs.getInt("clase_enemigos_idclase_enemigos"));
                cantClase.set( enemigo.getClase(), cantClase.get(enemigo.getClase()) + 1);
                nombreClase.set( enemigo.getClase(), rs.getString( "clase_enemigos"));
            }

            int obj = Collections.max(cantClase);
            int index = cantClase.indexOf(obj);
            clase = clase + nombreClase.get(index);


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return clase;

    }
    public  String obtenerObjetoPerdidoMasComun(){
        String objeto = " ";
        ArrayList<Integer> cantObjetoPerdido = new ArrayList<>();
        ArrayList< String > nombreObjetoPerdido = new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/lab8";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            //ResultSet rs = stmt.executeQuery("SELECT * FROM usuarios");
            ResultSet rs = stmt.executeQuery( "SELECT * FROM lab8.enemigos e\n" +
                    "INNER JOIN lab8.clase_enemigos class\n" +
                    "ON e.clase_enemigos_idclase_enemigos = class.idclase_enemigos\n" +
                    "LEFT JOIN lab8.objeto o\n" +
                    "ON e.objeto_idobjeto = o.idobjeto\n" +
                    "LEFT JOIN lab8.genero g\n" +
                    "ON e.genero_idgenero = g.idgenero");
            while (rs.next()) {
                Enemigo enemigo = new Enemigo();
                cantObjetoPerdido.set( rs.getInt("objeto_idobjeto"), cantObjetoPerdido.get(rs.getInt("objeto_idobjeto")) + 1);
                nombreObjetoPerdido.set(rs.getInt("objeto_idobjeto") , rs.getString( "objeto_x_derrota"));
            }

            int obj = Collections.max(cantObjetoPerdido);
            int index = cantObjetoPerdido.indexOf(obj);
            objeto = objeto + nombreObjetoPerdido.get(index);


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return objeto;

    }
    public  double obtenerEnemigosSinGenero(){
        double cantEnemigosSinGenero = 0;
        double cantEnemigosTotal = 0;
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/lab8";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            //ResultSet rs = stmt.executeQuery("SELECT * FROM usuarios");
            ResultSet rs = stmt.executeQuery( "SELECT * FROM lab8.enemigos e\n" +
                    "INNER JOIN lab8.clase_enemigos class\n" +
                    "ON e.clase_enemigos_idclase_enemigos = class.idclase_enemigos\n" +
                    "LEFT JOIN lab8.objeto o\n" +
                    "ON e.objeto_idobjeto = o.idobjeto\n" +
                    "LEFT JOIN lab8.genero g\n" +
                    "ON e.genero_idgenero = g.idgenero");
            while (rs.next()) {
                String resultado = rs.getString( "genero");
                if(resultado=="-"){
                    cantEnemigosSinGenero++;
                }
                cantEnemigosTotal++;
                }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return (cantEnemigosSinGenero/cantEnemigosTotal)*100;

    }
    public void guardarEnemigo(Enemigo enemigo) {

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "INSERT INTO enemigos (nombre, ataque, exp_x_derrota, genero_idgenero, objeto_idobjeto , clase_enemigos_idclase_enemigos, probabilidad_x_objeto) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, enemigo.getNombre());
            pstmt.setInt(2, enemigo.getAtaque());
            pstmt.setInt(3, enemigo.getExperienciaxDerrota());
            pstmt.setFloat(7, enemigo.getProbDejarObjeto());
            pstmt.setString(4, enemigo.getGenero());
            pstmt.setString(5, enemigo.getObjetoDejado());
            pstmt.setInt(6, enemigo.getClase());

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    public void borrarEnemigo(int idEnemigo) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/hr";
        String sql = "DELETE FROM lab8.enemigos WHERE idenemigos = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idEnemigo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void actualizarEnemigo(Enemigo enemigo) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = " ";

        try (Connection connection = DriverManager.getConnection(url,"root","root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, enemigo.getNombre());
            pstmt.setInt(2, enemigo.getAtaque());
            pstmt.setInt(3, enemigo.getExperienciaxDerrota());
            pstmt.setFloat(4, enemigo.getProbDejarObjeto());
            pstmt.setString(6, enemigo.getObjetoDejado());
            pstmt.setInt(7, enemigo.getClase());
            pstmt.setInt(8, enemigo.getIdEnemigo());


            pstmt.executeUpdate();


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
