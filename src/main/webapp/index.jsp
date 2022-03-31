<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Imports -->
<%@page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" session="true"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="java.security.MessageDigest"%>
<%@ include file="conexion/conexion.jsp" %>
<%

//Inicializo una sesión

HttpSession sesion = request.getSession();

//Si hay una sesión redirijo al dashboard

if (sesion.getAttribute("id_usuario") != null) {
    response.sendRedirect("dashboard.jsp");
}

String query = "";

%>
<!DOCTYPE html>
<html lang="es">
   <head>
      <meta charset="utf-8">
      <meta name=viewport content="width=device-width,initial-scale=1,shrink-to-fit=no">
      <title>Eps Curitas</title>
      <link rel=icon type=image/x-icon href="assets/favicon.ico">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
      <link href=https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css rel="stylesheet">
      <link rel=preconnect href="https://fonts.gstatic.com">
      <link href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap" rel="stylesheet">
      <link href=css/styles.css rel="stylesheet">
   </head>
   <body id=page-top>
      <nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm" id=mainNav>
         <div class="container px-5">
            <a class="navbar-brand fw-bold" href=#page-top>EPS Curitas</a> <button class=navbar-toggler type=button data-bs-toggle=collapse data-bs-target=#navbarResponsive aria-controls=navbarResponsive aria-expanded=false aria-label="Toggle navigation">Menu <i class=bi-list></i></button>
            <div class="collapse navbar-collapse" id=navbarResponsive>
               <ul class="navbar-nav ms-auto me-4 my-3 my-lg-0">
                  <li class=nav-item><a class="nav-link me-lg-3" href=#features>Sobre Nosotros</a></li>
               </ul>
               <button class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0" data-bs-toggle=modal data-bs-target=#Login><span class="d-flex align-items-center"><span class=small>Inicia Sesion</span></span></button>
               <button class="btn btn-primary rounded-pill mx-2 px-3 mb-2 mb-lg-0" data-bs-toggle=modal data-bs-target=#Register><span class="d-flex align-items-center"><span class=small>Registrate</span></span></button>
            </div>
         </div>
      </nav>
      <header class=masthead>
         <div class="container px-5">
            <div class="row gx-5 align-items-center">
               <div class=col-lg-6>
                  <div class="mb-5 mb-lg-0 text-center text-lg-start">
                    <h3 class="display-2 lh-1 mb-3">Eps Curitas estamos siempre contigo.</h3>
                     <p class="lead fw-normal text-muted mb-5">Aprende mas sobre nuestros nuevos servicios para citas medicas y editar tus datos de manera online.</p>
               </div>
               </div>
               <div class=col-lg-6>
                  <div class="masthead-device-mockup">                     
                        <div class="px-5 px-sm-0"><img class="img-fluid rounded-circle" src="https://i.pinimg.com/originals/3f/91/73/3f917353b51cb34c3ea979c925a77184.jpg" alt="..."></div>
                  </div>
               </div>
            </div>
         </div>
      </header>
      <aside class="text-center bg-gradient-primary-to-secondary">
         <div class="container px-5">
            <div class="row gx-5 justify-content-center">
               <div class=col-xl-8>
                  <div class="h2 fs-1 text-white mb-4">"Nuestro principal objetivo es vuestra satisfacción"</div>
               </div>
            </div>
         </div>
      </aside>
      <section class=bg-light>
         <div class="container px-5">
            <div class="row gx-5 align-items-center justify-content-center justify-content-lg-between">
               <div class="col-sm-8 col-md-6">
                  <div class="px-5 px-sm-0"><img class="img-fluid rounded-circle" src=https://static.enfermeria21.com/wp-content/uploads/ddimport/2016/07/350-plazas-para-enfermeros-y-auxiliares-en-Cantabria1.jpg alt="..."></div>
               </div>
               <div class="col-12 col-lg-5">
                  <h2 class="display-4 lh-1 mb-4">Bienvenidos a la nueva era de la medicina</h2>
                  <p class="lead fw-normal text-muted mb-5 mb-lg-0">Eps curitas tiene el objetivo de llegar a todos los lugares del pais con un buen servicio y atencion especializada </p>
               </div>               
            </div>
         </div>
      </section>
      <section class=bg-gradient-primary-to-secondary id=download>
         <div class="container px-5">
            <h2 class="text-center text-white font-alt mb-4">Tambien en!</h2>
            <div class="d-flex flex-column flex-lg-row align-items-center justify-content-center"><a class="me-lg-3 mb-4 mb-lg-0" href=#!><img class=app-badge src=assets/img/google-play-badge.svg alt="..."></a> <a href=#!><img class=app-badge src=assets/img/app-store-badge.svg alt="..."></a></div>
         </div>
      </section>
      <footer class="bg-black text-center py-5">
         <div class="container px-5">
            <div class="text-white-50 small">
               <div class=mb-2>&copy; EPS Curitas 2022. All Rights Reserved to Patas.</div>
               <a href=#!>Privacy</a> <span class=mx-1>&middot;</span> <a href=#!>Terms</a> <span class=mx-1>&middot;</span> <a href=#!>FAQ</a>
            </div>
         </div>
      </footer>
      <!--modal login-->
      <div class="modal fade" id="Login" tabindex=-1 aria-labelledby=feedbackModalLabel aria-hidden=true>
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
               <div class="modal-header bg-gradient-primary-to-secondary p-4">
                  <h5 class="modal-title font-alt text-white" id="feedbackModalLabel">Inicia Sesion</h5>
                  <button class="btn-close btn-close-white" type="button" data-bs-dismiss="modal" aria-label=Close></button>
               </div>
               <div class="modal-body border-0 p-4">
                  <form action="validaciones/validar_login.jsp" method="POST">
                     <div class="form-floating mb-3">
                        <input class="form-control" placeholder="Enter your name..." required name="usuario">
                        <label for="name">Usuario</label>
                    </div>
                     <div class="form-floating mb-3">
                        <input class="form-control" type="password" placeholder="Enter your password" required name="clave">
                        <label for="password">Clave</label>
                    </div>
                    <div class="d-grid">
                        <button class="mx-3 btn btn-primary rounded-pill btn-lg" type="submit">Iniciar Sesion</button>
                    </div>
                  </form>
               </div>
               <br>
            </div>
         </div>
      </div>
      <!--modal register cliente-->
      <div class="modal fade" id="Register" tabindex=-1 aria-labelledby=feedbackModalLabel aria-hidden=true>
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
               <div class="modal-header bg-gradient-primary-to-secondary p-4">
                  <h5 class="modal-title font-alt text-white" id="feedbackModalLabel">Registrate</h5>
                  <button class="btn-close btn-close-white" type="button" data-bs-dismiss="modal" aria-label=Close></button>
               </div>
               <div class="modal-body border-0 p-4">
                  <form id=contactForm action="validaciones/validar_register.jsp" method="POST">
                     <div class="form-floating mb-3">
                        <input class="form-control" name="usuario" placeholder="Enter your name..." required>
                        <label for="usuario">Usuario</label>
                     </div>
                     <div class="form-floating mb-3">
                        <input class="form-control" name="password" type="password" placeholder="Enter your password" required>
                        <label for="password">Clave</label>
                     </div>
                     <div class="form-floating mb-3">
                        <input class="form-control" name="nombre" type="text" placeholder="Ingresa tu Nombre" required>
                        <label for="nombre">Nombre</label>
                     </div>
                     <div class="form-floating mb-3">
                        <select class="custom-select" name="estado_civil" required>
                           <option value="Soltero">Soltero</option>
                           <option value="Casado">Casado</option>
                           <option value="Union">Union Libre</option>                                          
                        </select>
                     </div>                                          
                     <div class="form-floating mb-3">
                        <input class="form-control" name="direccion" type="text" placeholder="Ingrese su Direccion" required>
                        <label for="Direccion">Ingrese su Direccion</label>
                     </div>
                     <div class="form-floating mb-3">
                        <input class="form-control" name="email" type="email" placeholder="Ingrese su email" required>
                        <label for="email">Ingrese su email</label>
                     </div>
                     <div class="form-floating mb-3">
                        <select class="custom-select" name="id_permiso"  required>
                            <%
                            //Select permisos
                            query = "SELECT * FROM permisos where id_permiso != 1";
                            sentencia = conexion.prepareStatement(query);
                            rs = sentencia.executeQuery();
                            while(rs.next()){
                            %>
                           <option value="<%=rs.getString("id_permiso")%>"><%=rs.getString("nombre")%></option>
                           <%
                            }
                           %>                                    
                        </select>
                     </div> 
                     <div class="form-floating mb-3">
                        <select class="custom-select" name="id_afiliciacion" required>
                           <%
                           //Select afiliación
                            query = "SELECT * FROM afiliaciones";
                            sentencia = conexion.prepareStatement(query);
                            rs = sentencia.executeQuery();
                            while(rs.next()){
                           %>
                           <option value="<%=rs.getString("id_afiliacion")%>"><%=rs.getString("nombre")%></option>
                           <%
                            }
                           %>                                      
                        </select>
                     </div> 
                     <div class="form-floating mb-3">
                        <select class="custom-select" name="id_ips" required>
                           <%
                            //Select ips
                            query = "SELECT * FROM ips";
                            sentencia = conexion.prepareStatement(query);
                            rs = sentencia.executeQuery();
                            while(rs.next()){
                           %>
                           <option value="<%=rs.getString("id_ips")%>"><%=rs.getString("nombre")%></option>
                           <%
                            }
                           %>                                        
                        </select>
                     </div> 
                     <div class="form-floating mb-3">
                        <select class="custom-select" name="id_grupo_ingreso" required>
                           <%
                            //Select grupos_ingresos
                            query = "SELECT * FROM grupos_ingresos";
                            sentencia = conexion.prepareStatement(query);
                            rs = sentencia.executeQuery();
                            while(rs.next()){
                           %>
                           <option value="<%=rs.getString("id_grupo_ingreso")%>"><%=rs.getString("nombre")%></option>
                           <%
                            }
                           %>                                            
                        </select>
                     </div>
                    <div class="d-grid">
                        <button class="mx-3 btn btn-primary rounded-pill btn-lg" id=submitButton type=submit>Registrate
                    </button>
                    </div>
                  </form>
               </div>                
               <br>
            </div>
         </div>
      </div>
      <script src=https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js></script>
      <script src=js/scripts.js></script>
      <script src=https://cdn.startbootstrap.com/sb-forms-latest.js></script>
   </body>
</html>