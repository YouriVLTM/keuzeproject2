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
          
                <!-- tour packages -->
<section class="packages pt-5">
	<div class="container py-lg-4 py-sm-3">
		
		<div class="row">               
				
                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">Lekker genieten op <strong>vakantie</strong></h1>
                                     <p>
            <a href="startparken.jsp">Startpagina vakantieparken</a>
        </p>
        <p>
            <a href="starthotels.jsp">Startpagina hotels</a>
        </p>   
        <p>
            <a href="admin.jsp">Informatie over regio's</a>
        </p>
        <p>
            <a href="HotelServlet?maakHotel=1">Een hotel aanmaken</a>
        </p>
                        
                    </div>
			
                
			
		</div>
	</div>
</section>
<!-- tour packages -->



        <jsp:include page="temp/footer.jsp" />
    </body>
</html>
