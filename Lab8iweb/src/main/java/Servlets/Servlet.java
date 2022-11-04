package Servlets;

import Beans.Enemigo;
import Beans.Heroe;
import Daos.EnemigoDao;
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

        String accion = request.getParameter("accion")==null?"inicio":request.getParameter("accion");
        RequestDispatcher view;
        HeroeDao heroeDao = new HeroeDao();
        switch (accion) {
            case ("MenuPrincipal"):
                view = request.getRequestDispatcher("MenuPrincipal.jsp");
                view.forward(request, response);
                break;
            case ("MenuDeHeroes"):

                request.setAttribute("listaHeroes", heroeDao.obtenerlistaHeroes());
                view = request.getRequestDispatcher("pruebaListarHeroes.jsp");
                view.forward(request, response);
                break;
            case ("MenuDeEnemigos"):
                view = request.getRequestDispatcher(".jsp");
                view.forward(request, response);
                break;
            case ("MenuDeHechizos"):
                view = request.getRequestDispatcher("D.jsp");
                view.forward(request, response);
                break;
            case ("CatalogoDeObjetos"):
                view = request.getRequestDispatcher("Obj.jsp");
                view.forward(request, response);
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

            case "actualizar":

                heroe.setIdHeroe(Integer.parseInt(request.getParameter("ID Heroe"))); /*colocar los parametros en los botones del jsp*/
                heroe.setNombre(request.getParameter("Nombre"));
                heroe.setEdad(Integer.parseInt(request.getParameter("Apellidos")));
                heroe.setNivel(Integer.parseInt(request.getParameter("Correo PUCP")));
                heroe.setPuntosDeExperiencia(Integer.parseInt(request.getParameter("DNI")));
                heroe.setPareja(request.getParameter("Celular"));
                /*colocar if-else para genero y clase despues*/
                heroe.setGenero(request.getParameter("Categoría"));
                heroe.setClase(request.getParameter("Rol"));
                heroe.setAtaque(Integer.parseInt(request.getParameter("Codigo")));

                heroeDao.actualizarHeroe(heroe);

                response.sendRedirect(request.getContextPath() + "/AdminServlet");

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
