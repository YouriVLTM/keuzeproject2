<%-- 
    Document   : zoekhotel
    Created on : 20-mei-2019, 23:47:45
    Author     : Ruben
--%>

<%@page import="fact.it.www.beans.Periode"%>
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
        <%ArrayList<Periode> periodes = (ArrayList<Periode>) request.getAttribute("allePeriodes");%>
        <%ArrayList<String> maaltijden = (ArrayList<String>) session.getAttribute("maaltijden");%>

        <h1>Zoek je hotel</h1>
        <form action="ZoekHotelServlet">
            
            <p>                
                <label for="select">Hoeveel sterren moet het hotel hebben?</label>
                <select name="select" id="select">
                    <option value="2">2</option>
                    <option value="3" selected>3</option>
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
            <p>
                <label for="periode">In welke periode wilt u op vakantie gaan?</label>
                <select name="periode" id="periode">                   
                    <%for (Periode periode : periodes) {%>
                    <option value="<%=periode.getId()%>"><%=periode.getNaam()%></option>
                    <%}%>
                </select>
                <input type="submit" name="zoekHotelPeriode" value="zoeken op periode">
            </p>
            <p>
                <label for="maaltijd">Welke maaltijd wilt u?</label>
                <select name="maaltijd" id="maaltijd">
                    <%for (int i = 0; i < maaltijden.size(); i++) {%>
                    <option value="<%=i%>"><%=maaltijden.get(i)%></option>
                    <%}%>
                </select>
                <input type="submit" name="zoekHotelMaaltijd" value="zoeken op maaltijd">
            </p>
            <p>
                <label for="hotelNaam">Naam van het hotel<sup>(optioneel)</sup></label>
                <input type="text" name="hotelNaam" id="hotelNaam">
                <input type="submit" name="zoekHotelNaam" value="zoeken op naam">
            </p>
            <p>
                <label for="ontspanning">Welke ontspanning wilt u?<sup>(optioneel)</sup></label>
                <input type="text" name="ontspanning" id="ontspanning">
                <input type="submit" name="zoekHotelOntspanning" value="zoeken op ontspanning">
            </p>
            <input type="submit" name="hotelZoeken"id="hotelZoeken" value="Zoeken">
        </form>
        <a href="starthotels.jsp">Terug naar de startpagina</a>
    </body>
</html>
//