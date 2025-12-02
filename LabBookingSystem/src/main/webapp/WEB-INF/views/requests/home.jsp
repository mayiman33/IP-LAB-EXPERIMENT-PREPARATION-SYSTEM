<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Lab System</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Inter', sans-serif;
            background: #0F1A27;
            color: white;
        }
        .nav {
            display: flex;
            padding: 25px 50px;
            font-size: 20px;
            gap: 40px;
            background: rgba(255, 255, 255, 0.05);
        }
        .nav a {
            text-decoration: none;
            color: #97A2B7;
            font-weight: 300;
        }
        .nav a.active {
            color: white;
            border-bottom: 2px solid #8AA9FF;
            padding-bottom: 5px;
        }
        .container {
            padding: 40px 60px;
        }
        .welcome {
            font-size: 32px;
            margin-bottom: 30px;
            color: #8AA9FF;
        }
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }
        .card {
            background: rgba(255, 255, 255, 0.1);
            padding: 25px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.15);
        }
        .card h3 {
            margin-top: 0;
            color: #8AA9FF;
        }
        .quick-actions {
            margin-top: 40px;
        }
        .action-btn {
            padding: 12px 25px;
            background: #8AA9FF;
            color: white;
            border: none;
            border-radius: 25px;
            margin-right: 15px;
            cursor: pointer;
            font-weight: 600;
            transition: opacity 0.3s;
        }
        .action-btn:hover {
            opacity: 0.9;
        }
        .system-nav {
            margin: 10px 60px 0;
            padding: 10px 0;
        }
        .system-nav a {
            color: #8AA9FF;
            text-decoration: none;
            margin-right: 20px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <div class="nav">
        <a href="${pageContext.request.contextPath}/requests/home" class="active">Home</a>
        <a href="${pageContext.request.contextPath}/requests">Requests</a>
        <a href="${pageContext.request.contextPath}/requests/history">History</a>
        <div style="flex-grow: 1;"></div>
        <a href="${pageContext.request.contextPath}/reports">Reports</a>
        <a href="${pageContext.request.contextPath}/notifications">Notifications</a>
        <a href="${pageContext.request.contextPath}/">Dashboard</a>
    </div>
    
    <!-- System Navigation -->
    <div class="system-nav">
        <a href="${pageContext.request.contextPath}/">Dashboard</a> &gt; 
        <a href="${pageContext.request.contextPath}/requests">Experiment Requests</a> &gt; 
        <span style="color: white;">Home</span>
    </div>
    
    <div class="container">
        <div class="welcome">Welcome to Laboratory Management System</div>
        
        <div class="dashboard-cards">
            <div class="card">
                <h3>📊 Today's Statistics</h3>
                <p>Pending Requests: <strong>5</strong></p>
                <p>Approved Requests: <strong>12</strong></p>
                <p>Today's Experiments: <strong>3</strong></p>
            </div>
            
            <div class="card">
                <h3>🔔 Recent Notifications</h3>
                <p>• 2 new experiment requests need approval</p>
                <p>• Chemistry lab equipment maintenance reminder</p>
                <p>• Next week's lab schedule has been updated</p>
            </div>
            
            <div class="card">
                <h3>📅 Upcoming Experiments</h3>
                <p>• Chemistry Experiment - Tomorrow 9:00 AM</p>
                <p>• Physics Experiment - Day after tomorrow 2:00 PM</p>
                <p>• Biology Experiment - This Friday 10:00 AM</p>
            </div>
        </div>
        
        <div class="quick-actions">
            <h3>Quick Actions</h3>
            <button class="action-btn" onclick="location.href='${pageContext.request.contextPath}/requests/new'">
                New Experiment Request
            </button>
            <button class="action-btn" onclick="location.href='${pageContext.request.contextPath}/reports/generate'">
                Generate Report
            </button>
            <button class="action-btn" onclick="location.href='${pageContext.request.contextPath}/notifications'">
                View Notifications
            </button>
        </div>
    </div>
</body>
</html>