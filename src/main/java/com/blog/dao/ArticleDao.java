package com.blog.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.blog.domain.Article;

@Repository
public interface ArticleDao {
    int deleteByPrimaryKey(Integer id);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer id);

    Article selectLastArticle(Integer id);

    Article selectNextArticle(Integer id);

    int updateByPrimaryKeySelective(Article record);

    int countAllNum();

    List<Article> queryAll();

    List<Article> selectByWord(String word);
}