<%-- 
    Document   : voegparktoe
    Created on : May 22, 2019, 10:06:58 AM
    Author     : yourivanlaer
--%>

<%@page import="fact.it.www.beans.Regio"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="temp/head.jsp" />
    <body>
        <jsp:include page="temp/nav.jsp" />
                                <!-- banner -->
<section class="banner_inner" id="home">
	<div class="banner_inner_overlay">
	</div>
</section>
                                
        <section class="packages pt-5">
	<div class="container py-lg-4 py-sm-3">
		
		<div class="row">               
				
                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">Voeg nieuw park toe</h1>
                           

         <form action="ParkServlet" >
                 
                         <div class="form-row">
                            <div class="form-group col-md-6 contact-forms">
                                    <label for="naam">naam</label>
                                  <input type="text" class="form-control" id="naam" name="naam" placeholder="naam" >
                                </div>
                         </div>
             
                         <%ArrayList<Regio> regios = (ArrayList<Regio>) request.getAttribute("alleRegios");%>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="regio">In welke regio moet het Park liggen?</label>
                                </div>
                                <div class="form-group col-md-3"> 
                                    <select class="form-control" name="regio" id="regio">
                                        <option value="0">geen</option>

                                        <%for (Regio regio : regios) {%>
                                        <option value="<%=regio.getId()%>"><%=regio.getNaam()%></option>
                                        <%}%>
                                    </select>
                                </div>  
                            </div>
                                    <div class="form-row">
                            <div class="form-group col-md-6 contact-forms">
                                    <label for="aantalSterren">Aantal sterren</label>
                                  <input type="text" class="form-control" id="aantalSterren" name="aantalSterren" placeholder="aantal sterren" >
                                </div>
                                
                         </div>
                                    <div class="form-row">
                                    
                                    <div class="form-group col-md-6 contact-forms">
                                    <label for="aantalSterren">Voorzieningen</label>
                                  <input type="text" class="form-control" id="aantalSterren" name="aantalSterren" placeholder="aantal sterren" >
                                </div>
                
                                </div>
                                      </div>
        </form>
                        
                    </div>
			
                
			
		</div>
	</div>
</section>
<!-- tour packages -->



        <jsp:include page="temp/footer.jsp" />
    </body>
</html>
