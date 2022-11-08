package Beans;

public class Objeto {
    private int idobjeto;
    private String objeto;
    private String descripcion;
    private double peso;
    private int cantidad;

    public int getIdobjeto() {
        return idobjeto;
    }

    public void setIdobjeto(int idobjeto) {
        this.idobjeto = idobjeto;
    }

    public String getObjeto() {
        return objeto;
    }

    public void setObjeto(String objeto) {
        this.objeto = objeto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}
