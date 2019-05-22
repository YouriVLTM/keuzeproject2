<%-- 
    Document   : deletepark
    Created on : May 22, 2019, 10:06:58 AM
    Author     : yourivanlaer
--%>

<%@page import="fact.it.www.beans.Park"%>
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
                        <h1 class="heading text-center mb-5">Lijst van Parken</h1>

                        <%String foutmelding = (String) request.getAttribute("foutmelding");%>
                        <%if (foutmelding != null) {%>
                        <div class="alert alert-danger">
                            <strong>Alert!</strong> 
                            <ul>
                                <%=foutmelding%>
                            </ul>
                        </div>
                        <%}%>
                        <%String melding = (String) request.getAttribute("melding");%>
                        <%if (melding != null) {%>
                        <div class="alert alert-success">
                            <strong>Alert!</strong> 
                            <ul>
                                <%=melding%>
                            </ul>
                        </div>
                        <%}%>
                        <a href="startparken.jsp" class="btn btn-outline-primary">Terug naar parken</a>
                        <a href="ParkServlet?voegparktoepagina=1" class="btn btn-outline-primary">Voeg nieuw park toe</a>
                        <br>
                        <br>

                        <%ArrayList<Park> parken = (ArrayList<Park>) request.getAttribute("parken");%>

                        <% if (parken != null) { %>

                        <table id="dtBasicParken" class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">id</th>
                                    <th scope="col">Naam</th>
                                    <th scope="col">RegioId</th>
                                    <th scope="col">Aantalsterren</th>
                                    <th scope="col">voorzieningen</th>
                                    <th scope="col">foto</th>
                                    <th scope="col">Edit</th>
                                    <th scope="col">Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (Park park : parken) {%>
                                <tr>
                                    <th scope="row"><%=park.getId()%></th>
                                    <td><%=park.getNaam()%></td>
                                    <td><%=park.getRegioid()%></td>
                                    <td><%=park.getAantalSterren()%></td>
                                    <td><%=park.getVoorzieningen()%></td>
                                    <td><img src="images/<%=park.getFoto()%>" onerror="this.src='images/noPic.png'"class="img-fluid" ><%=park.getFoto()%></td>
                                    <td><a href="ParkServlet?wijzigparkpagina=<%=park.getId()%>" <i class="far fa-edit"></i></a> </td>
                                    <td><a href="ParkServlet?adminoverzichtparkendelete=<%=park.getId()%>" <i class="fas fa-trash"></i></a></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <%} else {%>
                        <p>Er is geen park gevonden</p>        
                        <%}%>
                    </div>
                </div>
        </section>
        <!-- tour packages -->
        <jsp:include page="temp/footer.jsp" />
        
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
       <script type="text/javascript" charset="utf8" src="temp/table.js"></script>

    </body>
</html>
