package com.example.demo.repository;

import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    
    // 根据用户名查找用户
    Optional<User> findByUsername(String username);
    
    // 根据用户名和密码查找用户（用于登录）
    @Query("SELECT u FROM User u WHERE u.username = :username AND u.password = :password")
    Optional<User> findByUsernameAndPassword(@Param("username") String username, 
                                            @Param("password") String password);
    
    // 根据邮箱查找用户
    Optional<User> findByEmail(String email);
    
    // 根据角色查找用户
    List<User> findByRole(String role);
    
    // 根据状态查找用户
    List<User> findByStatus(String status);
    
    // 根据用户名或邮箱查找用户
    @Query("SELECT u FROM User u WHERE u.username = :username OR u.email = :email")
    List<User> findByUsernameOrEmail(@Param("username") String username, 
                                    @Param("email") String email);
    
    // 检查用户名是否存在
    boolean existsByUsername(String username);
    
    // 检查邮箱是否存在
    boolean existsByEmail(String email);
}