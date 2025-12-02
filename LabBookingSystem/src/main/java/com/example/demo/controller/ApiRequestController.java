package com.example.demo.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/requests")
public class ApiRequestController {
    
    @PostMapping("/{id}/approve")
    public String approveRequest(@PathVariable Long id) {
        System.out.println("Approved request #" + id);
        return "{\"status\":\"success\",\"message\":\"Request approved\"}";
    }
    
    @PostMapping("/{id}/reject")
    public String rejectRequest(@PathVariable Long id) {
        System.out.println("Rejected request #" + id);
        return "{\"status\":\"success\",\"message\":\"Request rejected\"}";
    }
    
    @GetMapping("/{id}")
    public String getRequestDetails(@PathVariable Long id) {
        return "{\"id\":" + id + ",\"subject\":\"Chemistry Experiment\",\"status\":\"pending\"}";
    }
}