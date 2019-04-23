<%@ page language="java" contentType="text/html" import="java.util.*,com.ictwsn.bean.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>信息收集页面</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-Control" content="no-transform" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=2.0, user-scalable=1"> -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="layoutmode" content="standard">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="renderer" content="webkit">


<!--uc浏览器判断到页面上文字居多时，会自动放大字体优化移动用户体验。添加以下头部可以禁用掉该优化-->
<meta name="wap-font-scale" content="no">

<meta content="telephone=no" name="format-detection" />
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">



<link rel="stylesheet" type="text/css"
	href="css/fontsIco.min.css?v=201707171211" />
<link rel="stylesheet" type="text/css"
	href="css/base.min.css?v=201708102044" title="default" />
<link rel="stylesheet" type="text/css"
	href="css/bannerAnimation.min.css?v=201611211856" title="" />
<link rel="stylesheet" id="mobiStyleTemplateCss" type="text/css"
	href="css/1011_1.min.css?v=201612121825" />
	<%--<link rel="stylesheet" href="css/reset.css">--%>
	<%--<link rel="stylesheet" href="css/super-calendar.css">--%>


<!-- //横向标签样式css -->
<style id='mobiTabStyleCss'>
.fk-tabStyle2 .f-formTabButtonList .formTabButtonClick {
	border-bottom-color: #ff692c;
}

.fk-tabStyle2 .f-formTabButtonList .formTabButtonClick {
	color: #ff692c;
}

.fk-tabStyle1 div.formTabButtonClick .f-formTabMiddle {
	background-color: #ff692c;
}
</style>

<!-- //输出模块样式css -->
<style id='mobiStyleModule'>
</style>
<style id='mobiStyleNav' type='text/css'>
.open .navItem:nth-child(2) {
	transition-delay: 160ms;
}

.open .navItem:nth-child(4) {
	transition-delay: 240ms;
}

.open .navItem:nth-child(6) {
	transition-delay: 320ms;
}

#navbar_105 .icon-navItemIcon:before {
	content: '';
	content: '';
}

#navbar_105 .icon-navItemIcon {
	background-image: none;
}

.open .navItem:nth-child(8) {
	transition-delay: 400ms;
}

.open .navItem:nth-child(10) {
	transition-delay: 480ms;
}

.open .navItem:nth-child(12) {
	transition-delay: 560ms;
}
</style>

<style id="webBodyBackgroundStyle">
#g_web {
	background: none;
}

#webContainerBox {
	background: none;
}

#webBodyBackground {
	background:
		url(http://10937501.s61i.faiusr.com/2/AD0IncmbBRACGAAg4_6yvwUon4fR8gEwgAU46Ac.jpg)
		center center;
	background-size: cover;
}
</style>

<style id='mobiCubeStyleModule'>
</style>

<style id='mobiSearchStyleModule'>
</style>




<!-- 输出底部样式 -->
<style id='fixedAreaBoxStyle'>
</style>


<!-- 系统特殊隐藏栏目隐藏头部、banner -->


</head>

