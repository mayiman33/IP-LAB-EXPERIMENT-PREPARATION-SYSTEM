package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;

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
    public String showGenerateForm(Model model) {
        model.addAttribute("title", "Generate Report");
        return "reports/generate";
    }
    
    @PostMapping("/generate")
    public String handleGenerateReport(
            @RequestParam Map<String, String> params,
            RedirectAttributes redirectAttributes) {
        
        // Get all parameters
        String reportType = params.get("reportType");
        String startDate = params.get("startDate");
        String endDate = params.get("endDate");
        String format = params.get("format");
        String details = params.get("details");
        
        // Add processing logic here
        System.out.println("Report generation parameters:");
        System.out.println("Type: " + reportType);
        System.out.println("Start Date: " + startDate);
        System.out.println("End Date: " + endDate);
        System.out.println("Format: " + format);
        System.out.println("Details: " + details);
        
        // Add success message
        redirectAttributes.addFlashAttribute("message", "Report is being generated...");
        redirectAttributes.addFlashAttribute("reportType", reportType);
        redirectAttributes.addFlashAttribute("startDate", startDate);
        redirectAttributes.addFlashAttribute("endDate", endDate);
        redirectAttributes.addFlashAttribute("format", format);
        
        // Add current time
        String currentTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        redirectAttributes.addFlashAttribute("generatedTime", currentTime);
        
        return "redirect:/reports/result";
    }
    
    @GetMapping("/result")
    public String showResultPage(Model model) {
        // If there's no flash attribute, set default values
        if (!model.containsAttribute("message")) {
            model.addAttribute("message", "Report Generation Result");
            model.addAttribute("title", "Report Result");
            model.addAttribute("generatedTime", LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        }
        return "reports/result";
    }
    
    @GetMapping("/list")
    public String listReports(Model model) {
        model.addAttribute("title", "Report List");
        return "reports/list";
    }
}