
package com.ss.entities;

public class event 
{
    
    private int event_id;
    private String event_name;
    private String inst_name;
    private int event_fee;
    private String event_content;
    private String event_date_from;
    private String event_time_from;
    private String event_date_to;
    private String event_time_to;
    private int event_capacity;
    private String event_refreshments;
    private String event_pic;
    private int audi_id;
    private String event_permission;
    private int place_id;

    public event(String name, String instname, String details, String fdate, String ftime, int capacity, int duration, String refreshments, String tdate, String ttime) {
        
    }

    public int getPlace_id() {
        return place_id;
    }

    public void setPlace_id(int place_id) {
        this.place_id = place_id;
    }

    public event(String event_name, String inst_name, String event_content, String event_date_from, String event_time_from, String event_date_to, String event_time_to, int event_capacity, String event_refreshments, String event_pic, int audi_id, int place_id) {
        this.event_name = event_name;
        this.inst_name = inst_name;
        this.event_content = event_content;
        this.event_date_from = event_date_from;
        this.event_time_from = event_time_from;
        this.event_date_to = event_date_to;
        this.event_time_to = event_time_to;
        this.event_capacity = event_capacity;
        this.event_refreshments = event_refreshments;
        this.event_pic = event_pic;
        this.audi_id = audi_id;
        this.place_id = place_id;
    }

    public event(String event_name, String inst_name, String event_content, String event_date_from, String event_time_from, String event_date_to, String event_time_to, int event_capacity, String event_refreshments, int audi_id, int place_id) {
        this.event_name = event_name;
        this.inst_name = inst_name;
        this.event_content = event_content;
        this.event_date_from = event_date_from;
        this.event_time_from = event_time_from;
        this.event_date_to = event_date_to;
        this.event_time_to = event_time_to;
        this.event_capacity = event_capacity;
        this.event_refreshments = event_refreshments;
        this.audi_id = audi_id;
        this.place_id = place_id;
    }
 

    public String getEvent_permission() {
        return event_permission;
    }

    public void setEvent_permission(String event_permission) {
        this.event_permission = event_permission;
    }
 
    public String getEvent_pic() {
        return event_pic;
    }

    public void setEvent_pic(String event_pic) {
        this.event_pic = event_pic;
    }

    public String getEvent_refreshments() {
        return event_refreshments;
    }

    public void setEvent_refreshments(String event_refreshments) {
        this.event_refreshments = event_refreshments;
    }

    public String getEvent_date_from() {
        return event_date_from;
    }

    public void setEvent_date_from(String event_date_from) {
        this.event_date_from = event_date_from;
    }

    public String getEvent_time_from() {
        return event_time_from;
    }

    public void setEvent_time_from(String event_time_from) {
        this.event_time_from = event_time_from;
    }

    public String getEvent_date_to() {
        return event_date_to;
    }

    public void setEvent_date_to(String event_date_to) {
        this.event_date_to = event_date_to;
    }

    public String getEvent_time_to() {
        return event_time_to;
    }

    public void setEvent_time_to(String event_time_to) {
        this.event_time_to = event_time_to;
    }

    public event() {
    }

    public int getEvent_capacity() {
        return event_capacity;
    }

    public void setEvent_capacity(int event_capacity) {
        this.event_capacity = event_capacity;
    }
   
    
    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public String getEvent_name() {
        return event_name;
    }

    public void setEvent_name(String event_name) {
        this.event_name = event_name;
    }

    public String getInst_name() {
        return inst_name;
    }

    public void setInst_name(String inst_name) {
        this.inst_name = inst_name;
    }

    public int getEvent_fee() {
        return event_fee;
    }

    public int getAudi_id() {
        return audi_id;
    }

    public void setAudi_id(int audi_id) {
        this.audi_id = audi_id;
    }
    public void setEvent_fee(int event_fee) {
        this.event_fee = event_fee;
    }

    public String getEvent_content() {
        return event_content;
    }

    public void setEvent_content(String event_content) {
        this.event_content = event_content;
    }   
}