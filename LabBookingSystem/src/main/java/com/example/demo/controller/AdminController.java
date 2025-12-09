package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.model.ExperimentRequest;
import com.example.demo.service.UserService;
import com.example.demo.service.ExperimentRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private ExperimentRequestService requestService;

    // 管理员主页
    @GetMapping("")
    public String adminHome(HttpSession session) {
        logger.info("Admin home accessed, redirecting to dashboard");
        return "redirect:/admin/dashboard";
    }

    // 管理员仪表板
    @GetMapping("/dashboard")
    public String adminDashboard(HttpSession session, Model model) {
        logger.info("Accessing admin dashboard");

        // 检查登录
        User user = (User) session.getAttribute("user");
        if (user == null) {
            logger.warn("No user in session, redirecting to login");
            return "redirect:/user/login";
        }

        // 检查权限
        if (!"admin".equals(user.getRole())) {
            logger.warn("User {} is not admin, role: {}", user.getUsername(), user.getRole());
            return "redirect:/dashboard/user";
        }

        logger.info("Admin dashboard accessed by: {}", user.getUsername());

        // 添加用户信息到模型
        model.addAttribute("user", user);
        model.addAttribute("title", "Admin Dashboard");

        // 获取统计信息 - 修改为适配现有方法
        try {
            long totalUsers = userService.getAllUsers().size();

            // 使用现有方法获取数据
            List<ExperimentRequest> pendingRequestsList = requestService.getPendingRequests();
            List<ExperimentRequest> approvedRequestsList = requestService.getApprovedRequests();
            List<ExperimentRequest> rejectedRequestsList = requestService.getRejectedRequests();

            long pendingRequests = pendingRequestsList.size();

            // 计算今天批准的请求
            long approvedToday = 0;
            LocalDate today = LocalDate.now();
            for (ExperimentRequest request : approvedRequestsList) {
                if (request.getReviewedAt() != null) {
                    LocalDate reviewedDate = request.getReviewedAt().toInstant()
                            .atZone(ZoneId.systemDefault())
                            .toLocalDate();
                    if (reviewedDate.equals(today)) {
                        approvedToday++;
                    }
                }
            }

            // 计算本月拒绝的请求
            long rejectedThisMonth = 0;
            for (ExperimentRequest request : rejectedRequestsList) {
                if (request.getReviewedAt() != null) {
                    LocalDate reviewedDate = request.getReviewedAt().toInstant()
                            .atZone(ZoneId.systemDefault())
                            .toLocalDate();
                    if (reviewedDate.getMonth() == today.getMonth() &&
                            reviewedDate.getYear() == today.getYear()) {
                        rejectedThisMonth++;
                    }
                }
            }

            model.addAttribute("totalUsers", totalUsers);
            model.addAttribute("pendingRequests", pendingRequests);
            model.addAttribute("approvedToday", approvedToday);
            model.addAttribute("rejectedThisMonth", rejectedThisMonth);

            logger.info("Dashboard stats - Users: {}, Pending: {}, Approved Today: {}, Rejected Month: {}",
                    totalUsers, pendingRequests, approvedToday, rejectedThisMonth);
        } catch (Exception e) {
            model.addAttribute("totalUsers", 0);
            model.addAttribute("pendingRequests", 0);
            model.addAttribute("approvedToday", 0);
            model.addAttribute("rejectedThisMonth", 0);
            logger.error("Error getting dashboard stats", e);
        }

        return "dashboard/admin";
    }

    // 用户管理页面
    @GetMapping("/management")
    public String userManagement(HttpSession session, Model model) {
        logger.info("Accessing user management page");

        // 检查登录
        User user = (User) session.getAttribute("user");
        if (user == null) {
            logger.warn("No user in session for management page");
            return "redirect:/user/login";
        }

        // 检查权限
        if (!"admin".equals(user.getRole())) {
            logger.warn("Access denied for user {} to management page", user.getUsername());
            return "redirect:/dashboard/user";
        }

        logger.info("User management accessed by admin: {}", user.getUsername());

        try {
            // 获取所有用户列表
            List<User> users = userService.getAllUsers();
            model.addAttribute("users", users);
            model.addAttribute("user", user);
            logger.info("Loaded {} users for management", users.size());

            return "dashboard/management";
        } catch (Exception e) {
            logger.error("Error loading user management page", e);
            model.addAttribute("error", "Error loading users: " + e.getMessage());
            return "error";
        }
    }

    // 创建用户
    @PostMapping("/create-user")
    public String createUser(@ModelAttribute User newUser,
            HttpSession session,
            Model model) {
        logger.info("Creating new user: {}", newUser.getUsername());

        User admin = (User) session.getAttribute("user");
        if (admin == null || !"admin".equals(admin.getRole())) {
            return "redirect:/user/login";
        }

        try {
            userService.createUser(newUser);
            model.addAttribute("message", "User created successfully");
            model.addAttribute("messageType", "success");
            logger.info("User {} created successfully by admin {}",
                    newUser.getUsername(), admin.getUsername());
        } catch (Exception e) {
            model.addAttribute("message", "Error creating user: " + e.getMessage());
            model.addAttribute("messageType", "danger");
            logger.error("Error creating user", e);
        }

        return "redirect:/admin/management";
    }

    // 删除用户
    @GetMapping("/delete-user")
    public String deleteUser(@RequestParam("id") Integer userId,
            HttpSession session,
            Model model) {
        logger.info("Deleting user with ID: {}", userId);

        User admin = (User) session.getAttribute("user");
        if (admin == null || !"admin".equals(admin.getRole())) {
            return "redirect:/user/login";
        }

        // 防止管理员删除自己
        if (admin.getUserId() != null && admin.getUserId().equals(userId)) {
            model.addAttribute("message", "You cannot delete your own account");
            model.addAttribute("messageType", "warning");
            return "redirect:/admin/management";
        }

        try {
            userService.deleteUser(userId);
            model.addAttribute("message", "User deleted successfully");
            model.addAttribute("messageType", "success");
            logger.info("User ID {} deleted by admin {}", userId, admin.getUsername());
        } catch (Exception e) {
            model.addAttribute("message", "Error deleting user: " + e.getMessage());
            model.addAttribute("messageType", "danger");
            logger.error("Error deleting user", e);
        }

        return "redirect:/admin/management";
    }

    // 请求审批页面
    @GetMapping("/request-approval")
    public String requestApproval(HttpSession session, Model model) {
        logger.info("Accessing request approval page");

        User admin = (User) session.getAttribute("user");
        if (admin == null || !"admin".equals(admin.getRole())) {
            logger.warn("Unauthorized access to request approval");
            return "redirect:/user/login";
        }

        try {
            // 获取所有实验请求
            List<ExperimentRequest> requests = requestService.getAllRequests();
            model.addAttribute("requests", requests);
            model.addAttribute("user", admin);
            logger.info("Loaded {} requests for approval", requests.size());

            // 修改为返回正确的视图名称
            return "dashboard/request-approval"; // 改为这个
        } catch (Exception e) {
            logger.error("Error loading requests for approval", e);
            model.addAttribute("error", "Error loading requests: " + e.getMessage());
            return "error";
        }
    }

    // 处理请求审批
    @PostMapping("/process-request")
    public String processRequest(@RequestParam("requestId") Integer requestId,
            @RequestParam("action") String action,
            @RequestParam(value = "adminNotes", required = false) String adminNotes,
            HttpSession session,
            Model model) {
        logger.info("Processing request {} with action: {}", requestId, action);

        User admin = (User) session.getAttribute("user");
        if (admin == null || !"admin".equals(admin.getRole())) {
            return "redirect:/user/login";
        }

        try {
            if ("approve".equals(action)) {
                boolean success = requestService.updateRequestStatus(requestId, "approved",
                        adminNotes, admin.getUserId());
                if (success) {
                    model.addAttribute("message", "Request approved successfully");
                    model.addAttribute("messageType", "success");
                    logger.info("Request {} approved by admin {}", requestId, admin.getUsername());
                } else {
                    model.addAttribute("message", "Failed to approve request");
                    model.addAttribute("messageType", "danger");
                }
            } else if ("reject".equals(action)) {
                boolean success = requestService.updateRequestStatus(requestId, "rejected",
                        adminNotes, admin.getUserId());
                if (success) {
                    model.addAttribute("message", "Request rejected");
                    model.addAttribute("messageType", "warning");
                    logger.info("Request {} rejected by admin {}", requestId, admin.getUsername());
                } else {
                    model.addAttribute("message", "Failed to reject request");
                    model.addAttribute("messageType", "danger");
                }
            }
        } catch (Exception e) {
            model.addAttribute("message", "Error processing request: " + e.getMessage());
            model.addAttribute("messageType", "danger");
            logger.error("Error processing request", e);
        }

        return "redirect:/admin/request-approval";
    }

    // 编辑用户页面
    @GetMapping("/edit-user")
    public String editUserPage(@RequestParam("id") Integer userId,
            HttpSession session,
            Model model) {
        logger.info("Accessing edit user page for ID: {}", userId);

        User admin = (User) session.getAttribute("user");
        if (admin == null || !"admin".equals(admin.getRole())) {
            return "redirect:/user/login";
        }

        try {
            User userToEdit = userService.getUserById(userId);
            if (userToEdit == null) {
                model.addAttribute("message", "User not found");
                model.addAttribute("messageType", "danger");
                return "redirect:/admin/management";
            }

            model.addAttribute("userToEdit", userToEdit);
            model.addAttribute("user", admin);
            return "dashboard/edit-user";
        } catch (Exception e) {
            logger.error("Error loading user for edit", e);
            model.addAttribute("error", "Error loading user: " + e.getMessage());
            return "error";
        }
    }

    // 更新用户信息
    @PostMapping("/update-user")
    public String updateUser(@ModelAttribute User updatedUser,
            HttpSession session,
            Model model) {
        logger.info("Updating user: {}", updatedUser.getUsername());

        User admin = (User) session.getAttribute("user");
        if (admin == null || !"admin".equals(admin.getRole())) {
            return "redirect:/user/login";
        }

        try {
            userService.updateUser(updatedUser);
            model.addAttribute("message", "User updated successfully");
            model.addAttribute("messageType", "success");
            logger.info("User {} updated by admin {}",
                    updatedUser.getUsername(), admin.getUsername());
        } catch (Exception e) {
            model.addAttribute("message", "Error updating user: " + e.getMessage());
            model.addAttribute("messageType", "danger");
            logger.error("Error updating user", e);
        }

        return "redirect:/admin/management";
    }

    // 查看请求详情
    @GetMapping("/request-detail")
    public String requestDetail(@RequestParam("id") Integer requestId,
            HttpSession session,
            Model model) {
        logger.info("Viewing request detail for ID: {}", requestId);

        User admin = (User) session.getAttribute("user");
        if (admin == null || !"admin".equals(admin.getRole())) {
            return "redirect:/user/login";
        }

        try {
            ExperimentRequest request = requestService.getRequestById(requestId);
            if (request == null) {
                model.addAttribute("message", "Request not found");
                model.addAttribute("messageType", "danger");
                return "redirect:/admin/request-approval";
            }

            model.addAttribute("request", request);
            model.addAttribute("user", admin);
            return "dashboard/request-detail";
        } catch (Exception e) {
            logger.error("Error loading request detail", e);
            model.addAttribute("error", "Error loading request: " + e.getMessage());
            return "error";
        }
    }

    // 获取待处理请求数量（用于AJAX调用）
    @GetMapping("/pending-count")
    @ResponseBody
    public Long getPendingCount(HttpSession session) {
        User admin = (User) session.getAttribute("user");
        if (admin == null || !"admin".equals(admin.getRole())) {
            return 0L;
        }

        try {
            List<ExperimentRequest> pendingRequests = requestService.getPendingRequests();
            return (long) pendingRequests.size();
        } catch (Exception e) {
            logger.error("Error getting pending count", e);
            return 0L;
        }
    }

    // 搜索用户
    // 更简单的搜索实现
    @GetMapping("/search-users")
    public String searchUsers(@RequestParam("query") String query,
            HttpSession session,
            Model model) {
        logger.info("Searching users with query: {}", query);

        User admin = (User) session.getAttribute("user");
        if (admin == null || !"admin".equals(admin.getRole())) {
            return "redirect:/user/login";
        }

        try {
            List<User> allUsers = userService.getAllUsers();

            // 如果没有搜索词，返回所有用户
            if (query == null || query.trim().isEmpty()) {
                model.addAttribute("users", allUsers);
                model.addAttribute("user", admin);
                return "dashboard/management";
            }

            // 手动过滤用户
            List<User> searchResults = new ArrayList<>();
            String searchTerm = query.toLowerCase();

            for (User user : allUsers) {
                boolean matches = false;

                // 检查用户名
                if (user.getUsername() != null && user.getUsername().toLowerCase().contains(searchTerm)) {
                    matches = true;
                }
                // 检查全名
                else if (user.getFullName() != null && user.getFullName().toLowerCase().contains(searchTerm)) {
                    matches = true;
                }
                // 检查邮箱
                else if (user.getEmail() != null && user.getEmail().toLowerCase().contains(searchTerm)) {
                    matches = true;
                }
                // 检查角色
                else if (user.getRole() != null && user.getRole().toLowerCase().contains(searchTerm)) {
                    matches = true;
                }

                if (matches) {
                    searchResults.add(user);
                }
            }

            model.addAttribute("users", searchResults);
            model.addAttribute("user", admin);
            model.addAttribute("searchQuery", query);
            logger.info("Found {} users matching query: {}", searchResults.size(), query);

            return "dashboard/management";
        } catch (Exception e) {
            logger.error("Error searching users", e);
            // 出错时返回所有用户
            List<User> allUsers = userService.getAllUsers();
            model.addAttribute("users", allUsers);
            model.addAttribute("user", admin);
            model.addAttribute("error", "Error searching users: " + e.getMessage());
            return "dashboard/management";
        }

    }
}