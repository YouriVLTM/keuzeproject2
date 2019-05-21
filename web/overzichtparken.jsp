<%-- 
    Document   : overzichtparken
    Created on : May 20, 2019, 3:00:37 PM
    Author     : yourivanlaer
--%>

<%@page import="fact.it.www.beans.Park"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%ArrayList<Park> parken = (ArrayList<Park>) request.getAttribute("parken");%>
        <h1>VakantiePark</h1>
        
        <% if(parken != null){ %>
        <ul>
            <% for(Park park : parken) { %>
            <li>
                <a href="ParkServlet?parkId=<%=park.getId()%>"><%=park.getNaam()%></a>
                <p>AantalSterren: <%=park.getAantalSterren()%> </p> 
            </li>
            <% } %>
        </ul>
        <% }else{ %>
            <p>Er is geen park gevonden</p>        
        <% } %>
        <p>  <a href="ZoekParkServlet?uitgebreid=1">Terug naar zoekfunctie</a></p>
        <p>  <a href="index.jsp">Terug naar beginpagina</a></p>
    </body>
</html>
