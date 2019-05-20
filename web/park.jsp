<%-- 
    Document   : park
    Created on : 20-mei-2019, 13:00:35
    Author     : lukak
--%>

<%@page import="fact.it.www.beans.Park"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%Park park = (Park) request.getAttribute("park");%>
        <h1>VakantiePark</h1>
        <% if(park != null){ %>
            <p>VakantiePark: <%=park.getNaam()%> </p>  
            <p>AantalSterren: <%=park.getAantalSterren()%> </p> 
        <% }else{ %>
            <p>Er is geen park gevonden met deze beginletters</p>        
        <% } %>
        <p>  <a href="index.jsp">Terug naar beginpagina</a></p>
    </body>
</html>
