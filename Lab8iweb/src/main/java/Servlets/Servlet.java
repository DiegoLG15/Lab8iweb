package Servlets;

import Beans.Enemigo;
import Beans.Hechizo;
import Beans.Heroe;
import Daos.EnemigoDao;
import Daos.HechizoDao;
import Daos.HeroeDao;
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
        String idHeroe;
        String idHechizo;

        switch (accion) {
            case ("MenuPrincipal"):
                view = request.getRequestDispatcher("Index.jsp");
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
            case "borrarHeroe":
                idHeroe = request.getParameter("id");
                heroeDao.borrarHeroe(Integer.parseInt(idHeroe));

                response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHeroes");
                break;
            case "editarHeroe":
                idHeroe = request.getParameter("id");
                heroe = heroeDao.buscarPorId(Integer.parseInt(idHeroe) );

                if (heroe != null) {
                    request.setAttribute("hereoeEditar", heroe);
                    view = request.getRequestDispatcher("editarHeroe.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHeroes");
                }
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
            case ("CatalogoDeObjetos"):
                view = request.getRequestDispatcher("Obj.jsp");
                view.forward(request, response);
                break;
            case ("borrarHechizo"):
                idHechizo = request.getParameter("id");
                hechizoDao.borrarHechizo(Integer.parseInt(idHechizo));
                response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHechizos");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion");
        HeroeDao heroeDao = new HeroeDao();
        Heroe heroe = new Heroe();
        RequestDispatcher requestDispatcher;

        switch (accion) {

            case "guardarHeroe":

                heroe.setNombre(request.getParameter("nombre"));
                heroe.setEdad(Integer.parseInt(request.getParameter("edad")));
                heroe.setNivel(Integer.parseInt(request.getParameter("nivel")));

                int nivel= heroe.getNivel();
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
                heroe.setAtaque(Integer.parseInt(request.getParameter("ataque")));
                heroe.setPareja(Integer.parseInt(request.getParameter("pareja")));

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

                heroeDao.guardarHeroe(heroe);

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


                heroeDao.actualizarHeroe(heroe);

                response.sendRedirect(request.getContextPath() + "/MenuServlet?accion=MenuDeHeroes");

                break;


            case "buscarHeroe":
                String searchText = request.getParameter("searchText");

                ArrayList<Heroe> listaHeroe = heroeDao.buscarHeroes(searchText);
                request.setAttribute("listaHeroes", listaHeroe);

                requestDispatcher = request.getRequestDispatcher("heroe.jsp");
                requestDispatcher.forward(request, response);

                break;
        }
    }


}

