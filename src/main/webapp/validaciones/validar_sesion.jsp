HttpSession sesion = request.getSession();
if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
    response.sendRedirect("../index.jsp");
}