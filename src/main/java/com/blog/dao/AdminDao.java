package com.blog.dao;


import org.springframework.stereotype.Repository;

import com.blog.domain.Admin;

@Repository
public interface AdminDao {
    Admin selectByPrimaryKey(String username);
}