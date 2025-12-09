package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {
    
    @GetMapping("/user")
    public String userDashboard(HttpSession session, Model model) {
        // 检查登录
        if (session.getAttribute("user") == null) {
            return "redirect:/login";
        }
        
        // 如果是管理员，重定向到管理员页面
        String role = (String) session.getAttribute("role");
        if ("admin".equals(role)) {
            return "redirect:/dashboard/admin";
        }
        
        // 添加用户信息到模型
        model.addAttribute("user", session.getAttribute("user"));
        model.addAttribute("role", role);
        model.addAttribute("title", "User Dashboard");
        
        return "dashboard/user"; // 对应 WEB-INF/views/dashboard/user.jsp
    }
}