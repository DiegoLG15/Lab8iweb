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
}
