package com.example.demo.service;

import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.PostConstruct;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    @PostConstruct
    public void init() {
        System.out.println("UserService初始化，检查H2数据库...");
        try {
            long count = userRepository.count();
            System.out.println("✅ H2数据库连接成功！用户总数: " + count);
            
            // 如果数据库为空，插入一些测试数据
            if (count == 0) {
                insertDefaultUsers();
            }
            
        } catch (Exception e) {
            System.out.println("❌ H2数据库连接失败: " + e.getMessage());
            System.out.println("将使用模拟认证模式");
        }
    }
    
    private void insertDefaultUsers() {
        System.out.println("插入默认用户数据...");
        
        // 管理员用户
        User admin = new User();
        admin.setUsername("admin");
        admin.setPassword("admin123");
        admin.setEmail("admin@lab.edu");
        admin.setFullName("System Administrator");
        admin.setRole("admin");
        admin.setStatus("active");
        
        // 教师用户
        User teacher = new User();
        teacher.setUsername("teacher1");
        teacher.setPassword("teacher123");
        teacher.setEmail("teacher1@lab.edu");
        teacher.setFullName("Dr. Smith");
        teacher.setRole("teacher");
        teacher.setStatus("active");
        
        // 研究员用户
        User researcher = new User();
        researcher.setUsername("researcher1");
        researcher.setPassword("researcher123");
        researcher.setEmail("researcher1@lab.edu");
        researcher.setFullName("Senior Researcher");
        researcher.setRole("researcher");
        researcher.setStatus("active");
        
        // 学生用户
        User student = new User();
        student.setUsername("student1");
        student.setPassword("student123");
        student.setEmail("student1@lab.edu");
        student.setFullName("John Doe");
        student.setRole("student");
        student.setStatus("active");
        
        userRepository.save(admin);
        userRepository.save(teacher);
        userRepository.save(researcher);
        userRepository.save(student);
        
        System.out.println("✅ 默认用户数据插入完成！");
    }
    
    public User authenticate(String username, String password) {
        System.out.println("尝试认证用户: " + username);
        
        try {
            // 首先尝试从数据库认证
            Optional<User> userOpt = userRepository.findByUsernameAndPassword(username, password);
            if (userOpt.isPresent()) {
                System.out.println("✅ 数据库认证成功: " + username);
                return userOpt.get();
            }
            
            // 如果数据库中没有，尝试使用内置账户
            return authenticateWithBuiltInAccounts(username, password);
            
        } catch (Exception e) {
            System.out.println("数据库认证异常，使用内置账户: " + e.getMessage());
            return authenticateWithBuiltInAccounts(username, password);
        }
    }
    
    private User authenticateWithBuiltInAccounts(String username, String password) {
        System.out.println("使用内置账户认证: " + username);
        
        // 内置管理员账户
        if ("admin".equals(username) && "admin123".equals(password)) {
            User user = new User();
            user.setUserId(1);
            user.setUsername("admin");
            user.setPassword("admin123");
            user.setEmail("admin@lab.edu");
            user.setFullName("System Administrator");
            user.setRole("admin");
            user.setStatus("active");
            return user;
        }
        
        // 内置教师账户
        if ("teacher1".equals(username) && "teacher123".equals(password)) {
            User user = new User();
            user.setUserId(2);
            user.setUsername("teacher1");
            user.setPassword("teacher123");
            user.setEmail("teacher1@lab.edu");
            user.setFullName("Dr. Smith");
            user.setRole("teacher");
            user.setStatus("active");
            return user;
        }
        
        // 内置研究员账户
        if ("researcher1".equals(username) && "researcher123".equals(password)) {
            User user = new User();
            user.setUserId(3);
            user.setUsername("researcher1");
            user.setPassword("researcher123");
            user.setEmail("researcher1@lab.edu");
            user.setFullName("Senior Researcher");
            user.setRole("researcher");
            user.setStatus("active");
            return user;
        }
        
        // 内置学生账户
        if ("student1".equals(username) && "student123".equals(password)) {
            User user = new User();
            user.setUserId(4);
            user.setUsername("student1");
            user.setPassword("student123");
            user.setEmail("student1@lab.edu");
            user.setFullName("John Doe");
            user.setRole("student");
            user.setStatus("active");
            return user;
        }
        
        System.out.println("❌ 认证失败: 用户名或密码错误");
        return null;
    }
    
    @Transactional
    public User createUser(User user) {
        try {
            // 检查用户名是否已存在
            if (userRepository.existsByUsername(user.getUsername())) {
                throw new RuntimeException("用户名已存在: " + user.getUsername());
            }
            
            // 检查邮箱是否已存在
            if (userRepository.existsByEmail(user.getEmail())) {
                throw new RuntimeException("邮箱已存在: " + user.getEmail());
            }
            
            user.setCreatedAt(LocalDateTime.now());
            user.setUpdatedAt(LocalDateTime.now());
            
            User savedUser = userRepository.save(user);
            System.out.println("✅ 用户创建成功: " + savedUser.getUsername());
            return savedUser;
            
        } catch (Exception e) {
            System.out.println("❌ 创建用户失败: " + e.getMessage());
            throw new RuntimeException("创建用户失败: " + e.getMessage());
        }
    }
    
    public User getUserById(Integer userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("用户不存在，ID: " + userId));
    }
    
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
    
    @Transactional
    public User updateUser(User user) {
        try {
            User existingUser = getUserById(user.getUserId());
            
            // 更新用户信息
            existingUser.setEmail(user.getEmail());
            existingUser.setFullName(user.getFullName());
            existingUser.setRole(user.getRole());
            existingUser.setStatus(user.getStatus());
            existingUser.preUpdate();
            
            User updatedUser = userRepository.save(existingUser);
            System.out.println("✅ 用户更新成功: " + updatedUser.getUsername());
            return updatedUser;
            
        } catch (Exception e) {
            System.out.println("❌ 更新用户失败: " + e.getMessage());
            throw new RuntimeException("更新用户失败: " + e.getMessage());
        }
    }
    
    @Transactional
    public void deleteUser(Integer userId) {
        try {
            User user = getUserById(userId);
            userRepository.delete(user);
            System.out.println("✅ 用户删除成功: ID=" + userId);
        } catch (Exception e) {
            System.out.println("❌ 删除用户失败: " + e.getMessage());
            throw new RuntimeException("删除用户失败: " + e.getMessage());
        }
    }
}