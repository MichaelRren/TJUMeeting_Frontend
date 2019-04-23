package com.ictwsn.action.user;


import com.ictwsn.bean.*;
import com.ictwsn.service.driver.DriverService;
import com.ictwsn.service.hotel.HotelRoomService;
import com.ictwsn.service.hotel.HotelService;
import com.ictwsn.service.liaison.LiaisonService;
import com.ictwsn.service.message.MessageService;
import com.ictwsn.service.signin.SigninService;
import com.ictwsn.service.user.UserService;

import com.ictwsn.service.userdriver.UserDriverService;
import com.ictwsn.util.GetHttp;
import com.ictwsn.util.format.PublicDay;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;

/**
 * 用户控制类
 * @author YangYanan
 * @desc 包含用户对个人信息的增删改查请求处理
 * @date 2019-3-20
 */
@Controller
public class UserAction {
	static Logger logger = Logger.getLogger(UserAction.class.getName());
	PublicDay pd=new PublicDay();

	@Resource UserService userService;
	@Resource HotelService hotelService;
	@Resource HotelRoomService hotelRoomService;
	@Resource DriverService driverService;
	@Resource UserDriverService userDriverService;
	@Resource LiaisonService liaisonService;
	@Resource SigninService signinService;
	@Resource MessageService messageService;


	@RequestMapping(value = "addUser0Before.action")
	public String addUser0Before(HttpServletRequest request,Model model){
		try{
			return GetHttp.isMobileDevice(request)?"pages/user/adduser0":"MobilePages/user/adduser0";
		}catch(Exception e){
			e.printStackTrace();
			return "pages/error";
		}
	}

	@RequestMapping(value = "addUser1Before.action")
	public String addUser1Before(HttpServletRequest request,Model model){
		try{
			return GetHttp.isMobileDevice(request)?"pages/user/adduser1":"MobilePages/user/adduser1";
		}catch(Exception e){
			e.printStackTrace();
			return "pages/error";
		}
	}

