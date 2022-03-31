<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Imports -->
<%@page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" session="true"%>
<%@ page import="java.math.BigInteger"%>
<%@ page import="java.security.MessageDigest"%>
<%@ include file="../conexion/conexion.jsp" %>

<%

//Inicializo una sesión

HttpSession sesion = request.getSession();

//Elimino los atributos de la sesión

sesion.removeAttribute("id_usuario");  
sesion.removeAttribute("usuario");  
sesion.removeAttribute("nombre");  
sesion.removeAttribute("estado_civil");  
sesion.removeAttribute("direccion");  
sesion.removeAttribute("correo");  
sesion.removeAttribute("id_permiso");  
sesion.removeAttribute("id_afiliacion");  
sesion.removeAttribute("id_ips");  
sesion.removeAttribute("id_grupo_ingreso");  
sesion.removeAttribute("estado_afiliacion");

//Redirigir al index

response.sendRedirect("../index.jsp");
%>