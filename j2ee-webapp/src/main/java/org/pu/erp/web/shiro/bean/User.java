package org.pu.erp.web.shiro.bean;

import java.io.Serializable;

public class User implements Serializable  {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8607804967272002148L;
	private String password;
	private String username;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	

}
