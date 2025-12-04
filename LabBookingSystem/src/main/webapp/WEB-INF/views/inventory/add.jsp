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
            max-width: 600px;
            margin: 0 auto;
        }
        .header {
            margin-bottom: 2rem;
        }
        .header h1 {
            color: #8AA9FF;
            margin: 0;
        }
        .form-group {
            margin-bottom: 1.5rem;
        }
        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #A8B5C8;
        }
        input, select {
            width: 100%;
            padding: 0.75rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 5px;
            color: white;
            box-sizing: border-box;
        }
        .btn {
            padding: 0.75rem 2rem;
            background: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 1rem;
        }
        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
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
        
        <form action="${pageContext.request.contextPath}/inventory/add" method="post">
            <div class="form-group">
                <label for="name">Item Name *</label>
                <input type="text" id="name" name="name" required>
            </div>
            
            <div class="form-group">
                <label for="code">Item Code *</label>
                <input type="text" id="code" name="code" required>
            </div>
            
            <div class="form-group">
                <label for="category">Category *</label>
                <select id="category" name="category" required>
                    <option value="">Select Category</option>
                    <option value="Chemicals">Chemicals</option>
                    <option value="Equipment">Equipment</option>
                    <option value="Labware">Labware</option>
                    <option value="Safety">Safety</option>
                    <option value="Tools">Tools</option>
                    <option value="Consumables">Consumables</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="quantity">Quantity *</label>
                <input type="number" id="quantity" name="quantity" min="0" required>
            </div>
            
            <div class="form-group">
                <label for="unit">Unit *</label>
                <select id="unit" name="unit" required>
                    <option value="">Select Unit</option>
                    <option value="Piece">Piece</option>
                    <option value="Bottle">Bottle</option>
                    <option value="Pack">Pack</option>
                    <option value="Pair">Pair</option>
                    <option value="Box">Box</option>
                    <option value="Liter">Liter</option>
                    <option value="Gram">Gram</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="location">Storage Location *</label>
                <input type="text" id="location" name="location" required>
            </div>
            
            <div style="display: flex; gap: 1rem; margin-top: 2rem;">
                <button type="submit" class="btn">Add Item</button>
                <a href="${pageContext.request.contextPath}/inventory/items" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html>