package org.pu.erp.web.dao;

import org.pu.erp.web.shiro.bean.User;

public interface UserDao {

	public User findUserById(String name);
	
}
