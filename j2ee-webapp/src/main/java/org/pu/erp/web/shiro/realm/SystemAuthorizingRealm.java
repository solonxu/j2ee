package org.pu.erp.web.shiro.realm;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.pu.erp.web.dao.UserDao;
import org.pu.erp.web.shiro.bean.User;
import org.pu.erp.web.util.Encodes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SystemAuthorizingRealm extends AuthorizingRealm {

	private Logger logger = LoggerFactory.getLogger(getClass());

	private UserDao userDao;
	
	
//	@PostConstruct
//	public void initCredentialsMatcher() {
//		System.out.println("Credit is created");
//		HashedCredentialsMatcher matcher = new HashedCredentialsMatcher("SHA-1");
//		matcher.setHashIterations(1024);
//		setCredentialsMatcher(matcher);
//	}
	
	
	  protected  AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
//		  if (this.getCredentialsMatcher() == null)  {
//			  this.initCredentialsMatcher();
//		  }
		  User  user = (User) getAvailablePrincipal(principals);
		
			
			logger.info("Run the doGetAuthorizationInfo");
		
		  
		  if (user != null) {
				SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
				
				info.addStringPermission("user");
				//LogUtils.saveLog(Servlets.getRequest(), "系统登录");
				return info;
			} else {
				return null;
			}
		  
	  }
	  
	  
	  private User retrieveUser(String name) {
		  User user =  this.userDao.findUserById(name);
	    
		  if (user != null) {
			  System.out.println("the password is" + user.getPassword());
		  }
		  return user;
	  }
	  
	  @Override
		protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) {
			UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
			
			logger.info("Run the doGetAuthericationInfo");
			
			logger.info("the username :"+ token.getUsername() +",the password:" + token.getPassword());
			
			User user = retrieveUser(token.getUsername());
			if (user != null) {
			
				byte[] salt = Encodes.decodeHex(user.getPassword());
				return new SimpleAuthenticationInfo(user, 
						user.getPassword(), ByteSource.Util.bytes(salt), getName());
			} else {
				return null;
			}
		}


	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	  
	  

	
	
}
	
