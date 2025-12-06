<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Request Submitted - Lab System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #0F1A27;
            color: white;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        /* Navigation */
        .navbar {
            background: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: #8AA9FF;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .nav-links {
            display: flex;
            gap: 1rem;
            align-items: center;
        }
        
        .nav-link {
            color: #97A2B7;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 5px;
            transition: all 0.3s;
        }
        
        .nav-link:hover {
            color: white;
            background: rgba(138, 169, 255, 0.1);
        }
        
        .nav-link.active {
            color: white;
            background: rgba(138, 169, 255, 0.2);
            border-bottom: 2px solid #8AA9FF;
        }
        
        /* Success Content */
        .success-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 2rem;
            max-width: 600px;
            margin: 0 auto;
        }
        
        .success-icon {
            font-size: 5rem;
            color: #2ecc71;
            margin-bottom: 1.5rem;
        }
        
        .success-title {
            color: #8AA9FF;
            font-size: 2rem;
            margin-bottom: 1rem;
        }
        
        .success-message {
            color: #A8B5C8;
            font-size: 1.1rem;
            line-height: 1.6;
            margin-bottom: 2rem;
        }
        
        /* Buttons */
        .btn {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            background: #8AA9FF;
            color: white;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .btn:hover {
            background: #6c8ffc;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(138, 169, 255, 0.2);
        }
        
        .btn-outline {
            background: transparent;
            border: 1px solid #8AA9FF;
            color: #8AA9FF;
            margin-left: 1rem;
        }
        
        .btn-outline:hover {
            background: rgba(138, 169, 255, 0.1);
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="logo">
            <span>⚗️</span>
            <span>Lab System</span>
        </div>
        <div class="nav-links">
            <a href="/" class="nav-link">Home</a>
            <a href="/booking" class="nav-link">Book Lab</a>
            <a href="/timetable" class="nav-link">Timetable</a>
        </div>
    </nav>

    <div class="success-container">
        <div class="success-icon">✓</div>
        <h1 class="success-title">Booking Request Submitted!</h1>
        <p class="success-message">
            Thank you for your lab booking request. We've received your submission and will process it shortly.
            You'll receive a confirmation email once your booking is approved.
        </p>
        <div>
            <a href="/" class="btn">Return to Home</a>
            <a href="/timetable" class="btn btn-outline">View Timetable</a>
        </div>
    </div>
</body>
</html>
