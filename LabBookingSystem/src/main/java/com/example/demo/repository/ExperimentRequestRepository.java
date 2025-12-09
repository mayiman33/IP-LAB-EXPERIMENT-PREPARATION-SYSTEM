package com.example.demo.repository;

import com.example.demo.model.ExperimentRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface ExperimentRequestRepository extends JpaRepository<ExperimentRequest, Integer> {
    // Integer 是主键的类型（requestId）
    
    // 按用户ID查找请求
    List<ExperimentRequest> findByUserIdOrderByCreatedAtDesc(Integer userId);
    
    // 按状态查找请求
    List<ExperimentRequest> findByStatusOrderByCreatedAtDesc(String status);
    
    // 查找待处理的请求
    List<ExperimentRequest> findByStatus(String status);
    
    // 更新请求状态
    @Modifying
    @Transactional
    @Query("UPDATE ExperimentRequest r SET r.status = :status, r.adminNotes = :adminNotes, " +
           "r.reviewedBy = :reviewedBy, r.reviewedAt = CURRENT_TIMESTAMP WHERE r.requestId = :requestId")
    int updateRequestStatus(@Param("requestId") Integer requestId, 
                           @Param("status") String status,
                           @Param("adminNotes") String adminNotes,
                           @Param("reviewedBy") Integer reviewedBy);
    
    // 使用原生查询获取带有用户信息的请求列表
    @Query(value = "SELECT er.*, u.full_name as user_name, u.email as user_email " +
                   "FROM experiment_requests er " +
                   "LEFT JOIN users u ON er.user_id = u.user_id " +  // 使用 LEFT JOIN
                   "ORDER BY er.created_at DESC", nativeQuery = true)
    List<Object[]> findAllRequestsWithUserInfo();
    
    @Query(value = "SELECT er.*, u.full_name as user_name, u.email as user_email " +
                   "FROM experiment_requests er " +
                   "LEFT JOIN users u ON er.user_id = u.user_id " +  // 使用 LEFT JOIN
                   "WHERE er.user_id = :userId " +
                   "ORDER BY er.created_at DESC", nativeQuery = true)
    List<Object[]> findRequestsByUserIdWithUserInfo(@Param("userId") Integer userId);
    
    // 添加一个简单的 count 方法（JPA会自动实现）
    long countByStatus(String status);
}