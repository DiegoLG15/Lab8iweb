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
            case ("CatalogoDeObjetos"):
                view = request.getRequestDispatcher("Obj.jsp");
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
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion");
        HeroeDao heroeDao = new HeroeDao();
        Heroe heroe = new Heroe();
        RequestDispatcher requestDispatcher;
        HechizoDao hechizoDao = new HechizoDao();
        Hechizo hechizo= new Hechizo();

        switch (accion) {

            case "guardarHeroe":

                heroe.setIdHeroe(Integer.parseInt(request.getParameter("ID Heroe")));
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
                heroe.setAtaque(Integer.parseInt(request.getParameter("ataque")));
                heroe.setPareja(Integer.parseInt(request.getParameter("pareja")));
                heroe.setGenero(Integer.parseInt(request.getParameter("genero")));
                heroe.setClase(Integer.parseInt(request.getParameter("clase")));

                heroeDao.guardarHeroe(heroe);

                response.sendRedirect(request.getContextPath()+"/MenuServlet?accion=MenuDeHeroes");
                break;

            case "actualizarHeroe":

                heroe.setIdHeroe(Integer.parseInt(request.getParameter("ID Heroe"))); /*colocar los parametros en los botones del jsp*/
                heroe.setNombre(request.getParameter("nombre"));
                heroe.setEdad(Integer.parseInt(request.getParameter("edad")));
                /*colocar if-else para genero y clase despues*/
                heroe.setGenero(Integer.parseInt(request.getParameter("genero")));
                heroe.setClase(Integer.parseInt(request.getParameter("clase")));
                heroe.setNivel(Integer.parseInt(request.getParameter("nivel")));
                heroe.setAtaque(Integer.parseInt(request.getParameter("ataque")));
                heroe.setPareja(Integer.parseInt(request.getParameter("pareja")));


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


            /*case "actualizarParcial":
                String jobId2 = request.getParameter("jobId");
                String jobTitle2 = request.getParameter("jobTitle");
                String minSalaryStr2 = request.getParameter("minSalary");
                int minSalary2 = Integer.parseInt(minSalaryStr2);

                try {
                    daoJob.actualizarParcial(jobId2, jobTitle2, minSalary2);
                    response.sendRedirect(request.getContextPath() + "/JobServlet");
                } catch (SQLException e) {
                    job = daoJob.buscarPorId(jobId2);

                    if (job != null) { //abro el form para editar
                        request.setAttribute("job", job);
                        request.setAttribute("error","El texto no puede tener mas de 255 caractéres");
                        RequestDispatcher requestDispatcher = request.getRequestDispatcher("jobs/formEditarParcial.jsp");
                        requestDispatcher.forward(request, response);
                    } else { //id no encontrado
                        response.sendRedirect(request.getContextPath() + "/JobServlet");
                    }
                }

                break;

            case "buscarHeroe":
                String searchText = request.getParameter("searchText");

                ArrayList<Usuarios> lista = daoUsuarios.buscarUsuarios(searchText);
                request.setAttribute("lista", lista);

                requestDispatcher = request.getRequestDispatcher("AdminListaUsers.jsp");
                requestDispatcher.forward(request, response);

                break;*/
        }
    }


}

