<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management - Lab Experiment System</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
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

        /* ===== SEARCH BAR ===== */
        .search-container {
            position: relative;
            flex: 1;
            max-width: 400px;
            margin-right: var(--spacing-md);
        }

        .search-input {
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.5rem;
            background: var(--bg-tertiary);
            border: 1px solid var(--border-color);
            border-radius: 8px;
            color: var(--text-primary);
            font-size: 0.95rem;
            transition: all 0.2s ease;
        }

        .search-input:focus {
            outline: none;
            border-color: var(--accent-blue);
            background: var(--bg-secondary);
        }

        .search-icon {
            position: absolute;
            left: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-secondary);
        }

        .search-form {
            display: flex;
            gap: var(--spacing-sm);
            align-items: center;
        }

        /* ===== CONTENT CARDS ===== */
        .content-card {
            background: var(--bg-card);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: var(--spacing-lg);
            box-shadow: var(--shadow-sm);
            margin-bottom: var(--spacing-lg);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-md);
            padding-bottom: var(--spacing-sm);
            border-bottom: 1px solid var(--border-color);
        }

        .card-header h2 {
            font-size: 1.3rem;
            color: var(--text-primary);
        }

        /* ===== DATA TABLES ===== */
        .table-container {
            overflow-x: auto;
            border-radius: 8px;
            border: 1px solid var(--border-color);
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
            background: var(--bg-tertiary);
        }

        .data-table th {
            background: var(--bg-secondary);
            color: var(--text-secondary);
            font-weight: 500;
            text-align: left;
            padding: 1rem;
            border-bottom: 1px solid var(--border-color);
        }

        .data-table td {
            padding: 1rem;
            border-bottom: 1px solid var(--border-color);
        }

        .data-table tr:hover {
            background: var(--bg-secondary);
        }

        .data-table tr:last-child td {
            border-bottom: none;
        }

        /* ===== BADGES ===== */
        .badge {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .badge-info {
            background: rgba(74, 158, 255, 0.1);
            color: var(--accent-blue);
        }

        .badge-purple {
            background: rgba(139, 92, 246, 0.1);
            color: var(--accent-purple);
        }

        .badge-blue {
            background: rgba(74, 158, 255, 0.1);
            color: var(--accent-blue);
        }

        .badge-green {
            background: rgba(16, 185, 129, 0.1);
            color: var(--accent-green);
        }

        .badge-yellow {
            background: rgba(245, 158, 11, 0.1);
            color: var(--accent-yellow);
        }

        .badge-red {
            background: rgba(239, 68, 68, 0.1);
            color: var(--accent-red);
        }

        /* ===== STATUS INDICATORS ===== */
        .status-indicator {
            display: inline-block;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 500;
        }

        .status-pending {
            background: rgba(245, 158, 11, 0.1);
            color: var(--accent-yellow);
        }

        .status-approved {
            background: rgba(16, 185, 129, 0.1);
            color: var(--accent-green);
        }

        .status-rejected {
            background: rgba(239, 68, 68, 0.1);
            color: var(--accent-red);
        }

        .status-active {
            background: rgba(16, 185, 129, 0.1);
            color: var(--accent-green);
        }

        .status-inactive {
            background: rgba(239, 68, 68, 0.1);
            color: var(--accent-red);
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

        .btn-icon {
            background: none;
            border: none;
            color: var(--text-secondary);
            font-size: 1.2rem;
            cursor: pointer;
            padding: 0.5rem;
            border-radius: 6px;
            transition: all 0.2s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn-icon:hover {
            background: var(--bg-tertiary);
            color: var(--text-primary);
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
            align-items: center;
        }

        /* ===== ALERTS ===== */
        .alert {
            border-radius: 8px;
            border: 1px solid;
            padding: var(--spacing-md);
            margin-bottom: var(--spacing-md);
            display: flex;
            justify-content: space-between;
            align-items: center;
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

        .alert-close {
            background: none;
            border: none;
            color: inherit;
            cursor: pointer;
            font-size: 1.2rem;
            padding: 0;
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
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
                gap: var(--spacing-sm);
            }
            
            .page-header h1 {
                font-size: 1.5rem;
            }
            
            .search-container {
                max-width: 100%;
                margin-right: 0;
                order: 3;
            }
            
            .search-form {
                width: 100%;
            }
            
            .action-buttons {
                flex-wrap: wrap;
            }
        }

        @media (max-width: 480px) {
            .modal-content {
                width: 95%;
                margin: 10px;
            }
            
            .data-table th,
            .data-table td {
                padding: 0.75rem 0.5rem;
                font-size: 0.85rem;
            }
            
            .btn {
                padding: 0.5rem 1rem;
                font-size: 0.85rem;
            }
        }

        /* ===== TABLE ACTION BUTTONS ===== */
        .table-actions {
            display: flex;
            gap: 0.5rem;
            flex-wrap: nowrap;
        }

        .status-filter {
            display: flex;
            gap: 0.5rem;
            margin-bottom: var(--spacing-md);
            flex-wrap: wrap;
        }

        .status-filter-btn {
            padding: 0.5rem 1rem;
            border: 1px solid var(--border-color);
            background: var(--bg-tertiary);
            color: var(--text-secondary);
            border-radius: 6px;
            cursor: pointer;
            font-size: 0.85rem;
            transition: all 0.2s ease;
        }

        .status-filter-btn:hover {
            background: var(--bg-secondary);
            color: var(--text-primary);
        }

        .status-filter-btn.active {
            background: var(--accent-blue);
            color: white;
            border-color: var(--accent-blue);
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
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-item">
                <span class="nav-icon">📊</span>
                <span>Dashboard</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/management" class="nav-item active">
                <span class="nav-icon">👥</span>
                <span>User Management</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/request-approval" class="nav-item">
                <span class="nav-icon">✅</span>
                <span>Request Approval</span>
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
                        <div class="user-role">Administrator</div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
    
    <!-- Main Content -->
    <main class="main-content">
        <div class="page-header">
            <div>
                <h1>👥 User Management</h1>
                <p class="page-subtitle">Manage system users and permissions</p>
            </div>
            <div class="search-container">
                <form action="${pageContext.request.contextPath}/admin/search-users" method="get" class="search-form">
                    <span class="search-icon">🔍</span>
                    <input type="text" name="query" class="search-input" 
                           placeholder="Search users..." value="${searchQuery}">
                    <button type="submit" class="btn btn-secondary">Search</button>
                </form>
            </div>
            <button class="btn btn-primary" onclick="openModal('createUserModal')">
                + Add New User
            </button>
        </div>
        
        <!-- 消息提示 -->
        <c:if test="${not empty message}">
            <div class="alert alert-${messageType != null ? messageType : 'info'}" id="messageAlert">
                ${message}
                <button class="alert-close" onclick="document.getElementById('messageAlert').remove()">&times;</button>
            </div>
        </c:if>
        
        <!-- 用户表格 -->
        <div class="content-card">
            <div class="card-header">
                <h2>System Users</h2>
                <div>
                    <c:if test="${not empty searchQuery}">
                        <span class="badge badge-info" style="margin-right: 1rem;">
                            Search: "${searchQuery}"
                        </span>
                    </c:if>
                    <span class="badge badge-purple">
                        <c:choose>
                            <c:when test="${not empty users}">${users.size()} Users</c:when>
                            <c:otherwise>0 Users</c:otherwise>
                        </c:choose>
                    </span>
                </div>
            </div>
            
            <div class="table-container">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>Username</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty users and users.size() > 0}">
                                <c:forEach var="userItem" items="${users}">
                                    <tr>
                                        <td>#${userItem.userId}</td>
                                        <td><strong>${userItem.username}</strong></td>
                                        <td>${userItem.fullName}</td>
                                        <td>${userItem.email}</td>
                                        <td>
                                            <span class="badge ${userItem.role == 'admin' ? 'badge-purple' : (userItem.role == 'instructor' ? 'badge-blue' : 'badge-green')}">
                                                ${userItem.role.toUpperCase()}
                                            </span>
                                        </td>
                                        <td>
                                            <span class="status-indicator ${userItem.status == 'active' ? 'status-active' : 'status-inactive'}">
                                                ${userItem.status != null ? userItem.status.toUpperCase() : 'ACTIVE'}
                                            </span>
                                        </td>
                                        <td>
                                            <div class="table-actions">
                                                <a href="${pageContext.request.contextPath}/admin/edit-user?id=${userItem.userId}" 
                                                   class="btn-icon" title="Edit User">✏️</a>
                                                <c:if test="${userItem.userId != user.userId}">
                                                    <a href="${pageContext.request.contextPath}/admin/delete-user?id=${userItem.userId}" 
                                                       class="btn-icon" 
                                                       onclick="return confirm('Are you sure you want to delete user: ${userItem.username}?')" 
                                                       title="Delete User">🗑️</a>
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="7" class="text-center" style="padding: 3rem; color: var(--text-secondary);">
                                        <div style="font-size: 3rem; margin-bottom: 1rem; opacity: 0.5;">👥</div>
                                        <c:choose>
                                            <c:when test="${not empty searchQuery}">
                                                No users found matching "${searchQuery}"
                                            </c:when>
                                            <c:otherwise>
                                                No users found in the system
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    
    <!-- Create User Modal -->
    <div id="createUserModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>➕ Add New User</h2>
                <button class="modal-close" onclick="closeModal('createUserModal')">&times;</button>
            </div>
            <form action="${pageContext.request.contextPath}/admin/create-user" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Username *</label>
                        <input type="text" name="username" required class="form-input"
                               placeholder="Enter username">
                    </div>
                    <div class="form-group">
                        <label>Password *</label>
                        <input type="password" name="password" required class="form-input"
                               placeholder="Enter password">
                    </div>
                    <div class="form-group">
                        <label>Full Name *</label>
                        <input type="text" name="fullName" required class="form-input"
                               placeholder="Enter full name">
                    </div>
                    <div class="form-group">
                        <label>Email *</label>
                        <input type="email" name="email" required class="form-input"
                               placeholder="Enter email address">
                    </div>
                    <div class="form-group">
                        <label>Role *</label>
                        <select name="role" required class="form-input">
                            <option value="">Select role</option>
                            <option value="student">Student</option>
                            <option value="instructor">Instructor</option>
                            <option value="admin">Admin</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" 
                            onclick="closeModal('createUserModal')">Cancel</button>
                    <button type="submit" class="btn btn-primary">Create User</button>
                </div>
            </form>
        </div>
    </div>
    
    <script>
        function openModal(modalId) {
            document.getElementById(modalId).style.display = 'flex';
        }
        
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }
        
        window.onclick = function(event) {
            if (event.target.classList.contains('modal')) {
                event.target.style.display = 'none';
            }
        }
        
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
        
        // 搜索功能
        function handleSearch(event) {
            event.preventDefault();
            const query = document.querySelector('.search-input').value;
            window.location.href = '${pageContext.request.contextPath}/admin/search-users?query=' + encodeURIComponent(query);
        }
    </script>
</body>
</html>