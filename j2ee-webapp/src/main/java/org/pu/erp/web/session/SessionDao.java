package org.pu.erp.web.session;

import java.util.Collection;

import org.apache.shiro.session.Session;

public interface SessionDao extends org.apache.shiro.session.mgt.eis.SessionDAO {

	/**
	 * 鑾峰彇娲诲姩浼氳瘽
	 * @param includeLeave 鏄惁鍖呮嫭绂荤嚎锛堟渶鍚庤闂椂闂村ぇ浜�3鍒嗛挓涓虹绾夸細璇濓級
	 * @return
	 */
	public Collection<Session> getActiveSessions(boolean includeLeave);
	
	/**
	 * 鑾峰彇娲诲姩浼氳瘽
	 * @param includeLeave 鏄惁鍖呮嫭绂荤嚎锛堟渶鍚庤闂椂闂村ぇ浜�3鍒嗛挓涓虹绾夸細璇濓級
	 * @param principal 鏍规嵁鐧诲綍鑰呭璞¤幏鍙栨椿鍔ㄤ細璇�
	 * @param filterSession 涓嶄负绌猴紝鍒欒繃婊ゆ帀锛堜笉鍖呭惈锛夎繖涓細璇濄��
	 * @return
	 */
	public Collection<Session> getActiveSessions(boolean includeLeave, Object principal, Session filterSession);
	
} 