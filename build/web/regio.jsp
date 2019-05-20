<%@page import="fact.it.www.beans.Regio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Regio</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    </head>
    <body>
        <%Regio regio = (Regio) request.getAttribute("regio");%>
        <h1>Vakantieplanner</h1>
        <p>Regio: <%=regio.getNaam()%> </p>                   
        <p>  <a href="index.jsp">Terug naar beginpagina</a></p>
    </body>
</html>
