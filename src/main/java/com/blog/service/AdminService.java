package com.blog.service;

import com.blog.domain.Admin;

public interface AdminService {
	Admin getByUsername(String username);
}
