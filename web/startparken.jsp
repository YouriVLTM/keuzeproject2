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
                        
                        
         <form action="ParkServlet" >
             <h1>VakantiePark</h1>
             <label for="naam">Geef begin letters in: </label>
             <input type="text" name="naam" id="naam"/>
             <input type="submit" value="Toon Specifiek Park id 1" name="vakantiePark1" />
            <input type="submit" value="Toon Specifiek Park" name="vakantiePark" />
            <input type="submit" value="Toon alle Park" name="alleVakantiePark" />
            
        </form>
        <a href="ZoekParkServlet?uitgebreid=1">uitgebreid</a>
        
         
        
    </body>
</html>
