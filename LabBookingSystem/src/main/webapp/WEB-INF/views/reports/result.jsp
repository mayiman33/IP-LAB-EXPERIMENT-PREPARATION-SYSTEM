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
        .success-message {
            background: rgba(40, 167, 69, 0.2);
            border-left: 4px solid #28a745;
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
        }
        .info-box {
            background: rgba(255, 255, 255, 0.05);
            padding: 15px;
            border-radius: 5px;
            margin: 20px 0;
            border-left: 4px solid #8AA9FF;
        }
        .btn {
            padding: 12px 24px;
            background-color: #8AA9FF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
            font-size: 16px;
            transition: background-color 0.3s;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
            margin-right: 10px;
        }
        .btn:hover {
            background-color: #6c8eff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Report Generation Result</h1>
        
        <div class="success-message">
            <h3 style="color: #28a745; margin-top: 0;">✓ ${message}</h3>
        </div>
        
        <div class="info-box">
            <h3>Report Details:</h3>
            <p><strong>Report Type:</strong> ${reportType}</p>
            <p><strong>Date Range:</strong> ${startDate} to ${endDate}</p>
            <p><strong>Output Format:</strong> ${format}</p>
            <p><strong>Generated at:</strong> ${generatedTime}</p>
        </div>
        
        <div style="text-align: center; margin-top: 30px;">
            <a href="${pageContext.request.contextPath}/reports/generate" class="btn">Generate Another Report</a>
            <a href="${pageContext.request.contextPath}/reports" class="btn" style="background: rgba(255, 255, 255, 0.1);">Back to Report Center</a>
        </div>
    </div>
</body>
</html>