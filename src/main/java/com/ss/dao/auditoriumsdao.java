package com.ss.dao;

import com.ss.entities.auditoriums;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class auditoriumsdao 
{
    private Connection con;
    public auditoriumsdao(Connection con)
    {
        this.con = con;
    }
    public boolean saveAuditoriumDetails(auditoriums a) throws SQLException
    {
        boolean status = false;
        try{
        String query = "insert into auditoriums(audi_name,audi_venue,audi_capacity,audi_refreshments,audi_cost,audi_contact_number,audi_emailid,audi_legal_paper,audi_picture,place_id,audi_cost_student) values(?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1,a.getName());
        ps.setString(2, a.getVenue());
        ps.setString(3, a.getCapacity());
        ps.setString(4,a.getRefreshments());
        ps.setString(5, a.getAudi_cost());
        ps.setString(6, a.getContact());
        ps.setString(7,a.getEmailid());
        ps.setString(8, a.getLegalpaper());
        ps.setString(9, a.getPicture());
        ps.setInt(10,a.getPlace_id());
        ps.setString(11, a.getAudi_cost_student());
        int c = ps.executeUpdate();
        if(c!=0)
        {
            status = true;
        }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            System.out.print(e);
        }
        return status;
    }
    public List getAuditoriums()
    {
        List<auditoriums> a = new ArrayList<>();
        try
        {
//             int below = audi_capacity;
//             int above = audi_capacity+50;
             String query = "select * from auditoriums";
             PreparedStatement ps = con.prepareStatement(query);
//             ps.setInt(1, below);
//             ps.setInt(2, above);
             ResultSet rs = ps.executeQuery();
             while(rs.next())
             {
                 int id = rs.getInt("audi_id");
                 String name = rs.getString("audi_name");
                 String venue = rs.getString("audi_venue");
                 String capacity = rs.getString("audi_capacity");
                 String refreshments = rs.getString("audi_refreshments");
                 String cost = rs.getString("audi_cost");
                 String contact = rs.getString("audi_contact_number");
                 String emailid = rs.getString("audi_emailid");
                 String legal_paper = rs.getString("audi_legal_paper");
                 String verification = rs.getString("audi_verification");
                 String picture = rs.getString("audi_picture");
                 String audi_cost_student = rs.getString("audi_cost_student");
                 int place_id = rs.getInt("place_id");
                 auditoriums ad = new auditoriums(id,name,venue,capacity,refreshments,cost,contact,emailid,legal_paper,verification,picture,place_id,audi_cost_student);
                 a.add(ad);
             }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return a;
        
    }
    
    public auditoriums getAuditoriumById(int id)
    {
        auditoriums a = null;
        try
        {
             String query = "select * from auditoriums where audi_id=?";
             PreparedStatement ps = con.prepareStatement(query);
             ps.setInt(1, id);
             ResultSet rs = ps.executeQuery();
             while(rs.next())
             {
                 String name = rs.getString("audi_name");
                 String venue = rs.getString("audi_venue");
                 String capacity = rs.getString("audi_capacity");
                 String refreshments = rs.getString("audi_refreshments");
                 String cost = rs.getString("audi_cost");
                 String contact = rs.getString("audi_contact_number");
                 String emailid = rs.getString("audi_emailid");
                 String legal_paper = rs.getString("audi_legal_paper");
                 String verification = rs.getString("audi_verification");
                 String picture = rs.getString("audi_picture");
                 String audi_cost_student = rs.getString("audi_cost_student");
                 int place_id = rs.getInt("place_id");
                 a = new auditoriums(id,name,venue,capacity,refreshments,cost,contact,emailid,legal_paper,verification,picture,place_id,audi_cost_student);
                     
             }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return a;
        
    }
}
