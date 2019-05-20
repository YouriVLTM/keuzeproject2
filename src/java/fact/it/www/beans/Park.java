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
public class Park {
    private  int id;
    private String naam;
    private int regioid;
    private int aantalSterren;
    private String voorzieningen;
    private String foto;

    public Park() {
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

    public String getVoorzieningen() {
        return voorzieningen;
    }

    public void setVoorzieningen(String voorzieningen) {
        this.voorzieningen = voorzieningen;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    @Override
    public String toString() {
        return naam + " (" + aantalSterren + "*): " + voorzieningen;
    }
    
    
}
