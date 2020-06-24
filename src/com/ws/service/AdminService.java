package com.ws.service;

import com.ws.po.Admin;

public interface AdminService {
	public Admin selectAdminByAdminNamePassword(String admin_name,String password);
}
