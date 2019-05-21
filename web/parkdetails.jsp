<%-- 
    Document   : parkdetails
    Created on : May 20, 2019, 3:16:57 PM
    Author     : yourivanlaer
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="fact.it.www.beans.Vakantiehuis"%>
<%@page import="fact.it.www.beans.Regio"%>
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
     <%Regio regio = (Regio) request.getAttribute("regio");%>
        <h1>VakantiePark</h1>
        <% if(park != null){ %>
            <% if(park.getNaam() != ""){ %>
                <p>Naam: <%=park.getNaam()%> </p>  
            <%}else{ %>
                <p>Er is geen naam gegeven</p>
            <%}%>
             <% if(park.getAantalSterren() != 0){ %>
                <p>Aantalsterren: <%=park.getAantalSterren()%> </p> 

            <%}else{ %>
                <p>Er is geen Aantalsterren gegeven</p>
            <%}%>
            <% if(park.getVoorzieningen() != ""){ %>
                <p>voorzieningen <%=park.getVoorzieningen()%> </p> 
            <%}else{ %>
                <p>Er is geen voorziening gegeven</p>
            <%}%>
            <% if(park.getFoto() != ""){ %>
                <p>foto: <%=park.getFoto()%> </p> 
            <%}else{ %>
                <p>Er is geen foto gegeven</p>
            <%}%>
            
             <% if(regio != null){ %>
                <p> Regio : <%=regio.getNaam()%></p>
            <%}else{ %>
                <p>Er is geen regio gegeven</p>
            <%}%>
            
            
            <%ArrayList<Vakantiehuis> vakantiehuizen = (ArrayList<Vakantiehuis>) request.getAttribute("vakantiehuis");%>
            
            
            <% if(vakantiehuizen != null){ %>                
                <% for(Vakantiehuis vakantiehuis : vakantiehuizen ){%>
                    <p><a href="ParkServlet?vakantiehuisId=<%=vakantiehuis.getId()%>"><%=vakantiehuis.toString()%></a></p>
                <%}%>
                            
            <%}else{ %>
                <p>Er is geen vakantiehuis gegeven</p>
            <%}%>          
            
            
        <% }else{ %>
            <p>Er is geen park gevonden met deze beginletters</p>        
        <% } %>
        <p>  <a href="index.jsp">Terug naar beginpagina</a></p>
    </body>
</html>
