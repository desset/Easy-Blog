package com.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blog.dao.CommentDao;
import com.blog.domain.Comment;
import com.blog.service.CommentService;


/** 
 * @ClassName: CommentServiceImpl
 * @description: 
 * @author: Dx
 * @Date: 2019年11月25日 上午10:11:31
 */
@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	public CommentDao commentDao;
	public List<Comment> allComments(int article_id, int offset, int limit){
		return commentDao.queryAll(article_id,offset,limit);
	}
	@Override
	public int insertComment(Comment comment) {
		
		return commentDao.insert(comment);
	}
	@Override
	public int countAllNum() {
		// TODO Auto-generated method stub
		return commentDao.countAllNum();
	}
	@Override
	public boolean delById(Long id) {
		// TODO Auto-generated method stub
		return commentDao.deleteByPrimaryKey(id)>0;
	}
	
	
} 
