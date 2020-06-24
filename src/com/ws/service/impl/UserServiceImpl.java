package com.ws.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ws.dao.UserDao;
import com.ws.po.User;
import com.ws.service.UserService;

import java.util.List;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	@Override
	public User selectUserByUserNamePassword(String user_name, String password) {
		User user = this.userDao.selectUserByUserNamePassword(user_name, password);
		return user;
	}
	@Override
	public int insertUser(String user_id, String user_name, String password, String gender, String description,
			String registdate, String identity, String user_state) {
		int ret = this.userDao.insertUser(user_id, user_name, password, gender, description, 
				registdate, identity, user_state);
		return ret;
	}
	@Override
	public User selectUserByUserName(String user_name) {
		User user = this.userDao.selectUserByUserName(user_name);
		return user;
	}
	@Override
	public int updateUserState(String user_id, String user_state) {
		int ret = this.userDao.updateUserState(user_id, user_state);
		return ret;
	}
	@Override
	public User selectUserByUserId(String user_id) {
		User user = this.userDao.selectUserByUserId(user_id);
		return user;
	}
	@Override
	public int updateUserById(String user_id, String password, String user_gender, String user_description) {
		int ret = this.userDao.updateUserById(user_id, password, user_gender, user_description);
		return ret;
	}

	@Override
	public List<User> selectUsersList(int start, int size) {
		List<User> users = this.userDao.selectUsersList(start, size);
		return  users;
	}

	@Override
	public int selectUsersListCount() {
		int ret = this.userDao.selectUsersListCount();
		return  ret;
	}
}
