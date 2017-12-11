package org.pu.erp.web.shiro.bean;

public class Message {

	private String name;
	private String msg;
	
	public Message() {
		super();
	}
	
	public Message(String name, String msg) {
		this.name = name;
		this.msg = msg;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
}
