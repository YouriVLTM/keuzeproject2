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
public class Hotel {

    private int id;
    private String naam;
    private int regioid;
    private int aantalSterren;
    private String ligging;
    private String maaltijden;
    private String ontspanning;
    private String foto;

    public Hotel() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNaam() {
        return naam;
    }

    public void setNaam(String naam) {
        this.naam = naam;
    }

    public int getRegioid() {
        return regioid;
    }

    public void setRegioid(int regioid) {
        this.regioid = regioid;
    }

    public int getAantalSterren() {
        return aantalSterren;
    }

    public void setAantalSterren(int aantalSterren) {
        this.aantalSterren = aantalSterren;
    }

    public String getLigging() {
        return ligging;
    }

    public void setLigging(String ligging) {
        this.ligging = ligging;
    }

    public String getMaaltijden() {
        return maaltijden;
    }

    public void setMaaltijden(String maaltijden) {
        this.maaltijden = maaltijden;
    }

    public String getOntspanning() {
        return ontspanning;
    }

    public void setOntspanning(String ontspanning) {
        this.ontspanning = ontspanning;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    @Override
    public String toString() {
        return "Hotel{" + "naam=" + naam + ", regioid=" + regioid + ", aantalSterren=" + aantalSterren + ", ligging=" + ligging + ", maaltijden=" + maaltijden + ", ontspanning=" + ontspanning + '}';
    }

}
