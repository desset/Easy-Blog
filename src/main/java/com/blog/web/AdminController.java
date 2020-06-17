package com.blog.web;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.blog.domain.Admin;
import com.blog.domain.AdminLoginLog;
import com.blog.domain.Article;
import com.blog.service.impl.AdminLoginLogServiceImpl;
import com.blog.service.impl.ArticleServiceImpl;
import com.blog.service.impl.CommentServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class AdminController {
	@Autowired
	ArticleServiceImpl articleService;
	@Autowired
	CommentServiceImpl commentService;
	@Autowired
	AdminLoginLogServiceImpl adminLoginLogService;
	
	@RequestMapping("main")
	public ModelAndView main(HttpServletRequest request) {
		System.out.println("getmain-------------------");
		ModelAndView modelAndView = new ModelAndView("admin/main");

		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String clientIp = request.getRemoteAddr(); // 获取客户端IP，如：127.0.0.1
		String hostIp = request.getLocalAddr();
		int hostPort = request.getLocalPort();
		// html页面不能直接处理Date类型，需要在后台转化成为String类型再传值到前台
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm");// 设置日期格式
		String dates = df.format(date);
		int articleCount = articleService.selectCount();
		int commentCount = commentService.countAllNum();
		int loginNum = adminLoginLogService.selectCountByAdminId(admin.getId());
		AdminLoginLog adminLoginLog = null;
		try {
			if (adminLoginLogService.selectRencent(admin.getId()) != null
					&& adminLoginLogService.selectRencent(admin.getId()).size() == 2) {
				List<AdminLoginLog> adminLoginLogs = adminLoginLogService.selectRencent(admin.getId());
				adminLoginLog = adminLoginLogs.get(1);
				System.out.println(adminLoginLog.getIp());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			modelAndView.addObject("loginLog", adminLoginLog);
		}

		modelAndView.addObject("admin", admin);
		modelAndView.addObject("clientIp", clientIp);
		modelAndView.addObject("hostIp", hostIp);
		modelAndView.addObject("hostPort", hostPort);
		modelAndView.addObject("date", dates);
		modelAndView.addObject("articleCount", articleCount);
		modelAndView.addObject("commentCount", commentCount);
		modelAndView.addObject("loginNum", loginNum);
		return modelAndView;
	}
	
	@RequestMapping("search")
	public ModelAndView search(HttpServletRequest request,
			@RequestParam(required = true, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "10") Integer pageSize) throws UnsupportedEncodingException {
		System.out.println("search-------------------");
		// get方法提交的参数不会转码，所以需要转换编码
		String word = request.getParameter("word");
		word = new String(word.getBytes("iso8859-1"), "utf-8");
		PageHelper.startPage(page, pageSize);
		List<Article> articles = articleService.selectByWord(word);
		PageInfo<Article> pageInfo = new PageInfo<Article>(articles);
		ModelAndView modelAndView = new ModelAndView("admin/article_list");
		modelAndView.addObject("articles", articles);
		modelAndView.addObject("pageInfo", pageInfo);
		return modelAndView;
	}
	
	@RequestMapping("logout")
	public String logout() {
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "redirect:/index";
	}
}
