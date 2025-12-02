<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>History - Lab System</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Inter', sans-serif;
            background: #0F1A27;
            color: white;
        }
        .nav {
            display: flex;
            padding: 25px 50px;
            font-size: 20px;
            gap: 40px;
            background: rgba(255, 255, 255, 0.05);
        }
        .nav a {
            text-decoration: none;
            color: #97A2B7;
            font-weight: 300;
        }
        .nav a.active {
            color: white;
            border-bottom: 2px solid #8AA9FF;
            padding-bottom: 5px;
        }
        .container {
            padding: 40px 60px;
        }
        .section-title {
            font-size: 24px;
            color: #8AA9FF;
            margin-bottom: 20px;
        }
        .history-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .history-table th, .history-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        .history-table th {
            color: #A8B5C8;
            font-weight: 400;
        }
        .status-badge {
            padding: 5px 15px;
            border-radius: 15px;
            font-size: 14px;
            font-weight: 600;
        }
        .status-completed {
            background: rgba(78, 175, 80, 0.2);
            color: #4CAF50;
        }
        .status-cancelled {
            background: rgba(255, 82, 82, 0.2);
            color: #FF5252;
        }
        .status-pending {
            background: rgba(255, 166, 92, 0.2);
            color: #FFA65C;
        }
        .filter-bar {
            margin-bottom: 20px;
            display: flex;
            gap: 15px;
        }
        .filter-select {
            padding: 8px 15px;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            border-radius: 5px;
        }
        .view-btn {
            background: #8AA9FF;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
        }
        .view-btn:hover {
            background: #6c8eff;
        }
        .system-nav {
            margin: 10px 60px 0;
            padding: 10px 0;
        }
        .system-nav a {
            color: #8AA9FF;
            text-decoration: none;
            margin-right: 20px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <div class="nav">
        <a href="${pageContext.request.contextPath}/requests/home">Home</a>
        <a href="${pageContext.request.contextPath}/requests">Requests</a>
        <a href="${pageContext.request.contextPath}/requests/history" class="active">History</a>
        <div style="flex-grow: 1;"></div>
        <a href="${pageContext.request.contextPath}/reports">Reports</a>
        <a href="${pageContext.request.contextPath}/notifications">Notifications</a>
        <a href="${pageContext.request.contextPath}/">Dashboard</a>
    </div>
    
    <!-- System Navigation -->
    <div class="system-nav">
        <a href="${pageContext.request.contextPath}/">Dashboard</a> &gt; 
        <a href="${pageContext.request.contextPath}/requests">Experiment Requests</a> &gt; 
        <span style="color: white;">History</span>
    </div>
    
    <div class="container">
        <div class="section-title">Experiment Request History</div>
        
        <div class="filter-bar">
            <select class="filter-select">
                <option value="all">All Status</option>
                <option value="completed">Completed</option>
                <option value="cancelled">Cancelled</option>
                <option value="pending">Pending</option>
            </select>
            <select class="filter-select">
                <option value="all">All Laboratories</option>
                <option value="chemistry">Chemistry Laboratory</option>
                <option value="physics">Physics Laboratory</option>
                <option value="biology">Biology Laboratory</option>
                <option value="materials">Materials Laboratory</option>
            </select>
            <input type="date" class="filter-select">
            <button class="filter-select" style="background: #8AA9FF; cursor: pointer;">Filter</button>
        </div>
        
        <table class="history-table">
            <thead>
                <tr>
                    <th>Experiment Code</th>
                    <th>Subject</th>
                    <th>Laboratory</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>CH-2024-001</td>
                    <td>Chemistry Experiment</td>
                    <td>Chemistry Lab #1</td>
                    <td>2024-01-15</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td><button class="view-btn" onclick="viewDetails(1)">View Details</button></td>
                </tr>
                <tr>
                    <td>PH-2024-002</td>
                    <td>Physics Experiment</td>
                    <td>Physics Lab #2</td>
                    <td>2024-01-14</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td><button class="view-btn" onclick="viewDetails(2)">View Details</button></td>
                </tr>
                <tr>
                    <td>BIO-2024-003</td>
                    <td>Biology Experiment</td>
                    <td>Biology Lab #3</td>
                    <td>2024-01-13</td>
                    <td><span class="status-badge status-cancelled">Cancelled</span></td>
                    <td><button class="view-btn" onclick="viewDetails(3)">View Details</button></td>
                </tr>
                <tr>
                    <td>MS-2024-004</td>
                    <td>Materials Science</td>
                    <td>Materials Lab #4</td>
                    <td>2024-01-12</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td><button class="view-btn" onclick="viewDetails(4)">View Details</button></td>
                </tr>
                <tr>
                    <td>ENV-2024-005</td>
                    <td>Environmental Science</td>
                    <td>Environmental Lab #5</td>
                    <td>2024-01-11</td>
                    <td><span class="status-badge status-pending">Pending</span></td>
                    <td><button class="view-btn" onclick="viewDetails(5)">View Details</button></td>
                </tr>
            </tbody>
        </table>
        
        <div style="margin-top: 30px; text-align: center;">
            <button style="background: #8AA9FF; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; margin-right: 10px;">
                ← Previous
            </button>
            <span style="color: #A8B5C8;">Page 1 of 5</span>
            <button style="background: #8AA9FF; color: white; border: none; padding: 10px 20px; border-radius: 5px; cursor: pointer; margin-left: 10px;">
                Next →
            </button>
        </div>
    </div>
    
    <script>
        function viewDetails(requestId) {
            alert('Viewing details for request #' + requestId);
            // In real application: window.location.href = '/requests/detail/' + requestId;
        }
        
        // Filter functionality
        document.addEventListener('DOMContentLoaded', function() {
            const filterSelect = document.querySelector('.filter-select');
            const filterBtn = document.querySelector('.filter-select[style*="background: #8AA9FF"]');
            
            if (filterBtn) {
                filterBtn.addEventListener('click', function() {
                    alert('Filter applied!');
                    // In real application: apply filter and refresh table
                });
            }
        });
    </script>
</body>
</html>