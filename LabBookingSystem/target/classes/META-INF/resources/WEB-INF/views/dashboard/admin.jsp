<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Lab Experiment System</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* ============================================
           CSS/STYLE.CSS - Lab Experiment System
           Dark Theme Matching Reference Design
           ============================================ */

        /* ===== RESET & BASE ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            /* Dark Theme Colors */
            --bg-primary: #0f1419;
            --bg-secondary: #1a2332;
            --bg-tertiary: #253447;
            --bg-card: #1e2d3d;
            
            /* Accent Colors */
            --accent-blue: #4a9eff;
            --accent-purple: #8b5cf6;
            --accent-green: #10b981;
            --accent-yellow: #f59e0b;
            --accent-red: #ef4444;
            
            /* Text Colors */
            --text-primary: #e8eaed;
            --text-secondary: #9ca3af;
            --text-muted: #6b7280;
            
            /* Border & Divider */
            --border-color: #2d3748;
            --border-color-light: #374151;
            
            /* Shadows */
            --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.3);
            --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.4);
            --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.5);
            
            /* Spacing */
            --spacing-xs: 0.5rem;
            --spacing-sm: 1rem;
            --spacing-md: 1.5rem;
            --spacing-lg: 2rem;
            --spacing-xl: 3rem;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: var(--bg-primary);
            color: var(--text-primary);
            line-height: 1.6;
            overflow-x: hidden;
        }

        /* ===== DASHBOARD LAYOUT ===== */
        .dashboard {
            display: flex;
            min-height: 100vh;
            background: var(--bg-primary);
        }

        /* ===== SIDEBAR ===== */
        .sidebar {
            width: 260px;
            background: var(--bg-secondary);
            border-right: 1px solid var(--border-color);
            display: flex;
            flex-direction: column;
            position: fixed;
            height: 100vh;
            overflow-y: auto;
            z-index: 100;
        }

        .sidebar-header {
            padding: var(--spacing-lg) var(--spacing-md);
            border-bottom: 1px solid var(--border-color);
        }

        .sidebar-header h2 {
            font-size: 1.4rem;
            color: var(--accent-blue);
            margin-bottom: 0.25rem;
        }

        .sidebar-subtitle {
            color: var(--text-secondary);
            font-size: 0.85rem;
            font-weight: 400;
        }

        .sidebar-nav {
            flex: 1;
            padding: var(--spacing-md);
        }

        .nav-item {
            display: flex;
            align-items: center;
            padding: 0.75rem var(--spacing-md);
            color: var(--text-secondary);
            text-decoration: none;
            border-radius: 8px;
            margin-bottom: 0.5rem;
            transition: all 0.2s ease;
            font-size: 0.95rem;
            cursor: pointer;
        }

        .nav-item:hover {
            background: var(--bg-tertiary);
            color: var(--text-primary);
        }

        .nav-item.active {
            background: var(--bg-tertiary);
            color: var(--accent-blue);
            font-weight: 500;
        }

        .nav-icon {
            margin-right: var(--spacing-sm);
            font-size: 1.2rem;
        }

        .sidebar-footer {
            padding: var(--spacing-md);
            border-top: 1px solid var(--border-color);
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: var(--spacing-sm);
            cursor: pointer;
            transition: all 0.2s ease;
            padding: 0.5rem;
            border-radius: 8px;
        }

        .user-info:hover {
            background: var(--bg-tertiary);
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--accent-purple);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 1.1rem;
            color: white;
        }

        .user-name {
            font-weight: 500;
            font-size: 0.9rem;
            color: var(--text-primary);
        }

        .user-role {
            font-size: 0.8rem;
            color: var(--text-muted);
            text-transform: capitalize;
        }

        /* ===== MAIN CONTENT ===== */
        .main-content {
            flex: 1;
            margin-left: 260px;
            padding: var(--spacing-lg);
            min-height: 100vh;
        }

        .page-header {
            margin-bottom: var(--spacing-lg);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: var(--spacing-md);
        }

        .page-header h1 {
            font-size: 2rem;
            color: var(--text-primary);
        }

        .page-subtitle {
            color: var(--text-secondary);
            font-size: 0.95rem;
            margin-top: 0.25rem;
        }

        /* ===== DASHBOARD STATS ===== */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: var(--spacing-md);
            margin-bottom: var(--spacing-xl);
        }

        .stat-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: var(--spacing-md);
            display: flex;
            align-items: center;
            gap: var(--spacing-md);
            box-shadow: var(--shadow-sm);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.8rem;
        }

        .stat-icon-blue { background: rgba(74, 158, 255, 0.1); }
        .stat-icon-purple { background: rgba(139, 92, 246, 0.1); }
        .stat-icon-green { background: rgba(16, 185, 129, 0.1); }
        .stat-icon-yellow { background: rgba(245, 158, 11, 0.1); }
        .stat-icon-red { background: rgba(239, 68, 68, 0.1); }

        .stat-content {
            flex: 1;
        }

        .stat-label {
            color: var(--text-secondary);
            font-size: 0.85rem;
            margin-bottom: 0.25rem;
        }

        .stat-value {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--text-primary);
        }

        /* ===== QUICK ACTIONS ===== */
        .quick-actions {
            margin-top: var(--spacing-xl);
        }

        .section-title {
            font-size: 1.4rem;
            color: var(--text-primary);
            margin-bottom: var(--spacing-md);
        }

        .action-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: var(--spacing-md);
        }

        .action-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: var(--spacing-lg);
            text-decoration: none;
            display: block;
            transition: all 0.2s ease;
            cursor: pointer;
        }

        .action-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-lg);
            border-color: var(--accent-blue);
        }

        .action-icon {
            font-size: 2.5rem;
            margin-bottom: var(--spacing-sm);
        }

        .action-card h3 {
            color: var(--text-primary);
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
        }

        .action-card p {
            color: var(--text-secondary);
            font-size: 0.9rem;
        }

        /* ===== MODALS ===== */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }

        .modal-content {
            background: var(--bg-card);
            border-radius: 12px;
            width: 90%;
            max-width: 500px;
            max-height: 90vh;
            overflow-y: auto;
            border: 1px solid var(--border-color);
            box-shadow: var(--shadow-lg);
        }

        .modal-header {
            padding: var(--spacing-md);
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-header h2 {
            font-size: 1.3rem;
            color: var(--text-primary);
        }

        .modal-close {
            background: none;
            border: none;
            color: var(--text-secondary);
            font-size: 1.5rem;
            cursor: pointer;
            padding: 0;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .modal-body {
            padding: var(--spacing-md);
        }

        .modal-footer {
            padding: var(--spacing-md);
            border-top: 1px solid var(--border-color);
            display: flex;
            justify-content: flex-end;
            gap: var(--spacing-sm);
        }

        /* ===== FORMS ===== */
        .form-group {
            margin-bottom: var(--spacing-md);
        }

        .form-group label {
            display: block;
            color: var(--text-secondary);
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
            font-weight: 500;
        }

        .form-input {
            width: 100%;
            padding: 0.75rem var(--spacing-sm);
            background: var(--bg-tertiary);
            border: 1px solid var(--border-color);
            border-radius: 8px;
            color: var(--text-primary);
            font-size: 0.95rem;
            transition: all 0.2s ease;
        }

        .form-input:focus {
            outline: none;
            border-color: var(--accent-blue);
            background: var(--bg-secondary);
        }

        .form-input::placeholder {
            color: var(--text-muted);
        }

        textarea.form-input {
            resize: vertical;
            min-height: 100px;
        }

        .form-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: var(--spacing-md);
        }

        .form-actions {
            display: flex;
            gap: var(--spacing-sm);
            justify-content: flex-end;
            margin-top: var(--spacing-lg);
            padding-top: var(--spacing-md);
            border-top: 1px solid var(--border-color);
        }

        /* ===== BUTTONS ===== */
        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-size: 0.95rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-primary {
            background: var(--accent-blue);
            color: white;
        }

        .btn-primary:hover {
            background: #3a8eef;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(74, 158, 255, 0.3);
        }

        .btn-secondary {
            background: var(--bg-tertiary);
            color: var(--text-primary);
            border: 1px solid var(--border-color);
        }

        .btn-secondary:hover {
            background: var(--bg-secondary);
        }

        .btn-success {
            background: var(--accent-green);
            color: white;
        }

        .btn-success:hover {
            background: #0ea672;
            box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);
        }

        .btn-danger {
            background: var(--accent-red);
            color: white;
        }

        .btn-danger:hover {
            background: #dc2626;
            box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3);
        }

        .btn-block {
            width: 100%;
        }

        /* ===== ALERTS ===== */
        .alert {
            border-radius: 8px;
            border: 1px solid;
            padding: var(--spacing-md);
            margin-bottom: var(--spacing-md);
        }

        .alert-info {
            background: rgba(74, 158, 255, 0.1);
            border-color: var(--accent-blue);
            color: var(--accent-blue);
        }

        .alert-success {
            background: rgba(16, 185, 129, 0.1);
            border-color: var(--accent-green);
            color: var(--accent-green);
        }

        .alert-warning {
            background: rgba(245, 158, 11, 0.1);
            border-color: var(--accent-yellow);
            color: var(--accent-yellow);
        }

        .alert-danger {
            background: rgba(239, 68, 68, 0.1);
            border-color: var(--accent-red);
            color: var(--accent-red);
        }

        /* ===== RESPONSIVE ===== */
        @media (max-width: 768px) {
            .sidebar {
                width: 70px;
            }
            
            .main-content {
                margin-left: 70px;
                padding: var(--spacing-md);
            }
            
            .sidebar-header h2,
            .sidebar-subtitle,
            .nav-item span:not(.nav-icon),
            .user-info > div {
                display: none;
            }
            
            .nav-item {
                justify-content: center;
                padding: 0.75rem;
            }
            
            .sidebar-footer {
                padding: var(--spacing-sm);
            }
            
            .user-avatar {
                width: 36px;
                height: 36px;
            }
            
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .page-header h1 {
                font-size: 1.5rem;
            }
            
            .dashboard-cards {
                grid-template-columns: 1fr;
            }
            
            .form-row {
                grid-template-columns: 1fr;
            }
            
            .action-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .stat-card {
                flex-direction: column;
                text-align: center;
            }
            
            .action-card {
                padding: var(--spacing-md);
            }
        }
    </style>
