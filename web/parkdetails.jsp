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
    <jsp:include page="temp/head.jsp" />
    <body>
         <jsp:include page="temp/nav.jsp" />
                 <section class="banner_inner" id="home">
                <div class="banner_inner_overlay">
                </div>
        </section>
                 

        
        
        
        
        <section class="packages pt-5">
	<div class="container py-lg-4 py-sm-3">
		
		<div class="row">               
				
                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">VakantiePark detail</h1>                       
                        
                        <%Park park = (Park) request.getAttribute("park");%>
                        <%Regio regio = (Regio) request.getAttribute("regio");%>
                        
                        <% if(park != null){ %>
                        
                            <div class="row mb-5">
                                <div class="col-6">
                                     <% if(park.getFoto() != ""){ %>
                                        <img src="images/<%=park.getFoto()%>"/>
                                   <%}else{ %>
                                       <img src="images/noPic.png"/>
                                   <%}%>
                                </div>
                                <div class="col-6">
                                    
                                     <% if(park.getNaam() != ""){ %>
                                   <p>Naam: <%=park.getNaam()%> </p>  
                               <%}else{ %>
                                   <p>Er is geen naam gegeven</p>
                               <%}%>
                                <% if(park.getAantalSterren() != 0){ %>
                                   <p>Aantalsterren: <%=park.getAantalSterren()%> </p>
                                   <%if(park.getAantalSterren() == 5) { %>
                                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
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
                               <%}else{ %>
                                   <p>Er is geen Aantalsterren gegeven</p>
                               <%}%>
                               <% if(park.getVoorzieningen() != ""){ %>
                                   <p>voorzieningen <%=park.getVoorzieningen()%> </p> 
                               <%}else{ %>
                                   <p>Er is geen voorziening gegeven</p>
                               <%}%>
                                <% if(regio != null){ %>
                                   <p> Regio : <%=regio.getNaam()%></p>
                               <%}else{ %>
                                   <p>Er is geen regio gegeven</p>
                               <%}%>

                                </div>
                            </div>
                               
                               
                               
                                <%ArrayList<Vakantiehuis> vakantiehuizen = (ArrayList<Vakantiehuis>) request.getAttribute("vakantiehuis");%>
                               
                                 <% if(vakantiehuizen != null){ %>          
                                 

                                 <div class="row">
                                                    
                                       
                                                    
                                   <% for(Vakantiehuis vakantiehuis : vakantiehuizen ){%>
                                      
                                 
                                        <div class="col-lg-6 col-sm-6 mb-5">
                                             <div class="package-info">
                                                <div class="row">
                                                     <div class="col-12">
                                                        <h2 class="my-2 text-center"><span> <%=vakantiehuis.getType()%></span></h2> 
                                                        <p>Aantal slaapkamers : <span><%=vakantiehuis.getAantalSlaapkamers()%></span></p>
                                                        <p>Aantal personen :  <span><%=vakantiehuis.getAantalPersonen()%> </span></p>
                                                        <p>Hoeveelheid oppervlakte :  <span><%=vakantiehuis.getOppervlakte()%> </span></p>

                                                        <p><a href="ParkServlet?vakantiehuisId=<%=vakantiehuis.getId()%>">meer info</a></p>
                                                        <br>
                                                    </div>

                                                </div>


                                                </div>
                                        </div>

                                     <% } %>
                                    </div>


                               <%}else{ %>
                                   <p>Er is geen vakantiehuis gegeven</p>
                               <%}%>          


                           <% }else{ %>
                               <p>Er is geen park gevonden met deze beginletters</p>        
                           <% } %>
                           <p>  <a href="index.jsp">Terug naar beginpagina</a></p>
         
                        
                    </div>
			
                
			
		</div>
	</div>
</section>
<!-- tour packages -->



        <jsp:include page="temp/footer.jsp" />
    </body>
</html>
