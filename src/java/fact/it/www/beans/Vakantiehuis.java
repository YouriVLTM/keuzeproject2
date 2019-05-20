/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fact.it.www.beans;

/**
 *
 * @author u0068237
 */
public class Vakantiehuis {

    private int id;
    private int parkid;
    private String type;
    private int aantalSlaapkamers;
    private int aantalPersonen;
    private int oppervlakte;

    public Vakantiehuis() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getParkid() {
        return parkid;
    }

    public void setParkid(int parkid) {
        this.parkid = parkid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getAantalSlaapkamers() {
        return aantalSlaapkamers;
    }

    public void setAantalSlaapkamers(int aantalSlaapkamers) {
        this.aantalSlaapkamers = aantalSlaapkamers;
    }

    public int getAantalPersonen() {
        return aantalPersonen;
    }

    public void setAantalPersonen(int aantalPersonen) {
        this.aantalPersonen = aantalPersonen;
    }

    public int getOppervlakte() {
        return oppervlakte;
    }

    public void setOppervlakte(int oppervlakte) {
        this.oppervlakte = oppervlakte;
    }

    @Override
    public String toString() {
        return "Vakantiehuis{" + "type=" + type + ", aantalSlaapkamers=" + aantalSlaapkamers + ", aantalPersonen=" + aantalPersonen + ", oppervlakte=" + oppervlakte + '}';
    }

}
