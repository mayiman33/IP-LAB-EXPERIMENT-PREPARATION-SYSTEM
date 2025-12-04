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
            max-width: 1200px;
            margin: 0 auto;
        }
        .header {
            margin-bottom: 2rem;
        }
        .header h1 {
            color: #8AA9FF;
            margin-bottom: 0.5rem;
            font-size: 2rem;
        }
        .header p {
            color: #A8B5C8;
            font-size: 1.1rem;
        }
        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }
        .card {
            background: rgba(255, 255, 255, 0.1);
            padding: 1.5rem;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            text-decoration: none;
            color: white;
            transition: all 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            border-color: #8AA9FF;
            background: rgba(255, 255, 255, 0.15);
        }
        .card h3 {
            color: #8AA9FF;
            margin-top: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .card p {
            color: #A8B5C8;
            line-height: 1.5;
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
            padding: 0.5rem 1rem;
            border-radius: 5px;
            transition: all 0.3s;
        }
        .nav a:hover {
            background: rgba(255, 255, 255, 0.1);
        }
        .nav a.active {
            color: white;
            background: rgba(138, 169, 255, 0.2);
            border-bottom: 2px solid #8AA9FF;
        }
        .quick-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 1rem;
            margin-bottom: 2rem;
        }
        .stat {
            background: rgba(255, 255, 255, 0.08);
            padding: 1rem;
            border-radius: 8px;
            text-align: center;
        }
        .stat h3 {
            color: #8AA9FF;
            font-size: 1.5rem;
            margin: 0;
        }
        .stat p {
            color: #A8B5C8;
            margin: 0.5rem 0 0 0;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav">
            <a href="${pageContext.request.contextPath}/experience" class="active">Experience Center</a>
            <a href="${pageContext.request.contextPath}/experience/preparation">Preparation</a>
            <a href="${pageContext.request.contextPath}/reports">Reports</a>
            <a href="${pageContext.request.contextPath}/">Dashboard</a>
        </div>
        
        <div class="header">
            <h1>${title}</h1>
            <p>${module}</p>
        </div>
        
        <div class="quick-stats">
            <div class="stat">
                <h3>5</h3>
                <p>Active Preparations</p>
            </div>
            <div class="stat">
                <h3>12</h3>
                <p>Total Experiments</p>
            </div>
            <div class="stat">
                <h3>3</h3>
                <p>Labs Available</p>
            </div>
            <div class="stat">
                <h3>2</h3>
                <p>Pending Reviews</p>
            </div>
        </div>
        
        <div class="cards">
            <a href="${pageContext.request.contextPath}/experience/preparation" class="card">
                <h3>📋 Preparation</h3>
                <p>Create and manage experiment preparations including equipment setup, materials, and safety checks.</p>
            </a>
            
            <a href="${pageContext.request.contextPath}/experience/preparation/new" class="card">
                <h3>➕ New Preparation</h3>
                <p>Start a new experiment preparation with step-by-step guidance.</p>
            </a>
            
            
        </div>
    </div>
</body>
</html>