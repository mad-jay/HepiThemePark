/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author arish
 */
public class paymentBean implements java.io.Serializable  {
    
    private String CARDNO;
    private String CARDNAME;
    private String CVV;
    private String EXPMONTH;
    private String EXPYEAR;
    private String IC;
    
    public paymentBean(){
        
    }

    public paymentBean(String CARDNO, String CARDNAME, String CVV, String EXPMONTH, String EXPYEAR, String IC) {
        this.CARDNO = CARDNO;
        this.CARDNAME = CARDNAME;
        this.CVV = CVV;
        this.EXPMONTH = EXPMONTH;
        this.EXPYEAR = EXPYEAR;
        this.IC = IC;
    }

    public String getCARDNO() {
        return CARDNO;
    }

    public void setCARDNO(String CARDNO) {
        this.CARDNO = CARDNO;
    }

    public String getCARDNAME() {
        return CARDNAME;
    }

    public void setCARDNAME(String CARDNAME) {
        this.CARDNAME = CARDNAME;
    }

    public String getCVV() {
        return CVV;
    }

    public void setCVV(String CVV) {
        this.CVV = CVV;
    }

    public String getEXPMONTH() {
        return EXPMONTH;
    }

    public void setEXPMONTH(String EXPMONTH) {
        this.EXPMONTH = EXPMONTH;
    }

    public String getEXPYEAR() {
        return EXPYEAR;
    }

    public void setEXPYEAR(String EXPYEAR) {
        this.EXPYEAR = EXPYEAR;
    }

    public String getIC() {
        return IC;
    }

    public void setIC(String IC) {
        this.IC = IC;
    }

    

    
}
