package com.ictwsn.dao.hotel;

import java.util.List;

import com.ictwsn.bean.HotelBean;
import com.ictwsn.bean.HotelRoomBean;

public interface HotelDao {
	public int addHotel(HotelBean hb);
	public boolean deleteHotel(String hname);
	public int updateHotel(HotelBean hb);
	public List<HotelBean> searchHotel();
	public HotelBean getHurlByHname(String hname);  //根据酒店名称查询酒店地址


//	public int setUserHotel(HotelRoomBean userRoom);
//	public int setUserHotel(List<HotelRoomBean> userRooms);
}
