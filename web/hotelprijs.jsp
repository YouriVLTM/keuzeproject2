<%-- 
    Document   : hotelprijs
    Created on : 20-mei-2019, 19:25:15
    Author     : Ruben
--%>

<%@page import="fact.it.www.beans.Hotelaanbod"%>
<%@page import="fact.it.www.beans.Periode"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%ArrayList<Periode> periodes = (ArrayList<Periode>) request.getAttribute("periode");%>
        <%ArrayList<Hotelaanbod> hotelaanbiedingen = (ArrayList<Hotelaanbod>) request.getAttribute("hotelaanbod");%>
        <%String zoekPrijsHotelNaam = (String) request.getAttribute("zoekPrijsHotelNaam");%>
        <h1>Prijzen voor <%=zoekPrijsHotelNaam%></h1>
        <table>
            <tr>
                <td>Periode</td>
                <td>Prijs</td>
            </tr>
        <%for (int i = 0; i < periodes.size(); i++) {%>
        <tr>
            <td>
                <%=periodes.get(i).getNaam()%>
            </td>
            <td>
                <%=hotelaanbiedingen.get(i).getPrijsperdag()%>
            </td>
            <%}%>
        </tr>
        </table>
        
    </body>
</html>
