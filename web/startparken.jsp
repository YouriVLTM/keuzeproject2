<%-- 
    Document   : startparken
    Created on : 20-mei-2019, 10:35:31
    Author     : lukak
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
                        
                        
        
        
         
<section class="packages pt-5">
	<div class="container py-lg-4 py-sm-3">
		
		<div class="row">               
				
                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">VakantiePark</h1>
                           

         <form action="ParkServlet" >
                 
             
             <div class="form-row mt-5">
                 <div class="col-12">
                        <label for="naam">Geef begin letters in: </label>         
                    </div>
                    <div class="col-5 contact-forms">
                         <label for="attractieNaam" class="sr-only">attractie Naam</label>
                           <input type="text" class="form-control" id="naam" name="naam" placeholder="Geef de begin letters in">
                    </div>
                             
             </div>
             <br>
             <div class="btn-group" role="group" aria-label="Basic example">
                <input type="submit" class="btn btn-outline-primary"  value="Toon Specifiek Park id 1" name="vakantiePark1" />
               <input type="submit" class="btn btn-outline-primary"  value="Toon Specifiek Park op begin letters" name="vakantiePark" />
               <input type="submit" class="btn btn-outline-primary"  value="Toon alle Parken" name="alleVakantiePark" />
                       <a href="ZoekParkServlet?uitgebreid=1" class="btn btn-outline-primary">uitgebreid zoeken</a>
                       <a href="ZoekParkServlet?filter=1" class="btn btn-outline-primary">filter</a>
                         <a href="ParkServlet?voegparktoepagina=1" class="btn btn-outline-primary">Voeg nieuw park toe</a>

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
