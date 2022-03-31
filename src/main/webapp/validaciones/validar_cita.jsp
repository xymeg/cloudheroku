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

//Recibimos los parámetros que nos hayan enviado por post
int id_usuario = 0 ;
int id_solicitud = 0 ;
String query = "";
String query2 = "";

//Intentamos settear los parámetros

try{
	id_usuario = Integer.valueOf(request.getParameter("id_usuario"));
	id_solicitud = Integer.valueOf(request.getParameter("consulta"));

}catch(Exception e){
	out.println(e);
}

//Usamos preparedStaments para más seguridad

query = "INSERT INTO citas_medicas (id_usuario,id_tipo_consulta) VALUES (?, ?)";
sentencia = conexion.prepareStatement(query);
sentencia.setInt(1, id_usuario);
sentencia.setInt(2, id_solicitud);
sentencia.executeUpdate();
response.sendRedirect("../tables.jsp");


%>