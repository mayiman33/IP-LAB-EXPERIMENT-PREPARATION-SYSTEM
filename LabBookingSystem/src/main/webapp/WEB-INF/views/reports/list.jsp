<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title} - Lab System</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Inter', sans-serif;
            background: #0F1A27;
            color: white;
        }
        .container {
            padding: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }
        .nav {
            display: flex;
            gap: 1.5rem;
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
        .filter-bar {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
            align-items: center;
        }
        .filter-select {
            padding: 0.5rem 1rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            border-radius: 5px;
            min-width: 150px;
        }
        .search-box {
            flex: 1;
            padding: 0.5rem 1rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            border-radius: 5px;
        }
        .btn {
            padding: 0.5rem 1.5rem;
            background: #8AA9FF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
        }
        .reports-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }
        .reports-table th {
            text-align: left;
            padding: 1rem;
            color: #A8B5C8;
            font-weight: 500;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        .reports-table td {
            padding: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        .reports-table tr:hover {
            background: rgba(255, 255, 255, 0.05);
        }
        .status-badge {
            padding: 0.25rem 0.75rem;
            border-radius: 15px;
            font-size: 0.875rem;
            font-weight: 600;
            display: inline-block;
        }
        .status-completed {
            background: rgba(78, 175, 80, 0.2);
            color: #4CAF50;
        }
        .status-pending {
            background: rgba(255, 166, 92, 0.2);
            color: #FFA65C;
        }
        .status-failed {
            background: rgba(255, 82, 82, 0.2);
            color: #FF5252;
        }
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }
        .action-btn {
            padding: 0.25rem 0.75rem;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 0.875rem;
        }
        .btn-view {
            background: rgba(138, 169, 255, 0.2);
            color: #8AA9FF;
        }
        .btn-download {
            background: rgba(78, 175, 80, 0.2);
            color: #4CAF50;
        }
        .btn-delete {
            background: rgba(255, 82, 82, 0.2);
            color: #FF5252;
        }
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 1rem;
            margin-top: 2rem;
            padding-top: 1rem;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
        }
        .page-number {
            padding: 0.5rem 1rem;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 5px;
            cursor: pointer;
        }
        .page-number.active {
            background: #8AA9FF;
            color: white;
        }
        .empty-state {
            text-align: center;
            padding: 4rem 2rem;
            color: #A8B5C8;
        }
        .empty-state h3 {
            color: #8AA9FF;
            margin-bottom: 1rem;
        }
        .report-type-icon {
            font-size: 1.25rem;
            margin-right: 0.5rem;
        }
        .size-info {
            color: #A8B5C8;
            font-size: 0.875rem;
        }
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            .header {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            .filter-bar {
                flex-direction: column;
                align-items: stretch;
            }
            .reports-table {
                display: block;
                overflow-x: auto;
            }
            .action-buttons {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav">
            <a href="${pageContext.request.contextPath}/reports">Report Center</a>
            <a href="${pageContext.request.contextPath}/reports/generate">Generate Report</a>
            <a href="${pageContext.request.contextPath}/reports/list" class="active">Report List</a>
            <a href="${pageContext.request.contextPath}/">Dashboard</a>
        </div>
        
        <div class="header">
            <h1>${title}</h1>
            <button class="btn" onclick="location.href='${pageContext.request.contextPath}/reports/generate'">
                + New Report
            </button>
        </div>
        
        <div class="filter-bar">
            <select class="filter-select" id="reportTypeFilter">
                <option value="all">All Types</option>
                <option value="daily">Daily Reports</option>
                <option value="weekly">Weekly Reports</option>
                <option value="monthly">Monthly Reports</option>
                <option value="experiment">Experiment Reports</option>
                <option value="inventory">Inventory Reports</option>
            </select>
            
            <select class="filter-select" id="statusFilter">
                <option value="all">All Status</option>
                <option value="completed">Completed</option>
                <option value="pending">Pending</option>
                <option value="failed">Failed</option>
            </select>
            
            <input type="date" class="filter-select" id="dateFilter">
            
            <input type="text" class="search-box" id="searchBox" placeholder="Search reports...">
            
            <button class="btn" onclick="applyFilters()">Apply Filters</button>
            <button class="btn" onclick="resetFilters()" style="background: rgba(255, 255, 255, 0.1);">Reset</button>
        </div>
        
        <table class="reports-table">
            <thead>
                <tr>
                    <th>Report Name</th>
                    <th>Type</th>
                    <th>Generated Date</th>
                    <th>Period</th>
                    <th>Size</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="reportsTableBody">
                <!-- Report 1 -->
                <tr>
                    <td>
                        <span class="report-type-icon">📊</span>
                        <strong>January 2024 Monthly Report</strong>
                    </td>
                    <td>Monthly</td>
                    <td>2024-01-31</td>
                    <td>Jan 1 - Jan 31, 2024</td>
                    <td class="size-info">2.4 MB</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn btn-view" onclick="viewReport(1)">View</button>
                            <button class="action-btn btn-download" onclick="downloadReport(1)">Download</button>
                            <button class="action-btn btn-delete" onclick="deleteReport(1)">Delete</button>
                        </div>
                    </td>
                </tr>
                
                <!-- Report 2 -->
                <tr>
                    <td>
                        <span class="report-type-icon">🧪</span>
                        <strong>Chemistry Experiments Q1 2024</strong>
                    </td>
                    <td>Experiment</td>
                    <td>2024-01-28</td>
                    <td>Jan 1 - Mar 31, 2024</td>
                    <td class="size-info">1.8 MB</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn btn-view" onclick="viewReport(2)">View</button>
                            <button class="action-btn btn-download" onclick="downloadReport(2)">Download</button>
                            <button class="action-btn btn-delete" onclick="deleteReport(2)">Delete</button>
                        </div>
                    </td>
                </tr>
                
                <!-- Report 3 -->
                <tr>
                    <td>
                        <span class="report-type-icon">📋</span>
                        <strong>Weekly Lab Usage Report</strong>
                    </td>
                    <td>Weekly</td>
                    <td>2024-01-29</td>
                    <td>Jan 22 - Jan 28, 2024</td>
                    <td class="size-info">850 KB</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn btn-view" onclick="viewReport(3)">View</button>
                            <button class="action-btn btn-download" onclick="downloadReport(3)">Download</button>
                            <button class="action-btn btn-delete" onclick="deleteReport(3)">Delete</button>
                        </div>
                    </td>
                </tr>
                
                <!-- Report 4 -->
                <tr>
                    <td>
                        <span class="report-type-icon">📦</span>
                        <strong>Inventory Status Report</strong>
                    </td>
                    <td>Inventory</td>
                    <td>2024-01-30</td>
                    <td>As of Jan 30, 2024</td>
                    <td class="size-info">520 KB</td>
                    <td><span class="status-badge status-pending">Generating...</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn btn-view" onclick="viewReport(4)" disabled>View</button>
                            <button class="action-btn btn-download" onclick="downloadReport(4)" disabled>Download</button>
                            <button class="action-btn btn-delete" onclick="deleteReport(4)">Cancel</button>
                        </div>
                    </td>
                </tr>
                
                <!-- Report 5 -->
                <tr>
                    <td>
                        <span class="report-type-icon">📅</span>
                        <strong>Lab Schedule February 2024</strong>
                    </td>
                    <td>Schedule</td>
                    <td>2024-01-25</td>
                    <td>Feb 1 - Feb 29, 2024</td>
                    <td class="size-info">1.2 MB</td>
                    <td><span class="status-badge status-completed">Completed</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn btn-view" onclick="viewReport(5)">View</button>
                            <button class="action-btn btn-download" onclick="downloadReport(5)">Download</button>
                            <button class="action-btn btn-delete" onclick="deleteReport(5)">Delete</button>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        
        <div class="empty-state" id="noResults" style="display: none;">
            <h3>No Reports Found</h3>
            <p>No reports match your search criteria. Try adjusting your filters or generate a new report.</p>
            <button class="btn" onclick="resetFilters()" style="margin-top: 1rem;">Clear Filters</button>
        </div>
        
        <div class="pagination">
            <button class="btn" onclick="changePage(-1)" style="background: rgba(255, 255, 255, 0.1);">← Previous</button>
            <div>
                <span class="page-number active">1</span>
                <span class="page-number">2</span>
                <span class="page-number">3</span>
                <span class="page-number">4</span>
                <span class="page-number">5</span>
            </div>
            <button class="btn" onclick="changePage(1)" style="background: rgba(255, 255, 255, 0.1);">Next →</button>
        </div>
        
        <div style="margin-top: 2rem; padding: 1rem; background: rgba(255, 255, 255, 0.05); border-radius: 5px; border-left: 4px solid #8AA9FF;">
            <h4 style="color: #8AA9FF; margin-top: 0;">Report Management Tips:</h4>
            <ul style="color: #A8B5C8; margin-bottom: 0;">
                <li>Reports are automatically saved for 1 year</li>
                <li>You can download reports in multiple formats (PDF, Excel, HTML)</li>
                <li>Generate automated weekly/monthly reports from settings</li>
                <li>Share reports with other users using the share button</li>
            </ul>
        </div>
    </div>
    
    <script>
        // Report actions
        function viewReport(reportId) {
            alert(`Viewing report #${reportId}`);
            // window.location.href = `/reports/view/${reportId}`;
        }
        
        function downloadReport(reportId) {
            alert(`Downloading report #${reportId}`);
            // Create a temporary download link
            const link = document.createElement('a');
            link.href = '#';
            link.download = `report-${reportId}.pdf`;
            link.click();
        }
        
        function deleteReport(reportId) {
            if (confirm(`Are you sure you want to delete report #${reportId}?`)) {
                // Send delete request to server
                fetch(`/api/reports/${reportId}`, {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => {
                    if (response.ok) {
                        alert('Report deleted successfully');
                        location.reload();
                    } else {
                        alert('Failed to delete report');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Error deleting report');
                });
            }
        }
        
        // Filter functionality
        function applyFilters() {
            const typeFilter = document.getElementById('reportTypeFilter').value;
            const statusFilter = document.getElementById('statusFilter').value;
            const dateFilter = document.getElementById('dateFilter').value;
            const searchText = document.getElementById('searchBox').value.toLowerCase();
            
            const rows = document.querySelectorAll('#reportsTableBody tr');
            let visibleCount = 0;
            
            rows.forEach(row => {
                const type = row.cells[1].textContent.toLowerCase();
                const status = row.cells[5].querySelector('.status-badge').textContent.toLowerCase();
                const date = row.cells[2].textContent;
                const name = row.cells[0].textContent.toLowerCase();
                
                let show = true;
                
                // Apply type filter
                if (typeFilter !== 'all' && type !== typeFilter) {
                    show = false;
                }
                
                // Apply status filter
                if (statusFilter !== 'all') {
                    const statusMap = {
                        'completed': 'completed',
                        'pending': 'generating...',
                        'failed': 'failed'
                    };
                    if (status !== statusMap[statusFilter]) {
                        show = false;
                    }
                }
                
                // Apply date filter
                if (dateFilter && date !== dateFilter) {
                    show = false;
                }
                
                // Apply search filter
                if (searchText && !name.includes(searchText)) {
                    show = false;
                }
                
                if (show) {
                    row.style.display = '';
                    visibleCount++;
                } else {
                    row.style.display = 'none';
                }
            });
            
            // Show/hide no results message
            const noResults = document.getElementById('noResults');
            if (visibleCount === 0) {
                noResults.style.display = 'block';
            } else {
                noResults.style.display = 'none';
            }
        }
        
        function resetFilters() {
            document.getElementById('reportTypeFilter').value = 'all';
            document.getElementById('statusFilter').value = 'all';
            document.getElementById('dateFilter').value = '';
            document.getElementById('searchBox').value = '';
            applyFilters();
        }
        
        // Pagination
        function changePage(direction) {
            alert(`Navigating to ${direction > 0 ? 'next' : 'previous'} page`);
            // Implement actual pagination logic here
        }
        
        // Auto-apply filters on search input
        let searchTimeout;
        document.getElementById('searchBox').addEventListener('input', function() {
            clearTimeout(searchTimeout);
            searchTimeout = setTimeout(applyFilters, 300);
        });
        
        // Set today's date as default for date filter
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date().toISOString().split('T')[0];
            document.getElementById('dateFilter').value = today;
            
            // Apply initial filters
            applyFilters();
        });
        
        // Check and update pending reports status
        function checkPendingReports() {
            const pendingReports = document.querySelectorAll('.status-pending');
            pendingReports.forEach(report => {
                // Simulate report completion after 5 seconds
                setTimeout(() => {
                    report.textContent = 'Completed';
                    report.className = 'status-badge status-completed';
                    
                    // Enable buttons
                    const row = report.closest('tr');
                    const buttons = row.querySelectorAll('button[disabled]');
                    buttons.forEach(button => {
                        button.disabled = false;
                    });
                }, Math.random() * 5000 + 2000); // Random time between 2-7 seconds
            });
        }
        
        // Start checking pending reports
        checkPendingReports();
    </script>
</body>
</html>