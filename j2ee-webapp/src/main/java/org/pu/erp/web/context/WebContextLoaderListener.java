package org.pu.erp.web.context;

import javax.servlet.ServletContext;

import org.springframework.web.context.WebApplicationContext;

public class WebContextLoaderListener extends org.springframework.web.context.ContextLoaderListener{
	public static boolean printKeyLoadMessage(){
		StringBuilder sb = new StringBuilder();
		sb.append("\r\n======================================================================\r\n");
		sb.append("\r\n    欢迎使用  ERP - Powered By org.pu \r\n");
		sb.append("\r\n======================================================================\r\n");
		System.out.println(sb.toString());
		return true;
	}
	
	@Override
	public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
		if (!printKeyLoadMessage()){
			return null;
		}
		return super.initWebApplicationContext(servletContext);
	}
	
}
