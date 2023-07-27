
package com.ss.dao;

import com.ss.entities.notification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class notificationdao 
{
    private static Connection con;
    public notificationdao(Connection con)    
    {
        this.con = (Connection)con;
    }
    
    public boolean sendNotification(String userfrom, String userto, String n_content,String type,int event_id)
    {
        boolean status = false;
        try
        {
            String query = "insert into notification(n_content,user_from, user_to,type,event_id) values(?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, n_content);
            ps.setString(2, userfrom);
            ps.setString(3, userto);
            ps.setString(4, type);
            ps.setInt(5, event_id);
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
    public List getNotification(String user_to)
    {
        List<notification> n = new ArrayList<>();
        try
        {
            String query = "select * from notification where user_to = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,user_to);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                notification no = new notification();
                String from = rs.getString("user_from");
                no.setUser_from(from);
                String to = rs.getString("user_to");
                no.setUser_to(to);
                int id = rs.getInt("n_id");
                no.setN_id(id);
                String n_content = rs.getString("n_content");
                no.setN_content(n_content);
                String n_type = rs.getString("type");
                no.setType(n_type);
                int event_id = rs.getInt("event_id");
                no.setEvent_id(event_id);
                n.add(no);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return n;
    }
    public String getTo(int place_id)
    {
        String to=null;
        try{
            String query = "select email from user where place_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,place_id);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                to = rs.getString("email");
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return to;
    }
    public boolean deleteNotification(int id)
    {
        boolean status = false;
        try{
            String query = "delete from notification where n_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
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
    
}
