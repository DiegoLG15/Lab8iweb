<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Beans.Heroe" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Daos.HeroeDao" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
        <title>Crear Heroe</title>
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
        <header class="d-flex p-2" style="background-color: rgba(255,255,255,0.6)">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
                        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
                    </a>
                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <h4><li><a href="#" class="nav-link px-2"><b style="color:#144C47">WIKI FANTASIA</b></a></li></h4>
                    </ul>
                </div>
            </div>
        </header>

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
        <main id="main">
            <section class="section profile">
                <div class="container">
                    <div class="container-fluid " style="background-color: rgba(255,255,255,0.6);width: 65%">

                        <div class="row">
                            <div >
                                <br>
                                <center>
                                    <h3><b style="color:#144C47">CREAR HEROE</b></h3>
                                </center>
                                <br>
                            </div>
                            <div class="col-md-6">
                                <td>
                                    <img src="https://cdna.artstation.com/p/assets/images/images/031/262/012/large/seo-eaglesage-firemageclassicsmall.jpg?1603114052" class="rounded mx-auto d-block " alt="userphoto" height="600rem" width="380rem">
                                </td>
                            </div>
                            <div class="col-md-6">
                                <form  method="post" action="<%=request.getContextPath()%>/MenuServlet?accion=guardarHeroe" class="row g-3">
                                    <td style="padding-left: 2rem;">
                                        <ul class="list-group list-group-flush">
                                            <label for="nombre" class="form-label"><b>NOMBRE:</b></label>
                                            <input required maxlength="10" type="text" class="form-control" id="nombre" placeholder="nombre"
                                                   name="nombre" >
                                        </ul>

                                        <ul class="list-group list-group-flush">

                                            <label for="edad" class="form-label"><b>EDAD:</b></label>
                                            <input required type="number" min="8" max="999" class="form-control" id="edad" placeholder="edad"
                                                   name="edad" >
                                        </ul>
                                        <ul class="list-group list-group-flush">

                                            <label for="genero" class="form-label"><b>GENERO:</b></label>
                                            <select required class="form-select" id="genero" placeholder="genero" name="genero">
                                                <option value="">Seleccione una opción</option>
                                                <option value="Hombre">Hombre</option>
                                                <option value="Mujer">Mujer</option>
                                                <option value="Otro">Otro</option>
                                            </select>

                                        </ul>
                                        <ul class="list-group list-group-flush">

                                            <label for="clase" class="form-label"><b>CLASE:</b></label>
                                            <select required class="form-select" id="clase" placeholder="clase" name="clase">
                                                <option value="">Seleccione una opción</option>
                                                <option value="Sayayin">Sayayin</option>
                                                <option value="Hechicero">Hechicero</option>
                                                <option value="Androide">Androide</option>
                                                <option value="Namekusein">Namekusein</option>
                                                <option value="Guerrero">Guerrero</option>
                                                <option value="Zombie">Zombie</option>
                                                <option value="Ninja">Ninja</option>
                                                <option value="Fantasma">Fantasma</option>
                                                <option value="Robot">Robot</option>
                                            </select>

                                        </ul>
                                        <ul class="list-group list-group-flush">

                                            <label for="nivel" class="form-label"><b>NIVEL:</b></label>
                                            <input required type="number" min="1" max="100" class="form-control" id="nivel" placeholder="nivel"
                                                   name="nivel" >
                                        </ul>
                                        <ul class="list-group list-group-flush">
                                            <label for="ataque" class="form-label"><b>ATAQUE:</b></label>
                                            <input required type="number" min="1" class="form-control" id="ataque" placeholder="ataque"
                                                   name="ataque" >
                                        </ul>
                                        <ul class="list-group list-group-flush">
                                            <%HeroeDao heroeDao=new HeroeDao();
                                            ArrayList<Heroe> listaHeroes=heroeDao.cantidadNullsParejas();%>


                                            <label for="pareja" class="form-label">PAREJA:</label>
                                            <select required class="form-select" id="pareja" placeholder="pareja" name="pareja">
                                                <option value="">Seleccione una opción</option>
                                                <option value="0">Sin pareja</option>
                                                <%for(Heroe heroe: listaHeroes){%>

                                                <option value="<%=heroe.getIdHeroe()%>"><%= heroe.getIdHeroe()%>: <%=heroe.getNombre() %></option>

                                                <%}%>
                                            </select>

                                        </ul>
                                        <ul class="list-group list-group-flush">
                                            <div class="d-grid gap-2 col-6 col-lg-4 col-xl-3 mx-auto">
                                                <button class="btn btn-danger" type="submit">Crear</button>
                                            </div>
                                        </ul>
                                    </td>
                                </form>
                            </div>
                        </div>

                    </div>

                </div>
            </section>
        </main>
