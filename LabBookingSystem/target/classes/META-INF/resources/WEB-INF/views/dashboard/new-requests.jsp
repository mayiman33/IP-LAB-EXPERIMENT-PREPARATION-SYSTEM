<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>New Request - Lab Experiment System</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Include all CSS from above style.css here */
        /* ...全部CSS样式... */
    </style>
</head>
<body class="dashboard">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>🔬 Lab System</h2>
            <div class="sidebar-subtitle">User Panel</div>
        </div>
        
        <nav class="sidebar-nav">
            <a href="${pageContext.request.contextPath}/user/dashboard" class="nav-item">
                <span class="nav-icon">📊</span>
                <span>Dashboard</span>
            </a>
            <a href="${pageContext.request.contextPath}/user/new-request" class="nav-item active">
                <span class="nav-icon">➕</span>
                <span>New Request</span>
            </a>
            <a href="${pageContext.request.contextPath}/user/my-requests" class="nav-item">
                <span class="nav-icon">📋</span>
                <span>My Requests</span>
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="nav-item">
                <span class="nav-icon">🚪</span>
                <span>Logout</span>
            </a>
        </nav>
        
        <div class="sidebar-footer">
            <div class="user-info">
                <c:if test="${not empty user}">
                    <div class="user-avatar">${user.fullName.charAt(0)}</div>
                    <div>
                        <div class="user-name">${user.fullName}</div>
                        <div class="user-role">${user.role}</div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    
    <!-- Main Content -->
    <main class="main-content">
        <div class="page-header">
            <div>
                <h1>➕ New Experiment Request</h1>
                <p class="page-subtitle">Submit your experiment preparation request</p>
            </div>
        </div>
        
        <!-- 消息提示 -->
        <c:if test="${not empty message}">
            <div class="alert alert-${messageType != null ? messageType : 'info'}">
                ${message}
            </div>
        </c:if>
        
        <!-- 请求表单 -->
        <div class="content-card">
            <form action="${pageContext.request.contextPath}/user/submit-request" method="post" class="request-form">
                <div class="form-group">
                    <label>Experiment Title *</label>
                    <input type="text" name="title" required class="form-input"
                           placeholder="e.g., Chemical Reaction Analysis">
                </div>
                
                <div class="form-group">
                    <label>Experiment Description *</label>
                    <textarea name="description" rows="6" required class="form-input"
                              placeholder="Provide detailed description of your experiment..."></textarea>
                </div>
                
                <div class="form-group">
                    <label>Required Equipment</label>
                    <textarea name="equipment" rows="4" class="form-input"
                              placeholder="List all equipment and materials needed..."></textarea>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label>Requested Date *</label>
                        <input type="date" name="date" required class="form-input">
                    </div>
                    
                    <div class="form-group">
                        <label>Time Slot *</label>
                        <select name="timeSlot" required class="form-input">
                            <option value="">Select time slot</option>
                            <option value="08:00-10:00">08:00 - 10:00</option>
                            <option value="10:00-12:00">10:00 - 12:00</option>
                            <option value="12:00-14:00">12:00 - 14:00</option>
                            <option value="14:00-16:00">14:00 - 16:00</option>
                            <option value="16:00-18:00">16:00 - 18:00</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-actions">
                    <a href="${pageContext.request.contextPath}/user/dashboard" class="btn btn-secondary">
                        Cancel
                    </a>
                    <button type="submit" class="btn btn-primary">Submit Request</button>
                </div>
            </form>
        </div>
    </main>
    
    <script>
        // 设置明天为最小日期
        document.addEventListener('DOMContentLoaded', function() {
            const dateInput = document.querySelector('input[name="date"]');
            const tomorrow = new Date();
            tomorrow.setDate(tomorrow.getDate() + 1);
            const minDate = tomorrow.toISOString().split('T')[0];
            dateInput.min = minDate;
        });
        
        // 自动关闭警告框
        setTimeout(function() {
            var alerts = document.querySelectorAll('.alert');
            alerts.forEach(function(alert) {
                alert.style.opacity = '0';
                alert.style.transition = 'opacity 0.5s';
                setTimeout(function() {
                    alert.remove();
                }, 500);
            });
        }, 5000);
    </script>
</body>
</html>