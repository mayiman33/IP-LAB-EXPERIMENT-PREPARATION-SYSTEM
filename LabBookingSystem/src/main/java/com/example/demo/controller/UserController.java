package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.model.ExperimentRequest;
import com.example.demo.service.ExperimentRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private ExperimentRequestService requestService;

    // 用户仪表板
    @GetMapping("/dashboard")
    public String userDashboard(HttpSession session, Model model) {
        logger.info("Accessing user dashboard");

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login";
        }

        model.addAttribute("user", user);

        try {
            List<ExperimentRequest> userRequests = requestService.getRequestsByUserId(user.getUserId());
            long totalRequests = userRequests.size();

            long pendingRequests = 0;
            long approvedRequests = 0;

            for (ExperimentRequest request : userRequests) {
                if ("pending".equals(request.getStatus())) {
                    pendingRequests++;
                } else if ("approved".equals(request.getStatus())) {
                    approvedRequests++;
                }
            }

            model.addAttribute("totalRequests", totalRequests);
            model.addAttribute("pendingRequests", pendingRequests);
            model.addAttribute("approvedRequests", approvedRequests);

            logger.info("User dashboard stats for {} - Total: {}, Pending: {}, Approved: {}",
                    user.getUsername(), totalRequests, pendingRequests, approvedRequests);
        } catch (Exception e) {
            logger.error("Error getting user dashboard stats", e);
            model.addAttribute("totalRequests", 0);
            model.addAttribute("pendingRequests", 0);
            model.addAttribute("approvedRequests", 0);
        }

        return "dashboard/user";
    }

    // 我的请求页面
    @GetMapping("/my-requests")
    public String myRequests(HttpSession session, Model model) {
        logger.info("Accessing my requests page");

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login";
        }

        try {
            List<ExperimentRequest> requests = requestService.getRequestsByUserId(user.getUserId());
            model.addAttribute("requests", requests);
            model.addAttribute("user", user);
            logger.info("Loaded {} requests for user {}", requests.size(), user.getUsername());

            return "dashboard/my-requests";
        } catch (Exception e) {
            logger.error("Error loading user requests", e);
            model.addAttribute("error", "Error loading your requests: " + e.getMessage());
            return "error";
        }
    }

    // 新请求页面
    @GetMapping("/new-request")
    public String newRequestPage(HttpSession session, Model model) {
        logger.info("Accessing new request page");

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login";
        }

        model.addAttribute("user", user);
        return "dashboard/new-request";
    }

    // 提交新请求
    @PostMapping("/submit-request")
    public String submitRequest(@ModelAttribute ExperimentRequest request,
            HttpSession session,
            Model model) {
        logger.info("Submitting new experiment request");

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login";
        }

        try {
            request.setUserId(user.getUserId());
            requestService.createRequest(request);

            model.addAttribute("message", "Experiment request submitted successfully!");
            model.addAttribute("messageType", "success");
            logger.info("Request submitted by user {}", user.getUsername());

            return "redirect:/user/my-requests";
        } catch (Exception e) {
            logger.error("Error submitting request", e);
            model.addAttribute("message", "Error submitting request: " + e.getMessage());
            model.addAttribute("messageType", "danger");
            return "dashboard/new-request";
        }
    }

    // 删除我的请求
    @GetMapping("/delete-request")
    public String deleteRequest(@RequestParam("id") Integer requestId,
            HttpSession session,
            Model model) {
        logger.info("Deleting request ID: {}", requestId);

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/user/login";
        }

        try {
            // 验证请求属于当前用户
            ExperimentRequest request = requestService.getRequestById(requestId);
            if (request == null || !request.getUserId().equals(user.getUserId())) {
                model.addAttribute("message", "Request not found or access denied");
                model.addAttribute("messageType", "danger");
                return "redirect:/user/my-requests";
            }

            // 注意：您现有的ExperimentRequestService没有deleteRequest方法
            // 需要添加这个方法到Service中，或者使用其他方式处理
            // 这里暂时只显示消息
            model.addAttribute("message", "Delete functionality not implemented in memory storage");
            model.addAttribute("messageType", "warning");
            logger.warn("Delete request not implemented for request {}", requestId);

        } catch (Exception e) {
            logger.error("Error deleting request", e);
            model.addAttribute("message", "Error deleting request: " + e.getMessage());
            model.addAttribute("messageType", "danger");
        }

        return "redirect:/user/my-requests";
    }
}