package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/requests")
public class RequestController {
    
    @GetMapping("")
    public String requestsPage(Model model) {
        model.addAttribute("title", "Experiment Request Management");
        model.addAttribute("activeTab", "requests");
        return "requests/index";
    }
    
    @GetMapping("/home")
    public String homePage(Model model) {
        model.addAttribute("activeTab", "home");
        return "requests/home";
    }
    
    @GetMapping("/history")
    public String historyPage(Model model) {
        model.addAttribute("activeTab", "history");
        return "requests/history";
    }
}