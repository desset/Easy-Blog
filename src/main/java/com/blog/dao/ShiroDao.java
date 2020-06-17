package com.blog.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface ShiroDao {
	List<String> getRolesByUsername(String username);
	List<String> getPermissionsByUsername(String username);
}