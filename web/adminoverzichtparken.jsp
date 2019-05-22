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

                        <%ArrayList<Park> parken = (ArrayList<Park>) request.getAttribute("parken");%>

                        <% if (parken != null) { %>

                            <table class="table table-hover">
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
                                    <% for (Park park : parken) { %>
                            
                            <tr>
                                    
                                    <th scope="row"><%=park.getId()%></th>
                                    <th><%=park.getNaam()%></th>
                                    <th><%=park.getRegioid()%></th>
                                    <th><%=park.getAantalSterren()%></th>
                                    <th><%=park.getVoorzieningen()%></th>
                                    <th><img src="images/<%=park.getFoto()%>" class="img-fluid"><%=park.getFoto()%></th>
                                    <th><a href="ParkServlet?adminoverzichtparkendelete=<%=park.getId()%>" <i class="far fa-edit"></i></a> </th>
                                    <th><a href="ParkServlet?adminoverzichtparkendelete=<%=park.getId()%>" <i class="fas fa-trash"></i></a></th>

                                                                        
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
    </body>
</html>
