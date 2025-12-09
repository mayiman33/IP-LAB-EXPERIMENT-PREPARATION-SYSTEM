<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Requests - Lab Experiment System</title>
    
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
            <a href="${pageContext.request.contextPath}/user/new-request" class="nav-item">
                <span class="nav-icon">➕</span>
                <span>New Request</span>
            </a>
            <a href="${pageContext.request.contextPath}/user/my-requests" class="nav-item active">
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
                <h1>📋 My Requests</h1>
                <p class="page-subtitle">View your experiment requests</p>
            </div>
            <a href="${pageContext.request.contextPath}/user/new-request" class="btn btn-primary">
                + New Request
            </a>
        </div>
        
        <!-- 消息提示 -->
        <c:if test="${not empty message}">
            <div class="alert alert-${messageType != null ? messageType : 'info'}">
                ${message}
            </div>
        </c:if>
        
        <!-- 请求列表 -->
        <div class="requests-grid">
            <c:choose>
                <c:when test="${not empty requests and requests.size() > 0}">
                    <c:forEach var="request" items="${requests}">
                        <div class="request-card">
                            <div class="request-header">
                                <div>
                                    <h3>${request.experimentTitle}</h3>
                                    <p class="request-meta">
                                        Submitted on ${request.createdAt}
                                    </p>
                                </div>
                                <span class="status-badge status-${request.status}">
                                    ${request.status.toUpperCase()}
                                </span>
                            </div>
                            
                            <div class="request-body">
                                <div class="request-field">
                                    <label>📝 Description</label>
                                    <p>${request.experimentDescription}</p>
                                </div>
                                
                                <div class="request-field">
                                    <label>🔧 Required Equipment</label>
                                    <p>${request.requiredEquipment != null ? request.requiredEquipment : 'None specified'}</p>
                                </div>
                                
                                <div class="request-row">
                                    <div class="request-field">
                                        <label>📅 Requested Date</label>
                                        <p>${request.requestedDate}</p>
                                    </div>
                                    <div class="request-field">
                                        <label>⏰ Time Slot</label>
                                        <p>${request.requestedTimeSlot}</p>
                                    </div>
                                </div>
                                
                                <c:if test="${not empty request.adminNotes}">
                                <div class="request-field admin-notes">
                                    <label>💬 Admin Response</label>
                                    <p>${request.adminNotes}</p>
                                    <c:if test="${not empty request.reviewedAt}">
                                    <small>Reviewed on ${request.reviewedAt}</small>
                                    </c:if>
                                </div>
                                </c:if>
                            </div>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <div class="empty-icon">📋</div>
                        <h3>No Requests Yet</h3>
                        <p>You haven't submitted any experiment requests.</p>
                        <a href="${pageContext.request.contextPath}/user/new-request" class="btn btn-primary">
                            Create Your First Request
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
    
    <script>
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