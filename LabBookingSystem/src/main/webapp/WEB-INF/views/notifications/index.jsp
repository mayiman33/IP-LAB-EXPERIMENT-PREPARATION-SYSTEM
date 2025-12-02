<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title} - Lab System</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            padding: 20px;
            background: #0F1A27;
            color: white;
        }
        .notification { 
            border: 1px solid #ffc107; 
            padding: 20px; 
            margin: 15px 0; 
            border-radius: 10px;
            background-color: rgba(255, 243, 205, 0.1);
            border: 1px solid rgba(255, 193, 7, 0.3);
        }
        .btn { 
            padding: 10px 20px; 
            background-color: #17a2b8; 
            color: white; 
            text-decoration: none; 
            border-radius: 5px; 
            margin: 5px;
            display: inline-block;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }
        .btn:hover {
            background-color: #138496;
        }
        h1 {
            color: #8AA9FF;
            margin-bottom: 10px;
        }
        .nav {
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        .nav a {
            color: #97A2B7;
            text-decoration: none;
            margin-right: 20px;
            padding: 5px 10px;
        }
        .nav a.active {
            color: white;
            border-bottom: 2px solid #8AA9FF;
        }
        ul {
            color: #A8B5C8;
        }
        li {
            margin: 8px 0;
        }
        .back-link {
            margin-top: 30px;
            display: block;
            color: #8AA9FF;
        }
    </style>
</head>
<body>
    <div class="nav">
        <a href="${pageContext.request.contextPath}/notifications" class="active">Notification Center</a>
        <a href="${pageContext.request.contextPath}/notifications/list">Notification List</a>
        <a href="${pageContext.request.contextPath}/notifications/settings">Settings</a>
        <a href="${pageContext.request.contextPath}/">Dashboard</a>
    </div>
    
    <h1>${title}</h1>
    <p>${module}</p>
    
    <div class="notification">
        <h3>🔔 System Notifications</h3>
        <p>This is the Notification & Alert System demonstration page.</p>
        <p>Features include:</p>
        <ul>
            <li>Experiment approval notifications</li>
            <li>Low inventory alerts</li>
            <li>Schedule update reminders</li>
            <li>System message push notifications</li>
        </ul>
    </div>
    
    <div>
        <a href="${pageContext.request.contextPath}/notifications/list" class="btn">View Notification List</a>
        <a href="${pageContext.request.contextPath}/notifications/settings" class="btn">Notification Settings</a>
        <a href="${pageContext.request.contextPath}/reports" class="btn" style="background-color: #8AA9FF;">Go to Reports</a>
    </div>
    
    <a href="${pageContext.request.contextPath}/" class="back-link">← Back to Dashboard</a>
</body>
</html>