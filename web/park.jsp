<%-- 
    Document   : park
    Created on : 20-mei-2019, 13:00:35
    Author     : lukak
--%>

<%@page import="fact.it.www.beans.Park"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:include page="temp/head.jsp" />

    <body>
        <jsp:include page="temp/nav.jsp" />

        <section class="banner_inner" id="home">
            <div class="banner_inner_overlay">
            </div>
        </section>

        <%Park park = (Park) request.getAttribute("park");%>

        <div class="row justify-content-md-center">

            <div class="col-lg-6 col-sm-12 mb-5" style="margin-top: 25px;">
                <div class="package-info">
                    <div class="row justify-content-md-center">

                        <% if (park != null) {%>

                        <div class="col-12 text-center">
                            <h2 class="my-2"><span><%=park.getNaam()%></span></h2>  
                        </div>
                        <div class="col-6">
                            <img src="images/<%=park.getFoto()%>" class="rounded img-fluid" style="width: 250px"/>
                        </div>
                        <div class="col-6">
                            <p>AantalSterren: <%=park.getAantalSterren()%> </p> 
                            <a href="ParkServlet?parkId=<%=park.getId()%>">meer info</a>
                            <p>  <a href="index.jsp">Terug naar beginpagina</a></p>
                            <%if (park.getAantalSterren() == 5) { %>
                            <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></p>
                                    <% }%>
                                    <%if (park.getAantalSterren() == 4) { %>
                            <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i></p>
                                    <% }%>
                                    <%if (park.getAantalSterren() == 3) { %>
                            <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></p>
                                    <% }%>
                                    <%if (park.getAantalSterren() == 2) { %>
                            <p><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></p>
                                    <% }%>
                        </div>  
                        <% } else { %>
                        <p class="mx-2">Er is geen park gevonden met deze beginletters </p>                        
                        <p class="mx-2"><a href="index.jsp">Terug naar beginpagina</a></p>
                        <% }%>


                    </div>


                </div>
            </div> 
        </div>
        <jsp:include page="temp/footer.jsp" />
    </body>
</html>
