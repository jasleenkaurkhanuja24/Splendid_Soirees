package com.ss.dao;
import com.ss.entities.event;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class eventdao 
{
   private Connection con=null;
    public eventdao(Connection con)
    {
        this.con = con;
    } 
     public int saveeventData(event e)
    {
         int id=0;
        try{
        String query = "insert into event(event_name, inst_name, event_content, event_date_from, event_time_from,event_capacity,event_refreshments, event_date_to, event_time_to,audi_id,place_id) values (?,?,?,?,?,?,?,?,?,?,?)";
//        String query = "insert into user values(firstname,lastname,email,password,role) values (?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, e.getEvent_name());
        ps.setString(2, e.getInst_name());
        ps.setString(3, e.getEvent_content());
        ps.setString(4, e.getEvent_date_from());
        ps.setString(5, e.getEvent_time_from());
        ps.setInt(6, e.getEvent_capacity());
        ps.setString(7, e.getEvent_refreshments());
        ps.setString(8, e.getEvent_date_to());
        ps.setString(9, e.getEvent_time_to());
        ps.setInt(10, e.getAudi_id());
        ps.setInt(11, e.getPlace_id());
        int c = ps.executeUpdate();
        System.out.println(c);
         String query1 = "select event_id from event where event_name=? and inst_name=?";
        PreparedStatement ps1 = con.prepareStatement(query1);
        ps1.setString(1, e.getEvent_name());
        ps1.setString(2, e.getInst_name());
//        ps1.setString(3, e.getEvent_content());
//        ps1.setString(4, e.getEvent_date_from());
//        ps1.setString(5, e.getEvent_time_from());
//        ps1.setInt(6, e.getEvent_capacity());
//        ps1.setString(7, e.getEvent_refreshments());
//        ps1.setString(8, e.getEvent_date_to());
//        ps1.setString(9, e.getEvent_time_to());
//        ps1.setInt(10, e.getAudi_id());
//        ps1.setInt(11, e.getPlace_id());
        ResultSet rs = ps.executeQuery();
        while(rs.next())
        {
            id = rs.getInt("event_id");
        }
        }
        catch(SQLException g)
        {
            g.printStackTrace();
        }
        return id;
    }
     public int saveeventDatawithposter(event e)
    {
        int id  = 0;
        try{
        String query = "insert into event(event_name, inst_name, event_content, event_date_from, event_time_from,event_capacity,event_refreshments, event_date_to, event_time_to,event_pic,audi_id,place_id) values (?,?,?,?,?,?,?,?,?,?,?,?)";
//        String query = "insert into user values(firstname,lastname,email,password,role) values (?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, e.getEvent_name());
        ps.setString(2, e.getInst_name());
        ps.setString(3, e.getEvent_content());
        ps.setString(4, e.getEvent_date_from());
        ps.setString(5, e.getEvent_time_from());
        ps.setInt(6, e.getEvent_capacity());
        ps.setString(7, e.getEvent_refreshments());
        ps.setString(8, e.getEvent_date_to());
        ps.setString(9, e.getEvent_time_to());
        ps.setString(10, e.getEvent_pic());
        ps.setInt(11, e.getAudi_id());
        ps.setInt(12, e.getPlace_id());
        int c = ps.executeUpdate();
        System.out.println(c);
        String query1 = "select event_id from event where event_name=? and inst_name=?";
        PreparedStatement ps1 = con.prepareStatement(query1);
        ps1.setString(1, e.getEvent_name());
        ps1.setString(2, e.getInst_name());
//        ps1.setString(3, e.getEvent_content());
//        ps1.setString(4, e.getEvent_date_from());
//        ps1.setString(5, e.getEvent_time_from());
//        ps1.setInt(6, e.getEvent_capacity());
//        ps1.setString(7, e.getEvent_refreshments());
//        ps1.setString(8, e.getEvent_date_to());
//        ps1.setString(9, e.getEvent_time_to());
//        ps1.setString(10, e.getEvent_pic());
//        ps1.setInt(11, e.getAudi_id());
//        ps1.setInt(12, e.getPlace_id());
        ResultSet rs = ps1.executeQuery();
        while(rs.next())
        {
            id = rs.getInt("event_id");
        }
        }
        
        catch(SQLException g)
        {
            g.printStackTrace();
        }
        return id;
    }
      public List getpresenteventData()
    {
        List<event>eve = new ArrayList<>();
        try
        {
            String query = "select  * from event where CURDATE() between event_date_from and event_date_to ";
            PreparedStatement ps = con.prepareStatement(query);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                event e = new event();
                int event_id = rs.getInt("event_id");
                e.setEvent_id(event_id);
               String event_name = rs.getString("event_name");
                e.setEvent_name(event_name);
                String inst_name = rs.getString("inst_name");
                e.setInst_name(inst_name);
//                int event_fee = rs.getInt("event_fee");
//                e.setEvent_fee(event_fee);
                String event_content  = rs.getString("event_content");
                e.setEvent_content(event_content);
                String event_date_from  = rs.getString("event_date_from");
                e.setEvent_date_from(event_date_from);
                String event_time_from  = rs.getString("event_time_from");
                e.setEvent_time_from(event_time_from);
                String event_date_to  = rs.getString("event_date_to");
                e.setEvent_date_to(event_date_to);
                String event_time_to = rs.getString("event_time_to");
                e.setEvent_time_to(event_time_to);
                String event_pic = rs.getString("event_pic");
                e.setEvent_pic(event_pic);
                int audi_id = rs.getInt("audi_id");
                e.setAudi_id(audi_id);
                int place_id = rs.getInt("place_id");
                e.setPlace_id(place_id);
                String event_permission = rs.getString("event_permission");
                e.setEvent_permission(event_permission);
                eve.add(e);
            }
        }
        catch(Exception g)
        {
            g.printStackTrace();
        }
        return eve;
    }
      public List getupcomingeventData()
    {
        List<event>eve = new ArrayList<>();
        try
        {
            String query = "select  * from event where CURDATE() < event_date_from and CURDATE() < event_date_to ";
            PreparedStatement ps = con.prepareStatement(query);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                event e = new event();
                int event_id = rs.getInt("event_id");
                e.setEvent_id(event_id);
               String event_name = rs.getString("event_name");
                e.setEvent_name(event_name);
                String inst_name = rs.getString("inst_name");
                e.setInst_name(inst_name);
//                int event_fee = rs.getInt("event_fee");
//                e.setEvent_fee(event_fee);
                String event_content  = rs.getString("event_content");
                e.setEvent_content(event_content);
                String event_date_from  = rs.getString("event_date_from");
                e.setEvent_date_from(event_date_from);
                String event_time_from  = rs.getString("event_time_from");
                e.setEvent_time_from(event_time_from);
                String event_date_to  = rs.getString("event_date_to");
                e.setEvent_date_to(event_date_to);
                String event_time_to = rs.getString("event_time_to");
                e.setEvent_time_to(event_time_to);
                String event_pic = rs.getString("event_pic");
                e.setEvent_pic(event_pic);
                int audi_id = rs.getInt("audi_id");
                e.setAudi_id(audi_id);
                int place_id = rs.getInt("place_id");
                e.setPlace_id(place_id);
                 String event_permission = rs.getString("event_permission");
                e.setEvent_permission(event_permission);
                eve.add(e);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return eve;
    }
      public List getpasteventData()
    {
        List<event>eve = new ArrayList<>();
        try
        {
            String query = "select  * from event where CURDATE() > event_date_from and CURDATE() > event_date_to ";
            PreparedStatement ps = con.prepareStatement(query);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                event e = new event();
                int event_id = rs.getInt("event_id");
                e.setEvent_id(event_id);
               String event_name = rs.getString("event_name");
                e.setEvent_name(event_name);
                String inst_name = rs.getString("inst_name");
                e.setInst_name(inst_name);
//                int event_fee = rs.getInt("event_fee");
//                e.setEvent_fee(event_fee);
                String event_content  = rs.getString("event_content");
                e.setEvent_content(event_content);
                String event_date_from  = rs.getString("event_date_from");
                e.setEvent_date_from(event_date_from);
                String event_time_from  = rs.getString("event_time_from");
                e.setEvent_time_from(event_time_from);
                String event_date_to  = rs.getString("event_date_to");
                e.setEvent_date_to(event_date_to);
                String event_time_to = rs.getString("event_time_to");
                e.setEvent_time_to(event_time_to);
                String event_pic = rs.getString("event_pic");
                e.setEvent_pic(event_pic);
                int audi_id = rs.getInt("audi_id");
                e.setAudi_id(audi_id);
                int place_id = rs.getInt("place_id");
                e.setPlace_id(place_id);
                 String event_permission = rs.getString("event_permission");
                e.setEvent_permission(event_permission);
                eve.add(e);
            }
        }
        catch(Exception g)
        {
            g.printStackTrace();
        }
        return eve;
    }
     public List geteventData()
    {
        List<event>e = new ArrayList<>();
        try
        {
            String query = "select  * from event";
            PreparedStatement ps = con.prepareStatement(query);
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                event eve = new event();
               String event_name = rs.getString("event_name");
                eve.setEvent_name(event_name);
                String inst_name = rs.getString("inst_name");
                eve.setInst_name(inst_name);
//                int event_fee = rs.getInt("event_fee");
//                eve.setEvent_fee(event_fee);
                String event_content  = rs.getString("event_content");
                eve.setEvent_content(event_content);
                String event_date_from  = rs.getString("event_date_from");
                eve.setEvent_date_from(event_date_from);
                String event_time_from  = rs.getString("event_time_from");
                eve.setEvent_time_from(event_time_from);
                String event_date_to  = rs.getString("event_date_to");
                eve.setEvent_date_from(event_date_to);
                String event_time_to = rs.getString("event_time_to");
                eve.setEvent_time_to(event_time_to);
                String event_pic = rs.getString("event_pic");
                eve.setEvent_pic(event_pic);
                int audi_id = rs.getInt("audi_id");
                eve.setAudi_id(audi_id);
                int place_id = rs.getInt("place_id");
                eve.setPlace_id(place_id);
                 String event_permission = rs.getString("event_permission");
                eve.setEvent_permission(event_permission);
                e.add(eve);
            }
        }
        catch(Exception g)
        {
            g.printStackTrace();
        }
        return e;
    }
    
      public event getEventById(int id)
    {
       event e = null;
        try
        {
            String query = "select  * from event where event_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                 e = new event();
                
               String event_name = rs.getString("event_name");
                e.setEvent_name(event_name);
                String inst_name = rs.getString("inst_name");
                e.setInst_name(inst_name);
//                int event_fee = rs.getInt("event_fee");
//                e.setEvent_fee(event_fee);
                String event_content  = rs.getString("event_content");
                e.setEvent_content(event_content);
                String event_date_from  = rs.getString("event_date_from");
                e.setEvent_date_from(event_date_from);
                String event_time_from  = rs.getString("event_time_from");
                e.setEvent_time_from(event_time_from);
                String event_date_to  = rs.getString("event_date_to");
                e.setEvent_date_to(event_date_to);
                String event_time_to = rs.getString("event_time_to");
                e.setEvent_time_to(event_time_to);
                String event_pic = rs.getString("event_pic");
                e.setEvent_pic(event_pic);
                int audi_id = rs.getInt("audi_id");
                e.setAudi_id(audi_id);
                int place_id = rs.getInt("place_id");
                e.setPlace_id(place_id);
                String event_permission = rs.getString("event_permission");
                e.setEvent_permission(event_permission);
            }
        }
        catch(Exception g)
        {
            g.printStackTrace();
        }
        return e;
    }
      public boolean updateEvent(int event_id)
      {
          boolean status = false;
          try{
              String query = "update event set event_permission='yes' where event_id = ?";
              PreparedStatement ps = con.prepareStatement(query);
              ps.setInt(1, event_id);
              int c = ps.executeUpdate();
              if(c!=0)
              {
                  status = true;
              }
          }
          catch(Exception e)
          {
              System.out.println(e);
          }
          return status;
      }
      public int getPlaceId(int audi_id)
      {
          int place_id = 0;
          try{
              String query = "select place_id from auditoriums where audi_id = ?";
              PreparedStatement ps = con.prepareStatement(query);
              ps.setInt(1, audi_id);
              ResultSet rs = ps.executeQuery();
              while(rs.next())
              {
                  place_id = rs.getInt("place_id");
              }
          }
          catch(Exception e)
          {
              e.printStackTrace();
          }
          return place_id;
      }
}