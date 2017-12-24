package org.pu.erp.web.util;

import java.util.ArrayList;
import java.util.List;

import org.pu.erp.module.vendor.bean.Vendor;

import net.sf.json.JSONObject;

public class JsonText {
	
	public static void main(String arg[]) {
		Vendor vendor = new Vendor();
		vendor.setId("A00");
		vendor.setBrand("大众");;

		vendor.setName("简美");
		vendor.setShortName("精品");
		vendor.setHabit("广州");
		
		JSONObject json = new JSONObject();
		
		List<Vendor> list = new ArrayList<Vendor>();
		list.add(vendor);
		
		json.put("data",list);
		
		
		System.out.println(json.toString());
	}

}
