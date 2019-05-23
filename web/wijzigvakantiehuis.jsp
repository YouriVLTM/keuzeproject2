<%-- 
    Document   : wijzigvakantiehuis
    Created on : May 22, 2019, 10:06:58 AM
    Author     : yourivanlaer
--%>

<%@page import="fact.it.www.beans.Huisaanbod"%>
<%@page import="fact.it.www.beans.Vakantiehuis"%>
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
        
        <%Vakantiehuis vakantiehuis = (Vakantiehuis) request.getAttribute("vakantiehuis");%>


        <section class="packages pt-5">
            <div class="container py-lg-4 py-sm-3">

                <div class="row">               

                    <div class="col-lg-12 contact-left-form">
                        <h1 class="heading text-center mb-5">Wijzig vakantiehuis</h1>

                        <form action="ParkServlet" >
                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="vakantiehuisId">Park id</label>
                                    <input type="text" class="form-control" id="vakantiehuisId" name="vakantiehuisIdwijzigen" value="<%=vakantiehuis.getId()%>" readonly>
                                </div>
                            </div>
                            
                            <%ArrayList<Park> parken = (ArrayList<Park>) request.getAttribute("parken");%>
                            <div class="form-row">
                                <div class="form-group col-md-5">
                                    <label for="park">In welke regio moet het Park liggen?</label>
                                </div>
                                <div class="form-group col-md-3"> 
                                    <select class="form-control" name="parkIdvakantie" id="park">
                                        <%for (Park park : parken) {%>
                                        <option value="<%=park.getId()%>"><%=park.getNaam()%></option>
                                        <%}%>
                                    </select>
                                </div>  
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="type">Type</label>
                                    <input type="text" class="form-control" id="type" name="type" placeholder="type" value="<%=vakantiehuis.getType()%>">
                                </div>
                            </div>

                            
                            <div class="form-row">
                                <div class="form-group col-md-6 contact-forms">
                                    <label for="aantalSlaapKamers">aantal slaapkamers</label>
                                    <input type="text" class="form-control" id="aantalSlaapKamers" name="aantalSlaapkamers" placeholder="aantal slaap kamers" value="<%=vakantiehuis.getAantalSlaapkamers()%>">
                                </div>

                            </div>
                            <div class="form-row">

                                <div class="form-group col-md-6 contact-forms">
                                    <label for="aantalPersonen">aantal personen</label>
                                    <input type="text" class="form-control" id="aantalPersonen" name="aantalPersonen" placeholder="aantal personen" value="<%=vakantiehuis.getAantalPersonen()%>">
                                </div>

                            </div>
                            <div class="form-row">

                                <div class="form-group col-md-6 contact-forms">
                                    <label for="oppervlakte">Oppervlakte</label>
                                    <input type="text" class="form-control" id="oppervlakte" name="oppervlakte" placeholder="oppervlakte" value="<%=vakantiehuis.getOppervlakte()%>" >
                                </div>

                            </div>
                                
                                <h2>Prijzen</h2>
                                
                            <%ArrayList<Huisaanbod> huisaanboden = (ArrayList<Huisaanbod>) request.getAttribute("huisaanboden");%>
                            
                                <p></p>
                                <p></p>
                                <p></p>
                                <p></p>
                            
                            
                            <% if (!huisaanboden.isEmpty()) { %>

                        <table id="dtBasicParken" class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">id</th>
                                    <th scope="col">periodeId</th>
                                    <th scope="col">getprijsperweek</th>
                                    <th scope="col">Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (Huisaanbod huisaanbod : huisaanboden) {%>
                                <tr>
                                    <th scope="row"><%=huisaanbod.getId()%></th>
                                    <td><%=huisaanbod.getPeriodeid()%></td>
                                    <td><%=huisaanbod.getPrijsperweek()%> €</td>
                                    <td><a href="ParkServlet?wijzighuisaanbodpagina=<%=huisaanbod.getId()%>" <i class="far fa-edit"></i></a> </td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                        <%} else {%>
                        <p>Er is zijn geen gevonden</p>        
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

                            <div class="form-row">
                                <div class="col-6">
                                    <input type="submit" class="btn  sent-butnn btn-outline-primary" name="wijzigvakantiehuis" value="Wijziging opslaan vakantiehuis" />
                                </div>
                            </div>
                    </div>
                    </form>
                </div>
                <a href="startparken.jsp" class="btn btn-outline-primary">Terug naar parken</a>
            </div>
        </div>
    </section>
    <!-- tour packages -->



    <jsp:include page="temp/footer.jsp" />
</body>
</html>
