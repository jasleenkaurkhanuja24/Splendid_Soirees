package com.ss.helper;
import java.sql.*;

public class connection_provider 
{
    private static Connection con=null;
    public static Connection getConnection()
    {
        try
        {
            if(con==null)
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/splendid_soirees","root","jasleen");
                System.out.println("cp");   
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
    
}
