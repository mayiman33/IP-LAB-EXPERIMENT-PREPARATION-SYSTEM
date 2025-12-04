package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notifications")
public class NotificationController {
    
    @GetMapping("")
    public String notificationsHome(Model model) {
        model.addAttribute("title", "Notification Center");
        model.addAttribute("module", "Notification & Alert System");
        return "notifications/index";
    }
    
    @GetMapping("/list")
    public String listNotifications(Model model) {
        model.addAttribute("title", "Notification List");
        return "notifications/list";
    }
    
    @GetMapping("/settings")
    public String notificationSettings(Model model) {
        model.addAttribute("title", "Notification Settings");
        return "notifications/settings";
    }
}