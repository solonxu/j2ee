package org.pu.erp.web.session;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Sets;


public class CacheSessionDao extends EnterpriseCacheSessionDAO implements SessionDao {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
    public CacheSessionDao() {
        super();
    }

    @Override
    protected void doUpdate(Session session) {
    	if (session == null || session.getId() == null) {  
            return;
        }
    	
    	HttpServletRequest request = Servlets.getRequest();
		if (request != null){
			String uri = request.getServletPath();
			// 濡傛灉鏄潤鎬佹枃浠讹紝鍒欎笉鏇存柊SESSION
			if (Servlets.isStaticFile(uri)){
				return;
			}
			// 濡傛灉鏄鍥炬枃浠讹紝鍒欎笉鏇存柊SESSION
			if (StringUtils.startsWith(uri, GlobalConstant.WEB_VIEW_PRFIX)
					&& StringUtils.endsWith(uri, GlobalConstant.WEB_VIEW_SUFFIX)){
				return;
			}
			// 鎵嬪姩鎺у埗涓嶆洿鏂癝ESSION
			String updateSession = request.getParameter("updateSession");
			if (GlobalConstant.FALSE.equals(updateSession) || GlobalConstant.NO.equals(updateSession)){
				return;
			}
		}
    	super.doUpdate(session);
    	logger.debug("update {} {}", session.getId(), request != null ? request.getRequestURI() : "");
    }

    @Override
    protected void doDelete(Session session) {
    	if (session == null || session.getId() == null) {  
            return;
        }
    	
    	super.doDelete(session);
    	logger.debug("delete {} ", session.getId());
    }

    @Override
    protected Serializable doCreate(Session session) {
		HttpServletRequest request = Servlets.getRequest();
		if (request != null){
			String uri = request.getServletPath();
			// 濡傛灉鏄潤鎬佹枃浠讹紝鍒欎笉鍒涘缓SESSION
			if (Servlets.isStaticFile(uri)){
		        return null;
			}
		}
		super.doCreate(session);
		logger.debug("doCreate {} {}", session, request != null ? request.getRequestURI() : "");
    	return session.getId();
    }

    @Override
    protected Session doReadSession(Serializable sessionId) {
		return super.doReadSession(sessionId);
    }
    
    @Override
    public Session readSession(Serializable sessionId) throws UnknownSessionException {
    	try{
    		Session s = null;
    		HttpServletRequest request = Servlets.getRequest();
    		if (request != null){
    			String uri = request.getServletPath();
    			// 濡傛灉鏄潤鎬佹枃浠讹紝鍒欎笉鑾峰彇SESSION
    			if (Servlets.isStaticFile(uri)){
    				return null;
    			}
    			s = (Session)request.getAttribute("session_"+sessionId);
    		}
    		if (s != null){
    			return s;
    		}

    		Session session = super.readSession(sessionId);
    		logger.debug("readSession {} {}", sessionId, request != null ? request.getRequestURI() : "");
    		
    		if (request != null && session != null){
    			request.setAttribute("session_"+sessionId, session);
    		}
    		
    		return session;
    	}catch (UnknownSessionException e) {
			return null;
		}
    }

    /**
	 * 鑾峰彇娲诲姩浼氳瘽
	 * @param includeLeave 鏄惁鍖呮嫭绂荤嚎锛堟渶鍚庤闂椂闂村ぇ浜�3鍒嗛挓涓虹绾夸細璇濓級
	 * @return
	 */
	
	public Collection<Session> getActiveSessions(boolean includeLeave) {
		return getActiveSessions(includeLeave, null, null);
	}
    
    /**
	 * 鑾峰彇娲诲姩浼氳瘽
	 * @param includeLeave 鏄惁鍖呮嫭绂荤嚎锛堟渶鍚庤闂椂闂村ぇ浜�3鍒嗛挓涓虹绾夸細璇濓級
	 * @param principal 鏍规嵁鐧诲綍鑰呭璞¤幏鍙栨椿鍔ㄤ細璇�
	 * @param filterSession 涓嶄负绌猴紝鍒欒繃婊ゆ帀锛堜笉鍖呭惈锛夎繖涓細璇濄��
	 * @return
	 */
	
	public Collection<Session> getActiveSessions(boolean includeLeave, Object principal, Session filterSession) {
		// 濡傛灉鍖呮嫭绂荤嚎锛屽苟鏃犵櫥褰曡�呮潯浠躲��
		if (includeLeave && principal == null){
			return getActiveSessions();
		}
		Set<Session> sessions = Sets.newHashSet();
		for (Session session : getActiveSessions()){
			boolean isActiveSession = false;
			// 涓嶅寘鎷绾垮苟绗﹀悎鏈�鍚庤闂椂闂村皬浜庣瓑浜�3鍒嗛挓鏉′欢銆�
			if (includeLeave || pastMinutes(session.getLastAccessTime()) <= 3){
				isActiveSession = true;
			}
			// 绗﹀悎鐧婚檰鑰呮潯浠躲��
			if (principal != null){
				PrincipalCollection pc = (PrincipalCollection)session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
				if (principal.toString().equals(pc != null ? pc.getPrimaryPrincipal().toString() : StringUtils.EMPTY)){
					isActiveSession = true;
				}
			}
			// 杩囨护鎺夌殑SESSION
			if (filterSession != null && filterSession.getId().equals(session.getId())){
				isActiveSession = false;
			}
			if (isActiveSession){
				sessions.add(session);
			}
		}
		return sessions;
	}
	
	public static long pastMinutes(Date date) {
		long t = new Date().getTime()-date.getTime();
		return t/(60*1000);
	}
	
}

