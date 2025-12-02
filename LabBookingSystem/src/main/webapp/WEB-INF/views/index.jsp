<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>${message} - Laboratory Booking System</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #0F1A27 0%, #1a2b3c 100%);
            color: #fff;
            min-height: 100vh;
        }
        
        /* Navigation Bar */
        .navbar {
            background: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: #8AA9FF;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .nav-links {
            display: flex;
            gap: 2rem;
            align-items: center;
        }
        
        .nav-link {
            color: #97A2B7;
            text-decoration: none;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            transition: all 0.3s ease;
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
        
        /* Main Content */
        .main-content {
            padding: 2rem;
            max-width: 1400px;
            margin: 0 auto;
        }
        
        .welcome-section {
            text-align: center;
            margin-bottom: 3rem;
            padding: 3rem 2rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 20px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .welcome-title {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            background: linear-gradient(45deg, #8AA9FF, #4CAF50);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .welcome-subtitle {
            font-size: 1.2rem;
            color: #A8B5C8;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.6;
        }
        
        /* Modules Grid */
        .modules-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }
        
        .module-card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            padding: 2rem;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        
        .module-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            border-color: rgba(138, 169, 255, 0.3);
        }
        
        .module-icon {
            font-size: 3rem;
            margin-bottom: 1.5rem;
        }
        
        .module-title {
            font-size: 1.5rem;
            margin-bottom: 1rem;
            color: #8AA9FF;
        }
        
        .module-description {
            color: #A8B5C8;
            line-height: 1.6;
            margin-bottom: 1.5rem;
            flex-grow: 1;
        }
        
        .module-features {
            list-style: none;
            padding: 0;
            margin-bottom: 1.5rem;
        }
        
        .module-features li {
            padding: 0.5rem 0;
            color: #97A2B7;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .module-features li:before {
            content: "✓";
            color: #4CAF50;
            font-weight: bold;
        }
        
        .module-actions {
            display: flex;
            gap: 1rem;
            margin-top: auto;
        }
        
        .btn {
            padding: 0.8rem 1.5rem;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        
        .btn-primary {
            background: linear-gradient(45deg, #8AA9FF, #6c8eff);
            color: white;
            flex: 1;
        }
        
        .btn-primary:hover {
            background: linear-gradient(45deg, #6c8eff, #8AA9FF);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(108, 142, 255, 0.4);
        }
        
        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        /* Footer */
        .footer {
            margin-top: 4rem;
            padding: 2rem;
            text-align: center;
            color: #97A2B7;
            font-size: 0.9rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar">
        <div class="logo">
            <span>⚗️</span>
            <span>${message}</span>
        </div>
        
        <div class="nav-links">
            <a href="${pageContext.request.contextPath}/" class="nav-link active">Home</a>
            <a href="${pageContext.request.contextPath}/requests" class="nav-link">Requests</a>
            <a href="${pageContext.request.contextPath}/reports" class="nav-link">Reports</a>
            <a href="${pageContext.request.contextPath}/notifications" class="nav-link">Notifications</a>
            <a href="${pageContext.request.contextPath}/test" class="nav-link">Test</a>
        </div>
    </nav>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Welcome Section -->
        <section class="welcome-section">
            <h1 class="welcome-title">${systemName}</h1>
            <p class="welcome-subtitle">
                Laboratory Experiment Preparation and Booking System designed to streamline communication 
                and coordination between teachers and lab assistants.
            </p>
        </section>

        <!-- Modules Grid -->
        <section class="modules-grid">
            <!-- Request Module -->
            <div class="module-card">
                <div class="module-icon">📋</div>
                <h3 class="module-title">Experiment Request Management</h3>
                <p class="module-description">
                    Submit, approve and track laboratory experiment requests with seamless collaboration.
                </p>
                <ul class="module-features">
                    <li>Online request submission</li>
                    <li>Real-time status tracking</li>
                    <li>Automated approval workflow</li>
                    <li>Historical records</li>
                </ul>
                <div class="module-actions">
                    <a href="${pageContext.request.contextPath}/requests" class="btn btn-primary">
                        <span>Go to System</span>
                        <span>→</span>
                    </a>
                </div>
            </div>

            <!-- Report Module -->
            <div class="module-card">
                <div class="module-icon">📊</div>
                <h3 class="module-title">Reporting & Summary Module</h3>
                <p class="module-description">
                    Generate printable summaries and logs of experiment requests for record keeping.
                </p>
                <ul class="module-features">
                    <li>PDF report generation</li>
                    <li>Experiment data statistics</li>
                    <li>Inventory reports</li>
                    <li>Schedule reports</li>
                </ul>
                <div class="module-actions">
                    <a href="${pageContext.request.contextPath}/reports" class="btn btn-primary">
                        <span>Report Center</span>
                        <span>→</span>
                    </a>
                </div>
            </div>

            <!-- Notification Module -->
            <div class="module-card">
                <div class="module-icon">🔔</div>
                <h3 class="module-title">Notification & Alert System</h3>
                <p class="module-description">
                    Send notifications or alerts for approvals, low stock, and schedule updates.
                </p>
                <ul class="module-features">
                    <li>Approval status notifications</li>
                    <li>Low stock alerts</li>
                    <li>Schedule update notifications</li>
                    <li>Email/system notifications</li>
                </ul>
                <div class="module-actions">
                    <a href="${pageContext.request.contextPath}/notifications" class="btn btn-primary">
                        <span>Notification Center</span>
                        <span>→</span>
                    </a>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="footer">
        <p>© 2024 Laboratory Booking System | ${systemName} | Spring Boot + JSP</p>
        <p>Technical Support: Lab System Development Team | Version: 1.0.0</p>
    </footer>
</body>
</html>