package oes.model;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oes.db.Admins;
import oes.db.Provider;

public class AdminsDao {

    public static boolean doValidate(Admins ad) {
        boolean status = false;
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            con = Provider.getOracleConnection();
            if (con != null) {
                String sql = "SELECT * FROM admintable WHERE userid=? AND password=?";
                pst = con.prepareStatement(sql);
                pst.setString(1, ad.getUsername());
                pst.setString(2, ad.getPassword());
                rs = pst.executeQuery();

                if (rs.next()) {
                    status = true;
                }
            } else {
                System.err.println("Failed to establish a database connection.");
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
        } finally {
            closeResources(con, pst, rs);
        }

        return status;
    }

    private static void closeResources(Connection con, PreparedStatement pst, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.err.println("Error closing database resources: " + e.getMessage());
        }
    }
}
