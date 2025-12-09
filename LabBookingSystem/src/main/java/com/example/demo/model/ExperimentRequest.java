package com.example.demo.model;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;

@Entity
@Table(name = "experiment_requests")
public class ExperimentRequest {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "request_id")
    private Integer requestId;
    
    @Column(name = "user_id", nullable = false)
    private Integer userId;
    
    @Column(name = "experiment_title", nullable = false)
    private String experimentTitle;
    
    @Column(name = "experiment_description", columnDefinition = "TEXT")
    private String experimentDescription;
    
    @Column(name = "required_equipment", columnDefinition = "TEXT")
    private String requiredEquipment;
    
    @Column(name = "requested_date", nullable = false)
    private Date requestedDate;
    
    @Column(name = "requested_time_slot")
    private String requestedTimeSlot;
    
    @Column(nullable = false)
    private String status = "pending"; // pending, approved, rejected
    
    @Column(name = "admin_notes", columnDefinition = "TEXT")
    private String adminNotes;
    
    @Column(name = "reviewed_by")
    private Integer reviewedBy;
    
    @Column(name = "reviewed_at")
    private Timestamp reviewedAt;
    
    @Column(name = "created_at")
    private Timestamp createdAt;
    
    @Transient
    private String userName;
    
    @Transient
    private String userEmail;
    
    // Constructors
    public ExperimentRequest() {
        this.createdAt = new Timestamp(System.currentTimeMillis());
    }
    
    // Getters and Setters
    public Integer getRequestId() { return requestId; }
    public void setRequestId(Integer requestId) { this.requestId = requestId; }
    
    public Integer getUserId() { return userId; }
    public void setUserId(Integer userId) { this.userId = userId; }
    
    public String getExperimentTitle() { return experimentTitle; }
    public void setExperimentTitle(String experimentTitle) { this.experimentTitle = experimentTitle; }
    
    public String getExperimentDescription() { return experimentDescription; }
    public void setExperimentDescription(String experimentDescription) { this.experimentDescription = experimentDescription; }
    
    public String getRequiredEquipment() { return requiredEquipment; }
    public void setRequiredEquipment(String requiredEquipment) { this.requiredEquipment = requiredEquipment; }
    
    public Date getRequestedDate() { return requestedDate; }
    public void setRequestedDate(Date requestedDate) { this.requestedDate = requestedDate; }
    
    public String getRequestedTimeSlot() { return requestedTimeSlot; }
    public void setRequestedTimeSlot(String requestedTimeSlot) { this.requestedTimeSlot = requestedTimeSlot; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public String getAdminNotes() { return adminNotes; }
    public void setAdminNotes(String adminNotes) { this.adminNotes = adminNotes; }
    
    public Integer getReviewedBy() { return reviewedBy; }
    public void setReviewedBy(Integer reviewedBy) { this.reviewedBy = reviewedBy; }
    
    public Timestamp getReviewedAt() { return reviewedAt; }
    public void setReviewedAt(Timestamp reviewedAt) { this.reviewedAt = reviewedAt; }
    
    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
    
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    
    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }
}