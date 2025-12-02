<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>${title} - Lab System</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            padding: 20px;
            background: #0F1A27;
            color: white;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.05);
            padding: 30px;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        h1 {
            color: #8AA9FF;
            margin-bottom: 30px;
            text-align: center;
        }
        .form-group { 
            margin: 20px 0; 
        }
        label { 
            display: block; 
            margin-bottom: 8px; 
            color: #A8B5C8;
            font-weight: 500;
        }
        input, select { 
            padding: 10px; 
            width: 100%; 
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 5px;
            color: white;
            font-size: 14px;
            box-sizing: border-box;
        }
        input:focus, select:focus {
            outline: none;
            border-color: #8AA9FF;
        }
        .btn { 
            padding: 12px 24px; 
            background-color: #28a745; 
            color: white; 
            border: none; 
            border-radius: 5px; 
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            transition: background-color 0.3s;
            display: block;
            width: 100%;
            margin-top: 30px;
        }
        .btn:hover {
            background-color: #218838;
        }
        .cancel-btn {
            display: inline-block;
            padding: 10px 20px;
            background: rgba(255, 255, 255, 0.1);
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 15px;
            text-align: center;
            width: 100%;
            box-sizing: border-box;
        }
        .cancel-btn:hover {
            background: rgba(255, 255, 255, 0.2);
        }
        .nav {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }
        .nav a {
            color: #97A2B7;
            text-decoration: none;
            padding: 5px 10px;
        }
        .nav a.active {
            color: white;
            border-bottom: 2px solid #8AA9FF;
        }
        .info-box {
            background: rgba(255, 255, 255, 0.05);
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
            border-left: 4px solid #8AA9FF;
        }
        .info-box p {
            margin: 0;
            color: #A8B5C8;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav">
            <a href="${pageContext.request.contextPath}/reports">Report Center</a>
            <a href="${pageContext.request.contextPath}/reports/generate" class="active">Generate Report</a>
            <a href="${pageContext.request.contextPath}/reports/list">Report List</a>
            <a href="${pageContext.request.contextPath}/">Dashboard</a>
        </div>
        
        <h1>${title}</h1>
        
        <div class="info-box">
            <p>Generate printable summaries and logs of experiment requests for record keeping. Reports can be exported in PDF, Excel, or HTML format.</p>
        </div>
        
        <form action="${pageContext.request.contextPath}/reports/generate" method="post">
            <div class="form-group">
                <label>Report Type:</label>
                <select name="reportType" required>
                    <option value="daily">Daily Report</option>
                    <option value="weekly">Weekly Report</option>
                    <option value="monthly">Monthly Report</option>
                    <option value="experiment">Experiment Report</option>
                    <option value="inventory">Inventory Report</option>
                    <option value="schedule">Schedule Report</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Start Date:</label>
                <input type="date" name="startDate" required>
            </div>
            
            <div class="form-group">
                <label>End Date:</label>
                <input type="date" name="endDate" required>
            </div>
            
            <div class="form-group">
                <label>Output Format:</label>
                <select name="format" required>
                    <option value="pdf">PDF Document</option>
                    <option value="excel">Excel Spreadsheet</option>
                    <option value="html">HTML Web Page</option>
                </select>
            </div>
            
            <div class="form-group">
                <label>Include Details:</label>
                <select name="details">
                    <option value="summary">Summary Only</option>
                    <option value="detailed">Detailed Information</option>
                    <option value="full">Full Report with Charts</option>
                </select>
            </div>
            
            <button type="submit" class="btn">Generate Report</button>
            <a href="${pageContext.request.contextPath}/reports" class="cancel-btn">Cancel</a>
        </form>
        
        <div style="margin-top: 40px; padding-top: 20px; border-top: 1px solid rgba(255, 255, 255, 0.1);">
            <h3 style="color: #8AA9FF; font-size: 16px;">Quick Reports:</h3>
            <div style="display: flex; gap: 10px; margin-top: 10px;">
                <button onclick="generateQuickReport('today')" style="padding: 8px 15px; background: rgba(138, 169, 255, 0.2); color: #8AA9FF; border: 1px solid #8AA9FF; border-radius: 5px; cursor: pointer;">Today's Report</button>
                <button onclick="generateQuickReport('week')" style="padding: 8px 15px; background: rgba(138, 169, 255, 0.2); color: #8AA9FF; border: 1px solid #8AA9FF; border-radius: 5px; cursor: pointer;">This Week</button>
                <button onclick="generateQuickReport('month')" style="padding: 8px 15px; background: rgba(138, 169, 255, 0.2); color: #8AA9FF; border: 1px solid #8AA9FF; border-radius: 5px; cursor: pointer;">This Month</button>
            </div>
        </div>
    </div>
    
    <script>
        // Set default dates
        document.addEventListener('DOMContentLoaded', function() {
            const today = new Date().toISOString().split('T')[0];
            const oneWeekAgo = new Date();
            oneWeekAgo.setDate(oneWeekAgo.getDate() - 7);
            const oneWeekAgoStr = oneWeekAgo.toISOString().split('T')[0];
            
            document.querySelector('input[name="startDate"]').value = oneWeekAgoStr;
            document.querySelector('input[name="endDate"]').value = today;
        });
        
        function generateQuickReport(type) {
            const today = new Date();
            let startDate = new Date();
            let endDate = new Date();
            
            switch(type) {
                case 'today':
                    // Use today's date for both start and end
                    break;
                case 'week':
                    startDate.setDate(today.getDate() - 7);
                    break;
                case 'month':
                    startDate.setMonth(today.getMonth() - 1);
                    break;
            }
            
            const formatDate = (date) => date.toISOString().split('T')[0];
            
            document.querySelector('input[name="startDate"]').value = formatDate(startDate);
            document.querySelector('input[name="endDate"]').value = formatDate(endDate);
            
            // Auto-select appropriate report type
            const reportTypeSelect = document.querySelector('select[name="reportType"]');
            if (type === 'today') reportTypeSelect.value = 'daily';
            else if (type === 'week') reportTypeSelect.value = 'weekly';
            else if (type === 'month') reportTypeSelect.value = 'monthly';
            
            alert('Dates set for ' + type + ' report. Click "Generate Report" to proceed.');
        }
        
        // Form validation
        const form = document.querySelector('form');
        form.addEventListener('submit', function(e) {
            const startDate = new Date(document.querySelector('input[name="startDate"]').value);
            const endDate = new Date(document.querySelector('input[name="endDate"]').value);
            
            if (startDate > endDate) {
                e.preventDefault();
                alert('Start date cannot be after end date.');
                return false;
            }
            
            if (endDate > new Date()) {
                e.preventDefault();
                alert('End date cannot be in the future.');
                return false;
            }
            
            return true;
        });
    </script>
</body>
</html>