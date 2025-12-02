<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title}</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Inter', sans-serif;
            background: #0F1A27;
            color: white;
        }

        /* Navigation */
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
            transition: color 0.3s;
        }

        .nav a:hover {
            color: white;
        }

        .nav a.active {
            color: white;
            border-bottom: 2px solid #8AA9FF;
            padding-bottom: 5px;
        }

        .userIcon {
            position: absolute;
            right: 40px;
            top: 25px;
            font-size: 32px;
            cursor: pointer;
        }

        .title {
            font-size: 26px;
            margin: 40px 60px 20px;
            font-weight: 400;
        }

        /* System Navigation */
        .system-nav {
            margin: 10px 60px;
            padding: 10px 0;
        }
        
        .system-nav a {
            color: #8AA9FF;
            text-decoration: none;
            margin-right: 20px;
            font-size: 14px;
        }

        /* Table */
        .table-container {
            width: 80%;
            margin: 0 auto;
            margin-top: 10px;
        }

        .row {
            background: rgba(255, 255, 255, 0.15);
            margin-bottom: 18px;
            padding: 18px 25px;
            border-radius: 40px;
            display: grid;
            grid-template-columns: 1.5fr 1fr 1.3fr 1.5fr 1fr 1fr 0.5fr;
            align-items: center;
            font-size: 17px;
        }

        .header-row {
            background: none;
            margin-bottom: 10px;
            font-size: 15px;
            color: #A8B5C8;
            padding-left: 10px;
            display: grid;
            grid-template-columns: 1.5fr 1fr 1.3fr 1.5fr 1fr 1fr 0.5fr;
        }

        .status-approved {
            color: #9EFF91;
            font-weight: 600;
        }

        .status-pending {
            color: #FFA65C;
            font-weight: 600;
        }
        
        .status-read {
            color: #4CAF50;
            font-weight: 600;
        }
        
        .status-rejected {
            color: #FF5252;
            font-weight: 600;
        }

        /* Action buttons */
        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        
        .btn {
            padding: 6px 15px;
            border-radius: 20px;
            border: none;
            cursor: pointer;
            font-weight: 600;
            font-size: 14px;
        }
        
        .btn-approve {
            background: #4CAF50;
            color: white;
        }
        
        .btn-reject {
            background: #FF5252;
            color: white;
        }
        
        .btn-view {
            background: #8AA9FF;
            color: white;
        }

        /* Floating add button */
        .add-btn {
            position: fixed;
            right: 90px;
            bottom: 80px;
            background: white;
            width: 55px;
            height: 55px;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            color: black;
            font-size: 32px;
            cursor: pointer;
            transition: 0.25s;
        }

        .add-btn:hover {
            transform: scale(1.08);
        }

        /* Statistics Cards */
        .stats-container {
            display: flex;
            gap: 20px;
            margin: 20px 60px;
        }
        
        .stat-card {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 15px;
            flex: 1;
            text-align: center;
        }
        
        .stat-number {
            font-size: 32px;
            font-weight: 600;
            margin: 10px 0;
        }
        
        .stat-label {
            color: #A8B5C8;
            font-size: 14px;
        }
    </style>
</head>
<body>

<!-- Navigation -->
<div class="nav">
    <a href="${pageContext.request.contextPath}/requests/home" 
       class="${activeTab == 'home' ? 'active' : ''}">Home</a>
    <a href="${pageContext.request.contextPath}/requests" 
       class="${activeTab == 'requests' ? 'active' : ''}">Requests</a>
    <a href="${pageContext.request.contextPath}/requests/history" 
       class="${activeTab == 'history' ? 'active' : ''}">History</a>
    
    <div style="flex-grow: 1;"></div>
    <div>
        <a href="${pageContext.request.contextPath}/reports" style="font-size: 14px;">Reports</a>
        <a href="${pageContext.request.contextPath}/notifications" style="font-size: 14px;">Notifications</a>
        <a href="${pageContext.request.contextPath}/" style="font-size: 14px;">Dashboard</a>
    </div>

    <div class="userIcon" onclick="location.href='${pageContext.request.contextPath}/profile'">👤</div>
</div>

<!-- System Navigation -->
<div class="system-nav">
    <a href="${pageContext.request.contextPath}/">Dashboard</a> &gt; 
    <a href="${pageContext.request.contextPath}/requests">Experiment Requests</a>
</div>

