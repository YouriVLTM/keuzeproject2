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
            
        </form>
        <a href="startparken.jsp">Terug naar de startpagina</a>s
                    
                    
    </body>
</html>
