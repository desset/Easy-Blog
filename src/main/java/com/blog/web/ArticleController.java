package com.blog.web;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.blog.domain.Article;
import com.blog.domain.Comment;
import com.blog.service.impl.ArticleServiceImpl;
import com.blog.service.impl.CommentServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class ArticleController {
	@Autowired
	ArticleServiceImpl articleService;
	@Autowired
	CommentServiceImpl commentService;
	
	@RequestMapping("/article")
	public ModelAndView detail(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		List<Comment> comments = commentService.allComments(id, 0, 10);
		ListIterator<Comment> listIterator = comments.listIterator();
		while (listIterator.hasNext()) {
			System.out.println("comments----------------------");
			System.out.print(listIterator.next().getContent());
		}
		Article article = articleService.selectById(id);
		article.setClick(article.getClick()+1);
		System.out.println("click:"+article.getClick());
		articleService.updateArticle(article);
		Article lastArticle = articleService.selectLastArticle(id);
		Article nextArticle = articleService.selectNextArticle(id);
		System.out.println("article----------------------");
		System.out.println(article.getContent());
		// System.out.println(lastArticle.getId()+"---------------lastarticleId");
		// System.out.println(nextArticle.getId()+"---------------nextarticleId");
		ModelAndView modelAndView = new ModelAndView("/detail");
		modelAndView.addObject("comments", comments);
		modelAndView.addObject("article", article);
		modelAndView.addObject("lastArticle", lastArticle);
		modelAndView.addObject("nextArticle", nextArticle);
		return modelAndView;
	}

	@RequestMapping("/addComment")
	@ResponseBody
	public Object addComment(HttpServletRequest request) {
		System.out.println("addComment-----------------");
		Comment comment = new Comment();
		comment.setContent(request.getParameter("content"));
		System.out.println("content:"+request.getParameter("content"));
		comment.setDate(new Date());
		comment.setName(request.getParameter("name"));
		comment.setEmail(request.getParameter("email"));
		// parseLong将string转化为long
		comment.setArticleId(Long.parseLong(request.getParameter("articleId")));
		HashMap<String, String> res = new HashMap<String, String>();
		if (commentService.insertComment(comment) > 0) {
			res.put("stateCode", "1");
		} else {
			res.put("stateCode", "0");
		}
		return res;
	}
	@RequestMapping("article_add")
	public ModelAndView add(HttpServletRequest request) {
		System.out.println("getadd-------------------");
		ModelAndView modelAndView = new ModelAndView("admin/article_add");
		// modelAndView.addObject("succ", "test_succ");
		return modelAndView;
	}

	@RequestMapping("article_add/do")
	public String adddo(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		Article article = new Article();
		System.out.println("getadddo-------------------");
		article.setTitle(StringUtils.HTMLTransfer(request.getParameter("title")));
		article.setCatalogId(Integer.parseInt(request.getParameter("catalogId")));
		article.setKeywords(StringUtils.HTMLTransfer(request.getParameter("keywords")));
		article.setdesci(StringUtils.HTMLTransfer(request.getParameter("desci")));
		article.setContent(request.getParameter("content"));
		article.setTime(new Date());
		if (articleService.insert(article)) {
			redirectAttributes.addFlashAttribute("succ", "发表成功！");
			return "redirect:/article_add";
		} else {
			redirectAttributes.addFlashAttribute("error", "发表失败！");
			return "redirect:/article_add";
		}

	}

	@RequestMapping("article_list")
	public ModelAndView article_list(@RequestParam(required = true, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "10") Integer pageSize) {
		// PageHelper只对之后的第一条查询语句进行分页
		PageHelper.startPage(page, pageSize);
		List<Article> articles = articleService.queryAll();
		PageInfo<Article> pageInfo = new PageInfo<Article>(articles);
		System.out.println("get_article_list-------------------");
		ModelAndView modelAndView = new ModelAndView("admin/article_list");

		modelAndView.addObject("articles", articles);
		modelAndView.addObject("pageInfo", pageInfo);
		System.out.println(pageInfo.getPageSize() + "   getPageSize---------------------");
		System.out.println(pageInfo.getPages() + "  getPages-----------------------");
		return modelAndView;
	}

	@RequestMapping("comment")
	public ModelAndView comment(HttpServletRequest request) {
		System.out.println("get_comment_list-------------------");
		ModelAndView modelAndView = new ModelAndView("admin/comment_list");
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("get_id----" + id + "------------------");
		List<Comment> comments = commentService.allComments(id, 0, 10);

		if (comments.size() != 0) {
			modelAndView.addObject("comments", comments);
		}
		return modelAndView;

	}

	@RequestMapping("/comment/delete")
	@ResponseBody
	public Object comment_delete(HttpServletRequest request) {
		System.out.println("get_comment_delete-------------------");
		Long id = Long.parseLong(request.getParameter("id"));
		HashMap<String, String> res = new HashMap<String, String>();
		if (commentService.delById(id)) {
			res.put("stateCode", "1");
		} else {
			res.put("stateCode", "0");
		}
		System.out.println("get_stateCode......." + res.get("stateCode"));
		return res;

	}
	@RequestMapping("edit")
	public ModelAndView article_edit(HttpServletRequest request) {
		System.out.println("article_edit_get..................");
		ModelAndView modelAndView = new ModelAndView("admin/article_edit");
		Article article = null;
		int id = Integer.parseInt(request.getParameter("id"));
		if (articleService.selectById(id) != null) {
			article = articleService.selectById(id);
		}
		System.out.println(article.getContent());
		modelAndView.addObject("article", article);
		return modelAndView;
	}

	@RequestMapping("/edit/do")
	public ModelAndView edit_do(HttpServletRequest request) {
		System.out.println("get_edit_do-------------------");

		Article article = new Article();
		article.setId(Integer.parseInt(request.getParameter("id")));
		System.out.println(StringUtils.HTMLTransfer("title length:"+request.getParameter("title")).length());
		article.setTitle(StringUtils.HTMLTransfer(request.getParameter("title")));
		article.setKeywords(StringUtils.HTMLTransfer(request.getParameter("keywords")));
		article.setdesci(StringUtils.HTMLTransfer(request.getParameter("desci")));
		article.setContent(request.getParameter("content"));
		System.out.println("content:");
		System.out.println(request.getParameter("content"));
		article.setCatalogId(Integer.parseInt(request.getParameter("catalogId")));
		ModelAndView modelAndView = new ModelAndView("/admin/article_edit");
		if (articleService.updateArticle(article)) {
			modelAndView.addObject("succ", "success！");
		} else {
			modelAndView.addObject("error", "fail！");
		}
		modelAndView.addObject("article", article);
		return modelAndView;
	}
	
	@RequestMapping("article_del")
	@ResponseBody
	public HashMap<String, String> article_del(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		System.out.println("@RequestMapping(\"article_del\")");
		HashMap<String, String> res = new HashMap<String, String>();
		String id = request.getParameter("id");
		if(articleService.deleteById(Integer.valueOf(id))!=0) {
			res.put("stateCode", "1");
		}else {
			res.put("stateCode", "0");
		}			
		return res;
	}
}
