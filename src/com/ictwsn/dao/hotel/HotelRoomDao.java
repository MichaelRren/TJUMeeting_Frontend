package com.ictwsn.dao.hotel;

import com.ictwsn.bean.HotelBean;
import com.ictwsn.bean.HotelRoomBean;

import java.util.List;

public interface HotelRoomDao {
	public int addHotelRoom(HotelRoomBean hrb);
	public boolean deleteHotelRoom(String hid);
	public int updateHotelRoom(HotelRoomBean hrb);
	public List<HotelRoomBean> searchHotelRoom();

	public List<String> listHtypeByHname(String hanme);
	public int consumeHnumber(String hname, String htype);
	public int resumeHnumber(String hname, String htype);

//	public int setUserHotel(HotelRoomBean userRoom);
//	public int setUserHotel(List<HotelRoomBean> userRooms);
}
