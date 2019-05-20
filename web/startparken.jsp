<%-- 
    Document   : startparken
    Created on : 20-mei-2019, 10:35:31
    Author     : lukak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form action="ParkServlet" >
             <h1>VakantiePark</h1>
             <label for="naam">Geef ID in</label>
             <input type="text" name="naam" id="naam"/>
            <p><input type="submit" value="Toon Specifiek Park" name="toonVakantiePark" /></p>
        </form>
    </body>
</html>
