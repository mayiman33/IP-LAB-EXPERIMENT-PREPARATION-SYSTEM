-- 插入默认管理员用户
INSERT INTO users (username, password, email, full_name, role, status) 
VALUES ('admin', 'admin123', 'admin@lab.edu', 'System Administrator', 'admin', 'active');

-- 插入示例用户数据
INSERT INTO users (username, password, email, full_name, role, status) 
VALUES 
    ('teacher1', 'teacher123', 'teacher1@lab.edu', 'Dr. Smith', 'teacher', 'active'),
    ('assistant1', 'assistant123', 'assistant1@lab.edu', 'Lab Assistant', 'assistant', 'active'),
    ('researcher1', 'researcher123', 'researcher1@lab.edu', 'Senior Researcher', 'researcher', 'active'),
    ('student1', 'student123', 'student1@lab.edu', 'John Doe', 'student', 'active'),
    ('student2', 'student123', 'student2@lab.edu', 'Jane Smith', 'student', 'inactive');

-- 插入示例实验请求数据
INSERT INTO experiment_requests (user_id, experiment_title, experiment_description, required_equipment, requested_date, requested_time_slot, status) 
VALUES 
    (2, 'Chemistry Experiment', 'Study chemical reactions with various compounds', 'Beakers, Bunsen burner, test tubes', '2025-12-10', '9:00-11:00', 'pending'),
    (3, 'Biology Lab', 'Microscopic study of plant cells', 'Microscope, slides, cover slips', '2025-12-11', '14:00-16:00', 'approved'),
    (4, 'Physics Demonstration', 'Demonstrate principles of thermodynamics', 'Heat source, thermometers', '2025-12-12', '10:00-12:00', 'rejected'),
    (5, 'Environmental Science', 'Study of water quality parameters', 'pH meter, conductivity meter, test kits', '2025-12-13', '13:00-15:00', 'pending');