<body faiscoMobi="true" id="g_body" class="g_locale2052 mobiCol3">
<script type="text/javascript" src="js/layer.js"></script>
	<script type="text/javascript">
		var _htmlFontSize = (function() {
			var clientWidth = document.documentElement ? document.documentElement.clientWidth
					: document.body.clientWidth;
			if (clientWidth > 768 && clientWidth < 1280) {
				clientWidth = 768;
			} else if (clientWidth >= 1280) {
				clientWidth = 512;
			}
			document.documentElement.style.fontSize = clientWidth * 1 / 16
					+ "px";
			return clientWidth * 1 / 16;
		})();

		$(document).ready(function(){
			var message='<%=request.getParameter("message")%>';
			if(message!='null'){
				if(message==1){
					alert("信息添加成功!");
				}else if(message==0){
					alert("信息添加失败!");
				}

			}
		});
		function setType() {
			var clientIds = document.getElementById("selectClient");
			for ( var i = 0; i < clientIds.length; i++) {
				if (clientIds[i].selected == true) {
					document.getElementById("clientId").value = clientIds[i].value;
					break;
				}
			}
		}
		function search_htype(){
			var hname= document.getElementById("hname").value;

			$.post("checkHtype.action",{

				 	hname: hname


				 },function(type){
				 	if(type != []){
						type=type.replace("[","");

						type=type.replace("]","");
						type=type.split(',');
						var counts = type.length;
						for ( i=0;i<counts;i++ ) {
							type[i]=type[i].replace(" ","");
							document.addUserForm.htype.options[i] = new Option(value=type[i],type[i]);
						}
				 	}else{
						document.addUserForm.htype.options[0] = '无空房';

				 	}
				 });
		}
		function checkdinner() {

			if($("#dinner0").prop("checked")){
				$("#dinner28").removeAttr("checked");
				$("#dinner28").attr("disabled","disabled");
				$("#dinner290").removeAttr("checked");
				$("#dinner290").attr("disabled","disabled");
				$("#dinner291").removeAttr("checked");
				$("#dinner291").attr("disabled","disabled");
			}
			else{
				$("#dinner28").removeAttr("disabled");
				$("#dinner290").removeAttr("disabled");
				$("#dinner291").removeAttr("disabled");
			}
		}
		// $(".calendar-box").superCalendar({
		// 	target: "#hotalTime",
		// 	callback: function(date) {
		// 		console.log(date)
		// 	}
		// });


		function addUser(){

			var userName = document.getElementById("userName").value;
			var userNumber = document.getElementById("userNumber").value;
			var userAgent= document.getElementById("userAgent").value;
			var workPlace= document.getElementById("workPlace").value;
			var position= document.getElementById("position").value;
			var titles= document.getElementById("titles").value;
			var email= document.getElementById("email").value;
			var arrivalDate= document.getElementById("arrivalDate").value;
			var arrivalNumber= document.getElementById("arrivalNumber").value;
			var arrivalTime= document.getElementById("arrivalTime").value;
			var arrivalStation= document.getElementById("arrivalStation").value;
			var returnDate= document.getElementById("returnDate").value;
			var returnNumber= document.getElementById("returnNumber").value;
			var returnTime= document.getElementById("returnTime").value;
			var returnStation= document.getElementById("returnStation").value;
			var userDinner=document.getElementsByName("dinner");
			var checkin= document.getElementById("checkin").value;
			var checkout= document.getElementById("checkout").value;
			var arrivalStyle = document.getElementById("arrivalStyle").value;
			var returnStyle = document.getElementById("returnStyle").value;
			var imageFile = document.getElementById("imageFile").value;
			var hotalStyle=document.getElementById("hotalStyle").value;
			// var hname= document.getElementById("hname").value;
			// var htype= document.getElementById("htype").value;
			if(userName==""){
				document.getElementById("notice").style.display="block";
				document.getElementById("notice").innerHTML="请填写姓名!";
				// Mobi.scrollToTop('webContainerBox');
				return 0;
			}
			if(userNumber==""){
				document.getElementById("notice").style.display="block";
				document.getElementById("notice").innerHTML="请填写手机号!";

				return 0;
			}
			if(userAgent==""){
				document.getElementById("notice").style.display="block";
				document.getElementById("notice").innerHTML="请选择人员类别!";

				return 0;
			}
			if(workPlace==""){
				document.getElementById("notice").style.display="block";
				document.getElementById("notice").innerHTML="请填写所在单位!";

				return 0;
			}
			if(position==""){
				document.getElementById("notice").style.display="block";
				document.getElementById("notice").innerHTML="请填写职位!";

				return 0;
			}
			if(titles==""){
				document.getElementById("notice").style.display="block";
				document.getElementById("notice").innerHTML="请填写职称!";

				return 0;
			}
			if(email==""){
				document.getElementById("notice").style.display="block";
				document.getElementById("notice").innerHTML="请填写邮箱!";

				return 0;
			}
			// if(arrivalDate==""){
			// 	document.getElementById("notice").style.display="block";
			// 	document.getElementById("notice").innerHTML="请选择抵达日期!";
			// 	Mobi.scrollToTop('webContainerBox');
			// 	return 0;
			// }
			// if(arrivalNumber==""){
			// 	document.getElementById("notice").style.display="block";
			// 	document.getElementById("notice").innerHTML="请填写抵达车次!";
			// 	Mobi.scrollToTop('webContainerBox');
			// 	return 0;
			// }
			// if(arrivalTime==""){
			// 	document.getElementById("notice").style.display="block";
			// 	document.getElementById("notice").innerHTML="请选择抵达时间!";
			// 	Mobi.scrollToTop('webContainerBox');
			// 	return 0;
			// }
			// if(arrivalStation==""){
			// 	document.getElementById("notice").style.display="block";
			// 	document.getElementById("notice").innerHTML="请填写抵达车站!";
			// 	Mobi.scrollToTop('webContainerBox');
			// 	return 0;
			// }
			// if(returnDate==""){
			// 	document.getElementById("notice").style.display="block";
			// 	document.getElementById("notice").innerHTML="请选择返程日期!";
			// 	Mobi.scrollToTop('webContainerBox');
			// 	return 0;
			// }
			// if(returnNumber==""){
			// 	document.getElementById("notice").style.display="block";
			// 	document.getElementById("notice").innerHTML="请填写返程车次!";
			// 	Mobi.scrollToTop('webContainerBox');
			// 	return 0;
			// }
			// if(returnTime==""){
			// 	document.getElementById("notice").style.display="block";
			// 	document.getElementById("notice").innerHTML="请填写返程时间!";
			// 	Mobi.scrollToTop('webContainerBox');
			// 	return 0;
			// }
			// if(returnStation==""){
			// 	document.getElementById("notice").style.display="block";
			// 	document.getElementById("notice").innerHTML="请选择返程车站!";
			// 	Mobi.scrollToTop('webContainerBox');
			// 	return 0;
			// }
			// if(hname==""){
			// 	document.getElementById("notice").style.display="block";
			// 	document.getElementById("notice").innerHTML="请选择酒店!";
			// 	Mobi.scrollToTop('webContainerBox');
			// 	return 0;
			// }
			// if(htype==""){
			// 	document.getElementById("notice").style.display="block";
			// 	document.getElementById("notice").innerHTML="请选择房型!";
			// 	Mobi.scrollToTop('webContainerBox');
			// 	return 0;
			// }
			if(checkin==""&&hotalStyle=='统一安排'){
				document.getElementById("notice").style.display="block";
				document.getElementById("notice").innerHTML="请填写入住时间!";

				return 0;
			}
			if(checkout==""&&hotalStyle=='统一安排'){
				document.getElementById("notice").style.display="block";
				document.getElementById("notice").innerHTML="请填写退房时间!";

				return 0;
			}
			if (arrivalStyle == '自驾') {
				if (arrivalDate == '') {
					document.getElementById("notice").style.display = "block";
					document.getElementById("notice").innerHTML = "请填写到达日期!";

					return 0;
				}}
			var arrival_list=arrivalTime+arrivalDate+arrivalNumber+arrivalStation;
			if (arrival_list!="") {
				if(arrivalStyle!='自驾'){


				if (arrivalTime == "" || arrivalDate == "" || arrivalNumber == "" || arrivalStation == "" ) {
					document.getElementById("notice").style.display = "block";
					document.getElementById("notice").innerHTML = "若要填写到达信息,请填写完整!";

					return 0;
				}
			}}
			if (returnStyle == '自驾') {
				if (returnDate == '') {
					document.getElementById("notice").style.display = "block";
					document.getElementById("notice").innerHTML = "请填写返程日期!";

					return 0;
				}}
			if(returnTime+returnDate+returnNumber+returnStation!="") {
				if (returnStyle != '自驾') {
					if (returnTime == "" || returnDate == "" || returnNumber == "" || returnStation == "") {
						document.getElementById("notice").style.display = "block";
						document.getElementById("notice").innerHTML = "若要填写返程信息,请填写完整!";

						return 0
					}
				}
			}
			var idx = imageFile.lastIndexOf(".");
			var lastName = imageFile.substring(idx,imageFile.length);
			var name = lastName.toLowerCase();
			if(name != ".jpg" && name != ".jpeg" && name != ".png") {
				document.getElementById("notice").style.display="block";
				document.getElementById("notice").innerHTML="照片格式错误，必须为jpg 或者 png!";

				return 0;
			}
			var size=$("#imageFile")[0].files[0].size;
			if(size<20480){
				document.getElementById("notice").style.display="block";
				document.getElementById("notice").innerHTML="照片大小需大于20kb!";

				return 0;
			}
			$.post("addUserBefore.action",{

				userNumber: userNumber


			},function(result) {
				if(result==1){
					document.getElementById("notice").style.display = "block";
					document.getElementById("notice").innerHTML = "手机号已注册!";

					if(window.confirm("手机号已注册!点击确定跳转到登录页面")){
						window.location.href='login.jsp';
					}
				}
				else{

					document.addUserForm.submit();
					layer.open({
						content: '正在提交数据，请等待！'
						,style: 'border:none; background-color:#78BA32; color:#fff;'//自定风格
						,fixed:false
					});
				}
			});

		}
		
	</script>

	<div class="webLeft"></div>
	<div id="g_web" class="g_web">
		<!-- this is loading  -->
		<div id="webLoading" class="loading" style='display:none;'>
			<div id="splashscreen" class='splashscreen ui-loader'>
				<span class='ui-icon ui-icon-loading spin'></span>
			</div>
		</div>
		
		<div class='loginHeader webHeaderBg'>
			<span class='title pageTitle'>信息收集</span>
		</div>
		<div id="webBannerBox" class="webBannerBox  ">
			<div id='webBanner' style='display:none;' class='webBanner'></div>
		</div>
		<div id="webContainerBox" class="webContainerBox">
			<div id="webModuleContainer" class="webModuleContainer">
				<div id='module9' class='form Handle  formStyle14 ' _autoHeight='1'
					_height='0' _bHeight='0' _inTab='0'>

						<div class='formMiddle formMiddle9'>
							<div class='middleLeft middleLeft9'></div>
							<div class='middleCenter middleCenter9'>
								<div class='formMiddleContent formMiddleContent9 moduleContent'
									 _innerType='0'>
									<div id='signupPage'>
										<div class='signUpContent'>
											<div id='profileArea'>
												<form id="addUserForm" name="addUserForm" action="addUser.action"
													  method="post" enctype="multipart/form-data">

													<div class='g_globalLine '>
														<input type='text' maxlength='50' id='userName' name='userName'
															   class='mustItem itemEdit userAddItem g_input' placeholder='(必填)' onblur="checkinfo(this)"
															   ><span
															class='icon-nameIcon g_mainColor' ></span><span
															class='mustIcon'>&nbsp;</span>

													</div>
													<div class='g_globalLine '>
														<input type='text' maxlength='11' minlength="11" name="userNumber"
															   class='mustItem itemEdit userAddItem g_input' id='userNumber' placeholder='(必填)' onblur="checkinfo_tel(this)"
															    ><span
															class='icon-userNumberIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>
													<div class='g_globalLine '>
														<input maxlength='11' minlength="11" type='hidden' name="userRole"
															   class='mustItem itemEdit userAddItem g_input' id='userRole' value="1" onblur="checkinfo(this)"
														>
													</div>
													<div class='g_globalLine '>
														<select type='text' maxlength='50' id='sex' name="sex"
																class='mustItem itemEdit userAddItem g_input' placeholder='(必选)'>
															<option value ="男">男</option>
															<option value ="女">女</option>
														</select><span
															class='icon-userSexIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>
													<div class='g_globalLine '>
														<select type='text' name="userAgent"
															   class='mustItem itemEdit userAddItem g_input' id='userAgent' onblur="checkinfo(this)"
															   placeholder='(必选)'
															    >
															<option value ="省级教育行政部门">省级教育行政部门</option>
															<option value ="部署、合建高校">部署、合建高校</option>
															<option value ="有关部委">有关部委</option>
															<option value ="部内有关司局单位">部内有关司局单位</option>
														</select><span
															class='icon-userAgentIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>

													</div>
													<div class='g_globalLine '>
														<input type='text' maxlength='50' id='workPlace' name="workPlace"
															   list="workplacelist" onfocus="fuzzySearch.call(this)"
															   class='mustItem itemEdit userAddItem g_input selectInput' placeholder='(必填)' onblur="checkinfo(this)"
														>
														<div class="picture_click dropDowns" style=""></div>
														<div id="workplacelist" class="selectList">

														</div><span
																class='icon-workPlaceIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>

													</div>
													<div class='g_globalLine '>
														<input type='text' maxlength='50' id='position' name="position"
															   class='mustItem itemEdit userAddItem g_input' placeholder='(必填)' onblur="checkinfo(this)"
															   ><span
															class='icon-positionIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>
													<div class='g_globalLine '>
														<select type='text' maxlength='50' id='titles' name="titles"
															   class='mustItem itemEdit userAddItem g_input' placeholder='(必填)'>
															<option value ="教授及同等职称">教授及同等职称</option>
															<option value ="副教授及同等职称">副教授及同等职称</option>
															<option value="其他">其他</option>
														</select>
														<span
															class='icon-titlesIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>
													<div class='g_globalLine '>
														<input type='email' maxlength='50' id='email' name="email"
															   class='mustItem itemEdit userAddItem g_input' placeholder='(必填)' onblur="checkinfo(this)"
															    ><span
															class='icon-emailIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>
													<div class="g_globalLine">
														<h4 style="color: blue">请注意，以上信息提交后将无法修改。</h4>
													</div>
													<div class="g_globalLine" >
														<select type='text' maxlength='50' id='arrivalStyle' name="arrivalStyle" onchange="checkarrive(this)"
																class='mustItem itemEdit userAddItem g_input'>
															<option id="default_arrivalStyle">——请选择——</option>
															<option value="自驾">自驾</option>
															<option value ="公共交通">公共交通(请将到达信息填写完整)</option>

														</select>
														<span class="icon-arrivalStyleIcon g_mainColor"></span>
														<span class='mustIcon'>&nbsp;</span>
													</div>
													<div class='g_globalLine '>
														<input type='text' maxlength='50' id='arrivalDate' name="arrivalDate"
															   class='mustItem itemEdit userAddItem g_input'
															    ><span
															class='icon-arrivalDateIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>
													<div class='g_globalLine '>
														<input type='text' maxlength='50' id='arrivalNumber' name="arrivalNumber"
															   class='mustItem itemEdit userAddItem g_input'
															    ><span
															class='icon-arrivalNumberIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>
													<div class='g_globalLine '>
														<input type='time' maxlength='50' id='arrivalTime' name="arrivalTime"
															   class='mustItem itemEdit userAddItem g_input'
															  ><span
															class='icon-arrivalTimeIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>

													<div class='g_globalLine '>
														<select type='text' maxlength='50' id='arrivalStation' name="arrivalStation"
															   class='mustItem itemEdit userAddItem g_input'>
															<option id="default_arrive" ></option>
															<option id ="zijia" value="自驾" style="display: none">自驾</option>
														<option value ="天津站">天津站</option>
														<option value ="天津西站">天津西站</option>
														<option value="天津南站">天津南站</option>
														<option value="滨海机场">滨海机场</option>
														</select>
														<span
															class='icon-arrivalStationIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>
													<div class="g_globalLine">
														<select type='text' maxlength='50' id='returnStyle' name="returnStyle" onchange="checkreturn(this)"
																class='mustItem itemEdit userAddItem g_input'>
															<option id="default_returnStyle">——请选择——</option>
															<option value="自驾">自驾</option>
															<option value ="公共交通">公共交通(请将返程信息填写完整)</option>

														</select>
														<span class="icon-returnStyleIcon g_mainColor"></span>
														<span class='mustIcon'>&nbsp;</span>
													</div>
											</div>
													<div class='g_globalLine '>
														<input type='text' maxlength='50' id='returnDate' name="returnDate"
															   class='mustItem itemEdit userAddItem g_input'
															   ><span
															class='icon-returnDateIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>
													<div class='g_globalLine '>
														<input type='text' maxlength='50' id='returnNumber' name="returnNumber"
															   class='mustItem itemEdit userAddItem g_input'
															  ><span
															class='icon-returnNumberIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>
													<div class='g_globalLine '>
														<input type='time' maxlength='50' id='returnTime' name="returnTime"
															   class='mustItem itemEdit userAddItem g_input'
															    ><span
															class='icon-returnTimeIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>
													<div class='g_globalLine '>
														<select type='text' maxlength='50' id='returnStation' name="returnStation"
															   class='mustItem itemEdit userAddItem g_input'
															   >
															<option id="default_arrive" ></option>
															<option value="自驾" style="display: none">自驾</option>
															<option value ="天津站">天津站</option>
															<option value ="天津西站">天津西站</option>
															<option value="天津南站">天津南站</option>
															<option value="滨海机场">滨海机场</option>
															</select>
														<span
															class='icon-returnStationIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>
											<div class='g_globalLine '>
												<select type='text' maxlength='50' id='hotalStyle' name="hotalStyle"
														class='mustItem itemEdit userAddItem g_input' onchange="checkhotal(this)"
												>
													<option id="default_Style">——请选择——</option></option>
													<option value="自行安排" >自行安排</option>
													<option value ="统一安排">统一安排</option>

												</select>
												<span
														class='icon-hotalStyleIcon g_mainColor'></span><span
													class='mustIcon'>&nbsp;</span>
											</div>
													<div class='g_globalLine '>
														<div type='text' maxlength='20' id='userDinner' name="userDinner"
															   class='mustItem itemEdit userAddItem g_input'
														>
															28日晚 <input type="checkbox" name="dinner" id='dinner28' value="28日晚" />
															29日午 <input type="checkbox" name="dinner" id='dinner290' value="29日午" />
															29日晚 <input type="checkbox" name="dinner" id='dinner291' value="29日晚" />
															<%--无<input type="checkbox" name="dinner" id='dinner0' value="不用餐" onclick="checkdinner()"/>--%>
															<span
															class='icon-userDinnerIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>
													</div>
													<div class='g_globalLine '>
														<input type='text' maxlength='50' id='checkin' name="checkin"
															   class='mustItem itemEdit userAddItem g_input' onblur="checkinfo(this)" onfocus="checkinfo(this)"
														>
															<span
															class='icon-checkinIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>
													<div class='g_globalLine '>
														<input type='text' maxlength='50' id='checkout' name="checkout" onblur="checkinfo(this)" onclick="checkinfo(this)"
															   class='mustItem itemEdit userAddItem g_input'
														>
														<span
																class='icon-checkoutIcon g_mainColor'></span><span
															class='mustIcon'>&nbsp;</span>
													</div>


													<%--<div class='g_globalLine '>--%>

														<%--<select type='text' maxlength='50' id='hname'  name="hname"--%>
																<%--onclick="search_htype()"--%>
														<%--class='mustItem itemEdit userAddItem g_input'>--%>
															<%--<option value ="volvo">Volvo</option>--%>
															<%--<option value ="saab">Saab</option>--%>
															<%--<option value="opel">Opel</option>--%>
															<%--<option value="audi">Audi</option>--%>
														<%--</select>--%>
															    <%--<span--%>
															<%--class='icon-hnameIcon g_mainColor'></span><span--%>
															<%--class='mustIcon'>&nbsp;</span>--%>
													<%--</div>--%>
													<%--<div class='g_globalLine '>--%>
														<%--<select type='text' maxlength='50' id='htype' name="htype"--%>
															   <%--class='mustItem itemEdit userAddItem g_input' onfocus="search_htype()"--%>
															   <%-->--%>
															<%--</select>--%>
															<%--<span--%>
															<%--class='icon-htypeIcon g_mainColor'></span><span--%>
															<%--class='mustIcon'>&nbsp;</span>--%>

													<div class='g_globalLine '>
														<input type='text' maxlength='50' id='remark_content' name='remark_content'
															   class='mustItem itemEdit userAddItem g_input'
															   placeholder='请在下方文本框输入,不超过200字' readonly="readonly"><span
															class='icon-remarkIcon g_mainColor'></span>
													</div>
													<div class='g_globalLine '>
														<textarea id='remark' name='remark'
																  class='mustItem itemEdit userAddItem g_textArea msg_textArea' placeholder='单间或标间'
																  id='content'></textarea>
													</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class='middleRight middleRight9'></div>
						</div>
				</div>
				<div id="module414" class="form Handle  formStyle13" _autoheight="1"
					_height="0" _bheight="0" _intab="0" style="height: auto;">
					<div style="cursor:move;" _bannerautoheight="1"
						 class="formBannerTitle formBannerTitle414">
						<div class="titleLeft titleLeft414"></div>
						<div class="titleCenter titleCenter414">
							<div class="titleText titleText414">
								<div class="titleTextIcon icon-titleText">&nbsp;</div>
								<div class="textContent">上传照片</div>
							</div>
							<div class="formBannerMore formBannerMore414"></div>
						</div>
						<div class="titleRight titleRight414"></div>
					</div>
					<div class='g_globalLine '>
						<h5>用于制作代表证，请上传近期证件照</h5>
					</div>
					<div class="formMiddle formMiddle414">
						<div class="middleLeft middleLeft414"></div>
						<div class="middleCenter middleCenter414">
							<div class="formMiddleContent formMiddleContent414 moduleContent"
								_innertype="0">
								<div class="siteForm fk-siteForm-v">
									<div id="siteFormItems6" class="siteFormItemTable">
										<div class="siteFormItem siteFormItemTr">
											<div class="siteFormItemTd" width="100%"
												style="padding:0 0 0.45rem 0;">
												<div
													class="F6siteFormItemShowVal fk-siteFormItemShowVal f-fk-siteFormItemShowVal">
													<div class="fk-uploadComponent">
														<span id="uploadButton4140"> <input type="file"
															name="imageFile" id="imageFile" onchange="checkimage(this)"> </span> <font
															class="fk-importantStar">*</font>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
					<div class='g_globalLine '>
						<h4>29日早饭统一在酒店用餐</h4>
					</div>
				<div class="notice" id="notice" style="display:none"></div>
						<div class='signupSubmitCtrl g_globalLine'>

							<input type='button' style="cursor:pointer"
								   class='g_button sendIcon signupSubmit submitIcon' id="button1"
								   value='确认提交' onclick="addUser();"/>
						</div>
				</form>
			</div>
		</div>
		<div id="webFooterBox" class="webFooterBox  ">
			<!--图片详情Div -->
			<div id="fullScreenDivCotainer" class='fullScreenDivCotainer'></div>
		</div>

		<div id="fixedAreaBox" class="fixedAreaBox fixedAreaBox1011_1"
			tplid="1011_1"></div>

		<!--设置网站的背景颜色  start-->
		<div class="webBackgroundBox  ">
			<div id="webBodyBackground" class="webBackground "></div>
			<div id='navExistOffPanel' class='navExistOffPanel'></div>
		</div>
		<!--设置网站的背景颜色  end-->

		<!-- ------------------------------------------ -->
	</div>
	<div class="webRight"></div>
	
	<script type="text/javascript" charset="utf-8"
		src="js/jqmobi.min.js?v=201706192138"></script>
	<script type="text/javascript" charset="utf-8"
		src="js/jqmobi_ui.min.js?v=201708111609"></script>
	<script id="mobiOperationJS" type="text/javascript" charset="utf-8"
		src="js/mobi.min.js?v=201708091152"></script>
		<script type="text/javascript" charset="utf-8"
				src="js/laydate/laydate.js"></script>
	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="js/limitTextNum.js"></script>
	<script src="js/super-calendar.js"></script>

	<script>
		laydate.render({
			elem: '#arrivalDate'

		});

		laydate.render({

			elem: '#returnDate'
		});
		laydate.render({

			elem: '#checkin'
		});
		laydate.render({

			elem: '#checkout'
		});
	</script>

	<script type="text/javascript">
		function checkreturn(x) {
			if (x.value == '自驾') {
				$("#returnNumber").val('');
				$("#returnTime").val('');
				$("#returnStation").val('');
				document.addUserForm.returnStation.options[1].selected = true;
				$("#returnNumber").attr('readonly', 'readonly');
				$("#returnNumber").parent(".g_globalLine ").hide();
				$("#returnTime").attr('readonly', 'readonly');
				$("#returnTime").parent(".g_globalLine ").hide();
				$("#returnStation").attr('disabled', 'disabled');
			} else {
				$("#returnNumber").val('');
				$("#returnTime").val('');
				$("#returnStation").val('');
				$("#returnNumber").removeAttr('readonly');
				$("#returnNumber").parent(".g_globalLine ").show();
				$("#returnTime").removeAttr('readonly');
				$("#returnNumber").parent(".g_globalLine ").show();
				$("#returnStation").removeAttr('disabled');
			}
		}

		function checkarrive(x) {
			if (x.value == '自驾') {
				$("#arrivalNumber").val('');
				$("#arrivalTime").val('');
				$("#arrivalStation").val('');
				document.addUserForm.arrivalStation.options[1].selected = true;

				$("#arrivalNumber").attr('readonly', 'readonly');
				$("#arrivalNumber").parent(".g_globalLine ").hide();
				$("#arrivalTime").attr('readonly', 'readonly');
				$("#arrivalTime").parent(".g_globalLine ").hide();
				$("#arrivalStation").attr('disabled', 'disabled');
			} else {
				$("#arrivalNumber").val('');
				$("#arrivalTime").val('');
				$("#arrivalStation").val('');
				$("#arrivalNumber").removeAttr('readonly');
				$("#arrivalNumber").parent(".g_globalLine ").show();
				$("#arrivalTime").removeAttr('readonly');
				$("#arrivalTime").parent(".g_globalLine ").show();
				$("#arrivalStation").removeAttr('disabled');
			}
		}
	</script>
