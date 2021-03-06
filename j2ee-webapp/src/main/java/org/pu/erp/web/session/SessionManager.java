package org.pu.erp.web.session;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.SessionContext;
import org.apache.shiro.session.mgt.SessionKey;
import org.apache.shiro.session.mgt.SimpleSession;
import org.apache.shiro.web.servlet.Cookie;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.apache.shiro.web.util.WebUtils;


public class SessionManager extends DefaultWebSessionManager {

	public SessionManager() {
		super();
	}
	
	@Override
	protected Serializable getSessionId(ServletRequest request, ServletResponse response) {
		// 濡傛灉鍙傛暟涓寘鍚�淿_sid鈥濆弬鏁帮紝鍒欎娇鐢ㄦsid浼氳瘽銆� 渚嬪锛歨ttp://localhost/project?__sid=xxx&__cookie=true
		String sid = request.getParameter("__sid");
		if (StringUtils.isNotBlank(sid)) {
			// 鏄惁灏唖id淇濆瓨鍒癱ookie锛屾祻瑙堝櫒妯″紡涓嬩娇鐢ㄦ鍙傛暟銆�
			if (WebUtils.isTrue(request, "__cookie")){
		        HttpServletRequest rq = (HttpServletRequest)request;
		        HttpServletResponse rs = (HttpServletResponse)response;
				Cookie template = getSessionIdCookie();
		        Cookie cookie = new SimpleCookie(template);
				cookie.setValue(sid); cookie.saveTo(rq, rs);
			}
			// 璁剧疆褰撳墠session鐘舵��
            request.setAttribute(ShiroHttpServletRequest.REFERENCED_SESSION_ID_SOURCE,
                    ShiroHttpServletRequest.URL_SESSION_ID_SOURCE); // session鏉ユ簮涓巙rl
            request.setAttribute(ShiroHttpServletRequest.REFERENCED_SESSION_ID, sid);
            request.setAttribute(ShiroHttpServletRequest.REFERENCED_SESSION_ID_IS_VALID, Boolean.TRUE);
        	return sid;
		}else{
			return super.getSessionId(request, response);
		}
	}
	
	@Override
	public void validateSessions() {
		super.validateSessions();
	}
	
	protected Session retrieveSession(SessionKey sessionKey) {
		try{
			return super.retrieveSession(sessionKey);
		}catch (UnknownSessionException e) {
    		// 鑾峰彇涓嶅埌SESSION涓嶆姏鍑哄紓甯�
			return null;
		}
	}

    public Date getStartTimestamp(SessionKey key) {
    	try{
    		return super.getStartTimestamp(key);
    	}catch (InvalidSessionException e) {
    		// 鑾峰彇涓嶅埌SESSION涓嶆姏鍑哄紓甯�
        	return null;
		}
    }

    public Date getLastAccessTime(SessionKey key) {
    	try{
    		return super.getLastAccessTime(key);
    	}catch (InvalidSessionException e) {
    		// 鑾峰彇涓嶅埌SESSION涓嶆姏鍑哄紓甯�
        	return null;
		}
    }

    public long getTimeout(SessionKey key){
    	try{
    		return super.getTimeout(key);
    	}catch (InvalidSessionException e) {
    		// 鑾峰彇涓嶅埌SESSION涓嶆姏鍑哄紓甯�
        	return 0;
		}
    }

    public void setTimeout(SessionKey key, long maxIdleTimeInMillis) {
    	try{
    		super.setTimeout(key, maxIdleTimeInMillis);
    	}catch (InvalidSessionException e) {
    		// 鑾峰彇涓嶅埌SESSION涓嶆姏鍑哄紓甯�
		}
    }

    public void touch(SessionKey key) {
    	try{
	    	super.touch(key);
		}catch (InvalidSessionException e) {
			// 鑾峰彇涓嶅埌SESSION涓嶆姏鍑哄紓甯�
		}
    }

    public String getHost(SessionKey key) {
    	try{
    		return super.getHost(key);
    	}catch (InvalidSessionException e) {
    		// 鑾峰彇涓嶅埌SESSION涓嶆姏鍑哄紓甯�
        	return null;
		}
    }

    public Collection<Object> getAttributeKeys(SessionKey key) {
    	try{
    		return super.getAttributeKeys(key);
    	}catch (InvalidSessionException e) {
    		// 鑾峰彇涓嶅埌SESSION涓嶆姏鍑哄紓甯�
        	return null;
		}
    }

    public Object getAttribute(SessionKey sessionKey, Object attributeKey) {
    	try{
    		return super.getAttribute(sessionKey, attributeKey);
    	}catch (InvalidSessionException e) {
    		// 鑾峰彇涓嶅埌SESSION涓嶆姏鍑哄紓甯�
        	return null;
		}
    }

    public void setAttribute(SessionKey sessionKey, Object attributeKey, Object value) {
    	try{
    		super.setAttribute(sessionKey, attributeKey, value);
    	}catch (InvalidSessionException e) {
    		// 鑾峰彇涓嶅埌SESSION涓嶆姏鍑哄紓甯�
		}
    }

    public Object removeAttribute(SessionKey sessionKey, Object attributeKey) {
    	try{
    		return super.removeAttribute(sessionKey, attributeKey);
    	}catch (InvalidSessionException e) {
    		// 鑾峰彇涓嶅埌SESSION涓嶆姏鍑哄紓甯�
        	return null;
		}
    }

    public void stop(SessionKey key) {
    	try{
    		super.stop(key);
    	}catch (InvalidSessionException e) {
    		// 鑾峰彇涓嶅埌SESSION涓嶆姏鍑哄紓甯�
		}
    }
    
    public void checkValid(SessionKey key) {
    	try{
    		super.checkValid(key);
		}catch (InvalidSessionException e) {
			// 鑾峰彇涓嶅埌SESSION涓嶆姏鍑哄紓甯�
		}
    }
    
    @Override
    protected Session doCreateSession(SessionContext context) {
    	try{
    		return super.doCreateSession(context);
		}catch (IllegalStateException e) {
			return null;
		}
    }

	@Override
	protected Session newSessionInstance(SessionContext context) {
		Session session = super.newSessionInstance(context);
		session.setTimeout(getGlobalSessionTimeout());
		return session;
	}
    
    @Override
    public Session start(SessionContext context) {
    	try{
    		return super.start(context);
		}catch (NullPointerException e) {
			SimpleSession session = new SimpleSession();
			session.setId(0);
			return session;
		}
    }
}