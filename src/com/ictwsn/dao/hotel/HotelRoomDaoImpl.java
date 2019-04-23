package com.ictwsn.dao.hotel;

import com.ictwsn.bean.HotelRoomBean;
import com.ictwsn.dao.MySQLBaseDao;
import com.ictwsn.util.CurrentConn;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class HotelRoomDaoImpl extends MySQLBaseDao implements HotelRoomDao{

	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs=null;
	@Override
	public int addHotelRoom(HotelRoomBean hrb) {
		String sql="select count(0) from HotelRoom where Hname=? and Htype=?";
		int checkResult=this.jt.queryForInt(sql,new Object[]{hrb.getHname(),hrb.getHtype()});
		if(checkResult==0){//等于0代表不重复,可以添加
			sql="insert into HotelRoom(Hname,Htype,Hprice,Hnumber) values(?,?,?,?)";
			return this.jt.update(sql,new Object[]{hrb.getHname(),hrb.getHtype(),hrb.getHprice(),hrb.getHnumber()});
		}else if(checkResult==1){//等于1代表minor重复,不可以添加
			return -1;
		}
		return 0;
	}

	@Override
	public boolean deleteHotelRoom(String hid) {
		int result=this.jt.update("delete from HotelRoom where Hid=?",new Object[]{hid});
		return result>0?true:false;
	}

	@Override
	public int updateHotelRoom(HotelRoomBean hrb) {
		return this.jt.update("update HotelRoom set Hname=?,Htype=?,Hprice=?,Hnumber=? where Hid=?",
				new Object[]{hrb.getHnumber(),hrb.getHtype(),hrb.getHprice(),hrb.getHnumber(),hrb.getHid()});
	}

	@Override
	public List<HotelRoomBean> searchHotelRoom() {
		List<HotelRoomBean> hrbs=new ArrayList<HotelRoomBean>();
		String sql="select * from Hotel";
		try{
			conn=CurrentConn.getInstance().getConn();
			pst=conn.prepareStatement(sql);
			rs=pst.executeQuery();
			if(rs.next()){
				HotelRoomBean hrb = new HotelRoomBean();
				hrb.setHid(rs.getInt(1));
				hrb.setHname(rs.getString(2));
				hrb.setHtype(rs.getString(3));
				hrb.setHprice(rs.getInt(4));
				hrb.setHnumber(rs.getInt(5));
				hrbs.add(hrb);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			CurrentConn.getInstance().closeResultSet(rs);
			CurrentConn.getInstance().closePreparedStatement(pst);
			CurrentConn.getInstance().closeConnection(conn);
		}
		return hrbs;
	}

	public List<String> listHtypeByHname(String hname){
		List<String> list = new ArrayList<String>() ;
		String sql = "select Htype,Hnumber from HotelRoom where Hname=?";
		try{
			conn=CurrentConn.getInstance().getConn();
			pst=conn.prepareStatement(sql);
			pst.setString(1,hname);
			rs=pst.executeQuery();
			while(rs.next()){
				int hnumber = rs.getInt("Hnumber");
				if(hnumber > 0){
					String htype = rs.getString("Htype");
					list.add(htype);
				}
			}
		}catch (SQLException e){
			e.printStackTrace();
		}finally {
			CurrentConn.getInstance().closeResultSet(rs);
			CurrentConn.getInstance().closePreparedStatement(pst);
			CurrentConn.getInstance().closeConnection(conn);
		}
		return list;
	}

	/**
	 *酒店房间减一
	 * @param hname 酒店名称
	 * @param htype 酒店房型
	 * @return 返回-1表示没有房间，返回0表示出错，返回1表示成功。
	 */
	public int consumeHnumber(String hname, String htype){
		String sql = "select Hnumber from HotelRoom where Hname=? and Htype=?";
		int hnumber = 0;
		try{
			conn=CurrentConn.getInstance().getConn();
			pst=conn.prepareStatement(sql);
			pst.setString(1,hname);
			pst.setString(2,htype);
			rs=pst.executeQuery();

			if(rs.next()){
				hnumber = rs.getInt("Hnumber");
			}
			if (hnumber == 0){
				return -1;
			}else{
				hnumber = hnumber -1;
				sql = "update HotelRoom set Hnumber=? where Hname=? and Htype=?";
				return jt.update(sql, new Object[]{hnumber,hname,htype});
			}
		}catch (SQLException e){
			e.printStackTrace();
		}finally {
			CurrentConn.getInstance().closeResultSet(rs);
			CurrentConn.getInstance().closePreparedStatement(pst);
			CurrentConn.getInstance().closeConnection(conn);
		}
		return 0;
	}

	/**
	 * 酒店房间加一
	 * @param hname
	 * @param htype
	 * @return
	 */
	public int resumeHnumber(String hname,String htype){
		String sql = "select Hnumber from HotelRoom where Hname=? and Htype=?";
		int hnumber = 0;
		try{
			conn=CurrentConn.getInstance().getConn();
			pst=conn.prepareStatement(sql);
			pst.setString(1,hname);
			pst.setString(2,htype);
			rs=pst.executeQuery();

			if(rs.next()){
				hnumber = rs.getInt("Hnumber");
			}
			hnumber = hnumber +1;
			sql = "update HotelRoom set Hnumber=? where Hname=? and Htype=?";
			return jt.update(sql, new Object[]{hnumber,hname,htype});
		}catch (SQLException e){
			e.printStackTrace();
		}finally {
			CurrentConn.getInstance().closeResultSet(rs);
			CurrentConn.getInstance().closePreparedStatement(pst);
			CurrentConn.getInstance().closeConnection(conn);
		}
		return 0;
	}
}
