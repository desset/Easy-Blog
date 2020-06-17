package com.blog.shiro.realm;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import com.blog.dao.AdminDao;
import com.blog.dao.ShiroDao;
import com.blog.domain.Admin;

public class CustomRealm extends AuthorizingRealm {

    @Autowired
    private AdminDao adminDao;
    @Autowired
    private ShiroDao shiroDao;
//    Map<String, String> userMap = new HashMap();
//    Set<String> roles = new HashSet<String>();
//    Set<String> permissions = new HashSet<String>();
//    {
//        userMap.put("sun", "1d7b217127d82ea1eac7e3b92090a463");
//        roles.add("admin");
//        roles.add("user");
//        permissions.add("user:add");
//        permissions.add("admin:add");
//        super.setName("customRealm");
//    }

    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
    	System.out.println("realm..........getAuthorizationInfo");    	
        String username = (String) principalCollection.getPrimaryPrincipal();
//        从数据库或者缓存中获取角色信息
        Set<String> roles = getRolesByUsername(username);
        Set<String> permissions = getPermissionsByUsername(username);


        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        simpleAuthorizationInfo.setStringPermissions(permissions);
        simpleAuthorizationInfo.setRoles(roles);

        return simpleAuthorizationInfo;

    }

    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {

       // 1. 从主体获取提交的认证信息
        String username = (String) authenticationToken.getPrincipal();

        // 1. 从数据库验证
        String password = getPasswordByUsername(username);
        if(password == null) {
            return null;
        }
        System.out.println("AuthenticationInfo-------password------"+password);
        SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(username, password, "customRealm");
        simpleAuthenticationInfo.setCredentialsSalt(ByteSource.Util.bytes("dx"));
        return simpleAuthenticationInfo;    
    	//String password="123";
    	//String username = (String) authenticationToken.getPrincipal();
    	//SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(username,password, "customRealm");
    	//System.out.println("--------------------username: "+username);
    	//simpleAuthenticationInfo.setCredentialsSalt(ByteSource.Util.bytes("dx"));
    	//return simpleAuthenticationInfo; 
    }

    public String getPasswordByUsername(String username) {
       /* User user = userDao.getUserByUsername(username);
        if(user != null) {
            return user.getPassword();
        }
        return null;*/
    	Admin admin = adminDao.selectByPrimaryKey(username);
    	if(admin != null) {
            return admin.getPassword();
        }
        return null;
    	//return "123";
    }

    private Set<String> getRolesByUsername(String username) {
    	System.out.println("realm..........getRoles");
        System.out.println("从数据库中获取授权信息");
        List<String> list = shiroDao.getRolesByUsername(username);
        Set<String> roles = new HashSet<String>(list);
        return roles;

    }

    private Set<String> getPermissionsByUsername(String username) {
    	System.out.println("realm..........getPermission");
        List<String> list = shiroDao.getPermissionsByUsername(username);
        Set<String> permissions = new HashSet<String>(list);
        return permissions;

    }


   
    
    public static void main(String args[]) {
//        Md5Hash md5Hash = new Md5Hash("123");
/*        Md5Hash md5Hash = new Md5Hash("123", "dx");
        System.out.println(md5Hash.toString());*/
//    	getPasswordByUsername("sun");
    }

}
