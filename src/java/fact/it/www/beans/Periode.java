package fact.it.www.beans;

public class Periode {

    private int id;
    private String naam;

    public Periode() {
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


    @Override
    public String toString() {
        return naam;
    }


}
