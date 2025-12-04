<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Notification Settings - Lab System</title>
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
        .btn {
            padding: 0.5rem 1.5rem;
            background: #8AA9FF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
        }
        .settings-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(500px, 1fr));
            gap: 2rem;
        }
        .settings-card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            padding: 1.5rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        .settings-card h3 {
            color: #8AA9FF;
            margin-top: 0;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .setting-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        .setting-item:last-child {
            border-bottom: none;
        }
        .setting-info {
            flex: 1;
        }
        .setting-title {
            font-weight: 500;
            margin-bottom: 0.25rem;
        }
        .setting-description {
            color: #A8B5C8;
            font-size: 0.9rem;
        }
        .toggle-switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 30px;
            margin-left: 1rem;
        }
        .toggle-switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }
        .toggle-slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #2C3E50;
            transition: .4s;
            border-radius: 30px;
        }
        .toggle-slider:before {
            position: absolute;
            content: "";
            height: 22px;
            width: 22px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            transition: .4s;
            border-radius: 50%;
        }
        input:checked + .toggle-slider {
            background-color: #8AA9FF;
        }
        input:checked + .toggle-slider:before {
            transform: translateX(30px);
        }
        .select-dropdown {
            padding: 0.5rem 1rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            border-radius: 5px;
            min-width: 150px;
        }
        .frequency-options {
            display: flex;
            gap: 1rem;
            margin-top: 0.5rem;
        }
        .frequency-option {
            padding: 0.5rem 1rem;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }
        .frequency-option.active {
            background: #8AA9FF;
            color: white;
        }
        .notification-test {
            display: flex;
            gap: 1rem;
            align-items: center;
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }
        .notification-test-input {
            flex: 1;
            padding: 0.5rem 1rem;
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            border-radius: 5px;
        }
        .test-notification {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #8AA9FF;
            color: white;
            padding: 1rem 1.5rem;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            z-index: 1000;
            display: none;
            animation: slideIn 0.3s ease-out;
        }
        @keyframes slideIn {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        .save-section {
            margin-top: 3rem;
            padding-top: 2rem;
            border-top: 1px solid rgba(255, 255, 255, 0.2);
            display: flex;
            justify-content: flex-end;
            gap: 1rem;
        }
        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: white;
        }
        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }
            .settings-grid {
                grid-template-columns: 1fr;
            }
            .setting-item {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }
            .toggle-switch {
                margin-left: 0;
                align-self: flex-end;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="nav">
            <a href="${pageContext.request.contextPath}/notifications">Notification Center</a>
            <a href="${pageContext.request.contextPath}/notifications/list">Notification List</a>
            <a href="${pageContext.request.contextPath}/notifications/settings" class="active">Settings</a>
            <a href="${pageContext.request.contextPath}/">Dashboard</a>
        </div>
        
        <div class="header">
            <h1>Notification Settings</h1>
            <button class="btn" id="saveSettingsBtn">Save Settings</button>
        </div>
        
        <div class="settings-grid">
            <!-- Notification Channels -->
            <div class="settings-card">
                <h3>📱 Notification Channels</h3>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">In-App Notifications</div>
                        <div class="setting-description">Show notifications within the application</div>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" id="inAppNotifications" checked>
                        <span class="toggle-slider"></span>
                    </label>
                </div>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Email Notifications</div>
                        <div class="setting-description">Send notifications to your email address</div>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" id="emailNotifications" checked>
                        <span class="toggle-slider"></span>
                    </label>
                </div>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Push Notifications</div>
                        <div class="setting-description">Receive push notifications on your device</div>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" id="pushNotifications">
                        <span class="toggle-slider"></span>
                    </label>
                </div>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">SMS Notifications</div>
                        <div class="setting-description">Receive important alerts via SMS</div>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" id="smsNotifications">
                        <span class="toggle-slider"></span>
                    </label>
                </div>
            </div>
            
            <!-- Notification Types -->
            <div class="settings-card">
                <h3>🔔 Notification Types</h3>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Experiment Approvals</div>
                        <div class="setting-description">Get notified when experiments need approval</div>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" id="approvalNotifications" checked>
                        <span class="toggle-slider"></span>
                    </label>
                </div>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Low Stock Alerts</div>
                        <div class="setting-description">Receive alerts when inventory is low</div>
                    </div>
                    <select class="select-dropdown" id="stockAlertLevel">
                        <option value="immediate">Immediate Alerts</option>
                        <option value="daily">Daily Summary</option>
                        <option value="weekly">Weekly Report</option>
                        <option value="none">No Alerts</option>
                    </select>
                </div>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Schedule Updates</div>
                        <div class="setting-description">Notifications for lab schedule changes</div>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" id="scheduleNotifications" checked>
                        <span class="toggle-slider"></span>
                    </label>
                </div>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">System Messages</div>
                        <div class="setting-description">Important system announcements</div>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" id="systemNotifications" checked>
                        <span class="toggle-slider"></span>
                    </label>
                </div>
            </div>
            
            <!-- Notification Frequency -->
            <div class="settings-card">
                <h3>⏰ Notification Frequency</h3>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Email Summary Frequency</div>
                        <div class="setting-description">How often to receive email summaries</div>
                    </div>
                    <select class="select-dropdown" id="emailFrequency">
                        <option value="realtime">Real-time</option>
                        <option value="hourly">Hourly</option>
                        <option value="daily" selected>Daily</option>
                        <option value="weekly">Weekly</option>
                    </select>
                </div>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Quiet Hours</div>
                        <div class="setting-description">Mute non-urgent notifications during these hours</div>
                    </div>
                    <div>
                        <input type="time" id="quietStart" value="22:00" class="select-dropdown" style="width: 100px;">
                        <span style="margin: 0 0.5rem;">to</span>
                        <input type="time" id="quietEnd" value="07:00" class="select-dropdown" style="width: 100px;">
                    </div>
                </div>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Urgent Notifications</div>
                        <div class="setting-description">Always receive urgent notifications</div>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" id="urgentOverride" checked>
                        <span class="toggle-slider"></span>
                    </label>
                </div>
            </div>
            
            <!-- Sound & Display -->
            <div class="settings-card">
                <h3>🎵 Sound & Display</h3>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Notification Sound</div>
                        <div class="setting-description">Play sound for new notifications</div>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" id="notificationSound" checked>
                        <span class="toggle-slider"></span>
                    </label>
                </div>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Desktop Notifications</div>
                        <div class="setting-description">Show desktop notifications</div>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" id="desktopNotifications" checked>
                        <span class="toggle-slider"></span>
                    </label>
                </div>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Notification Duration</div>
                        <div class="setting-description">How long notifications stay visible</div>
                    </div>
                    <select class="select-dropdown" id="notificationDuration">
                        <option value="5">5 seconds</option>
                        <option value="10" selected>10 seconds</option>
                        <option value="30">30 seconds</option>
                        <option value="manual">Until dismissed</option>
                    </select>
                </div>
                <div class="setting-item">
                    <div class="setting-info">
                        <div class="setting-title">Vibration (Mobile)</div>
                        <div class="setting-description">Vibrate for notifications on mobile</div>
                    </div>
                    <label class="toggle-switch">
                        <input type="checkbox" id="vibrationEnabled">
                        <span class="toggle-slider"></span>
                    </label>
                </div>
                
                <div class="notification-test">
                    <input type="text" class="notification-test-input" id="testMessage" placeholder="Enter test notification message" value="This is a test notification">
                    <button class="btn" id="testNotificationBtn">Test Notification</button>
                </div>
            </div>
        </div>
        
        <div class="save-section">
            <button class="btn btn-secondary" id="resetSettingsBtn">Reset to Default</button>
            <button class="btn" id="saveSettingsBottomBtn">Save All Settings</button>
        </div>
        
        <!-- Test Notification -->
        <div class="test-notification" id="testNotification">
            <div style="font-weight: 500;">Test Notification</div>
            <div id="testNotificationMessage" style="font-size: 0.9rem; margin-top: 0.25rem;"></div>
            <button onclick="hideTestNotification()" style="position: absolute; top: 5px; right: 5px; background: none; border: none; color: white; cursor: pointer; font-size: 1.2rem;">×</button>
        </div>
    </div>
    
    <script>
        // ==================== 事件绑定 ====================
        document.addEventListener('DOMContentLoaded', function() {
            // 加载保存的设置
            loadSettings();
            
            // 绑定保存按钮
            document.getElementById('saveSettingsBtn').addEventListener('click', saveSettings);
            document.getElementById('saveSettingsBottomBtn').addEventListener('click', saveSettings);
            
            // 绑定重置按钮
            document.getElementById('resetSettingsBtn').addEventListener('click', resetSettings);
            
            // 绑定测试通知按钮
            document.getElementById('testNotificationBtn').addEventListener('click', testNotification);
            
            // 绑定静音时间输入框
            document.getElementById('quietStart').addEventListener('change', updateQuietHours);
            document.getElementById('quietEnd').addEventListener('change', updateQuietHours);
        });
        
        // ==================== 设置管理 ====================
        let currentSettings = {};
        
        function loadSettings() {
            // 尝试从localStorage加载设置
            const savedSettings = localStorage.getItem('notificationSettings');
            if (savedSettings) {
                currentSettings = JSON.parse(savedSettings);
                applySettings(currentSettings);
            } else {
                // 使用默认设置
                currentSettings = getDefaultSettings();
                applySettings(currentSettings);
            }
        }
        
        function getDefaultSettings() {
            return {
                // 通知渠道
                inAppNotifications: true,
                emailNotifications: true,
                pushNotifications: false,
                smsNotifications: false,
                
                // 通知类型
                approvalNotifications: true,
                stockAlertLevel: 'immediate',
                scheduleNotifications: true,
                systemNotifications: true,
                
                // 通知频率
                emailFrequency: 'daily',
                quietStart: '22:00',
                quietEnd: '07:00',
                urgentOverride: true,
                
                // 声音与显示
                notificationSound: true,
                desktopNotifications: true,
                notificationDuration: '10',
                vibrationEnabled: false
            };
        }
        
        function applySettings(settings) {
            // 通知渠道
            document.getElementById('inAppNotifications').checked = settings.inAppNotifications;
            document.getElementById('emailNotifications').checked = settings.emailNotifications;
            document.getElementById('pushNotifications').checked = settings.pushNotifications;
            document.getElementById('smsNotifications').checked = settings.smsNotifications;
            
            // 通知类型
            document.getElementById('approvalNotifications').checked = settings.approvalNotifications;
            document.getElementById('stockAlertLevel').value = settings.stockAlertLevel;
            document.getElementById('scheduleNotifications').checked = settings.scheduleNotifications;
            document.getElementById('systemNotifications').checked = settings.systemNotifications;
            
            // 通知频率
            document.getElementById('emailFrequency').value = settings.emailFrequency;
            document.getElementById('quietStart').value = settings.quietStart;
            document.getElementById('quietEnd').value = settings.quietEnd;
            document.getElementById('urgentOverride').checked = settings.urgentOverride;
            
            // 声音与显示
            document.getElementById('notificationSound').checked = settings.notificationSound;
            document.getElementById('desktopNotifications').checked = settings.desktopNotifications;
            document.getElementById('notificationDuration').value = settings.notificationDuration;
            document.getElementById('vibrationEnabled').checked = settings.vibrationEnabled;
        }
        
        function saveSettings() {
            const settings = collectSettings();
            currentSettings = settings;
            
            // 保存到localStorage
            localStorage.setItem('notificationSettings', JSON.stringify(settings));
            
            // 显示成功消息
            showNotification('Settings saved successfully!', 'success');
            
            // 模拟保存到服务器
            console.log('Saving settings to server:', settings);
            // fetch('/api/notification-settings', {
            //     method: 'POST',
            //     headers: {
            //         'Content-Type': 'application/json'
            //     },
            //     body: JSON.stringify(settings)
            // });
        }
        
        function collectSettings() {
            return {
                // 通知渠道
                inAppNotifications: document.getElementById('inAppNotifications').checked,
                emailNotifications: document.getElementById('emailNotifications').checked,
                pushNotifications: document.getElementById('pushNotifications').checked,
                smsNotifications: document.getElementById('smsNotifications').checked,
                
                // 通知类型
                approvalNotifications: document.getElementById('approvalNotifications').checked,
                stockAlertLevel: document.getElementById('stockAlertLevel').value,
                scheduleNotifications: document.getElementById('scheduleNotifications').checked,
                systemNotifications: document.getElementById('systemNotifications').checked,
                
                // 通知频率
                emailFrequency: document.getElementById('emailFrequency').value,
                quietStart: document.getElementById('quietStart').value,
                quietEnd: document.getElementById('quietEnd').value,
                urgentOverride: document.getElementById('urgentOverride').checked,
                
                // 声音与显示
                notificationSound: document.getElementById('notificationSound').checked,
                desktopNotifications: document.getElementById('desktopNotifications').checked,
                notificationDuration: document.getElementById('notificationDuration').value,
                vibrationEnabled: document.getElementById('vibrationEnabled').checked
            };
        }
        
        function resetSettings() {
            if (confirm('Reset all settings to default?')) {
                const defaultSettings = getDefaultSettings();
                applySettings(defaultSettings);
                showNotification('Settings reset to default', 'info');
            }
        }
        
        // ==================== 静音时间更新 ====================
        function updateQuietHours() {
            const start = document.getElementById('quietStart').value;
            const end = document.getElementById('quietEnd').value;
            
            // 验证时间格式
            if (start && end) {
                console.log(`Quiet hours updated: ${start} to ${end}`);
                
                // 检查时间是否合理
                if (start === end) {
                    showNotification('Quiet hours cannot be the same start and end time', 'warning');
                }
            }
        }
        
        // ==================== 测试通知 ====================
        function testNotification() {
            const message = document.getElementById('testMessage').value || 'This is a test notification';
            
            // 显示测试通知
            const testNotification = document.getElementById('testNotification');
            const messageElement = document.getElementById('testNotificationMessage');
            
            messageElement.textContent = message;
            testNotification.style.display = 'block';
            
            // 根据设置自动隐藏
            const duration = parseInt(document.getElementById('notificationDuration').value);
            if (duration > 0) {
                setTimeout(() => {
                    hideTestNotification();
                }, duration * 1000);
            }
            
            // 播放声音（如果启用）
            if (document.getElementById('notificationSound').checked) {
                playNotificationSound();
            }
            
            // 显示成功消息
            showNotification('Test notification sent!', 'success');
        }
        
        function hideTestNotification() {
            const testNotification = document.getElementById('testNotification');
            testNotification.style.display = 'none';
        }
        
        function playNotificationSound() {
            // 创建一个简单的通知声音
            try {
                const audioContext = new (window.AudioContext || window.webkitAudioContext)();
                const oscillator = audioContext.createOscillator();
                const gainNode = audioContext.createGain();
                
                oscillator.connect(gainNode);
                gainNode.connect(audioContext.destination);
                
                oscillator.frequency.value = 800;
                oscillator.type = 'sine';
                
                gainNode.gain.setValueAtTime(0.1, audioContext.currentTime);
                gainNode.gain.exponentialRampToValueAtTime(0.01, audioContext.currentTime + 0.5);
                
                oscillator.start(audioContext.currentTime);
                oscillator.stop(audioContext.currentTime + 0.5);
            } catch (error) {
                console.log('Audio not supported or permission denied');
            }
        }
        
        // ==================== 通用通知函数 ====================
        function showNotification(message, type = 'info') {
            // 创建一个临时通知元素
            const notification = document.createElement('div');
            notification.className = 'test-notification';
            notification.style.background = type === 'success' ? '#4CAF50' : 
                                          type === 'warning' ? '#FFC107' : 
                                          type === 'error' ? '#FF5252' : '#8AA9FF';
            
            notification.innerHTML = `
                <div style="font-weight: 500;">${type.charAt(0).toUpperCase() + type.slice(1)}</div>
                <div style="font-size: 0.9rem; margin-top: 0.25rem;">${message}</div>
                <button onclick="this.parentElement.remove()" style="position: absolute; top: 5px; right: 5px; background: none; border: none; color: white; cursor: pointer; font-size: 1.2rem;">×</button>
            `;
            
            document.body.appendChild(notification);
            
            // 位置调整
            const existingNotifications = document.querySelectorAll('.test-notification');
            const topPosition = 20 + (existingNotifications.length - 1) * 80;
            notification.style.top = `${topPosition}px`;
            notification.style.right = '20px';
            
            // 自动移除
            setTimeout(() => {
                if (notification.parentElement) {
                    notification.remove();
                }
            }, 3000);
        }
        
        // ==================== 导出功能（用于调试） ====================
        function exportSettings() {
            const settings = collectSettings();
            const blob = new Blob([JSON.stringify(settings, null, 2)], { type: 'application/json' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = 'notification-settings.json';
            a.click();
            URL.revokeObjectURL(url);
        }
        
        function importSettings(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    try {
                        const settings = JSON.parse(e.target.result);
                        applySettings(settings);
                        showNotification('Settings imported successfully!', 'success');
                    } catch (error) {
                        showNotification('Invalid settings file', 'error');
                    }
                };
                reader.readAsText(file);
            }
        }
        
        // 导出到window对象以便在控制台调试
        window.exportSettings = exportSettings;
        window.importSettings = importSettings;
        window.showTestNotification = testNotification;
        
        console.log('Debug commands available:');
        console.log('- exportSettings(): Export current settings as JSON');
        console.log('- importSettings(): Use file input to import settings');
        console.log('- showTestNotification(): Show a test notification');
    </script>
    
    <!-- 导入设置文件输入 -->
    <input type="file" id="importFileInput" accept=".json" style="display: none;" onchange="importSettings(event)">
</body>
</html>