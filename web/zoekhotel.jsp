<%-- 
    Document   : zoekhotel
    Created on : 20-mei-2019, 23:47:45
    Author     : Ruben
--%>

<%@page import="fact.it.www.beans.Regio"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel zoeken</title>
    </head>
    <body>
        <%ArrayList<Regio> regios = (ArrayList<Regio>) request.getAttribute("alleRegios");%>
        <h1>Zoek je hotel</h1>
        <form action="ZoekHotelServlet">
            <p>                
            <label for="select">Hoeveel sterren moet het hotel hebben?</label>
            <select name="select" id="select">
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
            <input type="submit" name="zoekHotelAantalSterren" value="zoeken op aantal sterren">
            </p>
            <p>
                <label for="regio">In welke regio moet het hotel liggen?</label>
                <select name="regio" id="regio">
                    <%for (Regio regio : regios) {%>
                    <option value="<%=regio.getId()%>"><%=regio.getNaam()%></option>
                    <%}%>
                </select>
                <input type="submit" name="zoekHotelRegio" value="zoeken op regio">
            </p>
            
        </form>
        <a href="starthotels.jsp">Terug naar de startpagina</a>
    </body>
</html>
