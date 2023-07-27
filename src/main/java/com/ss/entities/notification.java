
package com.ss.entities;

public class notification 
{
    private String n_content;
    private int n_id;
    private String user_from;
    private String user_to;
    private String type;
    private int event_id;
    

    public notification(String n_content, String user_from,String user_to,String type,int event_id) {
        this.n_content = n_content;
        //this.n_id = n_id;
        this.user_from = user_from;
        this.user_to = user_to;
        this.type = type;
        this.event_id = event_id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public notification() {
       }

    
    public String getN_content() {
        return n_content;
    }

    public void setN_content(String n_content) {
        this.n_content = n_content;
    }

    public int getN_id() {
        return n_id;
    }

    public void setN_id(int n_id) {
        this.n_id = n_id;
    }

    public String getUser_from() {
        return user_from;
    }

    public void setUser_from(String user_from) {
        this.user_from = user_from;
    }

    public String getUser_to() {
        return user_to;
    }

    public void setUser_to(String user_to) {
        this.user_to = user_to;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }
}
