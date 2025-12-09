<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Request Approval - Lab Experiment System</title>
    
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

.status-badge {
    display: inline-block;
    padding: 0.35rem 1rem;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 500;
}

/* ===== REQUESTS GRID ===== */
.requests-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
    gap: var(--spacing-md);
}

.request-card {
    background: var(--bg-card);
    border: 1px solid var(--border-color);
    border-radius: 12px;
    overflow: hidden;
    transition: all 0.2s ease;
}

.request-card:hover {
    transform: translateY(-2px);
    box-shadow: var(--shadow-md);
}

.request-header {
    padding: var(--spacing-md);
    border-bottom: 1px solid var(--border-color);
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
}

.request-header h3 {
    font-size: 1.1rem;
    color: var(--text-primary);
    margin-bottom: 0.25rem;
}

.request-meta {
    color: var(--text-secondary);
    font-size: 0.85rem;
}

.request-body {
    padding: var(--spacing-md);
}

.request-field {
    margin-bottom: var(--spacing-md);
}

.request-field:last-child {
    margin-bottom: 0;
}

.request-field label {
    display: block;
    color: var(--text-secondary);
    font-size: 0.85rem;
    margin-bottom: 0.25rem;
    font-weight: 500;
}

.request-field p {
    color: var(--text-primary);
    font-size: 0.95rem;
}

.request-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: var(--spacing-md);
}

.admin-notes {
    background: rgba(74, 158, 255, 0.05);
    border: 1px solid var(--border-color-light);
    border-radius: 8px;
    padding: var(--spacing-sm);
}

.request-actions {
    padding: var(--spacing-md);
    border-top: 1px solid var(--border-color);
    display: flex;
    gap: var(--spacing-sm);
}

/* ===== EMPTY STATE ===== */
.empty-state {
    text-align: center;
    padding: var(--spacing-xl);
    grid-column: 1 / -1;
}

.empty-icon {
    font-size: 4rem;
    margin-bottom: var(--spacing-md);
    opacity: 0.5;
}

.empty-state h3 {
    color: var(--text-primary);
    margin-bottom: 0.5rem;
}

.empty-state p {
    color: var(--text-secondary);
    margin-bottom: var(--spacing-md);
}

/* ===== FILTER BUTTONS ===== */
.filter-buttons {
    display: flex;
    gap: var(--spacing-sm);
    flex-wrap: wrap;
}

.btn-filter {
    background: var(--bg-tertiary);
    color: var(--text-secondary);
    border: 1px solid var(--border-color);
}

