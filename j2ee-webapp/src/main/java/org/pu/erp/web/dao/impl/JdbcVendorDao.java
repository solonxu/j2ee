package org.pu.erp.web.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.pu.erp.module.vendor.bean.Vendor;
import org.pu.erp.web.dao.VendorDao;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

public class JdbcVendorDao extends JdbcDaoSupport implements VendorDao {
	private String LIST_VENDOR_SQL  = "select id,vendorid,vendorsname,shortname,habitat,addr,postcode,fax,tel,contactman,email,memo,brand from vendors where 1=1 ";
	public List<Vendor> listVendor(Map<String,String> paramMap) {
		List<Object> params = new ArrayList<Object>();
		
		StringBuffer sb = new StringBuffer(LIST_VENDOR_SQL);
		
	    for (String key : paramMap.keySet()) {
	    	sb.append(" and ").append(key).append("=?");
	        params.add(paramMap.get(key));
	    }
	    
	    String sql = sb.toString();
	    
	    return this.getJdbcTemplate().query(sql, params.toArray(),new RowMapper<Vendor>() {
	    	public Vendor mapRow(ResultSet rs,int index) throws SQLException {
	    		Vendor vendor = new Vendor();
	    		vendor.setId(String.valueOf(index));
	    		vendor.setAddress(rs.getString("addr"));
	    		vendor.setBrand(rs.getString("brand"));
	    		vendor.setContact(rs.getString("contactman"));
	    		vendor.setFax(rs.getString("fax"));
	    		vendor.setHabit(rs.getString("habitat"));
	    		vendor.setMail(rs.getString("email"));

	    		vendor.setMemo(rs.getString("memo"));
	    		vendor.setName(rs.getString("vendorsname"));
	    		vendor.setPostCode(rs.getString("postcode"));
	    		vendor.setShortName(rs.getString("shortname"));

	    		vendor.setTel(rs.getString("tel"));
	    		vendor.setVendorId(rs.getString("vendorid"));

	    		return vendor;
	    	}
	    });
	    
		
	}
	
	private static final String NEW_VENDOR_SQL = "INSERT INTO VENDORS (id,vendorid,vendorsname,shortname,habitat,addr,postcode,fax,tel,contactman,email,memo,brand) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
	public void insert(Vendor vendor){
	    List<String> params = new ArrayList<String>();
	    params.add(vendor.getVendorId());
	    params.add(vendor.getVendorId());
	    params.add(vendor.getName());
	    params.add(vendor.getShortName());
	    params.add(vendor.getHabit());
	    params.add(vendor.getAddress());
	    params.add(vendor.getPostCode());
	    params.add(vendor.getFax());
	    params.add(vendor.getTel());
	    params.add(vendor.getContact());
	    params.add(vendor.getMail());
	    params.add(vendor.getMemo());
	    params.add(vendor.getBrand());
	    this.getJdbcTemplate().update(NEW_VENDOR_SQL,params.toArray());
	}
	
	private static final String UPDATE_VENDOR_SQL = "UPDATE VENDORS set vendorsname = ?,shortname = ?,habitat = ?,fax = ?,tel = ?,contactman  = ? ,brand = ?  where vendorid = ? ";
	
	public void update(Vendor vendor) {
		   List<String> params = new ArrayList<String>();
		    params.add(vendor.getName());
		    params.add(vendor.getShortName());
		    params.add(vendor.getHabit());
		    params.add(vendor.getFax());
		    params.add(vendor.getTel());
		    params.add(vendor.getContact());
		    params.add(vendor.getBrand());
		    params.add(vendor.getVendorId());
			 
		    this.getJdbcTemplate().update(UPDATE_VENDOR_SQL,params.toArray());
	}

}
