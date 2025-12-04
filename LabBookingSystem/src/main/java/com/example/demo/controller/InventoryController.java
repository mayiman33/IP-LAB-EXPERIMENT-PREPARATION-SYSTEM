package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.util.*;

@Controller
@RequestMapping("/inventory")
public class InventoryController {
    
    // 模拟库存数据
    private List<Map<String, Object>> inventoryItems = new ArrayList<>();
    
    public InventoryController() {
        // 初始化一些示例数据
        addItem("Chemical A", "CHEM-001", "Chemicals", 50, "Bottle", "Storage Room A");
        addItem("Beaker 250ml", "EQUIP-001", "Equipment", 20, "Piece", "Lab C");
        addItem("Gloves Medium", "SAFE-001", "Safety", 100, "Pair", "Storage Room B");
        addItem("Petri Dish", "LAB-001", "Labware", 200, "Pack", "Lab A");
    }
    
    private void addItem(String name, String code, String category, int quantity, String unit, String location) {
        Map<String, Object> item = new HashMap<>();
        item.put("id", inventoryItems.size() + 1);
        item.put("name", name);
        item.put("code", code);
        item.put("category", category);
        item.put("quantity", quantity);
        item.put("unit", unit);
        item.put("location", location);
        item.put("status", getStatus(quantity));
        inventoryItems.add(item);
    }
    
    private String getStatus(int quantity) {
        if (quantity <= 10) return "Low";
        if (quantity <= 50) return "Normal";
        return "Sufficient";
    }
    
    @GetMapping("")
    public String inventoryHome(Model model) {
        model.addAttribute("title", "Inventory Management");
        model.addAttribute("module", "Inventory & Material Management");
        return "inventory/index";
    }
    
    @GetMapping("/items")
    public String listItems(Model model) {
        model.addAttribute("title", "Inventory Items");
        model.addAttribute("items", inventoryItems);
        return "inventory/items";
    }
    
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("title", "Add New Item");
        return "inventory/add";
    }
    
    @PostMapping("/add")
    public String addItem(
            @RequestParam Map<String, String> params,
            RedirectAttributes redirectAttributes) {
        
        String name = params.get("name");
        String code = params.get("code");
        String category = params.get("category");
        int quantity = Integer.parseInt(params.get("quantity"));
        String unit = params.get("unit");
        String location = params.get("location");
        
        Map<String, Object> newItem = new HashMap<>();
        newItem.put("id", inventoryItems.size() + 1);
        newItem.put("name", name);
        newItem.put("code", code);
        newItem.put("category", category);
        newItem.put("quantity", quantity);
        newItem.put("unit", unit);
        newItem.put("location", location);
        newItem.put("status", getStatus(quantity));
        
        inventoryItems.add(newItem);
        
        redirectAttributes.addFlashAttribute("message", "Item added successfully!");
        redirectAttributes.addFlashAttribute("messageType", "success");
        
        return "redirect:/inventory/items";
    }
    
    @GetMapping("/view")
    public String viewItem(@RequestParam("id") int id, Model model) {
        Map<String, Object> item = inventoryItems.stream()
            .filter(i -> (int)i.get("id") == id)
            .findFirst()
            .orElse(new HashMap<>());
        
        model.addAttribute("title", "Item Details");
        model.addAttribute("item", item);
        return "inventory/view";
    }
    
    @PostMapping("/update")
    public String updateItem(
            @RequestParam Map<String, String> params,
            RedirectAttributes redirectAttributes) {
        
        int id = Integer.parseInt(params.get("id"));
        int quantity = Integer.parseInt(params.get("quantity"));
        String location = params.get("location");
        
        inventoryItems.stream()
            .filter(i -> (int)i.get("id") == id)
            .findFirst()
            .ifPresent(item -> {
                item.put("quantity", quantity);
                item.put("location", location);
                item.put("status", getStatus(quantity));
            });
        
        redirectAttributes.addFlashAttribute("message", "Item updated successfully!");
        redirectAttributes.addFlashAttribute("messageType", "success");
        
        return "redirect:/inventory/view?id=" + id;
    }
    
    @GetMapping("/categories")
    public String getCategories() {
        return "[\"Chemicals\", \"Equipment\", \"Labware\", \"Safety\", \"Tools\", \"Consumables\"]";
    }
}