package fact.it.www;

import fact.it.www.beans.*;
import fact.it.www.dataaccess.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ParkServlet", urlPatterns = {"/ParkServlet"}, initParams = {
    @WebInitParam(name = "url", value = "jdbc:oracle:thin:@itf-oracledb01.thomasmore.be:1521:XE")
    ,
    @WebInitParam(name = "login", value = "r0662682")
    ,
    @WebInitParam(name = "password", value = "1234")
    ,
    @WebInitParam(name = "driver", value = "oracle.jdbc.driver.OracleDriver")})

public class ParkServlet extends HttpServlet {

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
        if (request.getParameter("vakantiePark1") != null) {

            Park park = dapark.getPark();

            rd = request.getRequestDispatcher("park.jsp");
            request.setAttribute("park", park);

        } else if (request.getParameter("vakantiePark") != null) {
            String naam = request.getParameter("naam");

            Park park = dapark.getPark(naam);

            rd = request.getRequestDispatcher("park.jsp");
            request.setAttribute("park", park);

        } else if (request.getParameter("alleVakantiePark") != null) {

            ArrayList<Regio> alleRegios = daregio.getAlleRegios();

            ArrayList<Park> parken = dapark.getParken();

            rd = request.getRequestDispatcher("overzichtparken.jsp");
            request.setAttribute("parken", parken);
            request.setAttribute("alleRegios", alleRegios);

        } else if (request.getParameter("parkId") != null) {
            int parkId = Integer.parseInt(request.getParameter("parkId"));

            Park park = dapark.getParkId(parkId);
            // vraag regio op
            Regio regio = daregio.getRegionaamByParkId(parkId);
            // vakantiehuizen beschikbaar 
            ArrayList<Vakantiehuis> vakantiehuis = davakantiehuis.getVakantiehuizenByParkIdBeschikbaar(parkId);

            rd = request.getRequestDispatcher("parkdetails.jsp");
            request.setAttribute("park", park);
            request.setAttribute("regio", regio);
            request.setAttribute("vakantiehuis", vakantiehuis);

        } else if (request.getParameter("vakantiehuisId") != null) {
            int vakantiehuisId = Integer.parseInt(request.getParameter("vakantiehuisId"));
            Vakantiehuis vakantiehuis = davakantiehuis.getVakantiehuizenById(vakantiehuisId);

            // huisaanbod
            ArrayList<Huisaanbod> huisaanboden = daHuisaanbod.getHuisaanbodByVakantiehuisId(vakantiehuisId);

            //periode
            ArrayList<Periode> periodes = daperiode.getVanantiehuisPrijs(vakantiehuisId);

            rd = request.getRequestDispatcher("huisprijs.jsp");
            request.setAttribute("vakantiehuis", vakantiehuis);
            request.setAttribute("huisaanboden", huisaanboden);
            request.setAttribute("periodes", periodes);
        } else if (request.getParameter("voegparktoepagina") != null) {
            // voeg park toe surf naar pagina
            ArrayList<Regio> alleRegios = daregio.getAlleRegios();

            rd = request.getRequestDispatcher("voegparktoe.jsp");
            request.setAttribute("alleRegios", alleRegios);
        } else if (request.getParameter("maaknieuwparkaan") != null) {
            // voeg park toe surf naar pagina
            String parknaam = request.getParameter("naam");
            int regioId = Integer.parseInt(request.getParameter("regioId"));
            int aantalSterren = Integer.parseInt(request.getParameter("aantalSterren"));
            String voorzieningen = request.getParameter("Voorzieningen");
            String fotonaam = request.getParameter("fotonaam");

            if (!dapark.zoekParkNaam(parknaam.toLowerCase())) {
                // Het park bestaat nog niet
                // insert
                if (dapark.insertPark(parknaam, regioId, aantalSterren, voorzieningen, fotonaam)) {
                    rd = request.getRequestDispatcher("startparken.jsp");
                    request.setAttribute("melding", "Park succesvol toe gevoegd");

                } else {
                    ArrayList<Regio> alleRegios = daregio.getAlleRegios();
                    request.setAttribute("alleRegios", alleRegios);
                    rd = request.getRequestDispatcher("voegparktoe.jsp");
                    request.setAttribute("foutmelding", "Er is een fout opgetreden bij het inserten van park");

                }

            } else {

                ArrayList<Regio> alleRegios = daregio.getAlleRegios();
                request.setAttribute("alleRegios", alleRegios);
                rd = request.getRequestDispatcher("voegparktoe.jsp");
                request.setAttribute("foutmelding", "Er bestaat al een park met deze naam.");

            }

        } else if (request.getParameter("adminoverzichtparken") != null) {
            // Hastable 

            ArrayList<Park> parken = dapark.getParken();
            //hashtable
            Hashtable<Integer, Regio> regios = daregio.getAlleRegiosHash();
            rd = request.getRequestDispatcher("adminoverzichtparken.jsp");
            request.setAttribute("parken", parken);
            request.setAttribute("regios", regios);
        } else if (request.getParameter("adminoverzichtparkendelete") != null) {
            int parkId = Integer.parseInt(request.getParameter("adminoverzichtparkendelete"));
            // delete park

            if (dapark.deletePark(parkId)) {
                ArrayList<Park> parken = dapark.getParken();
                rd = request.getRequestDispatcher("adminoverzichtparken.jsp");
                request.setAttribute("parken", parken);
                request.setAttribute("melding", "Park is succesvol gedelete!");

            } else {
                ArrayList<Park> parken = dapark.getParken();
                rd = request.getRequestDispatcher("adminoverzichtparken.jsp");
                request.setAttribute("parken", parken);
                request.setAttribute("foutmelding", "Deze park kan niet worden delete!");

            }

        } else if (request.getParameter("wijzigparkpagina") != null) {
            int parkId = Integer.parseInt(request.getParameter("wijzigparkpagina"));

            Park park = dapark.getParkId(parkId);

            ArrayList<Regio> alleRegios = daregio.getAlleRegios();

            // alle regio's tonen
            ArrayList<Vakantiehuis> vakantiehuizen = davakantiehuis.getVakantiehuizenByParkIdBeschikbaar(parkId);

            rd = request.getRequestDispatcher("wijzigpark.jsp");
            request.setAttribute("park", park);
            request.setAttribute("alleRegios", alleRegios);
            request.setAttribute("vakantiehuizen", vakantiehuizen);

        } else if (request.getParameter("wijzigpark") != null) {

            int parkId = Integer.parseInt(request.getParameter("parkIdla"));
            String parknaam = request.getParameter("naam");
            int regioId = Integer.parseInt(request.getParameter("regioId"));
            int aantalSterren = Integer.parseInt(request.getParameter("aantalSterren"));
            String voorzieningen = request.getParameter("Voorzieningen");
            String fotonaam = request.getParameter("fotonaam");

            if (dapark.updatePark(parkId, parknaam, regioId, aantalSterren, voorzieningen, fotonaam)) {
                ArrayList<Park> parken = dapark.getParken();
                rd = request.getRequestDispatcher("adminoverzichtparken.jsp");
                request.setAttribute("parken", parken);
                request.setAttribute("melding", "Park succesvol geupdate");
            } else {
                ArrayList<Park> parken = dapark.getParken();
                rd = request.getRequestDispatcher("adminoverzichtparken.jsp");
                request.setAttribute("parken", parken);
                request.setAttribute("foutmelding", "Deze park kan niet worden geupdate");

            }

        } else if (request.getParameter("adminoverzichtvakantiehuizen") != null) {

            ArrayList<Vakantiehuis> vakantiehuizen = davakantiehuis.getVakantiehuizen();

            Hashtable<Integer, Park> parken = dapark.getAlleParkenHash();

            rd = request.getRequestDispatcher("adminoverzichtvakantiehuizen.jsp");
            request.setAttribute("vakantiehuizen", vakantiehuizen);
            request.setAttribute("parken", parken);

        } else if (request.getParameter("wijzigvakantiehuispagina") != null) {
            int vakantiehuisId = Integer.parseInt(request.getParameter("wijzigvakantiehuispagina"));

            ArrayList<Huisaanbod> huisaanboden = daHuisaanbod.getHuisaanbodByVakantiehuisId(vakantiehuisId);
            Vakantiehuis vakantiehuis = davakantiehuis.getVakantiehuizenById(vakantiehuisId);
            // alle regio's tonen
            ArrayList<Park> parken = dapark.getParken();
            //Hashtabels
            Hashtable<Integer, Regio> regios = daregio.getAlleRegiosHash();

            rd = request.getRequestDispatcher("wijzigvakantiehuis.jsp");
            request.setAttribute("huisaanboden", huisaanboden);
            request.setAttribute("vakantiehuis", vakantiehuis);
            request.setAttribute("parken", parken);
            request.setAttribute("regios", regios);
        } else if (request.getParameter("voegvakantiehuistoepagina") != null) {

            ArrayList<Park> parken = dapark.getParken();
            rd = request.getRequestDispatcher("voegvakantiehuistoe.jsp");
            request.setAttribute("parken", parken);
        } else if (request.getParameter("maaknieuwvakantiehuisaan") != null) {
            // voeg park toe surf naar pagina
            int parkId = Integer.parseInt(request.getParameter("parkIdvakantie"));
            String type = request.getParameter("type");
            int aantalSlaapkamers = Integer.parseInt(request.getParameter("aantalSlaapkamers"));
            int aantalPersonen = Integer.parseInt(request.getParameter("aantalPersonen"));
            int oppervlakte = Integer.parseInt(request.getParameter("oppervlakte"));

            if (davakantiehuis.insertVakantiehuis(parkId, type, aantalSlaapkamers, aantalPersonen, oppervlakte)) {
                ArrayList<Vakantiehuis> vakantiehuizen = davakantiehuis.getVakantiehuizen();
                rd = request.getRequestDispatcher("adminoverzichtvakantiehuizen.jsp");
                request.setAttribute("vakantiehuizen", vakantiehuizen);
                request.setAttribute("melding", "Vakantiehuis succesvol toe gevoegd");

            } else {
                ArrayList<Vakantiehuis> vakantiehuizen = davakantiehuis.getVakantiehuizen();
                rd = request.getRequestDispatcher("adminoverzichtvakantiehuizen.jsp");
                request.setAttribute("vakantiehuizen", vakantiehuizen);
                request.setAttribute("foutmelding", "Er is een fout opgetreden bij het inserten van park");

            }
        } else if (request.getParameter("adminoverzichtvakantiehuisdelete") != null) {
            int vakantiehuisId = Integer.parseInt(request.getParameter("adminoverzichtvakantiehuisdelete"));
            // delete park

            if (davakantiehuis.deleteVakantie(vakantiehuisId)) {
                ArrayList<Vakantiehuis> vakantiehuizen = davakantiehuis.getVakantiehuizen();
                rd = request.getRequestDispatcher("adminoverzichtvakantiehuizen.jsp");
                request.setAttribute("vakantiehuizen", vakantiehuizen);
                request.setAttribute("melding", "Park is succesvol gedelete!");

            } else {
                ArrayList<Vakantiehuis> vakantiehuizen = davakantiehuis.getVakantiehuizen();
                rd = request.getRequestDispatcher("adminoverzichtvakantiehuizen.jsp");
                request.setAttribute("vakantiehuizen", vakantiehuizen);
                request.setAttribute("foutmelding", "Deze park kan niet worden delete!");

            }

        } else if (request.getParameter("wijzigvakantiehuis") != null) {

            int vakantiehuisId = Integer.parseInt(request.getParameter("vakantiehuisIdwijzigen"));
            int parkId = Integer.parseInt(request.getParameter("parkIdvakantie"));
            String type = request.getParameter("type");
            int aantalSlaapkamers = Integer.parseInt(request.getParameter("aantalSlaapkamers"));
            int aantalPersonen = Integer.parseInt(request.getParameter("aantalPersonen"));
            int oppervlakte = Integer.parseInt(request.getParameter("oppervlakte"));

            if (davakantiehuis.updateVakantiehuis(vakantiehuisId, parkId, type, aantalSlaapkamers, aantalPersonen, oppervlakte)) {
                ArrayList<Vakantiehuis> vakantiehuizen = davakantiehuis.getVakantiehuizen();
                Hashtable<Integer, Park> parken = dapark.getAlleParkenHash();
                rd = request.getRequestDispatcher("adminoverzichtvakantiehuizen.jsp");
                request.setAttribute("vakantiehuizen", vakantiehuizen);
                request.setAttribute("parken", parken);

                request.setAttribute("melding", "Vakantiehuis succesvol bijgewerkt!");
            } else {
                ArrayList<Vakantiehuis> vakantiehuizen = davakantiehuis.getVakantiehuizen();
                Hashtable<Integer, Park> parken = dapark.getAlleParkenHash();

                rd = request.getRequestDispatcher("adminoverzichtvakantiehuizen.jsp");
                request.setAttribute("vakantiehuizen", vakantiehuizen);
                request.setAttribute("parken", parken);
                request.setAttribute("foutmelding", "Vakantiehuis kan niet worden bijgewerk!");

            }

        } else if (request.getParameter("wijzighuisaanbodpagina") != null) {
            int huisaanbodId = Integer.parseInt(request.getParameter("wijzighuisaanbodpagina"));

            Huisaanbod huisaanbod = daHuisaanbod.getHuisaandbodId(huisaanbodId);

            // alle regio's tonen
            rd = request.getRequestDispatcher("wijzighuisaanbod.jsp");
            request.setAttribute("huisaanbod", huisaanbod);

        } else if (request.getParameter("wijzighuisaanbod") != null) {

            int huisaanbodId = Integer.parseInt(request.getParameter("huisaanbodId"));
            int prijsperweek = Integer.parseInt(request.getParameter("prijsperweek"));

            if (daHuisaanbod.updateHuisaanbod(huisaanbodId, prijsperweek)) {
                ArrayList<Vakantiehuis> vakantiehuizen = davakantiehuis.getVakantiehuizen();
                Hashtable<Integer, Park> parken = dapark.getAlleParkenHash();
                rd = request.getRequestDispatcher("adminoverzichtvakantiehuizen.jsp");
                request.setAttribute("vakantiehuizen", vakantiehuizen);
                request.setAttribute("parken", parken);
                request.setAttribute("melding", "Prijs perweek succesvol bijgewerkt!");
            } else {
                ArrayList<Vakantiehuis> vakantiehuizen = davakantiehuis.getVakantiehuizen();
                Hashtable<Integer, Park> parken = dapark.getAlleParkenHash();
                rd = request.getRequestDispatcher("adminoverzichtvakantiehuizen.jsp");
                request.setAttribute("vakantiehuizen", vakantiehuizen);
                request.setAttribute("parken", parken);
                request.setAttribute("foutmelding", "Prijs per week kan niet worden bijgewerk!");

            }

        }  else if (request.getParameter("adminoverzichtpagina") != null) {
            // Haal aantal parken op
            int aantalparken = dapark.getAantalParken();
            int aantalvakantiehuizen = davakantiehuis.getAantalVakantiehuizen();
            int grootsteprijshuisaanbod = daHuisaanbod.getGrootstePrijs();
            int laagsteprijshuisaanbod = daHuisaanbod.getLaagstePrijs();

            
            // alle regio's tonen
            rd = request.getRequestDispatcher("adminoverzicht.jsp");
            request.setAttribute("aantalparken", aantalparken);
            request.setAttribute("aantalvakantiehuizen", aantalvakantiehuizen);
            request.setAttribute("grootsteprijshuisaanbod", grootsteprijshuisaanbod);
            request.setAttribute("laagsteprijshuisaanbod", laagsteprijshuisaanbod);


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
