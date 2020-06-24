package com.ws.service;

import com.ws.po.User;

import java.util.List;

public interface UserService {
	public User selectUserByUserNamePassword(String user_name, String password);
	public int insertUser(String user_id, String user_name, String password, String gender, String description,
			String registdate, String identity, String user_state);
	public User selectUserByUserName(String user_name);
	public int updateUserState(String user_id, String user_state);
	public User selectUserByUserId(String user_id);
	public int updateUserById(String user_id, String password, String user_gender, String user_description);
	public List<User> selectUsersList(int start,int size);
	public int selectUsersListCount();
}