.btn-filter.active {
    background: var(--accent-blue);
    color: white;
    border-color: var(--accent-blue);
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

.request-form {
    max-width: 800px;
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

.btn-icon {
    background: none;
    border: none;
    color: var(--text-secondary);
    font-size: 1.2rem;
    cursor: pointer;
    padding: 0.5rem;
    border-radius: 6px;
    transition: all 0.2s ease;
}

.btn-icon:hover {
    background: var(--bg-tertiary);
    color: var(--text-primary);
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
    
    .requests-grid {
        grid-template-columns: 1fr;
    }
    
    .request-row {
        grid-template-columns: 1fr;
    }
    
    .form-row {
        grid-template-columns: 1fr;
    }
    
    .action-grid {
        grid-template-columns: 1fr;
    }
    
    .filter-buttons {
        width: 100%;
        justify-content: space-between;
    }
    
    .btn-filter {
        flex: 1;
        text-align: center;
        font-size: 0.85rem;
        padding: 0.5rem;
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
    
    .modal-content {
        width: 95%;
        margin: 10px;
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
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-item">
                <span class="nav-icon">📊</span>
                <span>Dashboard</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/management" class="nav-item">
                <span class="nav-icon">👥</span>
                <span>User Management</span>
            </a>
            <a href="${pageContext.request.contextPath}/admin/request-approval" class="nav-item active">
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
                <h1>✅ Request Review & Approval</h1>
                <p class="page-subtitle">Review and approve experiment requests</p>
            </div>
            <div class="filter-buttons">
                <button class="btn btn-filter active" onclick="filterRequests('all')">
                    All (${not empty requests ? requests.size() : 0})
                </button>
                <button class="btn btn-filter" onclick="filterRequests('pending')">
                    Pending
                </button>
                <button class="btn btn-filter" onclick="filterRequests('approved')">
                    Approved
                </button>
                <button class="btn btn-filter" onclick="filterRequests('rejected')">
                    Rejected
                </button>
            </div>
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
                        <div class="request-card" data-status="${request.status}">
                            <div class="request-header">
                                <div>
                                    <h3>${request.experimentTitle}</h3>
                                    <p class="request-meta">
                                        Requested by <strong>${request.userName}</strong> • 
                                        ${request.createdAt}
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
                                
                                <div class="request-row">
                                    <div class="request-field">
                                        <label>🔧 Required Equipment</label>
                                        <p>${request.requiredEquipment != null ? request.requiredEquipment : 'None specified'}</p>
                                    </div>
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
                                
                                <div class="request-field">
                                    <label>📧 Contact</label>
                                    <p>${request.userEmail}</p>
                                </div>
                                
                                <c:if test="${not empty request.adminNotes}">
                                <div class="request-field admin-notes">
                                    <label>💬 Admin Notes</label>
                                    <p>${request.adminNotes}</p>
                                </div>
                                </c:if>
                            </div>
                            
                            <c:if test="${request.status == 'pending'}">
                            <div class="request-actions">
                                <button class="btn btn-success" 
                                        onclick="openApprovalModal(${request.requestId}, 'approve')">
                                    ✓ Approve
                                </button>
                                <button class="btn btn-danger" 
                                        onclick="openApprovalModal(${request.requestId}, 'reject')">
                                    ✗ Reject
                                </button>
                            </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <div class="empty-icon">📋</div>
                        <h3>No Requests Found</h3>
                        <p>There are currently no experiment requests to review.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
    
    <!-- Approval Modal -->
    <div id="approvalModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 id="modalTitle">Review Request</h2>
                <button class="modal-close" onclick="closeModal('approvalModal')">&times;</button>
            </div>
            <form action="${pageContext.request.contextPath}/admin/process-request" method="post">
                <div class="modal-body">
                    <input type="hidden" name="requestId" id="modalRequestId">
                    <input type="hidden" name="action" id="modalAction">
                    
                    <div class="form-group">
                        <label>Admin Notes</label>
                        <textarea name="adminNotes" rows="4" class="form-input" 
                                  placeholder="Add notes about your decision..."></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" 
                            onclick="closeModal('approvalModal')">Cancel</button>
                    <button type="submit" class="btn btn-primary" id="submitBtn">Confirm</button>
                </div>
            </form>
        </div>
    </div>
    
    <script>
        function openApprovalModal(requestId, action) {
            document.getElementById('modalRequestId').value = requestId;
            document.getElementById('modalAction').value = action;
            document.getElementById('modalTitle').textContent = 
                action === 'approve' ? '✓ Approve Request' : '✗ Reject Request';
            document.getElementById('submitBtn').textContent = 
                action === 'approve' ? 'Approve' : 'Reject';
            document.getElementById('submitBtn').className = 
                'btn ' + (action === 'approve' ? 'btn-success' : 'btn-danger');
            document.getElementById('approvalModal').style.display = 'flex';
        }
        
        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }
        
        function filterRequests(status) {
            const cards = document.querySelectorAll('.request-card');
            const buttons = document.querySelectorAll('.btn-filter');
            
            buttons.forEach(btn => btn.classList.remove('active'));
            event.target.classList.add('active');
            
            cards.forEach(card => {
                if (status === 'all' || card.dataset.status === status) {
                    card.style.display = 'block';
                } else {
                    card.style.display = 'none';
                }
            });
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
    </script>
</body>
</html>