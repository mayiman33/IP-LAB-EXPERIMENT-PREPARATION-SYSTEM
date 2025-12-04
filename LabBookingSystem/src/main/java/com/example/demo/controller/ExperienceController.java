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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/experience")
public class ExperienceController {
    
    // 存储模拟数据
    private List<Map<String, String>> preparations = new ArrayList<>();
    
    public ExperienceController() {
        // 初始化一些模拟数据
        Map<String, String> prep1 = new HashMap<>();
        prep1.put("id", "1");
        prep1.put("title", "Chemical Reaction Experiment");
        prep1.put("type", "Chemistry");
        prep1.put("status", "Ready");
        prep1.put("date", "2025-12-04");
        prep1.put("lab", "Lab A");
        preparations.add(prep1);
        
        Map<String, String> prep2 = new HashMap<>();
        prep2.put("id", "2");
        prep2.put("title", "Microbiology Study");
        prep2.put("type", "Biology");
        prep2.put("status", "In Progress");
        prep2.put("date", "2025-12-03");
        prep2.put("lab", "Lab B");
        preparations.add(prep2);
    }
    
    @GetMapping("")
    public String experienceHome(Model model) {
        model.addAttribute("title", "Experience Preparation");
        model.addAttribute("module", "Experiment Operations");
        return "experience/index";
    }
    
    @GetMapping("/preparation")
    public String preparationList(Model model) {
        model.addAttribute("title", "Experience Preparation");
        model.addAttribute("preparations", preparations);
        return "experience/preparation";
    }
    
    @GetMapping("/preparation/new")
    public String newPreparationForm(Model model) {
        model.addAttribute("title", "New Preparation");
        return "experience/new";
    }
    
    @PostMapping("/preparation/create")
    public String createPreparation(
            @RequestParam Map<String, String> params,
            RedirectAttributes redirectAttributes) {
        
        String title = params.get("title");
        String type = params.get("type");
        String description = params.get("description");
        String lab = params.get("lab");
        
        // 创建新的准备记录
        Map<String, String> newPrep = new HashMap<>();
        newPrep.put("id", String.valueOf(preparations.size() + 1));
        newPrep.put("title", title);
        newPrep.put("type", type);
        newPrep.put("description", description);
        newPrep.put("lab", lab);
        newPrep.put("status", "New");
        newPrep.put("date", LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        
        preparations.add(newPrep);
        
        redirectAttributes.addFlashAttribute("message", "Preparation created successfully!");
        redirectAttributes.addFlashAttribute("messageType", "success");
        
        return "redirect:/experience/preparation";
    }
    
    @GetMapping("/preparation/view")
    public String viewPreparation(@RequestParam("id") String id, Model model) {
        Map<String, String> prep = preparations.stream()
            .filter(p -> p.get("id").equals(id))
            .findFirst()
            .orElse(new HashMap<>());
        
        model.addAttribute("title", "View Preparation");
        model.addAttribute("preparation", prep);
        return "experience/view";
    }
    
    @PostMapping("/preparation/update")
    public String updatePreparation(
            @RequestParam Map<String, String> params,
            RedirectAttributes redirectAttributes) {
        
        String id = params.get("id");
        String status = params.get("status");
        
        preparations.stream()
            .filter(p -> p.get("id").equals(id))
            .findFirst()
            .ifPresent(p -> p.put("status", status));
        
        redirectAttributes.addFlashAttribute("message", "Status updated successfully!");
        redirectAttributes.addFlashAttribute("messageType", "success");
        
        return "redirect:/experience/preparation/view?id=" + id;
    }
}