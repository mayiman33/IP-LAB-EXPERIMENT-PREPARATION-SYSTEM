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
            text-decoration: none;
            color: white;
            transition: all 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            border-color: #8AA9FF;
        }
        .card h3 {
            color: #8AA9FF;
            margin-top: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
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
        }
        .nav a.active {
            color: white;
            background: rgba(138, 169, 255, 0.2);
            border-bottom: 2px solid #8AA9FF;
        }
        .stats {
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
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav">
            <a href="${pageContext.request.contextPath}/" class="">Home</a>
            <a href="${pageContext.request.contextPath}/inventory" class="active">Inventory</a>
            <a href="${pageContext.request.contextPath}/inventory/items">Items</a>
            <a href="${pageContext.request.contextPath}/experience">Experience</a>
            <a href="${pageContext.request.contextPath}/reports">Reports</a>
        </div>
        
        <div class="header">
            <h1>${title}</h1>
            <p>${module}</p>
        </div>
        
        <div class="stats">
            <div class="stat">
                <h3>15</h3>
                <p>Total Items</p>
            </div>
            <div class="stat">
                <h3>3</h3>
                <p>Low Stock</p>
            </div>
            <div class="stat">
                <h3>6</h3>
                <p>Categories</p>
            </div>
            <div class="stat">
                <h3>4</h3>
                <p>Storage Locations</p>
            </div>
        </div>
        
        <div class="cards">
            <a href="${pageContext.request.contextPath}/inventory/items" class="card">
                <h3>📦 All Items</h3>
                <p>View and manage all inventory items</p>
            </a>
            
            <a href="${pageContext.request.contextPath}/inventory/add" class="card">
                <h3>➕ Add New Item</h3>
                <p>Add new items to inventory</p>
            </a>
            
            
        </div>
    </div>
</body>
</html>