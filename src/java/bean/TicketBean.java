/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author user
 */
public class TicketBean {
    private String name, email, ic, date;
    private int  totalprice, total_adults, total_children;

    public TicketBean(String name, String email, String ic, int totalprice, int total_adults, int total_children, String date) {
        this.name = name;
        this.email = email;
        this.ic = ic;
        this.totalprice = totalprice;
        this.total_adults = total_adults;
        this.total_children = total_children;
        this.date = date;
    }
    
    public TicketBean() {
        this.name = "";
        this.email = "";
        this.ic = "";
        this.totalprice = 0;
        this.total_adults = 0;
        this.total_children = 0;
        this.date = "";
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getIc() {
        return ic;
    }

    public int getTotalprice() {
        return totalprice;
    }

    public int getTotal_adults() {
        return total_adults;
    }

    public int getTotal_children() {
        return total_children;
    }

    public String getDate() {
        return date;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setIc(String ic) {
        this.ic = ic;
    }

    public void setTotalprice(int totalprice) {
        this.totalprice = totalprice;
    }

    public void setTotal_adults(int total_adults) {
        this.total_adults = total_adults;
    }

    public void setTotal_children(int total_children) {
        this.total_children = total_children;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    
    
    
}