<script>
	function checkhotal(x){
		if(x.value=='自行安排'){
			$("#checkin").val('');
			$("#checkout").val('');
			$("#checkin").attr('readonly', 'readonly');
			$("#checkin").parent(".g_globalLine ").hide();
			$("#checkout").attr('readonly', 'readonly');
			$("#checkout").parent(".g_globalLine ").hide();
		}
		else{
			$("#checkin").val('');
			$("#checkout").val('');
			$("#checkin").removeAttr('readonly');
			$("#checkin").parent(".g_globalLine ").show();
			$("#checkout").removeAttr('readonly');
			$("#checkout").parent(".g_globalLine ").show();
		}
	}
</script>
	<script type="text/javascript" language="javascript">
		//管理态下的预览页面提前作处理 之前这里的g_viewMode先去掉
		if (!false && window.top !== window.self) {
			var g_className = document.getElementById("g_body").className;
			document.getElementById("g_body").className = g_className + " ";
		}

		//用于iframe显示手机模板的时候 给g_web加上width
		var g_webWidth = 0;
		if (g_webWidth == 0) {
			g_webWidth = window.localStorage ? localStorage
					.getItem("g_webWidth") : Cookie.read("g_webWidth");
			if (g_webWidth != null) {
				document.getElementById("g_web").style.width = g_webWidth
						+ "px";
			}
		} else {
			document.getElementById("g_web").style.width = g_webWidth + "px";
			if (window.localStorage) {
				localStorage.setItem("g_webWidth", g_webWidth);
			} else {
				Cookie.write("g_webWidth", g_webWidth);
			}
		}
	</script>
	<script src="js/jquery.js"></script>
	<script type="text/javascript">

		initSearchInput();

		function fuzzySearch(e) {

			var that = this;


			// $("#workplacelist").toggle();
			var listId = $(this).attr("list");
			var list = $('#' + listId + ' div');
			var listArr = [];
			$.each(list, function (index, item) {
				var obj = {'eleId': item.getAttribute('id'), 'eleName': item.innerHTML, 'ele': item};
				listArr.push(obj);
			});


			var current = 0;
			var showList = [];
			$(this).keyup(function (e) {
				//如果输入空格自动删除
				this.value = this.value.replace(' ', '');
				//列表框显示
				$('#' + listId).show();
				if (e.keyCode == 38) {
					//up
					console.log('up');
					current--;
					if (current <= 0) {
						current = 0;
					}
					console.log(current);
				} else if (e.keyCode == 40) {
					//down
					console.log('down');
					current++;
					if (current >= showList.length) {
						current = showList.length - 1;
					}
					console.log(current);

				} else if (e.keyCode == 13) {
					//enter
					console.log('enter');
					//如果按下回车，将此列表项的内容填充到文本框中
					$(that).val(showList[current].innerHTML);
					//下拉框隐藏
					$('#' + listId).hide();
				} else {
					console.log('other');


					var searchVal = document.getElementById("workPlace").value;
					showList = [];
					var work_place = [];
					//将和所输入的字符串匹配的项存入showList
					//将匹配项显示，不匹配项隐藏
					// $("#workplacelist").html("");
					$.each(listArr, function (index, item) {
						if (item.eleName.indexOf(searchVal) != -1) {
							item.ele.style.display = "block";
							showList.push(item.ele);
						} else {
							item.ele.style.display = "none";
						}
					});
					// for (i = 0; i < counts; i++) {
					// 	var place = array[i];
					//
					// 	if(place.indexOf(searchVal) != -1) {
					//
					//
					// 		work_place += "<option value='" + array[i] + "' ele='"+array[i]+"'>"+array[i]+"</option>";
					//
					//
					// 	}}
					// $("#workplacelist").append(work_place);
					console.log(showList);
					current = 0;
					// if(212 > $('#' + listId + ' div').eq(0).height() * showList.length) {
					// 	$('#' + listId).height($('#' + listId + ' div').eq(0).height() * showList.length);
					// }else {
					// 	$('#' + listId).height(212);
					// }


				}
			});

		}

		function initSearchInput() {
			//给下拉箭头绑定点击事件  点击下拉箭头显示/隐藏对应的列表
			//输入框的类名为selectInput
			//下拉箭头的类名为picture_click、dropDowns
			//下拉列表的类名为selectList
			// for(var i = 0; i < $('.workplacelist').length; i++) {
			// 	$('.workplacelist').eq(i).click(function(){
			// 		$(this).parent().find('.selectList').toggle();
			// 	})
			// }
			//为列表中的每一项绑定鼠标经过事件
			$.ajax({
				type: "get",
				url: "js/workplace.txt",
				dataType: "text",
				async: true
			}).done(function (data) {

				if (data != null) {
					var listArr = [];
					var array = data.split("\r\n");
					var counts = array.length;
					for (i = 0; i < counts; i++) {

						var html = "";
						listArr += "<div  id='" + array[i] + "' >" + array[i] + "</div>";


					}

					$("#workplacelist").append(listArr);
					$("#workplacelist").toggle();
					$('.selectList div').click(function () {
						//文本框为选中项的值
						$(this).parent().parent().find('.selectInput').val($(this).html());
						//下拉框隐藏
						$(this).parent().hide();
					});

					//点击下拉框外部的时候使下拉框隐藏
					var dropDowns = document.getElementsByClassName('dropDowns');
					var selectList = document.getElementsByClassName('selectList');
					document.body.onclick = function (e) {
						e = e || window.event;
						var target = e.target || e.srcElement;
						for (var i = 0; i < dropDowns.length; i++) {
							if (target != dropDowns[i] && target != selectList[i]) {
								selectList[i].style.display = 'none';
							}
						}
					}

				}
			});

			//为列表中的每一项绑定单击事件

		}

		function checkinfo(x) {

			var id = x.id;
			if (x.value == '' || x.value == null) {
				document.getElementById(id).style.border = "1px solid red";
			} else {
				document.getElementById(id).style.border = "1px solid grey";
			}


		}

		function checkinfo_tel(x) {
			var id = x.id;
			if (x.value == '' || x.value == null || x.value.length < 11) {
				document.getElementById(id).style.border = "1px solid red";
			} else {
				document.getElementById(id).style.border = "1px solid grey";
			}
		}

		// set_return_arrive();
		function set_return_arrive() {
			var returnStation = document.getElementById("returnStation").value;
			if (returnStation == '自驾') {

				$("#returnNumber").attr('readonly', 'readonly');
				$("#returnTime").attr('readonly', 'readonly');

			}
			var arriveStation = document.getElementById("arrivalStation").value;
			if (arriveStation == '自驾') {

				$("#arrivalNumber").attr('readonly', 'readonly');
				$("#arrivalTime").attr('readonly', 'readonly');

			}
		}

		function checktime() {
			var test_val0 = document.getElementById("checkin").value;
			if (test_val0 == '' || test_val0 == null) {
				document.getElementById("checkin").style.border = "1px solid red";
			} else {
				document.getElementById("checkin").style.border = "1px solid grey";
			}
			var test_val1 = document.getElementById("checkout").value;
			if (test_val1 == '' || test_val1 == null) {
				document.getElementById("checkout").style.border = "1px solid red";
			} else {
				document.getElementById("checkout").style.border = "1px solid grey";
			}
		}

			setInterval(checktime, 1000);
	</script>
<script>
	function checkimage(x){
		var imageFile = document.getElementById("imageFile").value;
		var idx = imageFile.lastIndexOf(".");
		var lastName = imageFile.substring(idx,imageFile.length);
		var name = lastName.toLowerCase();
		if(name != ".jpg" && name != ".jpeg" && name != ".png") {
			document.getElementById("notice").style.display="block";
			document.getElementById("notice").innerHTML="照片格式错误，必须为jpg 或者 png!";


		}else{
			document.getElementById("notice").style.display="none";
		}
		var size=$("#imageFile")[0].files[0].size;
		if(size<20480){
			document.getElementById("notice").style.display="block";
			document.getElementById("notice").innerHTML="照片大小需大于20kb!";


		}else{
			document.getElementById("notice").style.display="none";
		}
	}
</script>

</body>
</html>
