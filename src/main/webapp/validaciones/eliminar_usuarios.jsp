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

int id_usuario = 0;

String query = "";

//Intentamos settear los parámetros

try{
	id_usuario = Integer.parseInt(request.getParameter("id"));
}catch(Exception e){
	out.println(e);
}

//Usamos preparedStaments para más seguridad

query = "DELETE FROM usuarios WHERE id_usuario = ?";
sentencia = conexion.prepareStatement(query);
sentencia.setInt(1, id_usuario);
sentencia.executeUpdate();

//Pedimos que vuelva a iniciar sesión para volver a traer los datos

response.sendRedirect("../dashboard.jsp");
%>