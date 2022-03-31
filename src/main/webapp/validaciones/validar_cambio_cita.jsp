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
int id_tipo_consulta = 0;
String query = "";

//Intentamos settear los parámetros
    try{
        id_cita_medica = Integer.valueOf(request.getParameter("id_cita_medica"));
        id_tipo_consulta = Integer.valueOf(request.getParameter("consulta"));
        
    }catch(Exception e){
        out.println(e);
    }

    //Usamos preparedStaments para más seguridad

    query = "UPDATE citas_medicas SET id_tipo_consulta = ? WHERE id_cita_medica = ?";
    sentencia = conexion.prepareStatement(query);
    sentencia.setInt(1, id_tipo_consulta); 
    sentencia.setInt(2, id_cita_medica);
    sentencia.executeUpdate();
    response.sendRedirect("../tables.jsp");
    out.print(id_cita_medica);
    out.print(id_tipo_consulta);


//Redirect luego de cambiar los datos para resetear la sesión


%>