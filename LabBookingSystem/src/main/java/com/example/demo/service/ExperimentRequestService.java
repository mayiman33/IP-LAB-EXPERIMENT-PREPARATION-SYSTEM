package com.example.demo.service;

import com.example.demo.model.ExperimentRequest;
import org.springframework.stereotype.Service;
import java.sql.Timestamp;
import java.util.*;

@Service
public class ExperimentRequestService {
    
    // 使用内存数据，不使用数据库
    private Map<Integer, ExperimentRequest> requests = new HashMap<>();
    private int nextId = 1;
    
    public ExperimentRequestService() {
        // 初始化一些测试数据
        initMockData();
    }
    
    private void initMockData() {
        // 创建一些测试请求
        ExperimentRequest req1 = new ExperimentRequest();
        req1.setRequestId(nextId++);
        req1.setUserId(2);
        req1.setExperimentTitle("Chemistry Experiment");
        req1.setExperimentDescription("Study chemical reactions");
        req1.setRequiredEquipment("Beakers, Bunsen burner");
        req1.setRequestedDate(java.sql.Date.valueOf("2025-12-10"));
        req1.setRequestedTimeSlot("9:00-11:00");
        req1.setStatus("pending");
        req1.setCreatedAt(new Timestamp(System.currentTimeMillis()));
        requests.put(req1.getRequestId(), req1);
        
        ExperimentRequest req2 = new ExperimentRequest();
        req2.setRequestId(nextId++);
        req2.setUserId(3);
        req2.setExperimentTitle("Biology Lab");
        req2.setExperimentDescription("Microscopic study");
        req2.setRequiredEquipment("Microscope, slides");
        req2.setRequestedDate(java.sql.Date.valueOf("2025-12-11"));
        req2.setRequestedTimeSlot("14:00-16:00");
        req2.setStatus("approved");
        req2.setCreatedAt(new Timestamp(System.currentTimeMillis()));
        requests.put(req2.getRequestId(), req2);
    }
    
    public ExperimentRequest createRequest(ExperimentRequest request) {
        request.setRequestId(nextId++);
        request.setCreatedAt(new Timestamp(System.currentTimeMillis()));
        if (request.getStatus() == null) {
            request.setStatus("pending");
        }
        requests.put(request.getRequestId(), request);
        return request;
    }
    
    public List<ExperimentRequest> getAllRequests() {
        return new ArrayList<>(requests.values());
    }
    
    public List<ExperimentRequest> getRequestsByUserId(Integer userId) {
        List<ExperimentRequest> result = new ArrayList<>();
        for (ExperimentRequest request : requests.values()) {
            if (request.getUserId() != null && request.getUserId().equals(userId)) {
                result.add(request);
            }
        }
        return result;
    }
    
    public boolean updateRequestStatus(Integer requestId, String status, String adminNotes, Integer reviewedBy) {
        ExperimentRequest request = requests.get(requestId);
        if (request != null) {
            request.setStatus(status);
            request.setAdminNotes(adminNotes);
            request.setReviewedBy(reviewedBy);
            request.setReviewedAt(new Timestamp(System.currentTimeMillis()));
            return true;
        }
        return false;
    }
    
    public ExperimentRequest getRequestById(Integer requestId) {
        return requests.get(requestId);
    }
    
    public List<ExperimentRequest> getPendingRequests() {
        return getRequestsByStatus("pending");
    }
    
    public List<ExperimentRequest> getApprovedRequests() {
        return getRequestsByStatus("approved");
    }
    
    public List<ExperimentRequest> getRejectedRequests() {
        return getRequestsByStatus("rejected");
    }
    
    private List<ExperimentRequest> getRequestsByStatus(String status) {
        List<ExperimentRequest> result = new ArrayList<>();
        for (ExperimentRequest request : requests.values()) {
            if (request.getStatus() != null && request.getStatus().equals(status)) {
                result.add(request);
            }
        }
        return result;
    }
}