	@RequestMapping(value = "addUserBefore.action")
	public void addUserBefore(HttpServletRequest request, HttpServletResponse response,
							  @RequestParam(value="userNumber",required=true) String userNumber){
		try{
			int result = userService.checkUserNumber(userNumber); // result=0 代表不重复  result=1代表重复

			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(result);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "checkImage.action")
	public void checkImage(HttpServletRequest request,HttpServletResponse response,
						   @RequestParam(value = "imageFile") MultipartFile imageFile){
		try{
			int result = 0;
			String fileNameSuffix="";
			if(!imageFile.isEmpty()) {
				fileNameSuffix = imageFile.getOriginalFilename().substring(imageFile.getOriginalFilename().lastIndexOf("."));
				try {
					byte[] bytes = imageFile.getBytes();
					if (bytes.length < 512000) {
						result +=1;
					}
					if (!fileNameSuffix.equals(".jpg") || !fileNameSuffix.equals(".JPG") || !fileNameSuffix.equals(".png") ||
							!fileNameSuffix.equals(".PNG")){
						result +=2;
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			result = -1;

			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(result);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * 添加设备
	 * @param request
	 * 	 * @param model
	 * 	 * @param userName 用户姓名
	 * 	 * @param userNumber 用户手机号码
	 * 	 * @param workNumber 随行人员手机号码
	 * 	 * @param workPlace 工作单位哦
	 * 	 * @param position 职位
	 * 	 * @param titles 职称
	 * 	 * @param email 电子邮箱
	 * 	 * @param arrivalDate 到达日期
	 * 	 * @param arrivalNumber 到达车次
	 * 	 * @param arrivalTime 到达时间
	 * 	 * @param arrivalStation 到达车站
	 * 	 * @param returnDate 返程日期
	 * 	 * @param returnNumber 返程车次
	 * 	 * @param returnTime 返程时间
	 * 	 * @param returnStation 返程车站
	 * 	 * @param remark 备注
	 * 	 * @param imageFile 个人照片
	 * @return
	 */
	@RequestMapping(value="/addUser.action")
	public String addUser(HttpServletRequest request,Model model,
			@RequestParam(value="userName",required=true) String userName,
			@RequestParam(value="userNumber",required=true) String userNumber,
			@RequestParam(value="sex",required=true) String sex,
			@RequestParam(value="userRole", required = true) String userRole,
			@RequestParam(value="workNumber",required=false) String workNumber,
			@RequestParam(value = "userAgent", required = true) String userAgent,
			@RequestParam(value="workPlace",required=true) String workPlace,
			@RequestParam(value="position",required=true) String position,
			@RequestParam(value="titles",required=true) String titles,
			@RequestParam(value="email",required=true) String email,
			@RequestParam(value="arrivalDate",required=false) String arrivalDate,
			@RequestParam(value="arrivalNumber",required=false) String arrivalNumber,
			@RequestParam(value="arrivalTime",required=false) String arrivalTime,
			@RequestParam(value="arrivalStation",required=false) String arrivalStation,
			@RequestParam(value="returnDate",required=false) String returnDate,
			@RequestParam(value="returnNumber",required=false) String returnNumber,
			@RequestParam(value="returnTime",required=false) String returnTime,
			@RequestParam(value="returnStation",required=false) String returnStation,
//			@RequestParam(value="hname",required=true) String hname,
//			@RequestParam(value="htype",required=true) String htype,
			@RequestParam(value = "dinner", required = false , defaultValue = "不用餐") String dinner,
			@RequestParam(value="remark",required=false) String remark,
			@RequestParam(value = "checkin", required = false) String checkin,
			@RequestParam(value = "checkout", required = false) String checkout,
			@RequestParam("imageFile") MultipartFile imageFile
	){
		try{
			UserBean user = new UserBean();
			user.setUserName(userName);
			user.setUserNumber(userNumber);
			user.setSex(sex);
			user.setUserRole(userRole);
			user.setWorkerNumber(workNumber);
			user.setUserSorts(userAgent);
			user.setWorkPlace(workPlace);
			user.setPosition(position);
			user.setTitle(titles);
			user.setEmail(email);

			user.setArrivalDate(arrivalDate);
			user.setArrivalNumber(arrivalNumber);
			if(!arrivalTime.equals("")) {
				user.setArrivalTime(arrivalTime + ":00");
			}else{
				user.setArrivalTime(arrivalTime);
			}
			if (arrivalStation == null){
				arrivalStation = "自驾";
			}
			if (arrivalStation.equals("——请选择——")){
				arrivalStation = "";
			}
			user.setArrivalStation(arrivalStation);

			user.setReturnDate(returnDate);
			user.setReturnNumber(returnNumber);
			if(!returnTime.equals("")) {
				user.setReturnTime(returnTime + ":00");
			}else{
				user.setReturnTime(returnTime);
			}

			if (returnStation == null){
				returnStation = "自驾";
			}
			if (returnStation.equals("——请选择——")){
				returnStation = "";
			}
			user.setReturnStation(returnStation);

			if (dinner == null){
				dinner = "不用餐";
			}
			user.setDinner(dinner);
			user.setRemark(remark);
			if (checkin.equals("")){
				checkin = null;
			}
			if (checkout.equals("")){
				checkout = null;
			}
			user.setCheckin(checkin);
			user.setCheckout(checkout);

//			user.setHname(hname);
//			user.setHtype(htype);
			user.setHname("");
			user.setHtype("");

			String dateStr=pd.getNowDate1();

			//将图片写入到服务器目录下
			@SuppressWarnings("deprecation")
			String webRootPath=request.getRealPath("/");
			if(this.createFolder(userNumber,webRootPath)){
				String fileNameSuffix="";
				FileOutputStream out;
				String fileNamePrefix=webRootPath+"/userFiles/"+userNumber+"/";
				if(!imageFile.isEmpty()){
					fileNameSuffix=imageFile.getOriginalFilename().substring(imageFile.getOriginalFilename().lastIndexOf("."));
					try{
						byte[] bytes = imageFile.getBytes();
						if(bytes.length!=0){
							File myTfileHead=new File(fileNamePrefix+dateStr+fileNameSuffix);
							if(myTfileHead.exists()){
								myTfileHead.delete();
								myTfileHead.createNewFile();
							}
							out=new FileOutputStream(fileNamePrefix+dateStr+fileNameSuffix);
							out.write(bytes);
							out.close();
							user.setUserPhoto("userFiles/"+userNumber+"/"+dateStr+fileNameSuffix);
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}

			//使用用户名保存
			if(this.createFolder(userName,webRootPath)){
				String fileNameSuffix="";
				FileOutputStream out;
				String fileNamePrefix=webRootPath+"/userFiles/"+userName+"/";
				if(!imageFile.isEmpty()){
					fileNameSuffix=imageFile.getOriginalFilename().substring(imageFile.getOriginalFilename().lastIndexOf("."));
					try{
						byte[] bytes = imageFile.getBytes();
						if(bytes.length!=0){
							File myTfileHead=new File(fileNamePrefix+userName+fileNameSuffix);
							if(myTfileHead.exists()){
								myTfileHead.delete();
								myTfileHead.createNewFile();
							}
							out=new FileOutputStream(fileNamePrefix+userName+fileNameSuffix);
							out.write(bytes);
							out.close();
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				}
			}

//			int consume = hotelService.consumeHnumber(hname,htype);
			int result = 0;
//			if(consume == 1){
//				result = userService.addUser(user);
//			}
			String message1 = "尊敬的"+userName+"老师：您好，欢迎来津参加“六卓越一拔尖”计划2.0启动大会，感谢您积极注册信息。" +
					"目前我们已将住宿信息和接驳信息更新于网站，请您及时关注查询，网站为：http://202.113.8.130:8081/tju/login.jsp。" +
					"如有疑问，可随时与会务组保持联系，联系方式022-85356048、022-27405647。祝您工作顺利。天津大学。";

			String message0 = "尊敬的"+userName+"老师：您好，欢迎来津参加“六卓越一拔尖”计划2.0启动大会实施工作专题培训，" +
					"感谢您积极注册信息。目前我们已将住宿信息更新于网站，请您及时关注查询，网站为：http://202.113.8.130:8081/tju/login.jsp。" +
					"如有疑问，可随时与会务组保持联系，联系方式022-85356048、022-27405647。祝您工作顺利。天津大学。";

			result = userService.addUser(user);
			if(result>0){
				model.addAttribute("message",11);
				try{
					if (userRole.equals("0")){
						messageService.sendMessage(userNumber,message0);
					}
					if (userRole.equals("1")) {
						messageService.sendMessage(userNumber,message1);
					}
					return "redirect:login.jsp";
				}catch (Exception e){
					e.printStackTrace();
					return "redirect:login.jsp";
				}

			}else{
				model.addAttribute("message",10);
				return "redirect:login.jsp";
			}

		}catch(Exception e){
			e.printStackTrace();
			return GetHttp.isMobileDevice(request)?"pages/error/error":"MobilePages/error/error";
		}
	}

	/**
	 * 修改用户信息之前,获取一些参数
	 * @param request
	 * @param session
	 * @param model
	 * @param userNumber 用户手机号
	 * @return
	 */
	@RequestMapping(value="/updateUserBefore.do")
	public String updateDeviceBefore(HttpServletRequest request,HttpSession session,Model model,
			@RequestParam(value="userNumber",required=true) String userNumber){
		try{
			UserBean db = userService.searchUserByUserNumber(userNumber);
		
			model.addAttribute("db",db); 
			return GetHttp.isMobileDevice(request)? "pages/user/updateUser" :"MobilePages/user/updateUser";
		}catch(Exception e){
			e.printStackTrace();
			return "pages/error";
		}

	}
	/**
	 * 修改设备信息
	 * @param request
	 * @param model
	 * @param userName 用户姓名
	 * @param userNumber 用户手机号码
	 * @param workNumber 随行人员手机号码
	 * @param workPlace 工作单位哦
	 * @param position 职位
	 * @param titles 职称
	 * @param email 电子邮箱
	 * @param arrivalDate 到达日期
	 * @param arrivalNumber 到达车次
	 * @param arrivalTime 到达时间
	 * @param arrivalStation 到达车站
	 * @param returnDate 返程日期
	 * @param returnNumber 返程车次
	 * @param returnTime 返程时间
	 * @param returnStation 返程车站
	 * @param remark 备注
	 * @param imageFile 个人照片
	 * @return
	 */
	@RequestMapping(value="/updateUser.do")
	public String updateUser(HttpServletRequest request,HttpSession session,Model model,
			@RequestParam(value = "userName", required = true) String userName,
			@RequestParam(value = "userNumber", required = true) String userNumber,
			@RequestParam(value = "sex", required = true) String sex,
			@RequestParam(value = "userRole", required = true) String userRole,
			@RequestParam(value = "workNumber", required = false) String workNumber,
			@RequestParam(value = "userAgent", required = true) String userAgent,
			@RequestParam(value = "workPlace", required = true) String workPlace,
			@RequestParam(value = "position", required = true) String position,
			@RequestParam(value = "titles", required = true) String titles,
			@RequestParam(value = "email", required = true) String email,
			@RequestParam(value = "arrivalDate", required = false) String arrivalDate,
			@RequestParam(value = "arrivalNumber", required = false) String arrivalNumber,
			@RequestParam(value = "arrivalTime", required = false) String arrivalTime,
			@RequestParam(value = "arrivalStation", required = false) String arrivalStation,
			@RequestParam(value = "returnDate", required = false) String returnDate,
			@RequestParam(value = "returnNumber", required = false) String returnNumber,
			@RequestParam(value = "returnTime", required = false) String returnTime,
			@RequestParam(value = "returnStation", required = false) String returnStation,
//			@RequestParam(value = "hname", required = true) String hname,
//			@RequestParam(value = "htype", required = true) String htype,
			@RequestParam(value = "dinner", required = false, defaultValue = "不用餐") String dinner,
			@RequestParam(value = "remark", required = false) String remark,
			@RequestParam(value = "oldHname", required = true)String oldHname,
			@RequestParam(value = "oldHtype", required = true)String oldHtype,
			@RequestParam(value = "checkin") String checkin,
			@RequestParam(value = "checkout") String checkout,
			@RequestParam(value="oldImageUrl",required=false) String oldImageUrl,
			@RequestParam("imageFile") MultipartFile imageFile
	){
		try{
			UserBean user = new UserBean();
			user.setUserName(userName);
			user.setUserNumber(userNumber);
			user.setSex(sex);
			user.setUserRole(userRole);
			user.setWorkerNumber(workNumber);
			user.setUserSorts(userAgent);
			user.setWorkPlace(workPlace);
			user.setPosition(position);
			user.setTitle(titles);
			user.setEmail(email);

			user.setArrivalDate(arrivalDate);
			user.setArrivalNumber(arrivalNumber);

			if(arrivalTime.length() <=5 && !arrivalTime.equals("")){
				arrivalTime = arrivalTime + ":00";
			}
			user.setArrivalTime(arrivalTime);

			if (arrivalStation == null){
				arrivalStation = "自驾";
			}
			user.setArrivalStation(arrivalStation);

			user.setReturnDate(returnDate);
			user.setReturnNumber(returnNumber);

			if(returnTime.length() <=5 && !returnTime.equals("")){
				returnTime = returnTime + ":00";
			}
			user.setReturnTime(returnTime);

			if (returnStation == null){
				returnStation = "自驾";
			}
			if (returnStation.equals("——请选择——")){
				returnStation = "";
			}
			user.setReturnStation(returnStation);

			user.setDinner(dinner);
			user.setRemark(remark);
			if (checkin.equals("")){
				checkin = null;
			}
			if (checkout.equals("")){
				checkout = null;
			}
			user.setCheckin(checkin);
			user.setCheckout(checkout);

//			user.setHname(hname);
//			user.setHtype(htype);
			user.setHname(oldHname);
			user.setHtype(oldHtype);

			/**
			 * 上传图片存储处理
			 */
			@SuppressWarnings("deprecation")
			String webRootPath=request.getRealPath("/"); 
			String dateStr=pd.getNowDate1();
			File file=null;
			//将图片写入到服务器目录下
			if(this.createFolder(userNumber,webRootPath)){
				String fileNameSuffix="";
				FileOutputStream out;
				String fileNamePrefix=webRootPath+"/userFiles/"+userNumber+"/";
				if(!imageFile.isEmpty()){
					fileNameSuffix=imageFile.getOriginalFilename().substring(imageFile.getOriginalFilename().lastIndexOf("."));
					try{	 
						byte[] bytes = imageFile.getBytes();
						if(bytes.length!=0){	        			        				        					        		
							file=new File(fileNamePrefix+dateStr+fileNameSuffix);
							if(file.exists()){
								file.delete();	        	
								file.createNewFile();	       
							}
							out=new FileOutputStream(fileNamePrefix+dateStr+fileNameSuffix);	  	                              			
							out.write(bytes);
							out.close();
							user.setUserPhoto("userFiles/"+userNumber+"/"+dateStr+fileNameSuffix);//将数据库中的旧图片路径替换为新图片路径
							if(oldImageUrl!=null&&!oldImageUrl.equals("")){//删除旧图片
								file=new File(webRootPath+"/"+oldImageUrl);
								if(file.exists()){
									file.delete();	        	
								}
							}
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				}else {
					user.setUserPhoto(oldImageUrl);
				}
			}

			if(this.createFolder(userName,webRootPath)){
				String fileNameSuffix="";
				FileOutputStream out;
				String fileNamePrefix=webRootPath+"/userFiles/"+userName+"/";
				if(!imageFile.isEmpty()){
					fileNameSuffix=imageFile.getOriginalFilename().substring(imageFile.getOriginalFilename().lastIndexOf("."));
					try{
						byte[] bytes = imageFile.getBytes();
						if(bytes.length!=0){
							file=new File(fileNamePrefix+dateStr+fileNameSuffix);
							if(file.exists()){
								file.delete();
								file.createNewFile();
							}
							out=new FileOutputStream(fileNamePrefix+dateStr+fileNameSuffix);
							out.write(bytes);
							out.close();

							if(oldImageUrl!=null&&!oldImageUrl.equals("")){//删除旧图片
								file=new File(webRootPath+"/"+oldImageUrl);
								if(file.exists()){
									file.delete();
								}
							}
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				}else {
					user.setUserPhoto(oldImageUrl);
				}
			}

//			int resume = 0, consume = 0;
//			if (!oldHname.equals(hname) || !oldHtype.equals(htype)){
//				resume = hotelService.resumeHnumber(oldHname,oldHtype);
//			}
//			if(resume == 1){
//				consume = hotelService.consumeHnumber(hname,htype);
//			}

			int result = userService.updateUser(user);

			if(result>0){
				model.addAttribute("message",1);
				return "redirect:viewUser.do?userNumber="+userNumber; //修改成功
			}else{
				model.addAttribute("message",0);
				return "redirect:updateUserBefore.do?userNumber="+userNumber; //修改失败
			}
		}catch(Exception e){
			e.printStackTrace();
			return "pages/error/error";
		}
	}

	/**
	 * 查看用户信息
	 * @param request
	 * @param model
	 * @param userNumber 用户手机号码
	 * @return
	 */
	@RequestMapping(value="/viewUser.do")
	public String viewUser(HttpServletRequest request,HttpSession session,Model model,
			@RequestParam(value="userNumber",required=true) String userNumber){
		try{
			UserBean db = userService.searchUserByUserNumber(userNumber);

			model.addAttribute("db",db);
			return GetHttp.isMobileDevice(request)?"pages/user/viewUser":"MobilePages/user/viewUser";
			
		}catch(Exception e){
			e.printStackTrace();
			return "pages/error";
		}
	}

	/**
	 * 签到，移动端使用
	 * @param request
	 * @param response
	 * @param userNumber
	 * @return
	 */
	@RequestMapping(value = "/attend.do")
	public void userAttend(HttpServletRequest request, HttpServletResponse response,
						   @RequestParam(value="userNumber",required=true) String userNumber){
		try{
			SigninBean user = new SigninBean();
			user.setStatus(true);
			user.setUserNumber(userNumber);
			Date date = new Date();
			Timestamp now = new java.sql.Timestamp(date.getTime());
			user.setSignintime(now);

			int result = signinService.updateSignin(user);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(result);

		}catch (Exception e){
			e.printStackTrace();
		}
	}

	/**
	 *
	 * @param request
	 * @param response
	 * @param userNumber
	 */
	@RequestMapping(value = "/attendCheck.do")
	public void attendCheck(HttpServletRequest request, HttpServletResponse response,
							@RequestParam(value="userNumber", required = true) String userNumber){
		try{
			SigninBean user = signinService.searchSigninByuserNumber(userNumber);
			response.setCharacterEncoding("UTF-8");
			if (user.isStatus()){
				response.getWriter().print(true);
			}else{
				response.getWriter().print(false);
			}
		}catch (Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * 根据酒店名称获取剩余的房间类型
	 * @param request
	 * @param response
	 * @param hname
	 */
	@RequestMapping(value = "/checkHtype.action")
	public void checkHtype(HttpServletRequest request,HttpServletResponse response,
							 @RequestParam(value = "hname", required = true) String hname){
		try{
			List<String> type = hotelRoomService.listHtypeByHname(hname);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(type);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/viewLiaisonAndDriver.do")
	public String viewDriver(HttpServletRequest request, HttpSession session, Model model,
							 @RequestParam(value="userNumber",required=true) String userNumber){

		try{
			LiaisonBean liaison = liaisonService.searchLiaisonByUserNumber(userNumber);

			UserDriverBean ud = userDriverService.searchUserDriverByUserNumber(userNumber);
			DriverBean driver = driverService.searchDriverByDplate(ud.getDplate());

			model.addAttribute("liaison",liaison);
			model.addAttribute("driver", driver);

			return	GetHttp.isMobileDevice(request)?"pages/user/viewLiaisonAndDriver":"MobilePages/user/viewLiaisonAndDriver";
		}catch(Exception e){
			e.printStackTrace();
			return "pages/error";
		}
	}

	@RequestMapping(value = "/viewHotel.do")
	public String viewHotel(HttpServletRequest request, HttpSession session, Model model,
							@RequestParam(value="userNumber",required=true) String userNumber){
		try{
			UserBean user = userService.searchUserByUserNumber(userNumber);
			HotelBean hotel = hotelService.getHurlByHname(user.getHname());

			model.addAttribute("user",user);
			model.addAttribute("hotel",hotel);

			return GetHttp.isMobileDevice(request)?"pages/user/viewHotel":"MobilePages/user/viewHotel";
		}catch(Exception e){
			e.printStackTrace();
			return "pages/error";
		}
	}

	/**
	 * 创建用户的专属文件夹,存放该用户的图片或者视频
	 * @param folderName
	 * @param path
	 * @return
	 */
	private boolean createFolder(String folderName,String path){ 
		try {
			if (!(new File(path+"/userFiles/"+folderName+"/").isDirectory())) {                 //   linux系统 锟矫★拷\\锟斤拷
				new File(path+"/userFiles/"+folderName+"/").mkdir();
			}
		} catch (SecurityException e) {
			e.printStackTrace();
		}
		if((new File(path+"/userFiles/"+folderName+"/").isDirectory())){
			return true;
		}else{
			return false;
		}
	}

}
