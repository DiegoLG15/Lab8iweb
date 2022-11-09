<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Beans.Heroe" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    ArrayList<Heroe> listaHeroes = (ArrayList<Heroe>) request.getAttribute("listaHeroes");
%>
<!DOCTYPE html>
<html lang="en">
    <head>


        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <script src="https://kit.fontawesome.com/600382161a.js" crossorigin="anonymous"></script>
        <title>Heroes</title>
        <style>
            body {
                background: url(https://img.freepik.com/premium-photo/unicorn-background-with-rainbow-sky-fantasy-colorful-space-galaxy-illustration_71374-1570.jpg?w=2000);
                background-position: center center;
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                margin: 0;
                height: 100vh;
                bgcolor : "#800000";
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <header class="d-flex p-2" style="background-color: rgba(255,255,255,0.6)">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
                        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
                    </a>
                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <h4><li><a href="#" class="nav-link px-2"><b style="color:#144C47">WIKI FANTASIA</b></a></li></h4>
                        <!--
                        <div class="dropdown text-end">
                            <a href="#" class="d-block link-dark text-decoration-none" aria-expanded="false">
                                <img src="http://diaferdesign.com/wp-content/uploads/2017/11/diana-fondo-desenfocado-circular-300x283.png" alt="mdo" width="32" height="32" class="rounded-circle">
                            </a>
                        </div>
                        -->
                    </ul>
                </div>
            </div>
        </header>
        <br><br>
        <div class="boxed-page">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container">
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/MenuServlet?accion=MenuPrincipal" >
                        <!-- this anchor text for link your home to another page -->
                        <center>
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" class="ionicon" viewBox="0 0 512 512"><title>Game Controller</title><path d="M467.51 248.83c-18.4-83.18-45.69-136.24-89.43-149.17A91.5 91.5 0 00352 96c-26.89 0-48.11 16-96 16s-69.15-16-96-16a99.09 99.09 0 00-27.2 3.66C89 112.59 61.94 165.7 43.33 248.83c-19 84.91-15.56 152 21.58 164.88 26 9 49.25-9.61 71.27-37 25-31.2 55.79-40.8 119.82-40.8s93.62 9.6 118.66 40.8c22 27.41 46.11 45.79 71.42 37.16 41.02-14.01 40.44-79.13 21.43-165.04z" fill="none" stroke="currentColor" stroke-miterlimit="10" stroke-width="32"/><circle cx="292" cy="224" r="20"/><path d="M336 288a20 20 0 1120-19.95A20 20 0 01336 288z"/><circle cx="336" cy="180" r="20"/><circle cx="380" cy="224" r="20"/><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="32" d="M160 176v96M208 224h-96"/></svg><!-- this is home icon link get form fornt-awesome icon for home button --><!-- copy and paste the home icon link here for hover effect -->
                            </div>
                        </center>
                        <div class="name"><span data-text="Inicio">Inicio</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/MenuServlet?accion=MenuDeHeroes">
                        <!-- this anchor text for link your home to another page -->
                        <center>
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" height="48" width="48"><path d="m38.45 43.6-6.2-6.2-4.4 4.4-2.15-2.15q-.85-.85-.85-2.1t.85-2.1l9.95-9.95q.85-.85 2.1-.85t2.1.85L42 27.65l-4.4 4.4 6.15 6.2q.45.45.45 1.05 0 .6-.45 1.05l-3.2 3.25q-.45.45-1.05.45-.6 0-1.05-.45ZM44 11.8 21.35 34.45l.95 1q.85.85.85 2.1t-.85 2.1l-2.15 2.15-4.4-4.4-6.2 6.2q-.45.45-1.05.45-.6 0-1.05-.45L4.2 40.35q-.45-.45-.45-1.05 0-.6.45-1.05l6.2-6.2-4.4-4.4 2.15-2.15q.85-.85 2.1-.85t2.1.85l1 .95L36 3.8h8Zm-28 7.8 1.9-1.9 1.9-1.9-1.9 1.9Zm-2.1 2.1L4 11.8v-8h8l9.9 9.9-2.1 2.1-9.05-9H7v3.75l9 9.05Zm5.25 10.6L41 10.55V6.8h-3.75L15.4 28.55Zm0 0-1.85-1.9-1.9-1.85 1.9 1.85 1.85 1.9Z"/></svg><!-- copy and paste the home icon link here for hover effect -->
                            </div>
                        </center>
                        <div class="name"><span data-text="Menu Heroes">Heroes</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/MenuServlet?accion=MenuDeEnemigos">
                        <!-- this anchor text for link your home to another page -->
                        <center>
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" height="48" width="48"><path d="M7 40q-1.2 0-2.1-.9Q4 38.2 4 37v-6.6h3V37h6.6v3Zm10.85-7.75 2.3-11.75-5 2.35v6.7h-3V20.8l8.2-3.45q1.6-.7 2.275-.875Q23.3 16.3 24 16.3q1 0 1.775.425.775.425 1.325 1.275l2.1 3.35q.1.15.225.325.125.175.225.325-2.55 1.65-4.1 4.325Q24 29 23.9 32.25ZM27 14.3q-1.5 0-2.575-1.075-1.075-1.075-1.075-2.575 0-1.5 1.075-2.575Q25.5 7 27 7q1.5 0 2.575 1.075Q30.65 9.15 30.65 10.65q0 1.5-1.075 2.575Q28.5 14.3 27 14.3ZM4 9.6V3q0-1.2.9-2.1Q5.8 0 7 0h6.6v3H7v6.6Zm37 0V3h-6.6V0H41q1.2 0 2.1.9.9.9.9 2.1v6.6Zm-4.5 32.5q-4 0-6.8-2.8t-2.8-6.75q0-4 2.8-6.775Q32.5 23 36.45 23q4 0 6.775 2.775Q46 28.55 46 32.5q0 4-2.775 6.8T36.5 42.1Zm-.8-8.05h1.75V26.9H35.7Zm.9 4.25q.45 0 .775-.3t.325-.8q0-.5-.325-.8-.325-.3-.775-.3-.5 0-.8.3-.3.3-.3.8t.3.8q.3.3.8.3Z"/></svg>
                            </div>
                        </center>
                        <div class="name"><span data-text="Menu Enemigos">Enemigos</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/MenuServlet?accion=MenuDeHechizos">
                        <!-- this anchor text for link your home to another page -->
                        <center>
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" height="48" width="48"><path d="M40.6 12.85 38.9 9.1l-3.75-1.7 3.75-1.7 1.7-3.75 1.7 3.75 3.75 1.7-3.75 1.7Zm-24.1 0L14.8 9.1l-3.75-1.7 3.75-1.7 1.7-3.75 1.7 3.75 3.75 1.7-3.75 1.7Zm24.1 24.1-1.7-3.75-3.75-1.7 3.75-1.7 1.7-3.75 1.7 3.75 3.75 1.7-3.75 1.7ZM9.35 43.4 4.6 38.65q-.55-.55-.6-1.275-.05-.725.6-1.375l22.5-22.5q.6-.6 1.45-.6t1.45.6l4.5 4.5q.6.6.6 1.45t-.6 1.45L12 43.4q-.6.6-1.325.6t-1.325-.6Zm1.15-2.85L26.15 24.9l-3.1-3.1L7.4 37.45Z"/></svg>
                            </div>
                        </center>
                        <div class="name"><span data-text="Menu Hechizos">Hechizos</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/MenuServlet?accion=MenuDeObjetos">
                        <!-- this anchor text for link your home to another page -->
                        <center>
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" height="48" width="48"><path d="M11.1 44q-2.2 0-3.725-1.525T5.85 38.75V32.5h6.35V4l3 3 3-3 2.95 3 3-3 3 3 3-3 3 3 3-3 3 3 3-3v34.75q0 2.2-1.525 3.725T36.9 44Zm25.8-3q1 0 1.625-.625t.625-1.625V9H15.2v23.5h19.45v6.25q0 1 .625 1.625T36.9 41ZM17.85 16.9v-3h12v3Zm0 6.7v-3h12v3Zm16.65-6.7q-.6 0-1.05-.45Q33 16 33 15.4q0-.6.45-1.05.45-.45 1.05-.45.6 0 1.05.45.45.45.45 1.05 0 .6-.45 1.05-.45.45-1.05.45Zm0 6.45q-.6 0-1.05-.45-.45-.45-.45-1.05 0-.6.45-1.05.45-.45 1.05-.45.6 0 1.05.45.45.45.45 1.05 0 .6-.45 1.05-.45.45-1.05.45ZM11.05 41h20.6v-5.5H8.85v3.25q0 1 .625 1.625T11.05 41Zm-2.2 0v-5.5V41Z"/></svg>
                            </div>
                        </center>
                        <div class="name"><span data-text="Catalogo de objetos">Objetos</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                </div>
            </nav>
        </div>
        <br> <br>



        <div class="d-flex justify-content-center">
            <div class="card"  style="background-color: rgba(240,240,240,0.6)">
                <div class="card-body">
                    <div>
                        <h2 style="text-align: center; color:#053934"><b>LISTA DE HEROES</b></h2>
                    </div>
                    <br>
                    <div>
                        <form method="post" class="d-flex input-group w-auto" role="search" id="floatingInput" aria-describedby="search-addon" action="<%=request.getContextPath()%>/MenuServlet?accion=buscarHeroe">
                            <input name="searchText" class="form-control me-2" type="text" placeholder="Buscar nombre del Heroe" aria-label="Search"  >
                            <button class="btn btn-light" type="submit" style="color: gray; border:1px solid white">Buscar</button>
                        </form>
                        <br>
                    </div>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <a class="btn btn-danger " href="<%=request.getContextPath()%>/MenuServlet?accion=crearHeroe"
                           role="button">CREAR HEROE</a>
                    </div>
                    <br>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr style="align-content: center">
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>ID</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>NOMBRE</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>EDAD</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>GENERO</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>CLASE</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>NIVEL</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>ATAQUE</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>PAREJA</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col" ><b>PUNTOS EXP</b></th>
                                <th style="color:#053934; padding-left: 2rem; text-align: center" scope="col"><b>OPCIONES</b></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%

                                for (Heroe heroe : listaHeroes) {
                            %>
                            <tr style="align-content: center">
                                <td style="padding-left: 2rem; text-align: center">
                                    <%=heroe.getIdHeroe()%>
                                </td>
                                <td style="padding-left: 2rem; text-align: center">
                                    <%=heroe.getNombre()%>
                                </td>
                                <td style="padding-left: 2rem; text-align: center">
                                    <%=heroe.getEdad()%>
                                </td>
                                <td style="padding-left: 2rem; text-align: center">
                                    <% if (heroe.getGenero()==1){%>
                                    Hombre <%} else if (heroe.getGenero()==2) {%>
                                    Mujer <%} else if (heroe.getGenero()==3) {%>
                                    Otro

                                <%}%>
                                </td>
                                <td style="padding-left: 2rem; text-align: center">
                                    <% if (heroe.getClase()==1){%>
                                    Normal <%} else if (heroe.getClase()==2) {%>
                                    Sayayin <%} else if (heroe.getClase()==3) {%>
                                    Hechicero <%} else if (heroe.getClase()==4) {%>
                                    Androide <%} else if (heroe.getClase()==5) {%>
                                    Namekusein <%} else if (heroe.getClase()==6) {%>
                                    Guerrero <%} else if (heroe.getClase()==7) {%>
                                    Zombie <%} else if (heroe.getClase()==8) {%>
                                    Ninja <%} else if (heroe.getClase()==9) {%>
                                    Fantasma <%} else if (heroe.getClase()==10) {%>
                                    Robot
                                    <%}%>
                                </td >
                                <td style="padding-left: 2rem; text-align: center">
                                    <%=heroe.getNivel()%>
                                </td>
                                <td style="padding-left: 2rem; text-align: center">
                                    <%=heroe.getAtaque()%>
                                </td>
                                <td style="padding-left: 2rem; text-align: center">
                                    <%for(Heroe heroe2: listaHeroes){
                                        if (heroe.getPareja()==heroe2.getIdHeroe()){%>
                                            <%=heroe2.getNombre()%>
                                    <%}%>
                                    <%}
                                    if (heroe.getPareja()==0){%>
                                        -
                                    <%}%>

                                </td>
                                <td style="padding-left: 2rem; text-align: center"><%
                                    int nivel= heroe.getNivel();
                                    DecimalFormat numeroFormateado = new DecimalFormat("#.00");
                                    if(nivel>0 && nivel<=15){
                                    double puntos=Math.pow(nivel,3) *  (24+(nivel+1.0)/3.0)/50.0;
                                    double valorfinal = Math.round(puntos*100d)/100d;%>
                                    <%=valorfinal%><%}else if (nivel>=16 && nivel<=35){
                                    double puntos=Math.pow(nivel,3) *  (14+nivel)/50.0;
                                    double valorfinal = Math.round(puntos*100d)/100d; %>
                                    <%=valorfinal%><%}else if (nivel>=36 && nivel<=100){
                                    double puntos=Math.pow(nivel,3) *  (32+nivel/2)/50.0;
                                    double valorfinal = Math.round(puntos*100d)/100d;%>
                                    <%=valorfinal%><%}%>
                                </td>
                                <td >
                                    <center>
                                        <a type="button" class="btn btn-primary"
                                           href="<%=request.getContextPath()%>/MenuServlet?accion=editarHeroe&id=<%=heroe.getIdHeroe()%>">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor"
                                                 class="bi bi-pencil" viewBox="0 0 16 16">
                                                <path d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z"></path>
                                            </svg>
                                        </a>
                                        <a type="button" class="btn btn-danger"
                                           onclick="return confirm('¿Estas seguro(a) que deseas borrar?')"
                                           href="<%=request.getContextPath()%>/MenuServlet?accion=borrarHeroe&id=<%=heroe.getIdHeroe()%>">
                                            <i class="bi bi-trash"></i></a>
                                        <a href="<%=request.getContextPath()%>/MenuServlet?accion=listaObjetosDeHeroe&id=<%=heroe.getIdHeroe()%>"><button type="button" class="btn btn-secondary">Lista de objetos</button></a>
                                    </center>
                                </td>

                            </tr>
                            <%

                                }
                            %>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>

