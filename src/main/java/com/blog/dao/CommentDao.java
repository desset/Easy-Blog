package com.blog.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.blog.domain.Comment;

/** 
 * @ClassName: CommnetDao
 * @description: 
 * @author: Dx
 * @Date: 2019年11月25日 上午10:18:18
 */
@Repository
public interface CommentDao {
	List<Comment> queryAll(@Param("article_id") int article_id,@Param("offset") int offset,@Param("limit") int limit);
	int insert(Comment comment);
	int countAllNum();
	int deleteByPrimaryKey(Long id);
} 
