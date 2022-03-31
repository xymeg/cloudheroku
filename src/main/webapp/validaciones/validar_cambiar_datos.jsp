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
String usuario = "";
String clave = "";
String nombre = "";
String estado_civil = "";
String direccion = "";
String email = "";
int id_permiso = 1;
int id_afiliciacion = 0;
int id_ips = 0;
int id_grupo_ingreso = 0;
Boolean id_estado_afiliacion = true;
String query = "";

//Intentamos settear los parámetros

if(Integer.valueOf(sesion.getAttribute("id_usuario").toString()) == 1){

    try{
        id_usuario = Integer.valueOf(request.getParameter("id_usuario"));
        usuario = request.getParameter("usuario").toString();
        nombre = request.getParameter("nombre").toString();
        estado_civil = request.getParameter("estado_civil").toString();
        direccion = request.getParameter("direccion").toString();
        email = request.getParameter("email").toString();
        id_afiliciacion = Integer.valueOf(request.getParameter("id_afiliciacion"));
        id_ips = Integer.valueOf(request.getParameter("id_ips"));
        id_grupo_ingreso = Integer.valueOf(request.getParameter("id_grupo_ingreso"));
    }catch(Exception e){
        out.println(e);
    }

    //Usamos preparedStaments para más seguridad

    query = "UPDATE usuarios SET usuario = ?, nombre = ?, estado_civil = ?, direccion = ?, correo = ?, id_permiso = ?,     id_afiliacion = ?, id_ips = ?, id_grupo_ingreso = ?, estado_afiliacion = ? WHERE id_usuario = ?";
    sentencia = conexion.prepareStatement(query);
    sentencia.setString(1, usuario);
    sentencia.setString(2, nombre);
    sentencia.setString(3, estado_civil);
    sentencia.setString(4, direccion);
    sentencia.setString(5, email);
    sentencia.setInt(6, id_permiso);
    sentencia.setInt(7, id_afiliciacion);
    sentencia.setInt(8, id_ips);
    sentencia.setInt(9, id_grupo_ingreso);
    sentencia.setBoolean(10, id_estado_afiliacion);
    sentencia.setInt(11, id_usuario);
    sentencia.executeUpdate();
response.sendRedirect("../dashboard.jsp");
}else{

    try{
        id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
        usuario = request.getParameter("usuario").toString();
        nombre = request.getParameter("nombre").toString();
        estado_civil = request.getParameter("estado_civil").toString();
        direccion = request.getParameter("direccion").toString();
        email = request.getParameter("email").toString();
    }catch(Exception e){
        out.println(e);
    }

    //Usamos preparedStaments para más seguridad

    query = "UPDATE usuarios SET usuario = ?, nombre = ?, estado_civil = ?, direccion = ?, correo = ? WHERE id_usuario = ?";
    sentencia = conexion.prepareStatement(query);
    sentencia.setString(1, usuario);
    sentencia.setString(2, nombre);
    sentencia.setString(3, estado_civil);
    sentencia.setString(4, direccion);
    sentencia.setString(5, email);
    sentencia.setInt(6, id_usuario);
    sentencia.executeUpdate();

    //Pedimos que vuelva a iniciar sesión para volver a traer los datos
response.sendRedirect("../dashboard.jsp");
}

//Redirect luego de cambiar los datos para resetear la sesión


%>