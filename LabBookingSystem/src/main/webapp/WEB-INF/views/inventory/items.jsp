<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }
        .header h1 {
            color: #8AA9FF;
            margin: 0;
        }
        .btn {
            padding: 0.5rem 1.5rem;
            background: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            overflow: hidden;
        }
        th {
            background: rgba(255, 255, 255, 0.1);
            padding: 1rem;
            text-align: left;
            color: #8AA9FF;
        }
        td {
            padding: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        .status {
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.85rem;
            font-weight: 500;
        }
        .status-low { background: rgba(255, 107, 107, 0.2); color: #ff6b6b; }
        .status-normal { background: rgba(255, 193, 7, 0.2); color: #ffc107; }
        .status-sufficient { background: rgba(81, 207, 102, 0.2); color: #51cf66; }
        .action-link {
            color: #8AA9FF;
            text-decoration: none;
            margin-right: 1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav">
            <a href="${pageContext.request.contextPath}/">Home</a>
            <a href="${pageContext.request.contextPath}/inventory">Inventory</a>
            <a href="${pageContext.request.contextPath}/inventory/items" class="active">Items</a>
            <a href="${pageContext.request.contextPath}/experience">Experience</a>
            <a href="${pageContext.request.contextPath}/reports">Reports</a>
        </div>
        
        <div class="header">
            <h1>${title}</h1>
            <a href="${pageContext.request.contextPath}/inventory/add" class="btn">+ Add Item</a>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Code</th>
                    <th>Category</th>
                    <th>Quantity</th>
                    <th>Location</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${items}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.name}</td>
                        <td>${item.code}</td>
                        <td>${item.category}</td>
                        <td>${item.quantity} ${item.unit}</td>
                        <td>${item.location}</td>
                        <td>
                            <span class="status status-${item.status.toLowerCase()}">
                                ${item.status}
                            </span>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/inventory/view?id=${item.id}" class="action-link">View</a>
                            <a href="#" class="action-link">Edit</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>