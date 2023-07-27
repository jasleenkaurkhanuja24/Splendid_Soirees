package com.ss.entities;

public class auditoriums 
{
    private int id;
    private String name;
    private String venue;
    private String capacity;
    private String refreshments;
    private String audi_cost;
    private String contact;
    private String emailid;
    private String legalpaper;
    private String verification;
    private String picture;
    private int place_id;
    private String audi_cost_student;

    public auditoriums(int id, String name, String venue, String capacity, String refreshments, String audi_cost, String contact, String emailid, String legalpaper, String verification, String picture, int place_id, String audi_cost_student) {
        this.id = id;
        this.name = name;
        this.venue = venue;
        this.capacity = capacity;
        this.refreshments = refreshments;
        this.audi_cost = audi_cost;
        this.contact = contact;
        this.emailid = emailid;
        this.legalpaper = legalpaper;
        this.verification = verification;
        this.picture = picture;
        this.place_id = place_id;
        this.audi_cost_student = audi_cost_student;
    }

    public String getAudi_cost_student() {
        return audi_cost_student;
    }

    public void setAudi_cost_student(String audi_cost_student) {
        this.audi_cost_student = audi_cost_student;
    }

    public auditoriums(String name, String venue, String capacity, String refreshments, String audi_cost, String contact, String emailid, String legalpaper, String picture, int place_id, String audi_cost_student) {
        this.name = name;
        this.venue = venue;
        this.capacity = capacity;
        this.refreshments = refreshments;
        this.audi_cost = audi_cost;
        this.contact = contact;
        this.emailid = emailid;
        this.legalpaper = legalpaper;
        this.verification = verification;
        this.picture = picture;
        this.place_id = place_id;
        this.audi_cost_student = audi_cost_student;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getRefreshments() {
        return refreshments;
    }

    public void setRefreshments(String refreshments) {
        this.refreshments = refreshments;
    }

    public String getAudi_cost() {
        return audi_cost;
    }

    public void setAudi_cost(String audi_cost) {
        this.audi_cost = audi_cost;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmailid() {
        return emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public String getLegalpaper() {
        return legalpaper;
    }

    public void setLegalpaper(String legalpaper) {
        this.legalpaper = legalpaper;
    }

    public String getVerification() {
        return verification;
    }

    public void setVerification(String verification) {
        this.verification = verification;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getPlace_id() {
        return place_id;
    }

    public void setPlace_id(int place_id) {
        this.place_id = place_id;
    }
}