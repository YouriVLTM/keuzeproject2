<%@page import="fact.it.www.beans.Regio"%>
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

        <div class="row justify-content-md-center">                 
            <section class="packages pt-5">
                <div class="container py-lg-4 py-sm-3">

                    <%Regio regio = (Regio) request.getAttribute("regio");%>
                    <h1>Vakantieplanner</h1>
                    <p>Regio: <%=regio.getNaam()%> </p>                   
                    <p>  <a href="index.jsp">Terug naar beginpagina</a></p>

                </div>
            </section>
        </div>

        <jsp:include page="temp/footer.jsp" />
    </body>
</html>
