/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author User
 */
public class RegisterBean implements java.io.Serializable{
    
    private String username, email, password, nophone;
    
    public RegisterBean(){
        this.username = null;
        this.email = null;
        this.password = null;
        this.nophone = null;
    }

    public RegisterBean(String username, String email, String password, String nophone) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.nophone = nophone;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getNophone() {
        return nophone;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setNophone(String nophone) {
        this.nophone = nophone;
    }
    
    
    
}
