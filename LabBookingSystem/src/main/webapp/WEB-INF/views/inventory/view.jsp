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
        .status-low { background: rgba(255, 107, 107, 0.2); color: #ff6b6b; }
        .status-normal { background: rgba(255, 193, 7, 0.2); color: #ffc107; }
        .status-sufficient { background: rgba(81, 207, 102, 0.2); color: #51cf66; }
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
    </style>
</head>
<body>
    <div class="container">
        <div class="nav">
            <a href="${pageContext.request.contextPath}/">Home</a>
            <a href="${pageContext.request.contextPath}/inventory">Inventory</a>
            <a href="${pageContext.request.contextPath}/inventory/items">Items</a>
            <a href="${pageContext.request.contextPath}/experience">Experience</a>
        </div>
        
        <div class="header">
            <h1>${title}</h1>
        </div>
        
        <div class="info-card">
            <div class="info-row">
                <div class="info-label">ID:</div>
                <div class="info-value">${item.id}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Name:</div>
                <div class="info-value">${item.name}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Code:</div>
                <div class="info-value">${item.code}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Category:</div>
                <div class="info-value">${item.category}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Quantity:</div>
                <div class="info-value">${item.quantity} ${item.unit}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Location:</div>
                <div class="info-value">${item.location}</div>
            </div>
            <div class="info-row">
                <div class="info-label">Status:</div>
                <div class="info-value">
                    <span class="status status-${item.status.toLowerCase()}">
                        ${item.status}
                    </span>
                </div>
            </div>
        </div>
        
        <form action="${pageContext.request.contextPath}/inventory/update" method="post">
            <input type="hidden" name="id" value="${item.id}">
            <div style="background: rgba(255, 255, 255, 0.05); padding: 1.5rem; border-radius: 8px;">
                <h3 style="color: #8AA9FF; margin-top: 0;">Update Information</h3>
                <div style="display: flex; gap: 1rem; align-items: center;">
                    <div>
                        <label style="color: #A8B5C8; display: block; margin-bottom: 0.5rem;">New Quantity:</label>
                        <input type="number" name="quantity" value="${item.quantity}" min="0" style="padding: 0.5rem; background: rgba(255, 255, 255, 0.1); border: 1px solid rgba(255, 255, 255, 0.2); border-radius: 5px; color: white;">
                    </div>
                    <div>
                        <label style="color: #A8B5C8; display: block; margin-bottom: 0.5rem;">New Location:</label>
                        <input type="text" name="location" value="${item.location}" style="padding: 0.5rem; background: rgba(255, 255, 255, 0.1); border: 1px solid rgba(255, 255, 255, 0.2); border-radius: 5px; color: white;">
                    </div>
                    <button type="submit" class="btn">Update</button>
                </div>
            </div>
        </form>
        
        <div style="margin-top: 2rem;">
            <a href="${pageContext.request.contextPath}/inventory/items" class="btn" style="background: rgba(255, 255, 255, 0.1);">Back to Items</a>
        </div>
    </div>
</body>
</html>