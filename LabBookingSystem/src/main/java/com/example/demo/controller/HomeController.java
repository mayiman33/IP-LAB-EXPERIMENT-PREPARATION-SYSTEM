package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    
    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("message", "LAB EXPERIMENT PREPARATION SYSTEM");
        model.addAttribute("systemName", "LabCore");
        return "index";
    }
}