</head>
<body class="dashboard">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h2>🔬 Lab System</h2>
            <div class="sidebar-subtitle">Admin Panel</div>
        </div>
        
        <nav class="sidebar-nav">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-item ${pageContext.request.requestURI.contains('/admin/dashboard') ? 'active' : ''}">
                <span class="nav-icon">📊</span>
                <span>Dashboard</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/management" class="nav-item ${pageContext.request.requestURI.contains('/management') ? 'active' : ''}">
                <span class="nav-icon">👥</span>
                <span>User Management</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/request-approval" class="nav-item ${pageContext.request.requestURI.contains('/request-approval') ? 'active' : ''}">
                <span class="nav-icon">✅</span>
                <span>Request Approval</span>
            </a>
            <a href="${pageContext.request.contextPath}/logout" class="nav-item">
                <span class="nav-icon">🚪</span>
                <span>Logout</span>
            </a>
        </nav>
        
        <div class="sidebar-footer">
            <div class="user-info" onclick="openProfileModal()" title="Click to edit profile">
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
                <h1>Admin Dashboard</h1>
                <p class="page-subtitle">Welcome back, ${user.fullName}</p>
            </div>
        </div>
        
        <!-- 消息提示 -->
        <c:if test="${not empty message}">
            <div class="alert alert-${messageType != null ? messageType : 'info'}" id="messageAlert">
                ${message}
                <button class="modal-close" onclick="document.getElementById('messageAlert').remove()">&times;</button>
            </div>
        </c:if>
        
        <!-- 统计卡片 -->
        <div class="dashboard-cards">
            <div class="stat-card">
                <div class="stat-icon stat-icon-blue">
                    👥
                </div>
                <div class="stat-content">
                    <div class="stat-label">Total Users</div>
                    <div class="stat-value">
                        <c:choose>
                            <c:when test="${not empty totalUsers}">${totalUsers}</c:when>
                            <c:otherwise>0</c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon stat-icon-yellow">
                    ⏳
                </div>
                <div class="stat-content">
                    <div class="stat-label">Pending Requests</div>
                    <div class="stat-value">
                        <c:choose>
                            <c:when test="${not empty pendingRequests}">${pendingRequests}</c:when>
                            <c:otherwise>0</c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon stat-icon-green">
                    ✅
                </div>
                <div class="stat-content">
                    <div class="stat-label">Approved Today</div>
                    <div class="stat-value">
                        <c:choose>
                            <c:when test="${not empty approvedToday}">${approvedToday}</c:when>
                            <c:otherwise>0</c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            
            <div class="stat-card">
                <div class="stat-icon stat-icon-red">
                    ❌
                </div>
                <div class="stat-content">
                    <div class="stat-label">Rejected This Month</div>
                    <div class="stat-value">
                        <c:choose>
                            <c:when test="${not empty rejectedThisMonth}">${rejectedThisMonth}</c:when>
                            <c:otherwise>0</c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 快速操作 -->
        <div class="quick-actions">
            <h2 class="section-title">Quick Actions</h2>
            <div class="action-grid">
                <a href="${pageContext.request.contextPath}/admin/management" class="action-card">
                    <div class="action-icon">👥</div>
                    <h3>Manage Users</h3>
                    <p>Add, edit, or remove users from the system</p>
                </a>
                <a href="${pageContext.request.contextPath}/admin/request-approval" class="action-card">
                    <div class="action-icon">✅</div>
                    <h3>Review Requests</h3>
                    <p>Approve or reject experiment requests</p>
                </a>
            </div>
        </div>
    </main>
    
    <!-- Profile Edit Modal -->
    <div id="profileModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>✏️ Edit Your Profile</h2>
                <button class="modal-close" onclick="closeModal('profileModal')">&times;</button>
            </div>
            <form action="${pageContext.request.contextPath}/admin/update-user" method="post" onsubmit="return validateProfileForm()">
                <div class="modal-body">
                    <!-- Hidden field for user ID -->
                    <input type="hidden" name="userId" value="${user.userId}">
                    <input type="hidden" name="username" value="${user.username}">
                    <input type="hidden" name="role" value="${user.role}">
                    
                    <div class="form-group">
                        <label>Full Name *</label>
                        <input type="text" name="fullName" id="fullName" required class="form-input"
                               placeholder="Enter your full name" value="${user.fullName}">
                    </div>
                    
                    <div class="form-group">
                        <label>Email *</label>
                        <input type="email" name="email" id="email" required class="form-input"
                               placeholder="Enter your email address" value="${user.email}">
                    </div>
                    
                    <div class="form-group">
                        <label>New Password (Optional)</label>
                        <input type="password" name="password" id="password" class="form-input"
                               placeholder="Leave blank to keep current password">
                        <small style="color: var(--text-muted); font-size: 0.85rem;">
                            Only enter if you want to change your password
                        </small>
                    </div>
                    
                    <div class="form-group">
                        <label>Confirm New Password</label>
                        <input type="password" id="confirmPassword" class="form-input"
                               placeholder="Confirm new password">
                    </div>
                    
                    <div class="form-group">
                        <label>Status</label>
                        <select name="status" class="form-input">
                            <option value="active" ${user.status == 'active' ? 'selected' : ''}>Active</option>
                            <option value="inactive" ${user.status == 'inactive' ? 'selected' : ''}>Inactive</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" 
                            onclick="closeModal('profileModal')">Cancel</button>
                    <button type="submit" class="btn btn-primary">Update Profile</button>
                </div>
            </form>
        </div>
    </div>
    
    <script>
        // 打开个人资料编辑模态框
        function openProfileModal() {
            document.getElementById('profileModal').style.display = 'flex';
        }
        
        // 关闭模态框
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }
        
        // 验证表单
        function validateProfileForm() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password && password !== confirmPassword) {
                alert('Passwords do not match!');
                return false;
            }
            
            if (password && password.length < 6) {
                alert('Password must be at least 6 characters long!');
                return false;
            }
            
            return true;
        }
        
        // 简单的JavaScript功能
        document.addEventListener('DOMContentLoaded', function() {
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
            
            // 点击模态框外部关闭
            window.onclick = function(event) {
                if (event.target.classList.contains('modal')) {
                    event.target.style.display = 'none';
                }
            }
            
            // 添加悬停效果
            var actionCards = document.querySelectorAll('.action-card');
            actionCards.forEach(function(card) {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-4px)';
                    this.style.boxShadow = '0 10px 15px rgba(0, 0, 0, 0.5)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                    this.style.boxShadow = '0 1px 2px rgba(0, 0, 0, 0.3)';
                });
            });
            
            // 实时更新待处理请求数量
            function updatePendingCount() {
                fetch('${pageContext.request.contextPath}/admin/pending-count')
                    .then(response => response.json())
                    .then(count => {
                        const pendingElement = document.querySelector('.stat-card:nth-child(2) .stat-value');
                        if (pendingElement && count !== undefined) {
                            pendingElement.textContent = count;
                        }
                    })
                    .catch(error => console.error('Error updating pending count:', error));
            }
            
            // 每30秒更新一次
            updatePendingCount();
            setInterval(updatePendingCount, 30000);
            
            // 侧边栏用户信息悬停效果
            const userInfo = document.querySelector('.user-info');
            if (userInfo) {
                userInfo.addEventListener('mouseenter', function() {
                    this.style.background = 'var(--bg-tertiary)';
                    this.style.transform = 'translateY(-1px)';
                });
                
                userInfo.addEventListener('mouseleave', function() {
                    this.style.background = 'transparent';
                    this.style.transform = 'translateY(0)';
                });
                
                // 添加点击提示
                userInfo.title = 'Click to edit your profile';
            }
            
            // 键盘快捷键
            document.addEventListener('keydown', function(e) {
                if (e.ctrlKey && e.key === 'e') {
                    e.preventDefault();
                    openProfileModal();
                }
                
                if (e.key === 'Escape') {
                    closeModal('profileModal');
                }
            });
        });
    </script>
</body>
</html>