package com.ws.dao;

import org.apache.ibatis.annotations.Param;

import com.ws.po.Admin;

public interface AdminDao {
	public Admin selectAdminByAdminNamePassword(
			@Param("admin_name") String admin_name,
			@Param("password") String password
			);
}
