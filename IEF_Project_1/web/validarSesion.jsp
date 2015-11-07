<%
    
    if(session.getAttribute("usuario")==null || session.getAttribute("rol")==null)
        response.sendRedirect("index.jsp");     
    
    %>