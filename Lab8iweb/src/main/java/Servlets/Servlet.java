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
            case "guardar":

                heroe.setIdHeroe(Integer.parseInt("idHeroe"));
                heroe.setNombre(request.getParameter("Nombres"));
                heroe.setEdad(Integer.parseInt(request.getParameter("Edad")));
                heroe.setNivel(Integer.parseInt(request.getParameter("Correo PUCP")));
                heroe.setPuntosDeExperiencia(Double.parseDouble(request.getParameter("DNI")));
                heroe.setPareja(request.getParameter("Celular"));
                heroe.setGenero(request.getParameter("Categoría"));
                heroe.setClase(request.getParameter("Rol"));
                heroe.setAtaque(Integer.parseInt(request.getParameter("Codigo")));

                heroeDao.guardarHeroe(heroe);

                response.sendRedirect(request.getContextPath()+"/MenuServlet");
                break;
            case "editarHeroe":
                idHeroe = request.getParameter("id");
                heroe = heroeDao.buscarPorId(Integer.parseInt(idHeroe) );

                if (heroe != null) {
                    request.setAttribute("hereoeEditar", heroe);
                    view = request.getRequestDispatcher("editarHeroe.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/AdminServlet");
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

            case "actualizarHeroe":

                heroe.setIdHeroe(Integer.parseInt(request.getParameter("ID Heroe"))); /*colocar los parametros en los botones del jsp*/
                heroe.setNombre(request.getParameter("nombre"));
                heroe.setEdad(Integer.parseInt(request.getParameter("edad")));
                heroe.setNivel(Integer.parseInt(request.getParameter("genero")));
                heroe.setPuntosDeExperiencia(Integer.parseInt(request.getParameter("clase")));
                heroe.setPareja(request.getParameter("nivel"));
                /*colocar if-else para genero y clase despues*/
                heroe.setGenero(request.getParameter("ataque"));
                heroe.setClase(request.getParameter("pareja"));

                heroeDao.actualizarHeroe(heroe);

                response.sendRedirect(request.getContextPath() + "/MenuServlet");

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

            case "buscar":
                String searchText = request.getParameter("searchText");

                ArrayList<Usuarios> lista = daoUsuarios.buscarUsuarios(searchText);
                request.setAttribute("lista", lista);

                requestDispatcher = request.getRequestDispatcher("AdminListaUsers.jsp");
                requestDispatcher.forward(request, response);

                break;*/
        }
    }


}

