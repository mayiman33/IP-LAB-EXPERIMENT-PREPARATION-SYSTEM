<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>${message} - Lab System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #0F1A27;
            color: white;
            min-height: 100vh;
        }
        
        /* 导航栏 */
        .navbar {
            background: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: #8AA9FF;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .nav-links {
            display: flex;
            gap: 1rem;
            align-items: center;
        }
        
        .nav-link {
            color: #97A2B7;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            transition: all 0.3s;
        }
        
        .nav-link:hover {
            color: white;
            background: rgba(138, 169, 255, 0.1);
        }
        
        .nav-link.active {
            color: white;
            background: rgba(138, 169, 255, 0.2);
            border-bottom: 2px solid #8AA9FF;
        }
        
        /* 主要内容 */
        .main-content {
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        /* 欢迎区域 */
        .welcome-section {
            text-align: center;
            margin-bottom: 2rem;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .welcome-title {
            color: #8AA9FF;
            margin-bottom: 0.5rem;
            font-size: 2rem;
        }
        
        .welcome-subtitle {
            color: #A8B5C8;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.5;
        }
        
        /* 统计卡片 */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }
        
        .stat-card {
            background: rgba(255, 255, 255, 0.08);
            padding: 1.2rem;
            border-radius: 10px;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .stat-value {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 0.3rem;
        }
        
        .stat-label {
            color: #A8B5C8;
            font-size: 0.9rem;
        }
        
        /* 模块网格 */
        .modules-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .module-card {
            background: rgba(255, 255, 255, 0.05);
            padding: 1.5rem;
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s;
        }
        
        .module-card:hover {
            transform: translateY(-3px);
            border-color: rgba(138, 169, 255, 0.3);
            background: rgba(255, 255, 255, 0.08);
        }
        
        .module-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }
        
        .module-title {
            color: #8AA9FF;
            margin: 0 0 0.8rem 0;
            font-size: 1.2rem;
        }
        
        .module-description {
            color: #A8B5C8;
            line-height: 1.5;
            margin-bottom: 1.2rem;
            font-size: 0.95rem;
        }
        
        .module-features {
            list-style: none;
            padding: 0;
            margin: 0 0 1.2rem 0;
        }
        
        .module-features li {
            color: #97A2B7;
            padding: 0.3rem 0;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .module-features li:before {
            content: "✓";
            color: #4CAF50;
        }
        
        .module-actions {
            display: flex;
            gap: 0.8rem;
        }
        
        .btn {
            padding: 0.6rem 1.2rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            font-size: 0.9rem;
            transition: all 0.3s;
            border: none;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-primary {
            background: #8AA9FF;
            color: white;
            flex: 1;
        }
        
        .btn-primary:hover {
            background: #6c8eff;
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.2);
        }
        
        /* 特殊卡片样式 */
        .inventory-card .module-title {
            color: #4CAF50;
        }
        
        .inventory-card:hover {
            border-color: rgba(76, 175, 80, 0.3);
        }
        
        .experience-card .module-title {
            color: #ffc107;
        }
        
        .experience-card:hover {
            border-color: rgba(255, 193, 7, 0.3);
        }
        
        /* 底部 */
        .footer {
            margin-top: 3rem;
            padding: 1.5rem;
            text-align: center;
            color: #97A2B7;
            font-size: 0.85rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        /* 最近活动 */
        .recent-activity {
            margin-top: 2rem;
        }
        
        .recent-activity h3 {
            color: #8AA9FF;
            margin-bottom: 1rem;
        }
        
        .activity-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1rem;
        }
        
        .activity-item {
            background: rgba(255, 255, 255, 0.05);
            padding: 1rem;
            border-radius: 8px;
            border-left: 3px solid #8AA9FF;
        }
        
        .activity-item h4 {
            color: white;
            margin: 0 0 0.5rem 0;
            font-size: 0.95rem;
        }
        
        .activity-item p {
            color: #A8B5C8;
            margin: 0;
            font-size: 0.85rem;
        }
    </style>
</head>
<body>
    <!-- 导航栏 -->
    <nav class="navbar">
        <div class="logo">
            <span>⚗️</span>
            <span>${message}</span>
        </div>
        
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/" class="nav-link active">Home</a>
            <a href="${pageContext.request.contextPath}/requests" class="nav-link">Requests</a>
            <a href="${pageContext.request.contextPath}/experience" class="nav-link">Experience</a>
            <a href="${pageContext.request.contextPath}/inventory" class="nav-link">Inventory</a>
            <a href="${pageContext.request.contextPath}/reports" class="nav-link">Reports</a>
            <a href="${pageContext.request.contextPath}/notifications" class="nav-link">Notifications</a>
        </div>
    </nav>

    <!-- 主要内容 -->
    <main class="main-content">
        <!-- 欢迎区域 -->
        <section class="welcome-section">
            <h1 class="welcome-title">${systemName}</h1>
            <p class="welcome-subtitle">
                Laboratory Management System for experiment requests, preparations, and inventory management.
            </p>
        </section>

        <!-- 统计卡片 -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-value" style="color: #8AA9FF;">12</div>
                <div class="stat-label">Active Requests</div>
            </div>
            <div class="stat-card">
                <div class="stat-value" style="color: #ffc107;">5</div>
                <div class="stat-label">Experience Preps</div>
            </div>
            <div class="stat-card">
                <div class="stat-value" style="color: #4CAF50;">15</div>
                <div class="stat-label">Inventory Items</div>
            </div>
            <div class="stat-card">
                <div class="stat-value" style="color: #ff6b6b;">8</div>
                <div class="stat-label">Notifications</div>
            </div>
        </div>

        <!-- 模块网格 -->
        <section class="modules-grid">
            <!-- 请求管理 -->
            <div class="module-card">
                <div class="module-icon">📋</div>
                <h3 class="module-title">Request Management</h3>
                <p class="module-description">Submit and track experiment requests with approval workflow.</p>
                <ul class="module-features">
                    <li>Online submission</li>
                    <li>Status tracking</li>
                    <li>Approval workflow</li>
                </ul>
                <div class="module-actions">
                    <a href="${pageContext.request.contextPath}/requests" class="btn btn-primary">
                        <span>Go to System</span>
                    </a>
                </div>
            </div>

            <!-- 实验准备 -->
            <div class="module-card experience-card">
                <div class="module-icon">🔬</div>
                <h3 class="module-title">Experience Preparation</h3>
                <p class="module-description">Manage experiment setups, materials, and safety checks.</p>
                <ul class="module-features">
                    <li>Setup guides</li>
                    <li>Materials management</li>
                    <li>Safety checks</li>
                </ul>
                <div class="module-actions">
                    <a href="${pageContext.request.contextPath}/experience" class="btn btn-primary">
                        <span>Experience Center</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/experience/preparation/new" class="btn btn-secondary">
                        <span>New</span>
                    </a>
                </div>
            </div>

            <!-- 库存管理 -->
            <div class="module-card inventory-card">
                <div class="module-icon">📦</div>
                <h3 class="module-title">Inventory Management</h3>
                <p class="module-description">Track and manage laboratory supplies and equipment.</p>
                <ul class="module-features">
                    <li>Item tracking</li>
                    <li>Stock alerts</li>
                    <li>Category management</li>
                </ul>
                <div class="module-actions">
                    <a href="${pageContext.request.contextPath}/inventory" class="btn btn-primary">
                        <span>Inventory Center</span>
                    </a>
                    <a href="${pageContext.request.contextPath}/inventory/add" class="btn btn-secondary">
                        <span>Add Item</span>
                    </a>
                </div>
            </div>

            <!-- 报告系统 -->
            <div class="module-card">
                <div class="module-icon">📊</div>
                <h3 class="module-title">Reporting System</h3>
                <p class="module-description">Generate reports and summaries for record keeping.</p>
                <ul class="module-features">
                    <li>PDF generation</li>
                    <li>Data statistics</li>
                    <li>Export options</li>
                </ul>
                <div class="module-actions">
                    <a href="${pageContext.request.contextPath}/reports" class="btn btn-primary">
                        <span>Report Center</span>
                    </a>
                </div>
            </div>

            <!-- 通知系统 -->
            <div class="module-card">
                <div class="module-icon">🔔</div>
                <h3 class="module-title">Notification System</h3>
                <p class="module-description">Get alerts for approvals, low stock, and updates.</p>
                <ul class="module-features">
                    <li>Approval alerts</li>
                    <li>Stock warnings</li>
                    <li>System notifications</li>
                </ul>
                <div class="module-actions">
                    <a href="${pageContext.request.contextPath}/notifications" class="btn btn-primary">
                        <span>Notifications</span>
                    </a>
                </div>
            </div>

           
        </section>

        <!-- 最近活动 -->
        <section class="recent-activity">
            <h3>Recent Activity</h3>
            <div class="activity-grid">
                <div class="activity-item">
                    <h4>New Experiment Request</h4>
                    <p>Dr. Smith submitted Chemistry experiment - Pending approval</p>
                </div>
                <div class="activity-item" style="border-left-color: #ffc107;">
                    <h4>Experience Prep Started</h4>
                    <p>Chemical Reaction experiment preparation in progress</p>
                </div>
                <div class="activity-item" style="border-left-color: #4CAF50;">
                    <h4>Inventory Update</h4>
                    <p>Beakers stock updated - 20 pieces available</p>
                </div>
                <div class="activity-item" style="border-left-color: #ff6b6b;">
                    <h4>Report Generated</h4>
                    <p>Weekly summary report created - PDF format</p>
                </div>
            </div>
        </section>
    </main>

    <!-- 底部 -->
    <footer class="footer">
        <p>© 2024 Laboratory Booking System | ${systemName}</p>
        <p>Version: 2.0.0 | Spring Boot + JSP</p>
    </footer>

    <script>
        // 卡片点击效果
        document.querySelectorAll('.module-card').forEach(card => {
            card.addEventListener('click', function(e) {
                if (!e.target.closest('a') && !e.target.closest('button')) {
                    const link = this.querySelector('.btn-primary');
                    if (link) {
                        window.location.href = link.href;
                    }
                }
            });
        });

        // 简单的时间显示
        const timeElement = document.createElement('div');
        timeElement.style.cssText = 'text-align: center; color: #97A2B7; font-size: 0.9rem; margin-top: 1rem;';
        document.querySelector('.footer').appendChild(timeElement);
        
        function updateTime() {
            const now = new Date();
            const options = { 
                year: 'numeric', 
                month: 'long', 
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit'
            };
            timeElement.textContent = now.toLocaleDateString('en-US', options);
        }
        
        updateTime();
        setInterval(updateTime, 60000); // 每分钟更新一次
    </script>
</body>
</html>