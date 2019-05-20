package fact.it.www.beans;

import java.sql.Date;

public class Huisaanbod {

    private int id;
    private int vakantiehuisid;
    private int periodeid;
    private int prijsperweek;

    public Huisaanbod() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVakantiehuisid() {
        return vakantiehuisid;
    }

    public void setVakantiehuisid(int vakantiehuisid) {
        this.vakantiehuisid = vakantiehuisid;
    }

    public int getPeriodeid() {
        return periodeid;
    }

    public void setPeriodeid(int periodeid) {
        this.periodeid = periodeid;
    }

    public int getPrijsperweek() {
        return prijsperweek;
    }

    public void setPrijsperweek(int prijsperweek) {
        this.prijsperweek = prijsperweek;
    }

    @Override
    public String toString() {
        return "Huisaanbod{" + "vakantiehuisid=" + vakantiehuisid + ", periodeid=" + periodeid + ", prijsperweek=" + prijsperweek + '}';
    }

    

}
