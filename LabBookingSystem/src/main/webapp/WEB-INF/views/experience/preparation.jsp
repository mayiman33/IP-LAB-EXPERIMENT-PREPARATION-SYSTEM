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
            border: none;
            cursor: pointer;
            font-weight: 500;
        }
        .btn:hover {
            background: #218838;
        }
        .btn-secondary {
            background: #8AA9FF;
        }
        .btn-secondary:hover {
            background: #6c8eff;
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
        .table-container {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            overflow: hidden;
        }
        table {
            width: 100%;
            border-collapse: collapse;
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
        tr:hover {
            background: rgba(255, 255, 255, 0.05);
        }
        .status {
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.85rem;
            font-weight: 500;
        }
        .status-ready {
            background: rgba(81, 207, 102, 0.2);
            color: #51cf66;
            border: 1px solid #51cf66;
        }
        .status-progress {
            background: rgba(255, 193, 7, 0.2);
            color: #ffc107;
            border: 1px solid #ffc107;
        }
        .status-new {
            background: rgba(51, 154, 240, 0.2);
            color: #339af0;
            border: 1px solid #339af0;
        }
        .action-link {
            color: #8AA9FF;
            text-decoration: none;
            margin-right: 1rem;
        }
        .action-link:hover {
            text-decoration: underline;
        }
        .message {
            padding: 1rem;
            margin-bottom: 1rem;
            border-radius: 5px;
        }
        .message-success {
            background: rgba(40, 167, 69, 0.2);
            border-left: 4px solid #28a745;
            color: #28a745;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav">
            <a href="${pageContext.request.contextPath}/experience">Experience Center</a>
            <a href="${pageContext.request.contextPath}/experience/preparation" class="active">Preparation</a>
            <a href="${pageContext.request.contextPath}/reports">Reports</a>
            <a href="${pageContext.request.contextPath}/">Dashboard</a>
        </div>
        
        <div class="header">
            <h1>${title}</h1>
            <a href="${pageContext.request.contextPath}/experience/preparation/new" class="btn">+ New Preparation</a>
        </div>
        
        <c:if test="${not empty message}">
            <div class="message message-success">
                ${message}
            </div>
        </c:if>
        
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Type</th>
                        <th>Lab</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="prep" items="${preparations}">
                        <tr>
                            <td>${prep.id}</td>
                            <td>${prep.title}</td>
                            <td>${prep.type}</td>
                            <td>${prep.lab}</td>
                            <td>${prep.date}</td>
                            <td>
                                <span class="status status-${prep.status.toLowerCase().replace(' ', '-')}">
                                    ${prep.status}
                                </span>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/experience/preparation/view?id=${prep.id}" class="action-link">View</a>
                                <a href="#" class="action-link">Edit</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>