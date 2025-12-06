package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.example.demo.RequestForm;

@Controller
public class RequestController {

    // ==================== Lab Booking Request Endpoints ====================
    
    @GetMapping("/request/new")
    public String showForm(Model model) {
        // Adds a blank model object required by the bookingForm.html
        // th:object="${requestForm}"
        model.addAttribute("requestForm", new RequestForm());
        return "bookingForm";
    }

    // A dummy POST endpoint to ensure the form submission doesn't fail
    @PostMapping("/request/save")
    public String submitForm(@ModelAttribute("requestForm") RequestForm form, Model model) {
        model.addAttribute("form", form);
        return "requestSuccess"; // Needs a simple success page
    }

    // ==================== Experiment Request Management Endpoints ====================
    
    @GetMapping("/requests")
    public String requestsPage(Model model) {
        model.addAttribute("title", "Experiment Request Management");
        model.addAttribute("activeTab", "requests");
        return "requests/index";
    }
    
    @GetMapping("/requests/home")
    public String homePage(Model model) {
        model.addAttribute("activeTab", "home");
        return "requests/home";
    }
    
    @GetMapping("/requests/history")
    public String historyPage(Model model) {
        model.addAttribute("activeTab", "history");
        return "requests/history";
    }
}