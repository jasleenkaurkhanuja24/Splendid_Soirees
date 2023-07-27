package com.ss.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OTPdao 
{
    private Connection con;
    public OTPdao(Connection con)
    {
        this.con = con;
    }
    public boolean savegeneratedOTP(String otp,String id)
    {
        boolean status = false;
        try{
        String query = "update user set otp = ? where email = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1,otp);
        ps.setString(2, id);
        int c = ps.executeUpdate();
        if(c!=0)
        {
            status = true;
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return status;
    }
    public String getotp(String id)
    {
        String otp=null;
        try{
        String query = "select otp from user where id = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1,id);
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {
            otp = rs.getString("otp");
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return otp;
    }
}
