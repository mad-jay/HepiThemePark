/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.util.Date;

/**
 *
 * @author mad
 */
public class ReserveBean implements java.io.Serializable {

    private String NAME;
    private String EMAIL;
    private String IC;
    private int ADULT_TICKET;
    private int CHILDREN_TICKET;
    private Date DATE;
    private int TOTALPRICE;

    public ReserveBean() {
    }

    public ReserveBean(String NAME, String EMAIL, String IC, int ADULT_TICKET, int CHILDREN_TICKET, Date DATE, int TOTALPRICE) {
        this.NAME = NAME;
        this.EMAIL = EMAIL;
        this.IC = IC;
        this.ADULT_TICKET = ADULT_TICKET;
        this.CHILDREN_TICKET = CHILDREN_TICKET;
        this.DATE = DATE;
        this.TOTALPRICE = TOTALPRICE;
    }

    public String getNAME() {
        return NAME;
    }

    public void setNAME(String NAME) {
        this.NAME = NAME;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    public String getIC() {
        return IC;
    }

    public void setIC(String IC) {
        this.IC = IC;
    }

    public int getADULT_TICKET() {
        return ADULT_TICKET;
    }

    public void setADULT_TICKET(int ADULT_TICKET) {
        this.ADULT_TICKET = ADULT_TICKET;
    }

    public int getCHILDREN_TICKET() {
        return CHILDREN_TICKET;
    }

    public void setCHILDREN_TICKET(int CHILDREN_TICKET) {
        this.CHILDREN_TICKET = CHILDREN_TICKET;
    }

    public Date getDATE() {
        return DATE;
    }

    public void setDATE(Date DATE) {
        this.DATE = DATE;
    }

    public int getTOTALPRICE() {
        return TOTALPRICE;
    }

    public void setTOTALPRICE(int TOTALPRICE) {
        this.TOTALPRICE = TOTALPRICE;
    }

    
}
