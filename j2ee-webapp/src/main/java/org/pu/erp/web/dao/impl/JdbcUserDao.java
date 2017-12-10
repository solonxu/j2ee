package org.pu.erp.web.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.pu.erp.web.dao.UserDao;
import org.pu.erp.web.shiro.bean.User;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class JdbcUserDao extends JdbcTemplate implements UserDao {
	
	public User findUserById(String name) {
	   List<User> userList = this.query("select name ,password from sys_users where name =?",new Object[]{name},new RowMapper<User>() {
			public User mapRow(ResultSet rs,int index) throws SQLException {
				  User user = new User();
				  user.setPassword(rs.getString("password"));
				  user.setUsername(rs.getString("name"));
				  
				  return user;
			}
		});
	   
	    return userList == null ? null : userList.get(0);
	    
	}

}
