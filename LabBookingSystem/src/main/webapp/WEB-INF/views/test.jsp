<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Test Page - Lab System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background: #f5f5f5;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #4CAF50;
        }
        .status {
            padding: 20px;
            background: #e8f5e9;
            border-radius: 5px;
            margin: 20px 0;
        }
        .links a {
            display: block;
            padding: 10px;
            margin: 5px 0;
            background: #2196F3;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>${message}</h1>
        
        <div class="status">
            <p><strong>System Status:</strong> ✅ Running</p>
            <p><strong>Server Time:</strong> <%= new java.util.Date() %></p>
            <p><strong>Java Version:</strong> <%= System.getProperty("java.version") %></p>
        </div>
        
        <div class="links">
            <h3>Test Links:</h3>
            <a href="${pageContext.request.contextPath}/">Home Page</a>
            <a href="${pageContext.request.contextPath}/requests">Requests Module</a>
            <a href="${pageContext.request.contextPath}/reports">Reports Module</a>
            <a href="${pageContext.request.contextPath}/notifications">Notifications Module</a>
        </div>
    </div>
</body>
</html>