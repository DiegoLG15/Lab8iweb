package Servlets;

import Beans.Enemigo;
import Beans.Hechizo;
import Beans.Heroe;
import Beans.Objeto;
import Daos.EnemigoDao;
import Daos.HechizoDao;
import Daos.HeroeDao;
import Daos.ObjetoDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.text.DecimalFormat;
import java.util.ArrayList;

@WebServlet(name = "Servlet", value = "/MenuServlet")
public class Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion");
        RequestDispatcher view;
        HeroeDao heroeDao = new HeroeDao();
        Heroe heroe= new Heroe();
        HechizoDao hechizoDao = new HechizoDao();
        Hechizo hechizo= new Hechizo();
        ObjetoDao objetoDao=new ObjetoDao();
        Objeto objeto=new Objeto();
        Enemigo enemigo = new Enemigo();
        EnemigoDao enemigoDao= new EnemigoDao();


        String idHeroe;
        String idHeroeObjeto;
        String idHechizo;
        String idObjeto;
        String idEnemigo;


        switch (accion) {
            case ("MenuPrincipal"):
                view = request.getRequestDispatcher("index.jsp");
                view.forward(request, response);
                break;
            case ("MenuDeHeroes"):

                request.setAttribute("listaHeroes", heroeDao.obtenerlistaHeroes());
                view = request.getRequestDispatcher("heroe.jsp");
                view.forward(request, response);
                break;
            case "crearHeroe":

                view = request.getRequestDispatcher("añadirHeroe.jsp");
                view.forward(request, response);

                break;
            case "editarHeroe":
                idHeroe = request.getParameter("id");
                heroe = heroeDao.buscarPorId(Integer.parseInt(idHeroe) );
                /*ArrayList lista=heroeDao.obtenerlistaHeroes();
                int cantidad=lista.size();*/

                if (heroe != null) {
                    request.setAttribute("hereoeEditar", heroe);
                    view = request.getRequestDispatcher("editarHeroe.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHeroes");
                }
                break;
            case ("borrarHeroe"):
                idHeroe = request.getParameter("id");
                heroeDao.borrarHeroe(Integer.parseInt(idHeroe));
                response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHeroes");
                break;
            case ("MenuDeEnemigos"):
                request.setAttribute("listaEnemigo", enemigoDao.obtenerListaEnemigos());
                view = request.getRequestDispatcher("enemigo.jsp");
                view.forward(request, response);
                break;

            case "crearEnemigo":
                view = request.getRequestDispatcher("añadirEnemigo.jsp");
                view.forward(request, response);
                break;
            case "editarEnemigo":
                idHeroe = request.getParameter("id");
                heroe = heroeDao.buscarPorId(Integer.parseInt(idHeroe) );
                if (enemigo != null) {
                    request.setAttribute("enemigoEditar", heroe);
                    view = request.getRequestDispatcher("editarEnemigo.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeEnemigos");
                }
                break;
            case ("borrarEnemigo"):
                idHeroe = request.getParameter("id");
                heroeDao.borrarHeroe(Integer.parseInt(idHeroe));
                response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeEnemigos");
                break;
            case ("claseEnemigoComun"):
                request.setAttribute("claseComun", enemigoDao.obtenerClaseMasComun());
                view = request.getRequestDispatcher("editarEnemigo.jsp");
                view.forward(request, response);
                break;
            case ("ObjetoPerdidoComun"):
                request.setAttribute("objetoComun", enemigoDao.obtenerObjetoPerdidoMasComun());
                view = request.getRequestDispatcher("editarEnemigo.jsp");
                view.forward(request, response);
                break;

            case ("enemigoSinGenero"):
                request.setAttribute("enemigoGenero", enemigoDao.obtenerEnemigosSinGenero());
                view = request.getRequestDispatcher("editarEnemigo.jsp");
                view.forward(request, response);
                break;

            case "listaObjetosDeHeroe":
                idHeroeObjeto = request.getParameter("id");
                heroe = heroeDao.buscarPorId(Integer.parseInt(idHeroeObjeto));

                if (heroe != null) {
                    request.setAttribute("hereoeEditar", heroe);
                    view = request.getRequestDispatcher("inventarioHeroe.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHeroes");
                }
                break;
            case ("MenuDeHechizos"):
                request.setAttribute("listaHechizos", hechizoDao.obtenerListaHechizo());
                view = request.getRequestDispatcher("hechizo.jsp");
                view.forward(request, response);
                break;

            case ("crearHechizo"):
                view = request.getRequestDispatcher("añadirHechizo.jsp");
                view.forward(request, response);
                break;
            case ("editarHechizo"):
                idHechizo = request.getParameter("id");
                hechizo = hechizoDao.buscarPorIdH(Integer.parseInt(idHechizo));

                if (hechizo != null) { //abro el form para editar
                    request.setAttribute("hechizoEditar", hechizo);
                    view = request.getRequestDispatcher("editarHechizo.jsp");
                    view.forward(request, response);
                } else { //id no encontrado
                    response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHechizos");
                }
                break;
            case ("borrarHechizo"):
                idHechizo = request.getParameter("id");
                hechizoDao.borrarHechizosMismaBase(Integer.parseInt(idHechizo));
                response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHechizos");
                break;
            case ("MenuDeObjetos"):

                request.setAttribute("listaObjetos", objetoDao.obtenerlistaObjetos());
                view = request.getRequestDispatcher("listaObjetos.jsp");
                view.forward(request, response);
                break;

            case "ordenarPorNombre":

                request.setAttribute("listaObjetos", objetoDao.obtenerlistaObjetosPorNombre());
                view = request.getRequestDispatcher("listaObjetosPorNombre.jsp");
                view.forward(request, response);
                break;

            case ("crearObjeto"):
                view = request.getRequestDispatcher("añadirObjeto.jsp");
                view.forward(request, response);
                break;
            case "editarObjeto":
                idObjeto = request.getParameter("id");
                objeto = objetoDao.buscarPorId(Integer.parseInt(idObjeto) );


                if (objeto != null) {
                    request.setAttribute("objetoEditar", objeto);
                    view = request.getRequestDispatcher("editarObjeto.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeObjetos");
                }
                break;

            case ("borrarObjeto"):
                idObjeto = request.getParameter("id");
                objetoDao.borrarObjeto(Integer.parseInt(idObjeto));
                response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeObjetos");
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion");
        HeroeDao heroeDao = new HeroeDao();
        HechizoDao hechizoDao = new HechizoDao();
        ObjetoDao objetoDao=new ObjetoDao();
        Heroe heroe = new Heroe();
        Hechizo hechizo= new Hechizo();
        Objeto objeto=new Objeto();
        Enemigo enemigo = new Enemigo();
        EnemigoDao enemigoDao = new EnemigoDao();
        RequestDispatcher requestDispatcher;


        switch (accion) {


            case "guardarHeroe":

                heroe.setNombre(request.getParameter("nombre"));
                heroe.setEdad(Integer.parseInt(request.getParameter("edad")));
                heroe.setNivel(Integer.parseInt(request.getParameter("nivel")));

                int nivel=Integer.parseInt(request.getParameter("nivel"));
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

                if(request.getParameter("genero").equals("Hombre")){
                    heroe.setGenero(1);
                }else if (request.getParameter("genero").equals("Mujer")){
                    heroe.setGenero(2);
                }else if (request.getParameter("genero").equals("Otro")){
                    heroe.setGenero(3);
                }


                if(request.getParameter("clase").equals("Normal")){
                    heroe.setClase(1);
                }else if (request.getParameter("clase").equals("Sayayin")){
                    heroe.setClase(2);
                }else if (request.getParameter("clase").equals("Hechicero")){
                    heroe.setClase(3);
                }else if (request.getParameter("clase").equals("Androide")){
                    heroe.setClase(4);
                }else if (request.getParameter("clase").equals("Namekusein")){
                    heroe.setClase(5);
                }else if (request.getParameter("clase").equals("Guerrero")){
                    heroe.setClase(6);
                }else if (request.getParameter("clase").equals("Zombie")){
                    heroe.setClase(7);
                }else if (request.getParameter("clase").equals("Ninja")){
                    heroe.setClase(8);
                }else if (request.getParameter("clase").equals("Fantasma")){
                    heroe.setClase(9);
                }else if (request.getParameter("clase").equals("Robot")){
                    heroe.setClase(10);
                }
                heroe.setNivel(Integer.parseInt(request.getParameter("nivel")));
                heroe.setAtaque(Integer.parseInt(request.getParameter("ataque")));
                heroe.setPareja(Integer.parseInt(request.getParameter("pareja")));
                if (heroe.getPareja()>0){
                    heroe.setPareja(Integer.parseInt(request.getParameter("pareja")));
                }else {
                    heroe.setPareja(Types.INTEGER);
                }



                heroeDao.guardarHeroe(heroe);

                /*heroeDao.actualizarParejaHeroe(heroe.getIdHeroe(),heroe.getPareja()); no funciona*/



                response.sendRedirect(request.getContextPath()+"/MenuServlet?accion=MenuDeHeroes");
                break;

            case "actualizarHeroe":

                heroe.setIdHeroe(Integer.parseInt(request.getParameter("ID Heroe"))); /*colocar los parametros en los botones del jsp*/
                heroe.setNombre(request.getParameter("nombre"));
                heroe.setEdad(Integer.parseInt(request.getParameter("edad")));


                if(request.getParameter("genero").equals("Hombre")){
                    heroe.setGenero(1);
                }else if (request.getParameter("genero").equals("Mujer")){
                    heroe.setGenero(2);
                }else if (request.getParameter("genero").equals("Otro")){
                    heroe.setGenero(3);
                }

                if(request.getParameter("clase").equals("Normal")){
                    heroe.setClase(1);
                }else if (request.getParameter("clase").equals("Sayayin")){
                    heroe.setClase(2);
                }else if (request.getParameter("clase").equals("Hechicero")){
                    heroe.setClase(3);
                }else if (request.getParameter("clase").equals("Androide")){
                    heroe.setClase(4);
                }else if (request.getParameter("clase").equals("Namekusein")){
                    heroe.setClase(5);
                }else if (request.getParameter("clase").equals("Guerrero")){
                    heroe.setClase(6);
                }else if (request.getParameter("clase").equals("Zombie")){
                    heroe.setClase(7);
                }else if (request.getParameter("clase").equals("Ninja")){
                    heroe.setClase(8);
                }else if (request.getParameter("clase").equals("Fantasma")){
                    heroe.setClase(9);
                }else if (request.getParameter("clase").equals("Robot")){
                    heroe.setClase(10);
                }
                heroe.setNivel(Integer.parseInt(request.getParameter("nivel")));
                heroe.setAtaque(Integer.parseInt(request.getParameter("ataque")));
                heroe.setPareja(Integer.parseInt(request.getParameter("pareja")));

                if (heroe.getPareja()>0){
                    heroe.setPareja(Integer.parseInt(request.getParameter("pareja")));
                }else {
                    heroe.setPareja(Types.INTEGER);
                }


                heroeDao.actualizarParejaHeroe(heroe.getIdHeroe(),heroe.getPareja());


                heroeDao.actualizarHeroe(heroe);


                response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHeroes");

                break;

            case "guardarHechizo":


                String nombrehechizo = request.getParameter("nombreHechizo");
                int potencia = Integer.parseInt(request.getParameter("potenciaDeHechizo"));
                int precision= Integer.parseInt(request.getParameter("precisionDeHechizo"));
                int nivelAprendizaje = Integer.parseInt(request.getParameter("nivelAprendizaje"));
                int hechizoBase = Integer.parseInt(request.getParameter("hechizoBase"));

                hechizo.setNombreHechizo(nombrehechizo);
                hechizo.setPotenciaDeHechizo(potencia);
                hechizo.setPrecisionDeHechizo(precision);
                hechizo.setNivelAprendizaje(nivelAprendizaje);
                hechizo.setHechizoBase(hechizoBase);

                if (request.getParameter("elemento").equals("Fuego")){
                    hechizo.setIdElemento(1);
                }else if(request.getParameter("elemento").equals("Tierra")){
                    hechizo.setIdElemento(2);
                }else if(request.getParameter("elemento").equals("Agua")){
                    hechizo.setIdElemento(3);
                }else if(request.getParameter("elemento").equals("Viento")){
                    hechizo.setIdElemento(4);
                }else if(request.getParameter("elemento").equals("Void")){
                    hechizo.setIdElemento(5);
                }

                hechizoDao.registrarHechizo(hechizo);
                response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHechizos");
                break;
            case "actualizarHechizo":
                String hechizoID1 = request.getParameter("idHechizo");
                String nombrehechizo1 = request.getParameter("nombreHechizo");
                String potencia1 = request.getParameter("potencia");
                String precision1 = request.getParameter("precision");
                String nivelAprendiaje1 = request.getParameter("nivelAprendizaje");
                String hechizoBase1 = request.getParameter("hechizoBase");
                String elemento1 = request.getParameter("elemento");

                try {
                    int hechizoID_int = Integer.parseInt(hechizoID1);
                    int potencia_int = Integer.parseInt(potencia1);
                    int precision_int = Integer.parseInt(precision1);
                    int nivelAprendizaje_int = Integer.parseInt(nivelAprendiaje1);
                    int hechizoBase_int = Integer.parseInt(hechizoBase1);
                    int elemento_int = 0;

                    if(elemento1.equals("Fuego")){
                        elemento_int = 1;
                    }else if (elemento1.equals("Tierra")){
                        elemento_int = 2;
                    }else if (elemento1.equals("Agua")){
                        elemento_int = 3;
                    }else if (elemento1.equals("Viento")){
                        elemento_int = 4;
                    } else if (elemento1.equals("Void")){
                        elemento_int = 5;
                    }

                    hechizoDao.actualizarHechizo(hechizoID_int,nombrehechizo1,potencia_int,precision_int,nivelAprendizaje_int,hechizoBase_int, elemento_int);

                    response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHechizos");
                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=editarHechizo&id=" + hechizoID1);
                }
                break;
            case "buscarHeroe":
                String searchText = request.getParameter("searchText");
                ArrayList<Heroe> listaHeroe = heroeDao.buscarHeroes(searchText);
                request.setAttribute("listaHeroes", listaHeroe);
                requestDispatcher = request.getRequestDispatcher("heroe.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "guardarObjeto":

                objeto.setObjeto(request.getParameter("Nombre"));

                ArrayList<Objeto> listaObjetos=objetoDao.obtenerlistaObjetos();
                for(Objeto objeto1: listaObjetos){

                    if (objeto1.getObjeto().toLowerCase().equals(objeto.getObjeto().toLowerCase())){
                        response.sendRedirect(request.getContextPath()+"/MenuServlet?accion=MenuDeObjetos");
                        break;

                    }else{

                        objeto.setDescripcion(request.getParameter("Efecto/Uso"));
                        objeto.setPeso(Double.parseDouble(request.getParameter("Peso")));

                        objetoDao.guardarObjeto(objeto);

                        response.sendRedirect(request.getContextPath()+"/MenuServlet?accion=MenuDeObjetos");
                        break;
                    }

                }
                break;


            case "actualizarObjeto":

                objeto.setIdobjeto(Integer.parseInt(request.getParameter("ID Objeto")));
                objeto.setObjeto(request.getParameter("Nombre")); /*colocar los parametros en los botones del jsp*/
                objeto.setDescripcion(request.getParameter("Efecto/Uso"));
                objeto.setPeso(Double.parseDouble(request.getParameter("Peso")));

                objetoDao.actualizarObjeto(objeto);

                response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeObjetos");

                break;

            case "guardarEnemigo":

                enemigo.setNombre(request.getParameter("nombre"));
                enemigo.setClase(Integer.parseInt(request.getParameter("clase")));
                enemigo.setAtaque(Integer.parseInt(request.getParameter("ataque")));
                enemigo.setExperienciaxDerrota(Integer.parseInt(request.getParameter("experienciaDerrota")));
                enemigo.setObjetoDejado(request.getParameter("obejtoPerdido"));
                enemigo.setProbDejarObjeto(Float.parseFloat(request.getParameter("probabilidadDejarObjeto")));
                if(request.getParameter("genero").equals("Hombre")){
                    enemigo.setGenero(String.valueOf(1));
                }else if (request.getParameter("genero").equals("Mujer")){
                    enemigo.setGenero(String.valueOf(2));
                }else if (request.getParameter("genero").equals("Otro")){
                    enemigo.setGenero(String.valueOf(3));
                }


                if(request.getParameter("clase").equals("Dragon")){
                    enemigo.setClase(1);
                }else if (request.getParameter("clase").equals("Fantasma")){
                    enemigo.setClase(2);
                }else if (request.getParameter("clase").equals("Demonio")){
                    enemigo.setClase(3);
                }else if (request.getParameter("clase").equals("Pez")){
                    enemigo.setClase(4);
                }else if (request.getParameter("clase").equals("Humano")){
                    enemigo.setClase(5);
                }else if (request.getParameter("clase").equals("Bestia")){
                    enemigo.setClase(6);
                }else if (request.getParameter("clase").equals("Ave")){
                    enemigo.setClase(7);
                }else if (request.getParameter("clase").equals("Otros")){
                    enemigo.setClase(8);}

                enemigoDao.guardarEnemigo(enemigo);


                response.sendRedirect(request.getContextPath()+"/MenuServlet?accion=MenuDeEnemigos");
                break;

            case "actualizarEnemigo":

                enemigo.setIdEnemigo(Integer.parseInt(request.getParameter("ID Enemigo"))); /*colocar los parametros en los botones del jsp*/
                enemigo.setNombre(request.getParameter("nombre"));
                enemigo.setClase(Integer.parseInt(request.getParameter("clase")));
                enemigo.setAtaque(Integer.parseInt(request.getParameter("ataque")));
                enemigo.setExperienciaxDerrota(Integer.parseInt(request.getParameter("experienciaDerrota")));
                enemigo.setObjetoDejado(request.getParameter("obejtoPerdido"));
                enemigo.setProbDejarObjeto(Float.parseFloat(request.getParameter("probabilidadDejarObjeto")));
                if(request.getParameter("genero").equals("Hombre")){
                    enemigo.setGenero(String.valueOf(1));
                }else if (request.getParameter("genero").equals("Mujer")){
                    enemigo.setGenero(String.valueOf(2));
                }else if (request.getParameter("genero").equals("Otro")){
                    enemigo.setGenero(String.valueOf(3));
                }

                if(request.getParameter("clase").equals("Dragon")){
                    enemigo.setClase(1);
                }else if (request.getParameter("clase").equals("Fantasma")){
                    enemigo.setClase(2);
                }else if (request.getParameter("clase").equals("Demonio")){
                    enemigo.setClase(3);
                }else if (request.getParameter("clase").equals("Pez")){
                    enemigo.setClase(4);
                }else if (request.getParameter("clase").equals("Humano")){
                    enemigo.setClase(5);
                }else if (request.getParameter("clase").equals("Bestia")){
                    enemigo.setClase(6);
                }else if (request.getParameter("clase").equals("Ave")){
                    enemigo.setClase(7);
                }else if (request.getParameter("clase").equals("Otros")){
                    enemigo.setClase(8);}

                enemigoDao.actualizarEnemigo(enemigo);


                response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeEnemigos");

                break;

        }
    }


}

