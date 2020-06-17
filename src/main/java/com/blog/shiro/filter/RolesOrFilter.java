package com.blog.shiro.filter;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;


public class RolesOrFilter extends AuthorizationFilter {

    protected boolean isAccessAllowed(javax.servlet.ServletRequest servletRequest, javax.servlet.ServletResponse servletResponse, Object o) throws Exception {
    	System.out.println("-----------------------------rolesOrFilter");
    	Subject subjecj = getSubject(servletRequest, servletResponse);
        String[] roles = (String[]) o;      
        if(roles == null || roles.length == 0) {
        	System.out.println("-----------------------------rolesOrFilter");
            return true;
        }
        System.out.println("-----------------------------rolesOrFilter "+roles[0]);
        for(String role : roles) {
            if(subjecj.hasRole(role))
                return true;
        }
        return false;
    }
}
