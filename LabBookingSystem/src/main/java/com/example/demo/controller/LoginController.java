package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class LoginController {
    
    @Autowired
    private UserService userService;
    
    // 显示登录页面
    @GetMapping("/login")
    public String showLoginPage(HttpSession session, Model model) {
        // 如果已经登录，重定向到相应页面
        if (session.getAttribute("user") != null) {
            String role = (String) session.getAttribute("role");
            if ("admin".equals(role)) {
                return "redirect:/admin/dashboard";
            } else {
                return "redirect:/dashboard/user";
            }
        }
        
        model.addAttribute("title", "Login");
        return "login"; // 对应 WEB-INF/views/login.jsp
    }
    
    // 处理登录请求
    @PostMapping("/login")
    public String login(
            @RequestParam Map<String, String> params,
            HttpSession session,
            RedirectAttributes redirectAttributes) {
        
        String username = params.get("username");
        String password = params.get("password");
        
        try {
            // 验证用户（使用真实数据库）
            User user = userService.authenticate(username, password);
            
            if (user != null) {
                // 登录成功，设置session
                session.setAttribute("user", user);
                session.setAttribute("username", user.getUsername());
                session.setAttribute("role", user.getRole());
                session.setAttribute("userId", user.getUserId());
                session.setAttribute("fullName", user.getFullName());
                session.setAttribute("email", user.getEmail());
                
                // 根据角色重定向
                if ("admin".equals(user.getRole())) {
                    return "redirect:/admin/dashboard";
                } else {
                    return "redirect:/dashboard/user";
                }
            } else {
                redirectAttributes.addFlashAttribute("error", "Invalid username or password");
                return "redirect:/login";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Login failed: " + e.getMessage());
            return "redirect:/login";
        }
    }
    
    // 登出
    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirectAttributes) {
        if (session != null) {
            session.invalidate();
        }
        redirectAttributes.addFlashAttribute("message", "Logged out successfully");
        return "redirect:/login";
    }
}