package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reports")
public class ReportController {
    
    @GetMapping("")
    public String reportsHome(Model model) {
        model.addAttribute("title", "Report Center");
        model.addAttribute("module", "Reporting & Summary Module");
        return "reports/index";
    }
    
    @GetMapping("/generate")
    public String generateReport(Model model) {
        model.addAttribute("title", "Generate Report");
        return "reports/generate";
    }
    
    @GetMapping("/list")
    public String listReports(Model model) {
        model.addAttribute("title", "Report List");
        return "reports/list";
    }
}