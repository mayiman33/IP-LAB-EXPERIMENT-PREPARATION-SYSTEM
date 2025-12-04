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

        /* Main Content Tabs */
        .content-tabs {
            margin: 0 60px;
            display: flex;
            gap: 20px;
            padding: 10px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .tab {
            padding: 8px 20px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 20px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s;
        }
        
        .tab:hover {
            background: rgba(255, 255, 255, 0.1);
        }
        
        .tab.active {
            background: #8AA9FF;
            color: white;
            font-weight: 500;
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
            align-items: center;
            font-size: 17px;
        }

        /* Experiment Request Table */
        .requests-table .row {
            grid-template-columns: 1.5fr 1fr 1.3fr 1.5fr 1fr 1fr 0.5fr;
        }

        /* Preparation Table */
        .preparations-table .row {
            grid-template-columns: 0.5fr 1.5fr 1fr 1fr 1fr 1fr 0.5fr;
        }

        .header-row {
            background: none;
            margin-bottom: 10px;
            font-size: 15px;
            color: #A8B5C8;
            padding-left: 10px;
            display: grid;
        }

        .requests-table .header-row {
            grid-template-columns: 1.5fr 1fr 1.3fr 1.5fr 1fr 1fr 0.5fr;
        }

        .preparations-table .header-row {
            grid-template-columns: 0.5fr 1.5fr 1fr 1fr 1fr 1fr 0.5fr;
        }

        /* Status Styles */
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
        
        .status-new {
            color: #8AA9FF;
            font-weight: 600;
        }
        
        .status-inprogress {
            color: #FFD166;
            font-weight: 600;
        }
        
        .status-ready {
            color: #06D6A0;
            font-weight: 600;
        }
        
        .status-completed {
            color: #118AB2;
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
        
        .btn-edit {
            background: #FFD166;
            color: #333;
        }
        
        .btn-prepare {
            background: #06D6A0;
            color: white;
        }
        
        .btn-start {
            background: #118AB2;
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
            z-index: 100;
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
            cursor: pointer;
            transition: transform 0.3s;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
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

        /* Content Sections */
        .content-section {
            display: none;
        }
        
        .content-section.active {
            display: block;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #A8B5C8;
        }
        
        .empty-state h3 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #8AA9FF;
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
    <a href="${pageContext.request.contextPath}/experience" 
       class="${activeTab == 'experience' ? 'active' : ''}">Experience</a>
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
    <a href="${pageContext.request.contextPath}/requests">Experiment Operations</a>
</div>

<!-- Content Tabs -->
<div class="content-tabs">
    <div class="tab active" onclick="showSection('requests')">Experiment Requests</div>
    <div class="tab" onclick="showSection('preparations')">Experience Preparation</div>
    <div class="tab" onclick="showSection('projects')">Project Operations</div>
</div>

<!-- Statistics Cards -->
<div class="stats-container">
    <div class="stat-card" onclick="showSection('requests')">
        <div class="stat-number">12</div>
        <div class="stat-label">Total Requests</div>
    </div>
    <div class="stat-card" onclick="showSection('requests')">
        <div class="stat-number" style="color: #FFA65C;">5</div>
        <div class="stat-label">Pending</div>
    </div>
    <div class="stat-card" onclick="showSection('preparations')">
        <div class="stat-number" style="color: #8AA9FF;">8</div>
        <div class="stat-label">Active Preparations</div>
    </div>
    <div class="stat-card" onclick="showSection('projects')">
        <div class="stat-number" style="color: #06D6A0;">3</div>
        <div class="stat-label">Active Projects</div>
    </div>
</div>

<!-- Experiment Requests Section -->
<div id="requests-section" class="content-section active">
    <div class="title">Experiment Request List:</div>

    <div class="table-container requests-table">
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
                <button class="btn btn-prepare" onclick="prepareExperiment('CH-2024-001')">Prepare</button>
                <button class="btn btn-view" onclick="viewRequestDetails(1)">View</button>
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
                <button class="btn btn-prepare" onclick="prepareExperiment('MS-2024-004')">Prepare</button>
                <button class="btn btn-view" onclick="viewRequestDetails(4)">View</button>
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
                <button class="btn btn-view" onclick="viewRequestDetails(5)">View</button>
            </div>
        </div>
    </div>
</div>

<!-- Experience Preparation Section -->
<div id="preparations-section" class="content-section">
    <div class="title">Experience Preparation List:</div>

    <div class="table-container preparations-table">
        <!-- Header row -->
        <div class="header-row">
            <div>ID</div>
            <div>Experiment Title</div>
            <div>Type</div>
            <div>Lab</div>
            <div>Date</div>
            <div>Status</div>
            <div>Actions</div>
        </div>

        <!-- Preparation 1 -->
        <div class="row">
            <div>#1</div>
            <div>Chemical Reaction Experiment</div>
            <div>Chemistry</div>
            <div>Lab A</div>
            <div>2024-01-25</div>
            <div class="status-ready">Ready</div>
            <div class="action-buttons">
                <button class="btn btn-start" onclick="startExperiment(1)">Start</button>
                <button class="btn btn-view" onclick="viewPreparation(1)">View</button>
            </div>
        </div>

        <!-- Preparation 2 -->
        <div class="row">
            <div>#2</div>
            <div>Microbiology Study</div>
            <div>Biology</div>
            <div>Lab B</div>
            <div>2024-01-26</div>
            <div class="status-inprogress">In Progress</div>
            <div class="action-buttons">
                <button class="btn btn-edit" onclick="editPreparation(2)">Edit</button>
                <button class="btn btn-view" onclick="viewPreparation(2)">View</button>
            </div>
        </div>
        
        <!-- Preparation 3 -->
        <div class="row">
            <div>#3</div>
            <div>Optics Experiment</div>
            <div>Physics</div>
            <div>Lab C</div>
            <div>2024-01-27</div>
            <div class="status-new">New</div>
            <div class="action-buttons">
                <button class="btn btn-edit" onclick="editPreparation(3)">Edit</button>
                <button class="btn btn-view" onclick="viewPreparation(3)">View</button>
            </div>
        </div>
        
        <!-- Preparation 4 -->
        <div class="row">
            <div>#4</div>
            <div>Materials Testing</div>
            <div>Engineering</div>
            <div>Lab D</div>
            <div>2024-01-28</div>
            <div class="status-completed">Completed</div>
            <div class="action-buttons">
                <button class="btn btn-view" onclick="viewPreparation(4)">View</button>
            </div>
        </div>
        
        <!-- Preparation 5 -->
        <div class="row">
            <div>#5</div>
            <div>Tissue Culture Study</div>
            <div>Medical</div>
            <div>Lab B</div>
            <div>2024-01-29</div>
            <div class="status-ready">Ready</div>
            <div class="action-buttons">
                <button class="btn btn-start" onclick="startExperiment(5)">Start</button>
                <button class="btn btn-view" onclick="viewPreparation(5)">View</button>
            </div>
        </div>
    </div>
</div>

<!-- Project Operations Section -->
<div id="projects-section" class="content-section">
    <div class="title">Project Operations:</div>
    
    <div class="empty-state">
        <h3>No Active Projects</h3>
        <p>Create a new project to get started with project operations</p>
        <button class="btn" style="background: #8AA9FF; margin-top: 20px;" 
                onclick="createNewProject()">Create New Project</button>
    </div>
</div>

<!-- Floating Add Buttons -->
<div class="add-btn" id="addRequestBtn" onclick="location.href='${pageContext.request.contextPath}/requests/new'">+</div>
<div class="add-btn" id="addPreparationBtn" style="display: none; right: 160px;" 
     onclick="location.href='${pageContext.request.contextPath}/experience/preparation/new'">+</div>

<script>
    let currentSection = 'requests';
    
    function showSection(section) {
        // Update tabs
        document.querySelectorAll('.tab').forEach(tab => tab.classList.remove('active'));
        event.target.classList.add('active');
        
        // Update content sections
        document.querySelectorAll('.content-section').forEach(sec => sec.classList.remove('active'));
        document.getElementById(section + '-section').classList.add('active');
        
        // Update add button
        currentSection = section;
        if (section === 'requests') {
            document.getElementById('addRequestBtn').style.display = 'flex';
            document.getElementById('addPreparationBtn').style.display = 'none';
        } else if (section === 'preparations') {
            document.getElementById('addRequestBtn').style.display = 'none';
            document.getElementById('addPreparationBtn').style.display = 'flex';
        } else {
            document.getElementById('addRequestBtn').style.display = 'none';
            document.getElementById('addPreparationBtn').style.display = 'none';
        }
    }
    
    // Request Functions
    function viewRequestDetails(requestId) {
        location.href = '${pageContext.request.contextPath}/requests/view?id=' + requestId;
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
    
    function prepareExperiment(experimentCode) {
        if (confirm('Start preparation for ' + experimentCode + '?')) {
            location.href = '${pageContext.request.contextPath}/experience/preparation/new?code=' + experimentCode;
        }
    }
    
    // Preparation Functions
    function viewPreparation(prepId) {
        location.href = '${pageContext.request.contextPath}/experience/preparation/view?id=' + prepId;
    }
    
    function editPreparation(prepId) {
        location.href = '${pageContext.request.contextPath}/experience/preparation/edit?id=' + prepId;
    }
    
    function startExperiment(prepId) {
        if (confirm('Start experiment for preparation #' + prepId + '?')) {
            fetch('${pageContext.request.contextPath}/api/preparations/' + prepId + '/start', {
                method: 'POST'
            })
            .then(response => {
                if (response.ok) {
                    alert('Experiment started!');
                    location.reload();
                } else {
                    alert('Failed to start experiment.');
                }
            });
        }
    }
    
    // Project Functions
    function createNewProject() {
        location.href = '${pageContext.request.contextPath}/projects/new';
    }
    
    // Initialize
    document.addEventListener('DOMContentLoaded', function() {
        // Show appropriate add button based on current section
        showSection('requests');
        
        // Add hover effects to stats cards
        document.querySelectorAll('.stat-card').forEach(card => {
            card.addEventListener('click', function() {
                const label = this.querySelector('.stat-label').textContent;
                if (label.includes('Requests')) showSection('requests');
                else if (label.includes('Preparations')) showSection('preparations');
                else if (label.includes('Projects')) showSection('projects');
            });
        });
    });
</script>

</body>
</html>