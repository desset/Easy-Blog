package com.blog.web;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.domain.Admin;
import com.blog.domain.AdminLoginLog;
import com.blog.service.impl.AdminLoginLogServiceImpl;
import com.blog.service.impl.AdminServiceImpl;

@Controller
public class LoginController {
	@Autowired
	AdminServiceImpl adminService;
	@Autowired
	AdminLoginLogServiceImpl adminLoginLogService;
	
	@RequestMapping("login")
	public String login(HttpServletRequest request, ModelMap modelMap) {
		System.out.println("@RequestMapping(login)");
		return "admin/login";}
	
	@RequestMapping("subLogin")
	@ResponseBody
	public Object login(HttpServletRequest request, ModelMap modelMap, String username,String password) {
		System.out.println("subLogin-------get------");
//      主体提交请求进行验证
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		/*
		 * try { System.out.println("-------------rememberMe: "+user.getRememberMe());
		 * token.setRememberMe((boolean)user.getRememberMe()); subject.login(token); }
		 * catch (AuthenticationException e) {
		 * System.out.println("error:"+e.getMessage()); return e.getMessage(); }
		 */
		System.out.println(password + "-----subLogin---password");
		try {
			subject.login(token);
		} catch (AuthenticationException e) {
			System.out.println("error:" + e.getMessage());
			return e.getMessage();
		}
//		request.getSession().setAttribute("admin", adminService.getByUsername(user.getUsername()));
		String clientIp = request.getRemoteAddr();
//		Admin admin = (Admin) request.getSession().getAttribute("admin");
		Admin admin = adminService.getByUsername(username);
		request.getSession().setAttribute("admin",admin);
		System.out.println("userId:"+admin.getId());
		AdminLoginLog newLogin = new AdminLoginLog();
		newLogin.setDate(new Date());
		newLogin.setAdminId(admin.getId());
		newLogin.setIp(clientIp);
		adminLoginLogService.insert(newLogin);
//		SavedRequest savedRequest = WebUtils.getSavedRequest(request);
//		String url = "/";
//		if (savedRequest != null) {
//			url = savedRequest.getRequestUrl();
//		}
//		System.out.println("subLogin------login-success--------");
//		System.out.println("get_savedUrl..........." + url);
//		String res = "";
//		if (subject.hasRole("admin")) { res = "admin"; } else { res = "no admin"; }
//		if (subject.isPermitted("admin:update")) { res += " admin:update"; } else {
//		res += " no admin:update"; } if (subject.isPermitted("admin:add")) { res +=
//		" admin:add"; } else { res += " no admin:add"; 		 
		// modelMap.addAttribute("message",res);
		HashMap<String, String> res = new HashMap<String, String>();
//		res.put("url", url);
		return res;
	}
}
