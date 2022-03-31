 <%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!--  sentencias de import necesarias para jdbc-->
<%@ page import="java.sql.*"%>

<%
	Connection conexion=null;
	PreparedStatement sentencia=null;
	PreparedStatement sentencia2=null;
    PreparedStatement sentencia3=null;
    PreparedStatement sentencia4=null;
    ResultSet rs=null;
    ResultSet rs2=null;
    ResultSet rs3=null;
    ResultSet rs4=null;
	Class.forName("com.mysql.jdbc.Driver");
	conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/parcialjava", "root", "");
%>