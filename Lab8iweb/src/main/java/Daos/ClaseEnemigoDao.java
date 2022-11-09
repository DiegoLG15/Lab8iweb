package Daos;

import Beans.ClaseEnemigos;
import Beans.ElementoClase;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;

public class ClaseEnemigoDao {


    public ArrayList<ClaseEnemigos> obtenerListaClases() {

        ArrayList<ClaseEnemigos> listaClases = new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/lab8";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT + FROM clase_enemigos");
            while (rs.next()) {
                ClaseEnemigos claseEnemigos = new ClaseEnemigos();

                claseEnemigos.setIdClase(rs.getInt(1));
                claseEnemigos.setNombre(rs.getString(2));

                listaClases.add(claseEnemigos);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return listaClases;
    }

    public void actualizar(String elemento, float daño, String clase) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/lab8";
        String sql = "UPDATE clase_has_elementos SET daño = ? WHERE Clase idclase_enemigos = ? and Elementos_idElementos = ?";;

        try (Connection connes = this. getConnection();
             PreparedStatement pstm8 = conne8.prepareStatement (sql)) {
            pstm8.setFloat ( parameterIndex: 1, daño);
            pstm8.setString( parameterlndex: 2, clase);
            pstm8.setString ( parameterindex: 3, elemento);
            pstm8.executeUpdate0;
        } catch (SOLException e) ,
        throw new RuntimeException(e);
    }
}