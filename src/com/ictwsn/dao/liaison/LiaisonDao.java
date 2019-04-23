package com.ictwsn.dao.liaison;

import java.util.List;
import com.ictwsn.bean.LiaisonBean;

public interface LiaisonDao {
	public int addLiaison(LiaisonBean lb);  //增加
	public boolean deleteLiaison(String lnumber);	 	 //删除
	public List<LiaisonBean> searchLiaison();		 	 //查询all
	public int updateLiaison(LiaisonBean lb);		//修改
	
	public int checkLnumber(String lnumber);     //判断lnumber是否唯一
	
	public LiaisonBean searchLiaisonByLnumber(String lnumber);

	public LiaisonBean searchLiaisonByUserNumber(String userNumber);
}
