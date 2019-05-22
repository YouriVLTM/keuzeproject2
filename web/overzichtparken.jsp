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
<jsp:include page="temp/head.jsp" />
    <body>
        <jsp:include page="temp/nav.jsp" />
        
        <section class="banner_inner" id="home">
                <div class="banner_inner_overlay">
                </div>
        </section>
        


        
        <!-- tour packages -->
<section class="packages pt-5">
	<div class="container py-lg-4 py-sm-3">
		<h2 class="heading text-capitalize text-center">Overzicht VakantiePark</h2>
                <br>
		
                 <%ArrayList<Park> parken = (ArrayList<Park>) request.getAttribute("parken");%>
                 
                 
                
                <% if(parken != null){ %>

                    <div class="row">
                        
                    <% for(Park park : parken) { %>
                    
                        <div class="col-lg-6 col-sm-6 mb-5">
                             <div class="package-info">
                                <div class="row">
                                     <div class="col-12 text-center">
                                        <h2 class="my-2"><span><%=park.getNaam()%></span></h2> 
                                        <br>
                                    </div>
                                    <div class="col-6">
                                        <img src="images/<%=park.getFoto()%>" class="rounded img-fluid" style="width: 250px"/>
                                    </div>
                                    <div class="col-6">
                                            <p>AantalSterren: <%=park.getAantalSterren()%> </p> 
                                            <a href="ParkServlet?parkId=<%=park.getId()%>">meer info</a>
                                            <%if(park.getAantalSterren() == 5) { %>
                                            <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
                                            <% }%>
                                            <%if(park.getAantalSterren() == 4) { %>
                                            <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i></p>
                                            <% }%>
                                            <%if(park.getAantalSterren() == 3) { %>
                                            <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></p>
                                            <% }%>
                                            <%if(park.getAantalSterren() == 2) { %>
                                            <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></p>
                                            <% }%>    
                                    </div>

                                </div>
                               

                                </div>
                        </div>

                     <% } %>
                    </div>

                                        <% }else{ %>
                        <p>Er is geen park gevonden</p>        
                    <% } %>

                    <br>
                    <a href="ZoekParkServlet?uitgebreid=1" class="btn btn-outline-primary">Terug naar zoekfunctie</a>
                    <a href="index.jsp" class="btn btn-outline-primary">Terug naar beginpagina</a>
                    </div>
            </section>
            <!-- tour packages -->
        
        <jsp:include page="temp/footer.jsp" />
        
    </body>
</html>
