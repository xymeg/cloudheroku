<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Imports -->
<%@page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*" session="true"%>
<%@ page import="java.math.*"%>
<%@ page import="java.security.MessageDigest"%>
<%@ include file="../conexion/conexion.jsp" %>

<%
//Inicializo una sesión

HttpSession sesion = request.getSession();

//Recibimos los parámetros que nos hayan enviado por post

int id_cita_medica = 0;

String query = "";

//Intentamos settear los parámetros

try{
	id_cita_medica = Integer.parseInt(request.getParameter("id"));
}catch(Exception e){
	out.println(e);
}

//Usamos preparedStaments para más seguridad

query = "DELETE FROM citas_medicas WHERE id_cita_medica = ?";
sentencia = conexion.prepareStatement(query);
sentencia.setInt(1, id_cita_medica);
sentencia.executeUpdate();

//Pedimos que vuelva a iniciar sesión para volver a traer los datos

response.sendRedirect("../tables.jsp");
%>