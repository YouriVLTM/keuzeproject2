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
public class Hotelaanbod {
    private int id;
    private int hotelid;
    private int periodeid;
    private int prijsperdag;

    public Hotelaanbod() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHotelid() {
        return hotelid;
    }

    public void setHotelid(int hotelid) {
        this.hotelid = hotelid;
    }

    public int getPeriodeid() {
        return periodeid;
    }

    public void setPeriodeid(int periodeid) {
        this.periodeid = periodeid;
    }

    public int getPrijsperdag() {
        return prijsperdag;
    }

    public void setPrijsperdag(int prijsperdag) {
        this.prijsperdag = prijsperdag;
    }

    @Override
    public String toString() {
        return "Hotelaanbod{" + "hotelid=" + hotelid + ", periodeid=" + periodeid + ", prijsperdag=" + prijsperdag + '}';
    }




    
    
}
