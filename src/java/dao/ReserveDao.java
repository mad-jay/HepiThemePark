/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.ReserveBean;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import util.DBConnection;

/**
 *
 * @author mad
 */
public class ReserveDao {

    public ReserveDao() {
    }

    public LinkedList getAllReserve() {

        LinkedList reserveList = new LinkedList();
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String sql = "";
        String NAME = "";
        String EMAIL = "";
        String IC = "";
        int ADULT_TICKET = 0;
        int CHILDREN_TICKET = 0;
        Date DATE;
        int TOTALPRICE = 0;

        try {
            con = DBConnection.createConnection();
            statement = con.createStatement();

            sql = "select * from ticket";

            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                NAME = resultSet.getString("NAME");
                EMAIL = resultSet.getString("EMAIL");
                IC = resultSet.getString("IC");
                ADULT_TICKET = resultSet.getInt("ADULT_TICKET");
                CHILDREN_TICKET = resultSet.getInt("CHILDREN_TICKET");
                DATE = resultSet.getDate("DATE");
                TOTALPRICE = resultSet.getInt("TOTALPRICE");

                ReserveBean reserve = new ReserveBean(NAME, EMAIL, IC, ADULT_TICKET, CHILDREN_TICKET, DATE, TOTALPRICE);
                reserveList.add(reserve);
                return reserveList;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return reserveList;
    }

    public static List<ReserveBean> queryReserve(String a) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.createConnection(); //Fetch database connection object
        PreparedStatement ps = con.prepareStatement("SELECT NAME, EMAIL, IC, ADULT_TICKET, CHILDREN_TICKET, DATE, TOTALPRICE from TICKET where NAME='" + a + "'");

        ResultSet rs = ps.executeQuery();
        List<ReserveBean> list = new ArrayList();
        while (rs.next()) {
            String NAME = rs.getString("NAME");
            String EMAIL = rs.getString("EMAIL");
            String IC = rs.getString("IC");
            int ADULT_TICKET = rs.getInt("ADULT_TICKET");
            int CHILDREN_TICKET = rs.getInt("CHILDREN_TICKET");
            Date DATE = rs.getDate("DATE");
            int TOTALPRICE = rs.getInt("TOTALPRICE");
            ReserveBean reserve = new ReserveBean();

            reserve.setNAME(NAME);
            reserve.setEMAIL(EMAIL);
            reserve.setIC(IC);
            reserve.setADULT_TICKET(ADULT_TICKET);
            reserve.setCHILDREN_TICKET(CHILDREN_TICKET);
            reserve.setDATE(DATE);
            reserve.setTOTALPRICE(TOTALPRICE);

            list.add(reserve);
        }
        return list;
    }

    public String deleteReserve(String ic) {

        Connection con = null;
        Statement statement = null;
        String sql = "";

        try {
            con = DBConnection.createConnection();
            statement = con.createStatement();

            sql = "delete from TICKET where ic= '" + ic + "'";

            statement.executeUpdate(sql);

            return "SUCCESS";

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return "FAILED. PLEASE TRY AGAIN";
    }

    public String update_booking(ReserveBean updateBean) {
        String IC = updateBean.getIC();
        String EMAIL = updateBean.getEMAIL();
        int ADULT_TICKET =  updateBean.getADULT_TICKET();
        int CHILDREN_TICKET = updateBean.getCHILDREN_TICKET();
        int TOTALPRICE = updateBean.getTOTALPRICE();
        java.util.Date utilDate = updateBean.getDATE();
        java.sql.Date DATE = new java.sql.Date(utilDate.getTime());

        Connection con = null;
        PreparedStatement statement = null;

        
        try {
            con = DBConnection.createConnection();

            String query = "update TICKET set EMAIL = ?, ADULT_TICKET = ?, CHILDREN_TICKET = ?, DATE = ?, TOTALPRICE = ? WHERE IC = ?";
            statement = con.prepareStatement(query);
            statement.setString(1, EMAIL);
            statement.setInt(2, ADULT_TICKET);
            statement.setInt(3, CHILDREN_TICKET);
            statement.setDate(4, DATE);
            statement.setInt(5, TOTALPRICE);
            statement.setString(6, IC);

            int i = statement.executeUpdate();

            if (i != 0) {
                return "UPDATE SUCCESS";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "UPDATE FAILED";

    }

}
