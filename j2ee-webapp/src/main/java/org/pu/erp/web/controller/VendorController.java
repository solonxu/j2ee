package org.pu.erp.web.controller;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.pu.erp.module.vendor.bean.SaveVendorRequestBean;
import org.pu.erp.module.vendor.bean.Vendor;
import org.pu.erp.web.dao.VendorDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "/vendor")
public class VendorController {
	private Log log = LogFactory.getLog(this.getClass());
	
    private static String VENDOR_ID_COLUMN = "vendorid";
    private static String VENDOR_NAME_COLUMN = "vendorsname";
    private static String VENDOR_HABIT_COLUMN = "habitat";
    private static String VENDOR_SHORTNAME_COLUMN = "shortname";
    private static String VENDOR_BRAND_COLUMN = "brand";
    
	@Autowired
    private VendorDao vendorDao;
    
	
	@RequestMapping(value="/detail",method=RequestMethod.GET)
	public void detail(@RequestParam String vendorId,PrintWriter printWriter){
		System.out.println("the vendor id " + vendorId);
		Map<String,String> paramMap = new HashMap<String,String>();
		paramMap.put(VENDOR_ID_COLUMN, vendorId);
		
		
		List<Vendor> list = vendorDao.listVendor(paramMap);
		
		String jsonString = "";
		if (!list.isEmpty()) {
			JSONObject json = new JSONObject();
			json.put("data",list.get(0));
			jsonString = json.toString();
		}
		
		printWriter.write(jsonString);  
        printWriter.flush();  
        printWriter.close();  
	
	 }
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model){
		List<Vendor> list = vendorDao.listVendor(new HashMap<String,String>());
			
		JSONObject json = new JSONObject();
		json.put("data",list);
			
		model.addAttribute("list",json.toString());
		model.addAttribute("searchCriteria",new Vendor());
	    return "static/vendors"; 
	 }
	
	@RequestMapping(value="/list",method=RequestMethod.POST)
	public String list(Model model,Vendor vendor){
		
		Map<String,String> paramMap = retrieveParamMap(vendor);
		//System.out.println("the vendor is "  +vendor.getVendorId());
		List<Vendor> list = vendorDao.listVendor(paramMap);
			
		JSONObject json = new JSONObject();
		json.put("data",list);
			
		model.addAttribute("list",json.toString());
		model.addAttribute("searchCriteria",vendor);
		System.out.println(model.asMap().get("message"));
	    return "static/vendors"; 
	 }
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String save(Model model,SaveVendorRequestBean requestBean){
	    //System.out.println(requestBean.getNewVendor().getVendorId());;
	    
		String message = null;
		if ("NEW".equals(requestBean.getOpind())) {
			try {
			    this.vendorDao.insert(requestBean.getNewVendor());
	            message = "插入成功！";
			} catch (Exception e) {
				e.printStackTrace();
				log.error(e);
				message = "插入失败！";
			}
	   } else {
			try {
				this.vendorDao.update(requestBean.getNewVendor());
				message = "更新成功！";
			} catch (Exception e) {
				log.error(e);
				message = "更新失败！";
			}
			
		}
		log.info("the messsage :" + message);
		model.addAttribute("message",message);		
		
	    
	    return list(model,requestBean.getSearchVendor());
	 }
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String save(Model model, @RequestParam String vendorIds){
	    System.out.println("需要删除的ids："+vendorIds);
	    return list(model);
	 }
	 
	
	 private Map<String,String> retrieveParamMap(Vendor vendor)  {
		 Map<String,String> paramMap = new HashMap<String,String>();
		 
		 if (StringUtils.isNotBlank(vendor.getVendorId())) {
			 paramMap.put(VENDOR_ID_COLUMN, vendor.getVendorId());
		 }
		 
		 if (StringUtils.isNotBlank(vendor.getName())) {
			 paramMap.put(VENDOR_NAME_COLUMN, vendor.getName());
		 }
		 
		 if (StringUtils.isNotBlank(vendor.getShortName())) {
			 paramMap.put(VENDOR_SHORTNAME_COLUMN, vendor.getShortName());
		 }
		 if (StringUtils.isNotBlank(vendor.getBrand())) {
			 paramMap.put(VENDOR_BRAND_COLUMN, vendor.getBrand());
		 }

		 if (StringUtils.isNotBlank(vendor.getHabit())) {
			 paramMap.put(VENDOR_HABIT_COLUMN, vendor.getHabit());
		 }
		 
		 return paramMap;

	 }
	 
	 
	 
//	 private List<Vendor> listVendor() {
//		 Vendor vendor = new Vendor();
//			vendor.setId("1");
//			vendor.setBrand("大众");;
//			vendor.setVendorId("A00");
//			vendor.setName("简美");
//			vendor.setShortName("精品");
//			vendor.setHabit("广州");
//			
//			List<Vendor> list = new ArrayList<Vendor>();
//			list.add(vendor);
//          return list;
//     }
	 
	 
	 
	 
   
	 
	
}
