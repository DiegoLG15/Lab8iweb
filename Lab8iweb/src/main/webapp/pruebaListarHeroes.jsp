<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.Heroe" %>
<%
    ArrayList<Heroe> listaHeroes = (ArrayList<Heroe>) request.getAttribute("listaHeroes");
%>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>
        <main id="main" data-aos="fade-up">
            <section class="section profile" style="padding-top: 30px">
                <div class="container">
                    <div class="container-fluid">
                        <div class="container"><h4 class="hero">Heroes guardados:</h4>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <a class="btn btn-danger" href="<%=request.getContextPath()%>/AdminServlet?action=crear"
                                   role="button">Añadir nuevo usuario</a>
                            </div>
                        </div>
                        <br>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr style="align-content: center">
                                    <th>N°</th>
                                    <th>Nombres</th>
                                    <th>Edad</th>
                                    <th>Nivel</th>
                                    <th scope="col">puntosDeExperiencia</th>
                                    <th scope="col">pareja</th>
                                    <th scope="col">genero</th>
                                    <th scope="col">clase</th>
                                    <th scope="col">ataque</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%

                                    for (Heroe heroe : listaHeroes) {
                                %>
                                <tr>
                                    <td>
                                        <%=heroe.getIdHeroe()%>
                                    </td>
                                    <td>
                                        <%=heroe.getNombre()%>
                                    </td>
                                    <td>
                                        <%=heroe.getEdad()%>
                                    </td>
                                    <td>
                                        <%=heroe.getNivel()%>
                                    </td>
                                    <td>
                                        <%=heroe.getPuntosDeExperiencia()%>
                                    </td>
                                    <td>
                                        <%=heroe.getPareja()%>
                                    </td>
                                    <td>
                                        <%=heroe.getGenero()%>
                                    </td>
                                    <td>
                                        <%=heroe.getClase()%>
                                    </td>
                                    <td>
                                        <%=heroe.getAtaque()%>
                                    </td>
                                    <td>

                                        <a type="button" class="btn btn-primary"
                                           href="<%=request.getContextPath()%>/AdminServlet?action=editarHeroe&id<%=heroe.getIdHeroe()%>>">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor"
                                                 class="bi bi-pencil" viewBox="0 0 16 16">
                                                <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"></path>
                                            </svg>
                                        </a>

                                        <a type="button" class="btn btn-danger"
                                           onclick="return confirm('¿Estas seguro(a) que deseas borrar?')"
                                           href="<%=request.getContextPath()%>/AdminServlet?action=borrar&id">
                                            <i class="bi bi-trash"></i></a>

                                    </td>
                                    <%

                                        }
                                    %>

                                </tr>


                            </tbody>
                        </table>
                    </div>
                </div>

                <nav aria-label="Page navigation example" style="margin-top: 20px;">
                    <ul class="pagination justify-content-center">
                        <li class="page-item"><a class="page-link" href="#" tabindex="-1">Previous</a></li>
                        <li class="page-item"><a class="page-link"
                                                 href="<%=request.getContextPath()%>/AdminServlet">1</a></li>
                        <li class="page-item"><a class="page-link"
                                                 href="<%=request.getContextPath()%>/AdminServlet?action=page">2</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
            </section>

        </main><!-- End #main -->
    </body>
</html>
