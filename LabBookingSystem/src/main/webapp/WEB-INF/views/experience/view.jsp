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
            max-width: 800px;
            margin: 0 auto;
        }
        .header {
            margin-bottom: 2rem;
        }
        .header h1 {
            color: #8AA9FF;
            margin: 0;
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
        .info-card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 2rem;
            margin-bottom: 2rem;
        }
        .info-row {
            display: flex;
            margin-bottom: 1rem;
        }
        .info-label {
            width: 150px;
            color: #A8B5C8;
        }
        .info-value {
            flex: 1;
        }
        .status {
            display: inline-block;
            padding: 0.25rem 1rem;
            border-radius: 15px;
            font-weight: 500;
        }
        .status-ready { background: rgba(81, 207, 102, 0.2); color: #51cf66; }
        .status-progress { background: rgba(255, 193, 7, 0.2); color: #ffc107; }
        .status-new { background: rgba(51, 154, 240, 0.2); color: #339af0; }
        .btn {
            padding: 0.5rem 1.5rem;
            background: #8AA9FF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            margin-right: 1rem;
        }
        .btn:hover {
            background: #6c8eff;
        }
        form {
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
        }
        select {
            padding: 0.5rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 5px;
            color: white;
            margin-right: 1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav">
            <a href="${pageContext.request.contextPath}/experience">Experience Center</a>
            <a href="${pageContext.request.contextPath}/experience/preparation">Preparation</a>
            <a href="${pageContext.request.contextPath}/reports">Reports</a>
            <a href="${pageContext.request.contextPath}/">Dashboard</a>
        </div>
        
        <div class="header">
            <h1>${title}</h1>
        </div>
        
        <div class="info-card">
            <div class="info-row">
                <div class="info-label">ID:</div>
                <div class="info-value">${preparation.id}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Title:</div>
                <div class="info-value">${preparation.title}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Type:</div>
                <div class="info-value">${preparation.type}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Lab:</div>
                <div class="info-value">${preparation.lab}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Date:</div>
                <div class="info-value">${preparation.date}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Status:</div>
                <div class="info-value">
                    <span class="status status-${preparation.status.toLowerCase().replace(' ', '-')}">
                        ${preparation.status}
                    </span>
                </div>
            </div>
            <c:if test="${not empty preparation.description}">
                <div class="info-row">
                    <div class="info-label">Description:</div>
                    <div class="info-value">${preparation.description}</div>
                </div>
            </c:if>
        </div>
        
        <form action="${pageContext.request.contextPath}/experience/preparation/update" method="post">
            <input type="hidden" name="id" value="${preparation.id}">
            <label>Update Status:</label>
            <select name="status">
                <option value="New" ${preparation.status == 'New' ? 'selected' : ''}>New</option>
                <option value="In Progress" ${preparation.status == 'In Progress' ? 'selected' : ''}>In Progress</option>
                <option value="Ready" ${preparation.status == 'Ready' ? 'selected' : ''}>Ready</option>
                <option value="Completed" ${preparation.status == 'Completed' ? 'selected' : ''}>Completed</option>
            </select>
            <button type="submit" class="btn">Update Status</button>
        </form>
        
        <div style="margin-top: 2rem;">
            <a href="${pageContext.request.contextPath}/experience/preparation" class="btn" style="background: rgba(255, 255, 255, 0.1);">Back to List</a>
        </div>
    </div>
</body>
</html>