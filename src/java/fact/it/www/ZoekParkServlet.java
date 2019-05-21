package fact.it.www;

import fact.it.www.beans.*;
import fact.it.www.dataaccess.*;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ZoekParkServlet", urlPatterns = {"/ZoekParkServlet"}, initParams = {
    @WebInitParam(name = "url", value = "jdbc:oracle:thin:@itf-oracledb01.thomasmore.be:1521:XE"),
    @WebInitParam(name = "login", value = "r0662682"),
    @WebInitParam(name = "password", value = "1234"),
    @WebInitParam(name = "driver", value = "oracle.jdbc.driver.OracleDriver")})

public class ZoekParkServlet extends HttpServlet {

    private DAPark dapark = null;
    private DARegio daregio = null;
    private DAVakantiehuis davakantiehuis = null;
    private DAHuisaanbod daHuisaanbod = null;
    private DAPeriode daperiode = null;

    public void init() throws ServletException {
        try {
            String url = getInitParameter("url");
            String login = getInitParameter("login");
            String password = getInitParameter("password");
            String driver = getInitParameter("driver");
            if (dapark == null) {
                dapark = new DAPark(url, login, password, driver);
            }
            if (daregio == null) {
                daregio = new DARegio(url, login, password, driver);
            }

            if (davakantiehuis == null) {
                davakantiehuis = new DAVakantiehuis(url, login, password, driver);
            }
            if (daHuisaanbod == null) {
                daHuisaanbod = new DAHuisaanbod(url, login, password, driver);
            }
            if (daperiode == null) {
                daperiode = new DAPeriode(url, login, password, driver);
            }

        } catch (ClassNotFoundException e) {
            throw new ServletException(e);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//vul aan
 RequestDispatcher rd = null;
        if(request.getParameter("uitgebreid") != null){  
            
            
            ArrayList<Regio> alleRegios = daregio.getAlleRegios();
            
            rd = request.getRequestDispatcher("zoekpark.jsp");
            request.setAttribute("alleRegios", alleRegios);

            
        }else if(request.getParameter("zoekParkAantalSterren") != null){
            int aantalSterren = Integer.parseInt(request.getParameter("aantalSterren"));            
            
             ArrayList<Park> parken = dapark.getAantalSterren(aantalSterren);            
            
            rd = request.getRequestDispatcher("overzichtparken.jsp");
            request.setAttribute("parken", parken);
            
        }else if(request.getParameter("zoekParkRegio") != null){
            
            int regio = Integer.parseInt(request.getParameter("regio")); 
            
            
             ArrayList<Park> parken = dapark.getParksByRegio(regio);
            
            
            rd = request.getRequestDispatcher("overzichtparken.jsp");
            request.setAttribute("parken", parken);
            
        }else if(request.getParameter("zoekParkNaam") != null){
            
            String parkNaam = request.getParameter("parkNaam"); 
            
            ArrayList<Park> parken = dapark.getParkNaam(parkNaam);
            
            
            rd = request.getRequestDispatcher("overzichtparken.jsp");
            request.setAttribute("parken", parken);
        }else if(request.getParameter("zoekAantalslaapkamers") != null){
            
            int aantalslaapkamers = Integer.parseInt(request.getParameter("aantalSlaapkamers")); 
            
            ArrayList<Park> parken = dapark.getParkAantalSlaapkamers(aantalslaapkamers);
            
            
            rd = request.getRequestDispatcher("overzichtparken.jsp");
            request.setAttribute("parken", parken);
        }
      
        



        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
