package com.example.demo;

public class Booking {
    private String subject;
    private String timeSlot;
    private String reservedBy;

    // Constructor required to create dummy data in the Controller
    public Booking(String subject, String timeSlot, String reservedBy) {
        this.subject = subject;
        this.timeSlot = timeSlot;
        this.reservedBy = reservedBy;
    }

    // --- Getters (REQUIRED FOR THYMELEAF) ---
    public String getSubject() {
        return subject;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public String getReservedBy() {
        return reservedBy;
    }
}