package com.blog.dao;

import com.blog.domain.AdminLoginLog;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminLoginLogDao {

    int insert(AdminLoginLog record);

    List<AdminLoginLog> selectRencent(Integer adminId);

    int selectCountByAdminId(Integer adminId);
    }