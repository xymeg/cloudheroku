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

String usuario = "";
String clave = "";
String nombre = "";
String estado_civil = "";
String direccion = "";
String email = "";
int id_permiso = 0;
int id_afiliciacion = 0;
int id_ips = 0;
int id_grupo_ingreso = 0;
Boolean id_estado_afiliacion = true;
String query = "";

//Intentamos settear los parámetros

try{
	usuario = request.getParameter("usuario").toString();
	clave = getMD5(request.getParameter("password").toString());
	nombre = request.getParameter("nombre").toString();
	estado_civil = request.getParameter("estado_civil").toString();
	direccion = request.getParameter("direccion").toString();
	email = request.getParameter("email").toString();
	id_permiso = Integer.valueOf(request.getParameter("id_permiso"));
	id_afiliciacion = Integer.valueOf(request.getParameter("id_afiliciacion"));
	id_ips = Integer.valueOf(request.getParameter("id_ips"));
	id_grupo_ingreso = Integer.valueOf(request.getParameter("id_grupo_ingreso"));
}catch(Exception e){
	out.println(e);
}

//Usamos preparedStaments para más seguridad

query = "INSERT INTO usuarios (usuario, clave, nombre, estado_civil, direccion, correo, id_permiso, id_afiliacion, id_ips, id_grupo_ingreso, estado_afiliacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
sentencia = conexion.prepareStatement(query);
sentencia.setString(1, usuario);
sentencia.setString(2, clave);
sentencia.setString(3, nombre);
sentencia.setString(4, estado_civil);
sentencia.setString(5, direccion);
sentencia.setString(6, email);
sentencia.setInt(7, id_permiso);
sentencia.setInt(8, id_afiliciacion);
sentencia.setInt(9, id_ips);
sentencia.setInt(10, id_grupo_ingreso);
sentencia.setBoolean(11, id_estado_afiliacion);
sentencia.executeUpdate();

response.sendRedirect("../index.jsp");


//Setteamos dentro de sesión para poder manejar los datos en otra vista


%>
<%!
	
	//Método para devolver un MD5

    public String getMD5(String input) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] encBytes = md.digest(input.getBytes());
            BigInteger numero = new BigInteger(1, encBytes);
            String encString = numero.toString(16);
            while (encString.length() < 32) {
                encString = "0" + encString;
            }
            return encString;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    //Métdo para saber si el dato es nulo o no, de lo contrario, redirigir nuevamente al index


%>