</html>






<!--
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
                </ul>
            </div>
        </div>
    </header>
    <br><br><br>
    <div class="d-flex justify-content-center">
        <div class="card">
            <div class="card-body">
                <div >
                    <center>
                        <h4><b style="color:#144C47">CREAR HÉROE</b></h4>
                    </center>
                </div>
                <table>
                    <div>
                        <td>
                            <img src="https://cdnb.artstation.com/p/assets/images/images/031/262/015/large/seo-eaglesage-firemagecasuallsmall.jpg?1603114058" class="rounded mx-auto d-block " alt="userphoto" height="400rem" width="200rem">
                        </td>
                        <form method="post" action="=request.getContextPath()%>/MenuServlet?accion=guardarHeroe">

                            <div class="list-group list-group-flush">
                                <label for="ID Heroe" class="form-label">ID:</label>
                                <input type="text" placeholder="ID Heroe" id="ID Heroe" name = "ID Heroe" >
                            </div>
                            <div class="list-group list-group-flush">
                                <label for="nombre" class="form-label">NOMBRE:</label>
                                <input type="text" class="form-control" placeholder="nombre"  id="nombre" name="nombre">
                            </div>
                            <br>
                            <div class="list-group list-group-flush">
                                <label for="edad" class="form-label">EDAD:</label>
                                <input type="text" class="form-control"  placeholder="edad" id="edad" name="edad" >
                            </div>
                            <br>
                            <div class="list-group list-group-flush">
                                <label for="genero" class="form-label">GÉNERO:</label>
                                <input type="text" class="form-control" placeholder="genero" id="genero" name="genero" >
                            </div>
                            <br>
                            <div class="list-group list-group-flush">
                                <label for="clase" class="form-label">CLASE:</label>
                                <input type="text" class="form-control" placeholder="clase" id="clase" name="clase" >
                            </div>
                            <br>
                            <div class="list-group list-group-flush">
                                <label for="nivel" class="form-label">NIVEL:</label>
                                <input type="text" class="form-control" placeholder="nivel" id="nivel" name="nivel" >
                            </div>
                            <br>
                            <div class="list-group list-group-flush">
                                <label for="ataque" class="form-label">ATAQUE:</label>
                                <input type="text" class="form-control" placeholder="ataque" id="ataque" name="ataque" >
                            </div>
                            <br>
                            <div class="list-group list-group-flush">
                                <label for="pareja" class="form-label">PAREJA:</label>
                                <input type="text" class="form-control"  placeholder="pareja" id="pareja" name="pareja" >
                            </div>
                            <br>

                        </form>
                    </div>
                </table>
            </div>
        </div>
    </div>
    <br>
    <form>
        <div class="d-flex justify-content-center">
            <button type="submit" class="btn btn-danger">Crear</button>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <br>
    <a class="btn btn-primary" href="%=request.getContextPath()%>/MenuServlet" role="button" style="margin-left: 0rem; background-color:#D12C22 ; border: none;"> ◄ Atrás </a>
    <br><br>
</body>
-->