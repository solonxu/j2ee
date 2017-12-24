package org.pu.erp.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/vendor")
public class VendorController {

	 @RequestMapping(value="/list",method=RequestMethod.GET)
	 public String list(Model model){
		 System.out.println("In the goods list method");
	     return "static/vendors";
	 }
	 
	 
	
}
