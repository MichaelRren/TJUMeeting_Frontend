package com.ictwsn.service.liaison;

import java.util.List;


import com.ictwsn.bean.LiaisonBean;


public interface LiaisonService {
	
	public int addLiaison(LiaisonBean lb);
	public boolean deleteLiaison(String lnumber);	
	public int updateLiaison(LiaisonBean ob);	
	public List<LiaisonBean> searchLiaison();
	public int checkLnumber(String lnumber);//判断lnumber是否唯一
	public LiaisonBean searchLiaisonByLnumber(String lnumber);
	public LiaisonBean searchLiaisonByUserNumber(String userNumber);
}