<!-- Statistics Cards -->
<div class="stats-container">
    <div class="stat-card">
        <div class="stat-number">12</div>
        <div class="stat-label">Total Requests</div>
    </div>
    <div class="stat-card">
        <div class="stat-number" style="color: #FFA65C;">5</div>
        <div class="stat-label">Pending</div>
    </div>
    <div class="stat-card">
        <div class="stat-number" style="color: #9EFF91;">7</div>
        <div class="stat-label">Approved</div>
    </div>
    <div class="stat-card">
        <div class="stat-number" style="color: #8AA9FF;">3</div>
        <div class="stat-label">This Week</div>
    </div>
</div>

<!-- Page Title -->
<div class="title">Experiment Request List:</div>

<div class="table-container">

    <!-- Header row -->
    <div class="header-row">
        <div>Subject</div>
        <div>Experiment Code</div>
        <div>Date</div>
        <div>Time</div>
        <div>Laboratory</div>
        <div>Status</div>
        <div>Actions</div>
    </div>

    <!-- Row 1 -->
    <div class="row">
        <div>Chemistry</div>
        <div>CH-2024-001</div>
        <div>2024-01-25</div>
        <div>9:00 AM - 10:00 AM</div>
        <div>Chemistry Lab #1</div>
        <div class="status-approved">Approved</div>
        <div class="action-buttons">
            <button class="btn btn-view" onclick="viewDetails(1)">View</button>
        </div>
    </div>

    <!-- Row 2 -->
    <div class="row">
        <div>Physics</div>
        <div>PH-2024-002</div>
        <div>2024-01-26</div>
        <div>11:00 AM - 12:00 PM</div>
        <div>Physics Lab #2</div>
        <div class="status-pending">Pending</div>
        <div class="action-buttons">
            <button class="btn btn-approve" onclick="approveRequest(2)">Approve</button>
            <button class="btn btn-reject" onclick="rejectRequest(2)">Reject</button>
        </div>
    </div>
    
    <!-- Row 3 -->
    <div class="row">
        <div>Biology</div>
        <div>BIO-2024-003</div>
        <div>2024-01-27</div>
        <div>2:00 PM - 4:00 PM</div>
        <div>Biology Lab #3</div>
        <div class="status-pending">Pending</div>
        <div class="action-buttons">
            <button class="btn btn-approve" onclick="approveRequest(3)">Approve</button>
            <button class="btn btn-reject" onclick="rejectRequest(3)">Reject</button>
        </div>
    </div>
    
    <!-- Row 4 -->
    <div class="row">
        <div>Materials Science</div>
        <div>MS-2024-004</div>
        <div>2024-01-28</div>
        <div>10:00 AM - 12:00 PM</div>
        <div>Materials Lab #4</div>
        <div class="status-read">Read</div>
        <div class="action-buttons">
            <button class="btn btn-view" onclick="viewDetails(4)">View</button>
        </div>
    </div>
    
    <!-- Row 5 -->
    <div class="row">
        <div>Environmental Science</div>
        <div>ENV-2024-005</div>
        <div>2024-01-29</div>
        <div>1:00 PM - 3:00 PM</div>
        <div>Environmental Lab #5</div>
        <div class="status-rejected">Rejected</div>
        <div class="action-buttons">
            <button class="btn btn-view" onclick="viewDetails(5)">View</button>
        </div>
    </div>

</div>

<!-- Floating Add Button -->
<div class="add-btn" onclick="location.href='${pageContext.request.contextPath}/requests/new'">+</div>

<script>
    function viewDetails(requestId) {
        alert('View request details #' + requestId);
    }
    
    function approveRequest(requestId) {
        if (confirm('Approve request #' + requestId + '?')) {
            fetch('${pageContext.request.contextPath}/api/requests/' + requestId + '/approve', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => {
                if (response.ok) {
                    alert('Request approved!');
                    location.reload();
                } else {
                    alert('Approval failed. Please try again.');
                }
            });
        }
    }
    
    function rejectRequest(requestId) {
        if (confirm('Reject request #' + requestId + '?')) {
            fetch('${pageContext.request.contextPath}/api/requests/' + requestId + '/reject', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
            .then(response => {
                if (response.ok) {
                    alert('Request rejected!');
                    location.reload();
                } else {
                    alert('Rejection failed. Please try again.');
                }
            });
        }
    }
</script>

</body>
</html>