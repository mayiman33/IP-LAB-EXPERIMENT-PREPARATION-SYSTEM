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
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.05);
            padding: 30px;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        h1 {
            color: #8AA9FF;
            margin-bottom: 10px;
        }
        .subtitle {
            color: #A8B5C8;
            margin-bottom: 30px;
        }
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .card {
            background: rgba(255, 255, 255, 0.05);
            padding: 25px;
            border-radius: 10px;
            text-decoration: none;
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s;
        }
        .card:hover {
            background: rgba(255, 255, 255, 0.1);
            border-color: #8AA9FF;
            transform: translateY(-2px);
        }
        .card h3 {
            color: #8AA9FF;
            margin-top: 0;
        }
        .card p {
            color: #A8B5C8;
            font-size: 14px;
        }
        .nav {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        .nav a {
            color: #97A2B7;
            text-decoration: none;
            padding: 5px 10px;
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
        
        <h1>${title}</h1>
        <p class="subtitle">${module}</p>
        
        <div class="card-container">
            <a href="${pageContext.request.contextPath}/reports/generate" class="card">
                <h3>📊 Generate Report</h3>
                <p>Create new reports with custom parameters and export formats</p>
            </a>
            
            <a href="${pageContext.request.contextPath}/reports/list" class="card">
                <h3>📋 Report List</h3>
                <p>View and manage previously generated reports</p>
            </a>
        </div>
    </div>
</body>
</html>