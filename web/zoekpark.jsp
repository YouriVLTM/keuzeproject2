<%-- 
    Document   : zoekpark
    Created on : May 21, 2019, 10:26:44 AM
    Author     : yourivanlaer
--%>

<%@page import="fact.it.www.beans.Periode"%>
<%@page import="fact.it.www.beans.Regio"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
               
        <h1>Zoek je Park</h1>
        <form action="ZoekParkServlet">
            <p>                
            <label for="select">Hoeveel sterren moet het hotel hebben?</label>
            <select name="aantalSterren" id="select">
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
            </select>
            <input type="submit" name="zoekParkAantalSterren" value="zoeken op aantal sterren">
            </p>
            
            
            <%ArrayList<Regio> regios = (ArrayList<Regio>) request.getAttribute("alleRegios");%>
            
            <p>
                <label for="regio">In welke regio moet het hotel liggen?</label>
                <select name="regio" id="regio">
                    <%for (Regio regio : regios) {%>
                    <option value="<%=regio.getId()%>"><%=regio.getNaam()%></option>
                    <%}%>
                </select>
                <input type="submit" name="zoekParkRegio" value="zoeken op regio">
            </p>
             <p>
                <label for="parkNaam">Naam van het Park</label>
                <input type="text" name="parkNaam" id="parkNaam">
                <input type="submit" name="zoekParkNaam" value="zoeken op naam">
            </p>
            
             <p>
                <label for="aantalSlaapkamers">Aantal slaapkamers</label>
                <input type="text" name="aantalSlaapkamers" id="aantalSlaapkamers">
                <input type="submit" name="zoekAantalslaapkamers" value="zoeken op aantal slaapkamers">
            </p>
            
            <p>
                <label for="aantalPersonen">Aantal Personen</label>
                <input type="text" name="aantalPersonen" id="aantalPersonen">
                <input type="submit" name="zoekAantalPersonen" value="zoeken op aantal Personen">
            </p>
            
        </form>
        <a href="startparken.jsp">Terug naar de startpagina</a>s
                    
                    
    </body>
</html>
