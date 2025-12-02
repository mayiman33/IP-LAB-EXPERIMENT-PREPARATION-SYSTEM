<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title} - Lab System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #0F1A27;
            color: white;
        }
        .container {
            padding: 2rem;
        }
        .header {
            margin-bottom: 2rem;
        }
        .header h1 {
            color: #8AA9FF;
            margin-bottom: 0.5rem;
        }
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
        }
        .card {
            background: rgba(255, 255, 255, 0.1);
            padding: 1.5rem;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        .card h3 {
            color: #8AA9FF;
            margin-top: 0;
        }
        .btn {
            display: inline-block;
            padding: 0.5rem 1rem;
            background: #8AA9FF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 1rem;
        }
        .nav {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        .nav a {
            color: #97A2B7;
            text-decoration: none;
        }
        .nav a.active {
            color: white;
            border-bottom: 2px solid #8AA9FF;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav">
            <a href="${pageContext.request.contextPath}/reports" class="active">Report Center</a>
            <a href="${pageContext.request.contextPath}/reports/generate">Generate Report</a>
            <a href="${pageContext.request.contextPath}/reports/list">Report List</a>
            <a href="${pageContext.request.contextPath}/">Dashboard</a>
        </div>
        
        <div class="header">
            <h1>${title}</h1>
            <p>${module}</p>
        </div>
        
        <div class="cards">
            <div class="card">
                <h3>📋 Experiment Reports</h3>
                <p>Generate detailed reports of laboratory experiments including scheduling, usage, and results.</p>
                <a href="${pageContext.request.contextPath}/reports/generate?type=experiment" class="btn">Generate</a>
            </div>
            
            <div class="card">
                <h3>