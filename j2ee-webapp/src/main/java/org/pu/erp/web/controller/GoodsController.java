package org.pu.erp.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "/goods")
public class GoodsController {

	 @RequestMapping(value="/list",method=RequestMethod.GET)
	 public String list(Model model){
		 System.out.println("In the goods list method");
	     return "goodsManage";
	 }
	 
	 
	 @RequestMapping(value="/detail",method=RequestMethod.GET)
	 public String detail(@RequestParam String goodId,Model model){
//		 model.
//		 String goodId = (String)model.asMap().get("goodId");
//		
		 System.out.println("Detail Good Id:" + goodId);
	     return "goodsDetail";
	 }
}
