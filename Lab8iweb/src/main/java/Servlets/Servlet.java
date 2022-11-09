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

        String idHeroe;
        String idHechizo;
        String idObjeto;

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

                view = request.getRequestDispatcher(".jsp");
                view.forward(request, response);
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
            case ("borrarHechizo"):
                idHechizo = request.getParameter("id");
                hechizoDao.borrarHechizo(Integer.parseInt(idHechizo));
                response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHechizos");
                break;
            case ("MenuDeObjetos"):

                request.setAttribute("listaObjetos", objetoDao.obtenerlistaObjetos());
                view = request.getRequestDispatcher("listaObjetos.jsp");
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


                heroeDao.actualizarParejaHeroe(heroe.getIdHeroe(),heroe.getPareja());


                heroeDao.actualizarHeroe(heroe);


                response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHeroes");

                break;

            case "guardarHechizo":

                String hechizoID = request.getParameter("idHechizo");
                String nombrehechizo = request.getParameter("nombreHechizo");
                int potencia = Integer.parseInt(request.getParameter("potenciaDeHechizo"));
                int precision= Integer.parseInt(request.getParameter("precisionDeHechizo"));
                int nivelAprendizaje = Integer.parseInt(request.getParameter("nivelAprendizaje"));
                int hechizoBase = Integer.parseInt(request.getParameter("hechizoBase"));
                String elemento = request.getParameter("elemento");

                Hechizo job = new Hechizo();
                job.setIdHechizo(Integer.parseInt(hechizoID));
                job.setNombreHechizo(nombrehechizo);
                job.setPotenciaDeHechizo(potencia);


                response.sendRedirect(request.getContextPath() + "/");
                break;
            case "actualizarHechizo":
                String hechizoID1 = request.getParameter("idHechizo");
                String nombrehechizo1 = request.getParameter("nombreHechizo");
                String potencia1 = request.getParameter("potenciaDeHechizo");
                String precision1 = request.getParameter("precisionDeHechizo");
                String nivelAprendiaje1 = request.getParameter("precisionDeHechizo");
                String hechizoBase1 = request.getParameter("hechizoBase");
                String elemento1 = request.getParameter("elemento");

                try {
                    int hechizoID_int = Integer.parseInt(hechizoID1);
                    int potencia_int = Integer.parseInt(potencia1);
                    int precision_int = Integer.parseInt(precision1);
                    int nivelAprendizaje_int = Integer.parseInt(nivelAprendiaje1);
                    int hechizoBase_int = Integer.parseInt(hechizoBase1);
                    hechizoDao.actualizarHechizo(hechizo);

                    response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHechizos");
                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/JobServlet?action=editar&id=" + hechizoID1);
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
                objeto.setDescripcion(request.getParameter("Efecto/Uso"));
                objeto.setPeso(Double.parseDouble(request.getParameter("Peso")));

                objetoDao.guardarObjeto(objeto);

                response.sendRedirect(request.getContextPath()+"/MenuServlet?accion=MenuDeObjetos");
                break;

            case "actualizarObjeto":

                objeto.setIdobjeto(Integer.parseInt(request.getParameter("ID Objeto")));
                objeto.setObjeto(request.getParameter("Nombre")); /*colocar los parametros en los botones del jsp*/
                objeto.setDescripcion(request.getParameter("Efecto/Uso"));
                objeto.setPeso(Double.parseDouble(request.getParameter("Peso")));

                objetoDao.actualizarObjeto(objeto);

                response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeObjetos");

                break;


        }
    }


}

