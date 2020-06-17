package com.blog.web;

import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.blog.domain.Article;
import com.blog.service.impl.ArticleServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class IndexController {
	@Autowired
	ArticleServiceImpl articleService;
	//测试
//	@RequestMapping(value = "test_dao")
//	public Object test_dao() {
//		List<String> list = shiroDao.getRolesByUsername("sun");
//		System.out.println("get_test_dao................");
//		System.out.println("get_role.................." + list.get(0));
//		List<String> list2 = shiroDao.getPermissionsByUsername("sun");
//		System.out.println("get_permission.................." + list2.get(0));
//		return "test";
//	}

	//测试
	// 被shiro拦截了，重定向到login.html
//	@RequestMapping("freemarker")
//	public String freemarker(HttpServletRequest request, ModelMap modelMap) {
//		System.out.println("freemarker---------");
//		modelMap.addAttribute("message", "blog");
//		return "test";
//	}

	//测试
//	@RequestMapping("message")
//	public ModelAndView about(HttpServletRequest request, ModelMap modelMap) {
//		/*
//		 * if(adminService.getById(10000)!=null){
//		 * System.out.println(adminService.getById(10000).getUsername());
//		 * modelMap.addAttribute("message", adminService.getById(10000).getUsername());
//		 * } else { System.out.println("0"); }
//		 */
//		ModelAndView modelAndView = new ModelAndView("test");
//		modelAndView.addObject("message", "hahaha");
//		List<Article> articles = articleService.queryAll();
//		System.out.println("articles------------");
//		ListIterator<Article> listIterator = articles.listIterator();
//		while (listIterator.hasNext()) {
//			System.out.print(listIterator.next().getdesci());
//			System.out.println("----------------------");
//		}
//		modelAndView.addObject("articles", articles);
//		if (userDao.getUserByUsername("sun") != null) {
//			System.out.println(userDao.getUserByUsername("sun").getUsername());
//			// modelMap.addAttribute("message",
//			// userDao.getUserByUsername("sun").getPassword());
//		} else {
//			System.out.println("0");
//		}
//		return modelAndView;
//	}

	@RequestMapping({"/index", "/"})
	public ModelAndView index(
			@RequestParam(required = true, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "5") Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		ModelAndView modelAndView = new ModelAndView("/index");
		List<Article> articles = articleService.queryAll();
		PageInfo<Article> pageInfo = new PageInfo<Article>(articles);
		System.out.println("articles------------");
		ListIterator<Article> listIterator = articles.listIterator();
		while (listIterator.hasNext()) {
			System.out.print(listIterator.next().getdesci());
			System.out.println("----------------------");
		}
		modelAndView.addObject("articles", articles);
		modelAndView.addObject("pageInfo", pageInfo);
		return modelAndView;
	}

	@RequestMapping("detail")
	public ModelAndView article_detail(HttpServletRequest request) {
		System.out.println("article_detail_get..................");
		ModelAndView modelAndView = new ModelAndView("admin/article_detail");
		Article article = null;
		int id = Integer.parseInt(request.getParameter("id"));
		if (articleService.selectById(id) != null) {
			article = articleService.selectById(id);
		}		
		modelAndView.addObject("article", article);
		return modelAndView;
	}

}
