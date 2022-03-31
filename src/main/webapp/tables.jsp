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

//Declaración de variables

String query = "";
String query2 = "";

if (sesion.getAttribute("id_usuario") == null || sesion.getAttribute("id_usuario").equals("0")) {
    response.sendRedirect("index.jsp");
}

%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />        
        <title>Tables -Admin</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="css/stylesDashboard.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="#!">Dashboard</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Modales-->
            <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <button class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0" data-bs-toggle=modal data-bs-target="#crear_cita"><span class="d-flex align-items-center"><span class=small>Solicitar Cita</span></span></button>
            </div>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">                        
                        <li><a class="dropdown-item" href="validaciones/logout.jsp">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Panel administrativo</div>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>                            
                            <div class="sb-sidenav-menu-heading">Tablas</div>                            
                            <a class="nav-link" href="tables.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Crear citas
                            </a>
                        </div>
                    </div>                    
                </nav>
            </div>
            <!--TABLAS-->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Citas</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                            <li class="breadcrumb-item active">Citas</li>
                        </ol>                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Citas Tabla
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Id Cita Medica</th>
                                            <th>Id usuario</th>                                            
                                            <th>Id Consulta</th>
                                            <th>Fecha Consulta</th>
                                            <th>Nombre Usuario</th>
                                            <th>Tipo Consulta</th>                                            
                                            <th>Editar</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>                                   
                                    <tbody>                                     
                                        <%
                                            if (sesion.getAttribute("id_permiso").equals("1")) {
                                            query = "SELECT citas_medicas.id_cita_medica,citas_medicas.id_usuario,citas_medicas.id_tipo_consulta,citas_medicas.fecha_consulta,  usuarios.nombre as 'usuario', solicitudes.nombre as 'consulta' from citas_medicas inner join usuarios ON usuarios.id_usuario = citas_medicas.id_usuario inner join solicitudes ON solicitudes.id_solicitud = citas_medicas.id_tipo_consulta";
                                            sentencia = conexion.prepareStatement(query);
                                            rs = sentencia.executeQuery();
                                            }else{
                                                query = "SELECT citas_medicas.id_cita_medica,citas_medicas.id_usuario,citas_medicas.id_tipo_consulta,citas_medicas.fecha_consulta,  usuarios.nombre as 'usuario', solicitudes.nombre as 'consulta' from citas_medicas inner join usuarios ON usuarios.id_usuario = citas_medicas.id_usuario inner join solicitudes ON solicitudes.id_solicitud = citas_medicas.id_tipo_consulta WHERE citas_medicas.id_usuario = ?";
                                                sentencia = conexion.prepareStatement(query);
                                                sentencia.setInt(1, (Integer) Integer.valueOf(sesion.getAttribute("id_usuario").toString()));
                                                rs = sentencia.executeQuery();
                                            }
                                            while(rs.next()){
                                        %>
                                        <tr>
                                            <td><%=rs.getString("id_cita_medica")%></td>
                                            <td><%=rs.getString("id_usuario")%></td>
                                            <td><%=rs.getString("id_tipo_consulta")%></td>
                                            <td><%=rs.getString("fecha_consulta")%></td>
                                            <td><%=rs.getString("usuario")%></td>
                                            <td><%=rs.getString("consulta")%></td>                                                                                                                                  
                                            <td><button type="button" class="btn btn-success" data-bs-toggle=modal data-bs-target="#editar_citas<%=rs.getString("id_cita_medica")%>">Editar</button></td>
                                            <td><a href="validaciones/eliminar_citas.jsp?id=<%=rs.getString("id_cita_medica")%>"><button type="button" class="btn btn-danger">Eliminar</button></a></td>
                                        </tr>
                                        <!--modal editar citas-->
                                        <div class="modal fade" id="editar_citas<%= rs.getString("id_cita_medica")%>" tabindex=-1 aria-labelledby=feedbackModalLabel aria-hidden=true>
                                            <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header bg-gradient-primary-to-secondary p-4">
                                                    <h5 class="modal-title font-alt text-black" id="feedbackModalLabel">Editar Cita</h5>
                                                    <button class="btn-close btn-close-white" type="button" data-bs-dismiss="modal" aria-label=Close></button>
                                                </div>
                                                <div class="modal-body border-0 p-4">
                                                    <form id=contactForm action="validaciones/validar_cambio_cita.jsp" method="POST"> 
                                                        <input type="hidden" name="id_cita_medica" value="<%=rs.getString("id_cita_medica")%>">                              
                                                        <div class="form-floating mb-3">
                                                        <input class="form-control" name="nombre"  type="text" placeholder="Ingresa tu Nombre"  readonly required value="<% out.println(sesion.getAttribute("nombre")); %>">
                                                        <label for="nombre">Nombre</label>
                                                        </div>
                                                        <div class="form-floating mb-3">
                                                        <select class="custom-select" name="consulta" required>
                                                            <%
                                                            //Select afiliación
                                                            query2 = "select * from solicitudes";
                                                            sentencia2 = conexion.prepareStatement(query2);
                                                            rs2 = sentencia2.executeQuery();
                                                            while(rs2.next()){
                                                            %>
                                                            <option value="<%=rs2.getString("id_solicitud")%>"><%=rs2.getString("nombre")%></option>
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
                                        <%
                                        }
                                        %>                                 
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--modal crear citas-->
                    <div class="modal fade" id="crear_cita" tabindex=-1 aria-labelledby=feedbackModalLabel aria-hidden=true>
                        <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header bg-gradient-primary-to-secondary p-4">
                                <h5 class="modal-title font-alt text-black" id="feedbackModalLabel">Solicitar Cita</h5>
                                <button class="btn-close btn-close-white" type="button" data-bs-dismiss="modal" aria-label=Close></button>
                            </div>
                            <div class="modal-body border-0 p-4">
                                <form id=contactForm action="validaciones/validar_cita.jsp" method="POST"> 
                                    <input type="hidden" name="id_usuario" value="<% out.print(sesion.getAttribute("id_usuario"));%>">                              
                                    <div class="form-floating mb-3">
                                    <input class="form-control" name="nombre"  type="text" placeholder="Ingresa tu Nombre"  readonly required value="<% out.println(sesion.getAttribute("nombre")); %>">
                                    <label for="nombre">Nombre</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                    <select class="custom-select" name="consulta" required>
                                         <%
                                        //Select afiliación
                                        query = "select * from solicitudes";
                                        sentencia = conexion.prepareStatement(query);
                                        rs = sentencia.executeQuery();
                                        while(rs.next()){
                                        %>
                                        <option value="<%=rs.getString("id_solicitud")%>"><%=rs.getString("nombre")%></option>
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
                                    
                <!--Footer-->
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
