<%-- 
    Document   : adminoverzicht
    Created on : May 23, 2019, 9:41:13 AM
    Author     : yourivanlaer
--%>

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
               
               <section class="services pt-5">
	<div class="container py-lg-5 py-sm-3">
		<h2 class="heading text-capitalize text-center mb-lg-5 mb-4">Admin dashboard park</h2> 
                <hr>
        </div>
</section>

<section class="services">
	<div class="container py-lg-5 py-sm-3">
                <h2 class="heading text-capitalize text-center mb-lg-5 mb-4">Wijzigen</h2>      
               
                <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6 service-grid-wthree text-center mb-5">
                                <div class="ser-fashion-grid">
                                        <div class="about-icon mb-md-4 mb-3">
                                            <span class="far fa-building fa-3x" aria-hidden="true"></span>
                                        </div>
                                        <div class="ser-sevice-grid mb-3">
                                          <h4 class="pb-3">Parken</h4>
                                          <p>Hier krijg je een totaal overzicht van alle parken</p>
                                        </div>
                                         <a class="btn btn-outline-primary btn-block" href="ParkServlet?adminoverzichtparken=1">klik hier</a>

                          </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6 service-grid-wthree text-center mb-5">
                                <div class="ser-fashion-grid">
                                        <div class="about-icon mb-md-4 mb-3">
                                            <span class="fas fa-home fa-3x" aria-hidden="true"></span>
                                        </div>
                                        <div class="ser-sevice-grid mb-3">
                                          <h4 class="pb-3">Vakantiehuizen</h4>
                                          <p>Hier krijg je een totaal overzicht van alle vakantiehuizen</p>
                                        </div>
                                         <a class="btn btn-outline-primary btn-block" href="ParkServlet?adminoverzichtvakantiehuizen=1">klik hier</a>

                          </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6 service-grid-wthree text-center mb-5">
                                <div class="ser-fashion-grid">
                                            
                          </div>
                        </div>

                </div>
                
	</div>
</section>



        
        
         <jsp:include page="temp/footer.jsp" />
    </body>
</html>
