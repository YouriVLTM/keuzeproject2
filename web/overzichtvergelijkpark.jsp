<%-- 
    Document   : overzichtvergelijkpark
    Created on : May 22, 2019, 10:06:58 AM
    Author     : yourivanlaer
--%>

<%@page import="java.util.Hashtable"%>
<%@page import="fact.it.www.beans.Regio"%>
<%@page import="fact.it.www.beans.Regio"%>
<%@page import="fact.it.www.beans.Park"%>
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
                        <h1 class="heading text-center mb-5">Vergelijk 2 parken</h1>

                        <%Park park1 = (Park) request.getAttribute("park1");%>
                        <%Park park2 = (Park) request.getAttribute("park2");%>
                        <%Hashtable<Integer, Regio> regios = (Hashtable<Integer, Regio>) request.getAttribute("regios");%>

                        <%if (!regios.isEmpty()) {%>
                        <%if (park1 != null && park2 != null) {%>

                        <table class="table table-bordered">

                            <tbody>
                                <tr>
                                    <th scope="row">Foto </th>
                                    <td><img src="images/<%=park1.getFoto()%>" class="img-fluid mb-5"/></td>
                                    <td><img src="images/<%=park2.getFoto()%>" class="img-fluid mb-5"/></td>
                                </tr>
                                <tr>
                                    <th scope="row">Naam</th>
                                    <td><%=park1.getNaam()%></td>
                                    <td><%=park2.getNaam()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Regio</th>
                                    <td><%=regios.get(park1.getRegioid()).getNaam()%></td>
                                    <td><%=regios.get(park2.getRegioid()).getNaam()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Aantal sterren </th>
                                    <td><%=park1.getAantalSterren()%></td>
                                    <td><%=park2.getAantalSterren()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Voorzieningen </th>
                                    <td><%=park1.getVoorzieningen()%></td>
                                    <td><%=park2.getVoorzieningen()%></td>
                                </tr>
                            </tbody>
                        </table>

                        <br>
                        <br>
                        <a href="startparken.jsp" class="btn btn-outline-primary mx-1">Start parken</a>



                        <%} else {%>
                        <p>Park namen niet gevonden!</p>
                        <%}%>

                        <%} else {%>
                        <p>Regios id niet gevonden!</p>
                        <%}%>


                        <%String foutmelding = (String) request.getAttribute("foutmelding");%>
                        <%if (foutmelding != null) {%>
                        <div class="alert alert-danger">
                            <strong>Alert!</strong> 
                            <ul>
                                <%=foutmelding%>
                            </ul>
                        </div>
                        <%}%>


                    </div>

                </div>

            </div>
        </div>
    </section>
    <!-- tour packages -->

    <jsp:include page="temp/footer.jsp" />
</body>
</html>
