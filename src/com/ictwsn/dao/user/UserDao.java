package com.ictwsn.dao.user;

import com.ictwsn.bean.UserBean;

import java.util.List;

public interface UserDao {
	
	public int addUser(UserBean ub);  //增加
	public boolean deleteUser(String userNumber);	 	 //删除
	public List<UserBean> searchUser(int number, int size);		 	 //查询all
	public List<UserBean> searchUserASCReturnTime(int number, int size);
	public int updateUser(UserBean ub);		//修改
	public int checkUserNumber(String userNumber);     //判断usernumber是否唯一
	public int getUserConut();
	public UserBean searchUserByUserNumber(String userNumber);
	public List<UserBean> searchUserByCondition(String type,String keyword,int number,int size);

	public int setUserHotel(UserBean userRoom);
}
