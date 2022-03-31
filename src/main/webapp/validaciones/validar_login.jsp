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
String query = "";

//Intentamos settear los parámetros

try{
	usuario = request.getParameter("usuario").toString();
	clave = getMD5(request.getParameter("clave").toString());
}catch(Exception e){
	out.println(e);
}

//Usamos preparedStaments para más seguridad

query = "SELECT (SELECT COUNT(*) from usuarios ) as 'contar', usuarios.* FROM usuarios WHERE usuario = ? and clave = ?";
sentencia = conexion.prepareStatement(query);
sentencia.setString(1, usuario);
sentencia.setString(2, clave);
rs = sentencia.executeQuery();
//Setteamos dentro de sesión para poder manejar los datos en otra vista

while (rs.next()) {
		sesion.setAttribute("id_usuario",rs.getString(2));  
		sesion.setAttribute("usuario",rs.getString(3));  
		sesion.setAttribute("nombre",rs.getString(5));  
		sesion.setAttribute("estado_civil",rs.getString(6));  
		sesion.setAttribute("direccion",rs.getString(7));  
		sesion.setAttribute("correo",rs.getString(8));  
		sesion.setAttribute("id_permiso",rs.getString(9));  
		sesion.setAttribute("id_afiliacion",rs.getString(10));  
		sesion.setAttribute("id_ips",rs.getString(11));  
		sesion.setAttribute("id_grupo_ingreso",rs.getString(12));  
		sesion.setAttribute("estado_afiliacion",rs.getString(13));
}

if (sesion.getAttribute("id_usuario") == null || sesion.getAttribute("id_usuario").equals("0")) {
	response.sendRedirect("../index.jsp");
}else{
	response.sendRedirect("../dashboard.jsp");
}

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