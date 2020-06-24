package com.ws.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ws.dao.AdminDao;
import com.ws.po.Admin;
import com.ws.service.AdminService;
@Service("adminService")
@Transactional
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao adminDao;
	@Override
	public Admin selectAdminByAdminNamePassword(String admin_name, String password) {
		Admin admin = this.adminDao.selectAdminByAdminNamePassword(admin_name, password);
		return admin;
	}

}
