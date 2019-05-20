<%-- 
    Document   : parkdetails
    Created on : May 20, 2019, 3:16:57 PM
    Author     : yourivanlaer
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
            <p>Naam: <%=park.getNaam()%> </p>  
            <p>Aantalsterren: <%=park.getAantalSterren()%> </p> 
            <p>voorzieningen <%=park.getVoorzieningen()%> </p> 
            <p>foto: <%=park.getFoto()%> </p> 

            
        <% }else{ %>
            <p>Er is geen park gevonden met deze beginletters</p>        
        <% } %>
        <p>  <a href="index.jsp">Terug naar beginpagina</a></p>
    </body>
</html>
