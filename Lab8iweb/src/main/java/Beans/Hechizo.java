package Beans;

public class Hechizo {
    private int idHechizo;
    private String nombreHechizo;
    private int potenciaDeHechizo;
    private int precisionDeHechizo;
    private int nivelAprendizaje;
    private int hechizoBase;
    private String elemento;

    public int getIdHechizo() {
        return idHechizo;
    }

    public void setIdHechizo(int idHechizo) {
        this.idHechizo = idHechizo;
    }

    public String getNombreHechizo() {
        return nombreHechizo;
    }

    public void setNombreHechizo(String nombre) {
        this.nombreHechizo = nombre;
    }

    public int getPotenciaDeHechizo() {
        return potenciaDeHechizo;
    }

    public void setPotenciaDeHechizo(int portenciaDeHechizo) {
        this.potenciaDeHechizo = portenciaDeHechizo;
    }

    public int getPrecisionDeHechizo() {
        return precisionDeHechizo;
    }

    public void setPrecisionDeHechizo(int precisionDeHechizo) {
        this.precisionDeHechizo = precisionDeHechizo;
    }

    public int getNivelAprendizaje() {
        return nivelAprendizaje;
    }

    public void setNivelAprendizaje(int nivelAprendizaje) {
        this.nivelAprendizaje = nivelAprendizaje;
    }

    public int getHechizoBase() {
        return hechizoBase;
    }

    public void setHechizoBase(int hechizoBase) {
        this.hechizoBase = hechizoBase;
    }

    public String getElemento() {
        return elemento;
    }

    public void setElemento(String elemento) {
        this.elemento = elemento;
    }
}
