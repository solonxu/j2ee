package org.pu.erp.web.dao;

import java.util.List;
import java.util.Map;

import org.pu.erp.module.vendor.bean.Vendor;

public interface VendorDao {
	
	public List<Vendor> listVendor(Map<String,String> paramMap);
	public void insert(Vendor vendor);
	public void update(Vendor vendor);

	

}
