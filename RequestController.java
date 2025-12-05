package com.labsystem.app.controller;

import com.labsystem.app.model.RequestForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
public class RequestController {

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
}