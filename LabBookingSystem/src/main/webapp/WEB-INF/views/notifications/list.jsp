<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title} - Lab System</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Inter', sans-serif;
            background: #0F1A27;
            color: white;
        }
        .container {
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }
        .nav {
            display: flex;
            gap: 1.5rem;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        .nav a {
            color: #97A2B7;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
        }
        .nav a.active {
            color: white;
            background: rgba(138, 169, 255, 0.2);
            border-bottom: 2px solid #8AA9FF;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }
        .header h1 {
            color: #8AA9FF;
            margin: 0;
        }
        .filter-bar {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            align-items: center;
            flex-wrap: wrap;
        }
        .filter-select {
            padding: 0.5rem 1rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            border-radius: 5px;
            min-width: 150px;
        }
        .btn {
            padding: 0.5rem 1.5rem;
            background: #8AA9FF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
        }
        .stats-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }
        .stat-card {
            background: rgba(255, 255, 255, 0.05);
            padding: 1.5rem;
            border-radius: 10px;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }
        .stat-label {
            color: #A8B5C8;
            font-size: 0.9rem;
        }
        .notifications-list {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }
        .notification-item {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 1.5rem;
            border-left: 4px solid #8AA9FF;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .notification-item.unread {
            background: rgba(255, 193, 7, 0.1);
            border-left-color: #FFC107;
        }
        .notification-item.urgent {
            background: rgba(255, 82, 82, 0.1);
            border-left-color: #FF5252;
        }
        .notification-item.success {
            background: rgba(78, 175, 80, 0.1);
            border-left-color: #4CAF50;
        }
        .notification-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 0.5rem;
        }
        .notification-title {
            font-weight: 600;
            font-size: 1.1rem;
            color: white;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .notification-time {
            color: #A8B5C8;
            font-size: 0.9rem;
        }
        .notification-content {
            color: #A8B5C8;
            margin-bottom: 1rem;
            line-height: 1.5;
        }
        .notification-actions {
            display: flex;
            gap: 0.5rem;
            margin-top: 1rem;
        }
        .action-btn {
            padding: 0.5rem 1rem;
            background: rgba(255, 255, 255, 0.1);
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-size: 0.9rem;
            transition: background 0.3s;
        }
        .action-btn:hover {
            background: rgba(255, 255, 255, 0.2);
        }
        .btn-mark-read {
            background: rgba(138, 169, 255, 0.2);
            color: #8AA9FF;
        }
        .btn-delete {
            background: rgba(255, 82, 82, 0.2);
            color: #FF5252;
        }
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: #A8B5C8;
        }
        .empty-state h3 {
            color: #8AA9FF;
            margin-bottom: 1rem;
        }
        .notification-type {
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
            display: inline-block;
            margin-left: 0.5rem;
        }
        .type-approval {
            background: rgba(138, 169, 255, 0.2);
            color: #8AA9FF;
        }
        .type-stock {
            background: rgba(255, 193, 7, 0.2);
            color: #FFC107;
        }
        .type-schedule {
            background: rgba(78, 175, 80, 0.2);
            color: #4CAF50;
        }
        .type-system {
            background: rgba(155, 89, 182, 0.2);
            color: #9B59B6;
        }
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 1rem;
            margin-top: 2rem;
            padding-top: 1rem;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
        }
        .page-number {
            padding: 0.5rem 1rem;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 5px;
            cursor: pointer;
        }
        .page-number.active {
            background: #8AA9FF;
            color: white;
        }
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            .filter-bar {
                flex-direction: column;
                align-items: stretch;
            }
            .notification-header {
                flex-direction: column;
                gap: 0.5rem;
            }
            .notification-actions {
                flex-wrap: wrap;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav">
            <a href="${pageContext.request.contextPath}/notifications">Notification Center</a>
            <a href="${pageContext.request.contextPath}/notifications/list" class="active">Notification List</a>
            <a href="${pageContext.request.contextPath}/notifications/settings">Settings</a>
            <a href="${pageContext.request.contextPath}/">Dashboard</a>
        </div>
        
        <div class="header">
            <h1>${title}</h1>
            <div style="display: flex; gap: 1rem;">
                <button class="btn" id="markAllReadBtn">Mark All as Read</button>
                <button class="btn" id="clearAllBtn" style="background: rgba(255, 82, 82, 0.2); color: #FF5252;">Clear All</button>
            </div>
        </div>
        
        <div class="stats-cards">
            <div class="stat-card">
                <div class="stat-number" id="totalCount">15</div>
                <div class="stat-label">Total Notifications</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="unreadCount" style="color: #FFC107;">5</div>
                <div class="stat-label">Unread</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="todayCount" style="color: #4CAF50;">3</div>
                <div class="stat-label">Today</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="urgentCount" style="color: #FF5252;">2</div>
                <div class="stat-label">Urgent</div>
            </div>
        </div>
        
        <div class="filter-bar">
            <select class="filter-select" id="typeFilter">
                <option value="all">All Types</option>
                <option value="approval">Approval</option>
                <option value="stock">Stock Alerts</option>
                <option value="schedule">Schedule</option>
                <option value="system">System</option>
            </select>
            
            <select class="filter-select" id="statusFilter">
                <option value="all">All Status</option>
                <option value="unread">Unread Only</option>
                <option value="read">Read Only</option>
            </select>
            
            <select class="filter-select" id="priorityFilter">
                <option value="all">All Priorities</option>
                <option value="high">High Priority</option>
                <option value="medium">Medium Priority</option>
                <option value="low">Low Priority</option>
            </select>
            
            <button class="btn" id="applyFiltersBtn">Apply Filters</button>
            <button class="btn" id="resetFiltersBtn" style="background: rgba(255, 255, 255, 0.1);">Reset</button>
        </div>
        
        <div class="notifications-list" id="notificationsList">
            <!-- Notification 1 -->
            <div class="notification-item unread urgent" data-notification-id="1">
                <div class="notification-header">
                    <div class="notification-title">
                        🔥 Urgent: Low Stock Alert
                        <span class="notification-type type-stock">Stock</span>
                    </div>
                    <div class="notification-time">10 minutes ago</div>
                </div>
                <div class="notification-content">
                    Chemical reagents running low in Chemistry Lab #1. Order immediately to avoid disruption.
                    Affected items: Test tubes (15 remaining), Beakers (8 remaining), Pipettes (12 remaining).
                </div>
                <div class="notification-actions">
                    <button class="action-btn btn-mark-read mark-read-btn">Mark as Read</button>
                    <button class="action-btn order-supplies-btn">Order Supplies</button>
                    <button class="action-btn btn-delete delete-btn">Delete</button>
                </div>
            </div>
            
            <!-- Notification 2 -->
            <div class="notification-item unread" data-notification-id="2">
                <div class="notification-header">
                    <div class="notification-title">
                        ⏰ New Experiment Request
                        <span class="notification-type type-approval">Approval</span>
                    </div>
                    <div class="notification-time">2 hours ago</div>
                </div>
                <div class="notification-content">
                    Dr. Smith submitted a new experiment request for Chemistry Lab #3.
                    Experiment: "Organic Synthesis Lab", Date: 2024-02-15, Time: 9:00 AM - 12:00 PM.
                </div>
                <div class="notification-actions">
                    <button class="action-btn btn-mark-read mark-read-btn">Mark as Read</button>
                    <button class="action-btn view-request-btn">View Request</button>
                    <button class="action-btn approve-request-btn">Approve</button>
                    <button class="action-btn btn-delete delete-btn">Delete</button>
                </div>
            </div>
            
            <!-- Notification 3 -->
            <div class="notification-item success" data-notification-id="3">
                <div class="notification-header">
                    <div class="notification-title">
                        ✅ Experiment Approved
                        <span class="notification-type type-approval">Approval</span>
                    </div>
                    <div class="notification-time">5 hours ago</div>
                </div>
                <div class="notification-content">
                    Your experiment request "Physics Lab #2 - Optics Experiment" has been approved.
                    Scheduled for: 2024-02-14, 2:00 PM - 4:00 PM. Lab Assistant assigned: John Wilson.
                </div>
                <div class="notification-actions">
                    <button class="action-btn view-schedule-btn">View Schedule</button>
                    <button class="action-btn btn-delete delete-btn">Delete</button>
                </div>
            </div>
            
            <!-- Notification 4 -->
            <div class="notification-item" data-notification-id="4">
                <div class="notification-header">
                    <div class="notification-title">
                        📅 Schedule Update
                        <span class="notification-type type-schedule">Schedule</span>
                    </div>
                    <div class="notification-time">Yesterday, 3:45 PM</div>
                </div>
                <div class="notification-content">
                    Biology Lab #3 maintenance has been rescheduled from Friday to Monday next week.
                    Please adjust your experiments accordingly. New maintenance window: 2024-02-12, 8:00 AM - 12:00 PM.
                </div>
                <div class="notification-actions">
                    <button class="action-btn view-updated-schedule-btn">View Updated Schedule</button>
                    <button class="action-btn btn-delete delete-btn">Delete</button>
                </div>
            </div>
            
            <!-- Notification 5 -->
            <div class="notification-item" data-notification-id="5">
                <div class="notification-header">
                    <div class="notification-title">
                        ⚙️ System Maintenance
                        <span class="notification-type type-system">System</span>
                    </div>
                    <div class="notification-time">2 days ago</div>
                </div>
                <div class="notification-content">
                    Scheduled system maintenance this weekend. The system will be unavailable from 
                    Saturday 10:00 PM to Sunday 2:00 AM. Please save your work before this time.
                </div>
                <div class="notification-actions">
                    <button class="action-btn btn-delete delete-btn">Delete</button>
                </div>
            </div>
        </div>
        
        <div class="empty-state" id="noNotifications" style="display: none;">
            <h3>No Notifications Found</h3>
            <p>You're all caught up! No notifications match your current filters.</p>
            <button class="btn" id="showAllBtn" style="margin-top: 1rem;">Show All Notifications</button>
        </div>
        
        <div class="pagination">
            <button class="btn" id="prevPageBtn" style="background: rgba(255, 255, 255, 0.1);">← Previous</button>
            <div>
                <span class="page-number active" data-page="1">1</span>
                <span class="page-number" data-page="2">2</span>
                <span class="page-number" data-page="3">3</span>
            </div>
            <button class="btn" id="nextPageBtn" style="background: rgba(255, 255, 255, 0.1);">Next →</button>
        </div>
    </div>
    
    <script>
        // ==================== 事件绑定 ====================
        document.addEventListener('DOMContentLoaded', function() {
            // 更新统计
            updateStats();
            
            // 绑定顶部按钮
            document.getElementById('markAllReadBtn').addEventListener('click', markAllAsRead);
            document.getElementById('clearAllBtn').addEventListener('click', clearAllNotifications);
            document.getElementById('applyFiltersBtn').addEventListener('click', applyFilters);
            document.getElementById('resetFiltersBtn').addEventListener('click', resetFilters);
            document.getElementById('showAllBtn').addEventListener('click', resetFilters);
            
            // 绑定分页按钮
            document.getElementById('prevPageBtn').addEventListener('click', () => changePage(-1));
            document.getElementById('nextPageBtn').addEventListener('click', () => changePage(1));
            
            // 绑定页码点击
            document.querySelectorAll('.page-number').forEach(page => {
                page.addEventListener('click', function() {
                    goToPage(parseInt(this.dataset.page));
                });
            });
            
            // 绑定通知操作按钮
            bindNotificationButtons();
            
            // 初始过滤
            applyFilters();
        });
        
        // ==================== 通知按钮绑定 ====================
        function bindNotificationButtons() {
            // Mark as Read 按钮
            document.querySelectorAll('.mark-read-btn').forEach(btn => {
                btn.addEventListener('click', function(e) {
                    e.stopPropagation();
                    const notification = this.closest('.notification-item');
                    const notificationId = notification.dataset.notificationId;
                    markSingleAsRead(notificationId, notification);
                });
            });
            
            // Delete 按钮
            document.querySelectorAll('.delete-btn').forEach(btn => {
                btn.addEventListener('click', function(e) {
                    e.stopPropagation();
                    const notification = this.closest('.notification-item');
                    const notificationId = notification.dataset.notificationId;
                    deleteSingleNotification(notificationId, notification);
                });
            });
            
            // 其他功能按钮
            document.querySelectorAll('.order-supplies-btn').forEach(btn => {
                btn.addEventListener('click', function() {
                    alert('Redirecting to supplies ordering page...');
                });
            });
            
            document.querySelectorAll('.view-request-btn').forEach(btn => {
                btn.addEventListener('click', function() {
                    alert('Opening request details...');
                });
            });
            
            document.querySelectorAll('.approve-request-btn').forEach(btn => {
                btn.addEventListener('click', function() {
                    if (confirm('Approve this experiment request?')) {
                        alert('Request approved successfully!');
                        const notification = this.closest('.notification-item');
                        notification.classList.remove('unread');
                        notification.classList.add('success');
                        this.closest('.notification-actions').innerHTML = `
                            <button class="action-btn view-schedule-btn">View Schedule</button>
                            <button class="action-btn btn-delete delete-btn">Delete</button>
                        `;
                        bindNotificationButtons(); // 重新绑定按钮
                        updateStats();
                    }
                });
            });
            
            document.querySelectorAll('.view-schedule-btn').forEach(btn => {
                btn.addEventListener('click', function() {
                    alert('Opening schedule...');
                });
            });
            
            document.querySelectorAll('.view-updated-schedule-btn').forEach(btn => {
                btn.addEventListener('click', function() {
                    alert('Opening updated schedule...');
                });
            });
        }
        
        // ==================== 核心功能函数 ====================
        function markSingleAsRead(notificationId, notificationElement) {
            notificationElement.classList.remove('unread');
            updateStats();
            
            // 发送API请求
            console.log(`Marking notification ${notificationId} as read`);
            // fetch(`/api/notifications/${notificationId}/read`, { method: 'POST' });
        }
        
        function markAllAsRead() {
            if (confirm('Mark all notifications as read?')) {
                document.querySelectorAll('.notification-item.unread').forEach(notification => {
                    notification.classList.remove('unread');
                });
                updateStats();
                
                // 发送API请求
                console.log('Marking all notifications as read');
                // fetch('/api/notifications/read-all', { method: 'POST' });
            }
        }
        
        function deleteSingleNotification(notificationId, notificationElement) {
            if (confirm('Delete this notification?')) {
                notificationElement.style.opacity = '0';
                notificationElement.style.transform = 'translateX(-20px)';
                
                setTimeout(() => {
                    notificationElement.remove();
                    updateStats();
                    checkEmptyState();
                }, 300);
                
                // 发送API请求
                console.log(`Deleting notification ${notificationId}`);
                // fetch(`/api/notifications/${notificationId}`, { method: 'DELETE' });
            }
        }
        
        function clearAllNotifications() {
            if (confirm('Clear all notifications? This action cannot be undone.')) {
                const notifications = document.querySelectorAll('.notification-item');
                notifications.forEach(notification => {
                    notification.style.opacity = '0';
                    notification.style.transform = 'translateX(-20px)';
                    setTimeout(() => {
                        notification.remove();
                    }, 300);
                });
                
                setTimeout(() => {
                    updateStats();
                    checkEmptyState();
                }, 500);
                
                // 发送API请求
                console.log('Clearing all notifications');
                // fetch('/api/notifications', { method: 'DELETE' });
            }
        }
        
        // ==================== 过滤功能 ====================
        function applyFilters() {
            const typeFilter = document.getElementById('typeFilter').value;
            const statusFilter = document.getElementById('statusFilter').value;
            const priorityFilter = document.getElementById('priorityFilter').value;
            
            const notifications = document.querySelectorAll('.notification-item');
            let visibleCount = 0;
            
            notifications.forEach(notification => {
                const typeElement = notification.querySelector('.notification-type');
                const type = typeElement ? typeElement.textContent.toLowerCase() : '';
                const isUnread = notification.classList.contains('unread');
                const isUrgent = notification.classList.contains('urgent');
                
                let show = true;
                
                // 类型过滤
                if (typeFilter !== 'all') {
                    const typeMap = {
                        'approval': 'approval',
                        'stock': 'stock',
                        'schedule': 'schedule',
                        'system': 'system'
                    };
                    if (type !== typeMap[typeFilter]) {
                        show = false;
                    }
                }
                
                // 状态过滤
                if (statusFilter !== 'all') {
                    if (statusFilter === 'unread' && !isUnread) {
                        show = false;
                    }
                    if (statusFilter === 'read' && isUnread) {
                        show = false;
                    }
                }
                
                // 优先级过滤
                if (priorityFilter !== 'all') {
                    if (priorityFilter === 'high' && !isUrgent) {
                        show = false;
                    }
                    // 实际应用中应该有更完善的优先级系统
                }
                
                if (show) {
                    notification.style.display = '';
                    visibleCount++;
                } else {
                    notification.style.display = 'none';
                }
            });
            
            checkEmptyState();
        }
        
        function resetFilters() {
            document.getElementById('typeFilter').value = 'all';
            document.getElementById('statusFilter').value = 'all';
            document.getElementById('priorityFilter').value = 'all';
            applyFilters();
        }
        
        function checkEmptyState() {
            const visibleNotifications = document.querySelectorAll('.notification-item[style=""]');
            const noNotifications = document.getElementById('noNotifications');
            
            if (visibleNotifications.length === 0) {
                noNotifications.style.display = 'block';
            } else {
                noNotifications.style.display = 'none';
            }
        }
        
        // ==================== 统计功能 ====================
        function updateStats() {
            const totalNotifications = document.querySelectorAll('.notification-item').length;
            const unreadNotifications = document.querySelectorAll('.notification-item.unread').length;
            const todayNotifications = 3; // 演示数据
            const urgentNotifications = document.querySelectorAll('.notification-item.urgent').length;
            
            document.getElementById('totalCount').textContent = totalNotifications;
            document.getElementById('unreadCount').textContent = unreadNotifications;
            document.getElementById('todayCount').textContent = todayNotifications;
            document.getElementById('urgentCount').textContent = urgentNotifications;
        }
        
        // ==================== 分页功能 ====================
        function changePage(direction) {
            const activePage = document.querySelector('.page-number.active');
            const currentPage = parseInt(activePage.dataset.page);
            const totalPages = 3; // 演示数据
            
            let newPage = currentPage + direction;
            if (newPage < 1) newPage = 1;
            if (newPage > totalPages) newPage = totalPages;
            
            if (newPage !== currentPage) {
                goToPage(newPage);
            }
        }
        
        function goToPage(pageNumber) {
            // 更新活动页码
            document.querySelectorAll('.page-number').forEach(page => {
                page.classList.remove('active');
                if (parseInt(page.dataset.page) === pageNumber) {
                    page.classList.add('active');
                }
            });
            
            // 实际应用中这里应该从服务器加载数据
            // 现在只是显示一个消息
            console.log(`Loading page ${pageNumber}`);
        }
        
        // ==================== 模拟新通知 ====================
        function simulateNewNotification() {
            const notificationsList = document.getElementById('notificationsList');
            const newId = Date.now();
            
            const newNotification = document.createElement('div');
            newNotification.className = 'notification-item unread';
            newNotification.dataset.notificationId = newId;
            newNotification.innerHTML = `
                <div class="notification-header">
                    <div class="notification-title">
                        🔔 New Message
                        <span class="notification-type type-system">System</span>
                    </div>
                    <div class="notification-time">Just now</div>
                </div>
                <div class="notification-content">
                    Welcome to the notification center! This is a demo notification.
                </div>
                <div class="notification-actions">
                    <button class="action-btn btn-mark-read mark-read-btn">Mark as Read</button>
                    <button class="action-btn btn-delete delete-btn">Delete</button>
                </div>
            `;
            
            notificationsList.prepend(newNotification);
            bindNotificationButtons();
            updateStats();
            
            // 显示通知
            newNotification.style.animation = 'slideIn 0.3s ease-out';
        }
        
        // 添加CSS动画
        const style = document.createElement('style');
        style.textContent = `
            @keyframes slideIn {
                from {
                    opacity: 0;
                    transform: translateY(-20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
        `;
        document.head.appendChild(style);
        
        // 每30秒模拟一个新通知（可选）
        // setInterval(simulateNewNotification, 30000);
        
        // 也可以手动触发：在控制台输入 simulateNewNotification()
        window.simulateNewNotification = simulateNewNotification;
    </script>
</body>
</html>