<%-- 
    Document   : huisprijs
    Created on : May 21, 2019, 9:28:56 AM
    Author     : yourivanlaer
--%>

<%@page import="fact.it.www.beans.Periode"%>
<%@page import="fact.it.www.beans.Huisaanbod"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fact.it.www.beans.Vakantiehuis"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <body>
        <%Vakantiehuis vakantiehuis = (Vakantiehuis) request.getAttribute("vakantiehuis");%>
        <%ArrayList<Huisaanbod> huisaanboden = (ArrayList<Huisaanbod>) request.getAttribute("huisaanboden");%>
        <%ArrayList<Periode> periodes = (ArrayList<Periode>) request.getAttribute("periodes");%>

        <h1>VakantiePark</h1>
        <% if(vakantiehuis != null){ %>
            <p>type: <%=vakantiehuis.getType()%> </p> 
            
            <%for(Huisaanbod huisaanbod : huisaanboden){%>
                <p><%=huisaanbod.getPrijsperweek()%> euro</p>                
                <%for(Periode periode : periodes){%>
                    <% if(periode.getId() == huisaanbod.getPeriodeid()){ %>
                        <p><%=periode.getNaam()%></p>

                    <%}%>
                <%}%>
                
            <%}%>
        <% }else{ %>
            <p>Er is geen vakanthuis gevonden</p>        
        <% } %>
        <p>  <a href="index.jsp">Terug naar beginpagina</a></p>
    </body>
</html>
