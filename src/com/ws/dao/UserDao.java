package com.ws.dao;

import org.apache.ibatis.annotations.Param;
import com.ws.po.User;

import java.util.List;

public interface UserDao {
	public User selectUserByUserNamePassword(
			@Param("user_name") String user_name,
			@Param("password") String password
			);
	public int insertUser(
			@Param("user_id") String user_id,
			@Param("user_name") String user_name,
			@Param("password") String password,
			@Param("gender") String gender,
			@Param("description") String description,
			@Param("registdate") String registdate,
			@Param("identity") String identity,
			@Param("user_state") String user_state
			);
	public User selectUserByUserName(
			@Param("user_name") String user_name
			);
	public int updateUserState(
			@Param("user_id") String user_id,
			@Param("user_state") String user_state
			);
	public User selectUserByUserId(
			@Param("user_id") String user_id
			);
	public int updateUserById(
			@Param("user_id") String user_id,
			@Param("password") String password,
			@Param("user_gender") String user_gender,
			@Param("user_description") String user_description
			);
	public List<User> selectUsersList(
			@Param("start") Integer start,
			@Param("size") Integer size
	);
	public int selectUsersListCount();
}
