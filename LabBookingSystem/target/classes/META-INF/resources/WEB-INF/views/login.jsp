<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Lab Experiment System</title>
    <style>
        /* 这里是上面的完整CSS样式 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #0F1A27 0%, #1a2b3c 100%);
            color: white;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 2rem;
        }
        
        .login-card {
            background: rgba(255, 255, 255, 0.05);
            padding: 2.5rem;
            border-radius: 15px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
        }
        
        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .login-header h1 {
            color: #8AA9FF;
            margin-bottom: 0.5rem;
            font-size: 1.8rem;
        }
        
        .login-header p {
            color: #A8B5C8;
            margin: 0;
        }
        
        .error-message {
            background: rgba(220, 53, 69, 0.2);
            color: #dc3545;
            padding: 1rem;
            border-radius: 8px;
            border: 1px solid #dc3545;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #A8B5C8;
        }
        
        .form-input {
            width: 100%;
            padding: 0.75rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            color: white;
            box-sizing: border-box;
        }
        
        .form-input:focus {
            outline: none;
            border-color: #8AA9FF;
        }
        
        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            border: none;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .btn-primary {
            background: linear-gradient(45deg, #8AA9FF, #6c8eff);
            color: white;
        }
        
        .btn-primary:hover {
            background: linear-gradient(45deg, #6c8eff, #8AA9FF);
            transform: translateY(-2px);
        }
        
        .btn-block {
            width: 100%;
            padding: 1rem;
            font-size: 1rem;
        }
        
        .login-footer {
            text-align: center;
            margin-top: 2rem;
            padding-top: 1.5rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: #A8B5C8;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <div class="login-header">
                <h1>🔬 Lab Experiment System</h1>
                <p>Sign in to manage experiments</p>
            </div>
            
            <c:if test="${not empty message}">
                <div class="error-message">
                    ${message}
                </div>
            </c:if>
            
            <form action="/login" method="post" class="login-form">

                <div class="form-group">
                    <label>Username</label>
                    <input type="text" name="username" required 
                           placeholder="Enter your username" class="form-input">
                </div>
                
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" required 
                           placeholder="Enter your password" class="form-input">
                </div>
                
                <button type="submit" class="btn btn-primary btn-block">
                    Sign In
                </button>
            </form>
            
            <div class="login-footer">
                <p>Demo Credentials: admin / admin123</p>
            </div>
        </div>
    </div>
</body>
</html>