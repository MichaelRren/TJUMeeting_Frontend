package com.ictwsn.service.liaison;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ictwsn.bean.LiaisonBean;
import com.ictwsn.dao.liaison.LiaisonDao;

@Service
public class LiaisonServiceImpl implements LiaisonService{

	@Resource LiaisonDao dao;
	@Override
	public int addLiaison(LiaisonBean lb) {
		if(dao.checkLnumber(lb.getLnumber())>0)
			return -2;
		return dao.addLiaison(lb);
	}
	@Override
	public boolean deleteLiaison(String lnumber) {
		return dao.deleteLiaison(lnumber);
	}
	@Override
	public int updateLiaison(LiaisonBean lb) {
		return dao.updateLiaison(lb);
	}
	@Override
	public List<LiaisonBean> searchLiaison() {
		return dao.searchLiaison();
	}
	@Override
	public int checkLnumber(String lnumber) {
		return dao.checkLnumber(lnumber);
	}
	@Override
	public LiaisonBean searchLiaisonByLnumber(String lnumber) {
		return dao.searchLiaisonByLnumber(lnumber);
	}

	public LiaisonBean searchLiaisonByUserNumber(String userNumber){
		return dao.searchLiaisonByUserNumber(userNumber);
	}
}
