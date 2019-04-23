<%@ page language="java" contentType="text/html"
	import="java.util.*,com.ictwsn.bean.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
	//获取当前角色的权限信息
	RoleBean rb = null;
	if ((RoleBean) session.getAttribute("RoleBean") != null) {
		rb = (RoleBean) session.getAttribute("RoleBean");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />

<link rel="stylesheet" type="text/css" href="css/showBo.css"/>
<link rel="stylesheet" type="text/css" href="css/pintuer.css">
<link rel="stylesheet" type="text/css" href="css/admin.css">
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

<link href="lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
	<div class="row cl" style="margin-top: -20px;margin-left: -220px;">
			<label class="bread"><a href="viewUser.do?userNumber=<%=rb.getUserNumber()%>" style="text-decoration: none;"><<返回</a></label>
	  </div>
	<form action="updateUser.do" method="post" class="form form-horizontal" id="updateUserForm" name="updateUserForm" enctype="multipart/form-data">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>用户姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${db.userName}" readonly="readonly" id="userName" name="userName">
				<span id="userName_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>手机号码：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${db.userNumber}" readonly="readonly" id="userNumber" name="userNumber">
				<span id="userNumber_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>性别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${db.sex}" readonly="readonly" id="sex" name="sex">
				<span id="sex_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>人员类别：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${db.userSorts}" readonly="readonly" id="userAgent" name="userAgent" >
				<span id="userAgent_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>工作单位：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${db.workPlace}" readonly="readonly" id="workPlace" name="workPlace">
				<span id="workPlace_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>职位：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${db.position}" readonly="readonly" id="position" name="position">
				<span id="position_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>职称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${db.title}" readonly="readonly" id="titles" name="titles">
				<span id="title_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>邮箱：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="email" class="input w50" value="${db.email}" maxlength='50' placeholder="(必填)" id="email" name="email">
				<span id="email_notice" class="c-red"></span>
			</div>
		</div>
		<%--<div class="row cl" style="padding-left: 1%">--%>
			<%--<h4 style="color: blue">若此栏不是自驾，请将到达信息填写完整。（返程信息要求相同）</h4>--%>
		<%--</div>--%>
		<div class="row cl" style="text-align:center;">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>出行方式：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select type="text" class="input w50"  maxlength='50' id="arrivalStyle" name="arrivalStyle" onchange="checkarrive(this)">
					<option id="default_arrivalStyle">——请选择——</option>
					<option value="自驾">自驾</option>
					<option value ="公共交通">公共交通(请将到达信息填写完整)</option>

				</select>
				<span id="arrivalStyle_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>到达日期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${db.arrivalDate}" maxlength='50' id="arrivalDate" name="arrivalDate">
				<span id="arrivalDate_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>到达车次：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${db.arrivalNumber}" maxlength='50' id="arrivalNumber" name="arrivalNumber">
				<span id="arrivalNumber_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>到达时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="time" class="input w50" value="${db.arrivalTime}" maxlength='50' id="arrivalTime" name="arrivalTime">
				<span id="arrivalTime_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>到达车站：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select type="text" class="input w50" value="${db.arrivalStation}" maxlength='50' id="arrivalStation" name="arrivalStation">
					<option id="default_arrive"></option>
					<option id ="zijia" value="自驾" style="display: none">自驾</option>
					<option value ="天津站">天津站</option>
					<option value ="天津西站">天津西站</option>
					<option value="天津南站">天津南站</option>
					<option value="滨海机场">滨海机场</option>
				</select>
				<span id="arrivalStation_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl" style="text-align:center;">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>返程方式：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select type="text" class="input w50"  maxlength='50' id="returnStyle" name="returnStyle" onchange="checkreturn(this)">
					<option id="default_returnStyle">——请选择——</option>
					<option value="自驾">自驾</option>
					<option value ="公共交通">公共交通(请将返程信息填写完整)</option>

				</select>
				<span id="returnStyle_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>返程日期：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${db.returnDate}" maxlength='50' id="returnDate" name="returnDate">
				<span id="returnDate_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>返程车次：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${db.returnNumber}" maxlength='50' id="returnNumber" name="returnNumber">
				<span id="returnNumber_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>返程时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="time" class="input w50" value="${db.returnTime}" maxlength='50' id="returnTime" name="returnTime">
				<span id="returnTime_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>返程车站：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select type="text" class="input w50" value="${db.returnStation}" maxlength='50' id="returnStation" name="returnStation">
					<option id="default_return" value=""></option>
					<option value="自驾" style="display: none">自驾</option>
					<option value ="天津站">天津站</option>
					<option value ="天津西站">天津西站</option>
					<option value="天津南站">天津南站</option>
					<option value="滨海机场">滨海机场</option>
				</select>
				<span id="returnStation_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl" style="text-align:center;">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>住宿方式：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select type="text" class="input w50"  maxlength='50' id="hotalStyle" name="hotalStyle"  onchange="checkhotal(this)">
					<option id="default_Style" value="">——请选择——</option>
					<option value="自行安排" >自行安排</option>
					<option value ="统一安排">统一安排</option>
				</select>
				<span id="hotalStyle_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl" >
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>用餐需求：</label>
			<div class="formControls col-xs-8 col-sm-9">

				28日晚 <input type="checkbox" name="dinner" id='dinner28' value="28日晚" >
				29日午 <input type="checkbox" name="dinner" id='dinner290' value="29日午" />
				29日晚 <input type="checkbox" name="dinner" id='dinner29' value="29日晚" >

			</div>
		</div>

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>入住时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${db.checkin}" maxlength='50' id="checkin" name="checkin">
				<span id="checkin_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>退房时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${db.checkout}" maxlength='50' id="checkout" name="checkout">
				<span id="checkout_notice" class="c-red"></span>
			</div>
		</div>
		<%--<div class="row cl">--%>
			<%--<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>酒店：</label>--%>
			<%--<div class="formControls col-xs-8 col-sm-9">--%>
				<%--<input type="text" class="input w50" value="${db.hname}" maxlength='50' placeholder="(必填)" id="hname" name="hname">--%>
				<%--<span id="hname_notice" class="c-red"></span>--%>
			<%--</div>--%>
		<%--</div>--%>
		<%--<div class="row cl">--%>
			<%--<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>房型：</label>--%>
			<%--<div class="formControls col-xs-8 col-sm-9">--%>
				<%--<select type="text" class="input w50" maxlength='50' placeholder="(必填)" id="htype" name="htype" onfocus="search_htype()">--%>

					<%--<option id="0">${db.htype}</option>--%>
					<%--<option id="1">${db.htype}</option>--%>
				<%--</select>--%>
				<%--<span id="htype_notice" class="c-red"></span>--%>
			<%--</div>--%>
		<%--</div>--%>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>备注：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea id='remark' name='remark' class="input w50" placeholder='单间或标间' value="${db.remark}"></textarea>
				<span id="remark_notice" class="c-red"></span>
			</div>
		</div>

		<input type="hidden" value="${db.userRole}" id="userRole" name="userRole">
		<input type="hidden" value="${db.hname}" id="oldHname" name="oldHname">
		<input type="hidden" value="${db.htype}" id="oldHtype" name="oldHtype">
 		<input type="hidden" value="${db.userPhoto}" id="oldImageUrl" name="oldImageUrl">

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">更换照片：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="btn-upload form-group">
				<input class="input-text upload-url" type="text" name="uploadfile2" id="uploadfile2" nullmsg="请添加照片！" style="width:200px">
				<a href="javascript:void();" class="btn btn-primary radius upload-btn"><i class="Hui-iconfont"></i> 选择照片</a>
				<input type="file" name="imageFile" id="imageFile" class="input-file" onchange="checkimage(this)">
				</span> </div>
		</div>
		<div class="row cl" style="padding-left: 15%"><h5>用于制作代表证，请上传近期证件照</h5></div>
		<div class="row cl">
			<div class="formControls col-xs-8 col-sm-9">
				<div class="notice" id="notice" style="display:none;padding-left: 22%;color: red"></div></div></div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="updateUser();" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe632;</i>确认修改</button>
				<button class="btn btn-default radius" type="reset">&nbsp;&nbsp;撤    销&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="js/showBo.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript" charset="utf-8"
		src="js/laydate/laydate.js"></script>

<script type="text/javascript">
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
	function checktime() {
		var test_val0=document.getElementById("checkin").value;
		if(test_val0==''||test_val0==null){
			document.getElementById("checkin").style.border = "1px solid red";
		}else{
			document.getElementById("checkin").style.border = "1px solid grey";
		}
		var test_val1=document.getElementById("checkout").value;
		if(test_val1==''||test_val1==null){
			document.getElementById("checkout").style.border = "1px solid red";
		}else{
			document.getElementById("checkout").style.border = "1px solid grey";
		}

	}
	setInterval(checktime,1000);
</script>

<script type="text/javascript">
	setdinner();
	function setdinner() {
		var dinner="${db.dinner}";

		if(dinner.indexOf('28')!= -1){
			$("#dinner28").prop("checked",true);
		}
		if(dinner.indexOf('29日午')!= -1){
			$("#dinner290").prop("checked",true);
		}
		if(dinner.indexOf('29日晚')!= -1){
			$("#dinner29").prop("checked",true);
		}
	}
</script>
<script type="text/javascript">
	sethotalStyle();
	function sethotalStyle() {
		if("${db.checkin}"==null || "${db.checkin}"==''){
			document.updateUserForm.hotalStyle.options[1].selected=true;
			$("#checkin").parent().parent().hide();
			$("#checkout").parent().parent().hide();
	}else{
			document.updateUserForm.hotalStyle.options[2].selected=true;
		}
	}
</script>
<script type="text/javascript">
	initSearchInput();
	function fuzzySearch(e) {

		var that = this;


		// $("#workplacelist").toggle();
		var listId = $(this).attr("list");
		var list = $('#' + listId + ' div');
		var listArr = [];
		$.each(list, function(index, item){
			var obj = {'eleId': item.getAttribute('id'), 'eleName': item.innerHTML, 'ele': item};
			listArr.push(obj);
		});


		var current = 0;
		var showList = [];
		$(this).keyup(function(e){
			//如果输入空格自动删除
			this.value=this.value.replace(' ','');
			//列表框显示
			$('#' + listId).show();
			if(e.keyCode == 38) {
				//up
				console.log('up');
				current --;
				if(current <= 0) {
					current = 0;
				}
				console.log(current);
			}else if(e.keyCode == 40) {
				//down
				console.log('down');
				current ++;
				if(current >= showList.length) {
					current = showList.length -1;
				}
				console.log(current);

			}else if(e.keyCode == 13) {
				//enter
				console.log('enter');
				//如果按下回车，将此列表项的内容填充到文本框中
				$(that).val(showList[current].innerHTML);
				//下拉框隐藏
				$('#' + listId).hide();
			}else {
				console.log('other');


				var searchVal = document.getElementById("workPlace").value;
				showList = [];
				var work_place = [];
				//将和所输入的字符串匹配的项存入showList
				//将匹配项显示，不匹配项隐藏
				// $("#workplacelist").html("");
				$.each(listArr, function(index, item){
					if(item.eleName.indexOf(searchVal) != -1) {
						item.ele.style.display = "block";
						showList.push(item.ele);
					}else {
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
					listArr += "<div  id='"+array[i]+"' >"+array[i]+"</div>";



				}

				$("#workplacelist").append(listArr);
				$("#workplacelist").toggle();
				$('.selectList div').click(function(){
					//文本框为选中项的值
					$(this).parent().parent().find('.selectInput').val($(this).html());
					//下拉框隐藏
					$(this).parent().hide();
				});

				//点击下拉框外部的时候使下拉框隐藏
				var dropDowns = document.getElementsByClassName('dropDowns');
				var selectList = document.getElementsByClassName('selectList');
				document.body.onclick = function(e){
					e = e || window.event;
					var target = e.target || e.srcElement;
					for(var i = 0; i < dropDowns.length; i++) {
						if(target != dropDowns[i] && target != selectList[i]){
							selectList[i].style.display = 'none';
						}
					}
				}

			}
		});

		//为列表中的每一项绑定单击事件

	}
</script>

<script type="text/javascript">
	setdefault();
	function setdefault() {
		for(i=0;i<6;i++){
			if (document.updateUserForm.arrivalStation.options[i].value =='${db.arrivalStation}'){
				document.updateUserForm.arrivalStation.options[i].selected=true;
			}
			if (document.updateUserForm.returnStation.options[i].value =='${db.returnStation}'){
				document.updateUserForm.returnStation.options[i].selected=true;
			}
		}
		$("#remark").val("${db.remark}");
	}
</script>

<script type="text/javascript">

	$(document).ready(function(){
		var message ='<%=request.getParameter("message")%>';
		if(message!='null'){
			if(message==1){
				Showbo.Msg.alert("修改成功!",function (){window.location='viewUser.do?userNumber=${db.userNumber}';});

			}else if(message==0){
				Showbo.Msg.alert("修改失败!");
			}

		}
	});


	function viewUserAgent() {

		if ('${db.userRole}' == "1"){
			var optionlist1=["省级教育行政部门","部署、合建高校","有关部委","部内有关司局单位"];
			for(i=0;i<4;i++){
				if(optionlist1[i]!="${db.userSorts}" && document.getElementById("userAgent").options.length<4){
					document.getElementById("userAgent").options.add(new Option(optionlist1[i],optionlist1[i]));
				}
			}


		}
		else{
			$.ajax({
				type: "get",
				url: "js/liexidaibiao.txt",
				dataType: "text",
				async: true
			}).done(function (data) {
				if (data != null) {
					var userName = document.getElementById("userName").value;
					var listArr = [];
					var array = data.split("\r\n");
					var counts = array.length;
					var optionlist0=["省级教育行政部门","部署、合建高校","地方高校和民办高校代表主要负责同志","京津冀列席代表"];
					for(i=0;i<4;i++){
						if(optionlist0[i]!="${db.userSorts}" && document.getElementById("userAgent").options.length<4){
							document.getElementById("userAgent").options.add(new Option(optionlist0[i],optionlist0[i]));
						}
					}
					for (i = 0; i < counts; i++) {
						var array1 = array[i].split('\t');
						if (array1[0] == userName) {
							document.getElementById("userAgent").options.length=0;
							document.getElementById("userAgent").options.add(new Option(array1[1],array1[1]));
							return 0;
						}

					}



				}
			})
		}
	}

	<%--setTitle();--%>
	<%--function setTitle(){--%>
		<%--for(i=0;i<3;i++){--%>
			<%--if (document.updateUserForm.titles.options[i].value =='${db.title}'){--%>
				<%--document.updateUserForm.titles.options[i].selected=true;--%>
			<%--}--%>
		<%--}--%>
	<%--}--%>

	<%--setSex();--%>
	<%--function setSex() {--%>
		<%--for(i=0;i<2;i++){--%>
			<%--if(document.updateUserForm.sex.options[i].value == '${db.sex}'){--%>
				<%--document.updateUserForm.sex.options[i].selected=true;--%>
			<%--}--%>
		<%--}--%>
	<%--}--%>

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
					document.updateUserForm.htype.options[i] = new Option(value=type[i],type[i]);
				}
			}else{
				document.updateUserForm.htype.options[0] = '无空房';

			}
		});
	}

	function checkreturn(x) {
		if(x.value=='自驾'){
			$("#returnNumber").val('');
			$("#returnTime").val('');
			$("#returnStation").val('');
			document.updateUserForm.returnStation.options[1].selected=true;
			$("#returnNumber").attr('readonly','readonly');
			$("#returnTime").attr('readonly','readonly');
			$("#returnStation").attr('disabled','disabled');
		}
		else{
			$("#returnNumber").val('');
			$("#returnTime").val('');
			$("#returnStation").val('');
			$("#returnNumber").removeAttr('readonly');
			$("#returnTime").removeAttr('readonly');
			$("#returnStation").removeAttr('disabled');
		}
	}
	function checkarrive(x) {
		if(x.value=='自驾'){
			$("#arrivalNumber").val('');
			$("#arrivalTime").val('');
			$("#arrivalStation").val('');
			document.updateUserForm.arrivalStation.options[1].selected=true;
			$("#arrivalNumber").attr('readonly','readonly');
			$("#arrivalTime").attr('readonly','readonly');
			$("#arrivalStation").attr('disabled','disabled');
		}
		else{
			$("#arrivalNumber").val('');
			$("#arrivalTime").val('');
			$("#arrivalStation").val('');
			$("#arrivalNumber").removeAttr('readonly');
			$("#arrivalTime").removeAttr('readonly');
			$("#arrivalStation").removeAttr('disabled');
		}
	}
	function checkinfo(x) {
		var id=x.id;
		if(x.value==''||x.value==null){
			document.getElementById(id).style.border = "1px solid red";
		}
		else{
			document.getElementById(id).style.border = "1px solid grey";
		}
	}
	set_return_arrive();
	function set_return_arrive() {
		var returnStation=document.getElementById("returnStation").value;
		if(returnStation=='自驾'){
			document.updateUserForm.returnStyle.options[1].selected=true;
			document.updateUserForm.returnStation.options[1].selected=true;
			$("#returnNumber").attr('readonly','readonly');
			$("#returnTime").attr('readonly','readonly');

		}
		else if(returnStation!='' && returnStation!=null){
			document.updateUserForm.returnStyle.options[2].selected=true;
		}
		var arriveStation=document.getElementById("arrivalStation").value;
		if(arriveStation=='自驾'){
			document.updateUserForm.arrivalStyle.options[1].selected=true;
			document.updateUserForm.arrivalStation.options[1].selected=true;
			$("#arrivalNumber").attr('readonly','readonly');
			$("#arrivalTime").attr('readonly','readonly');

		}
		else if(arriveStation!=''&&arriveStation!=null){
			document.updateUserForm.arrivalStyle.options[2].selected=true;
		}
	}


function updateUser() {
	var userName = document.getElementById("userName").value;
	var userNumber = document.getElementById("userNumber").value;
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
	var imageFile= document.getElementById("imageFile").value;
	var arrivalStyle = document.getElementById("arrivalStyle").value;
	var returnStyle = document.getElementById("returnStyle").value;
	var hotalStyle=document.getElementById("hotalStyle").value;
	var checkin= document.getElementById("checkin").value;
	var checkout= document.getElementById("checkout").value;
	// var hname= document.getElementById("hname").value;
	// var htype= document.getElementById("htype").value;
	if(userName==""){
		document.getElementById("notice").style.display="block";
		document.getElementById("notice").innerHTML="请填写姓名!";
		Mobi.scrollToTop('webContainerBox');
		return 0;
	}
	if(userNumber==""){
		document.getElementById("notice").style.display="block";
		document.getElementById("notice").innerHTML="请填写手机号!";
		Mobi.scrollToTop('webContainerBox');
		return 0;
	}

	if(workPlace==""){
		document.getElementById("notice").style.display="block";
		document.getElementById("notice").innerHTML="请填写所在单位!";
		Mobi.scrollToTop('webContainerBox');
		return 0;
	}
	if(position==""){
		document.getElementById("notice").style.display="block";
		document.getElementById("notice").innerHTML="请填写职位!";
		Mobi.scrollToTop('webContainerBox');
		return 0;
	}
	if(titles==""){
		document.getElementById("notice").style.display="block";
		document.getElementById("notice").innerHTML="请填写职称!";
		Mobi.scrollToTop('webContainerBox');
		return 0;
	}
	if(email==""){
		document.getElementById("notice").style.display="block";
		document.getElementById("notice").innerHTML="请填写邮箱!";
		Mobi.scrollToTop('webContainerBox');
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
	if (returnStyle == '自驾') {
		if (returnDate == '') {
			document.getElementById("notice").style.display = "block";
			document.getElementById("notice").innerHTML = "请填写到达日期!";

			return 0;
		}}
	var arrival_list=arrivalTime+arrivalDate+arrivalNumber+arrivalStation;
	if (arrival_list!="" && arrivalStyle!='自驾') {

		if (arrivalTime == "" || arrivalDate == "" || arrivalNumber == "" || arrivalStation == "") {
			document.getElementById("notice").style.display = "block";
			document.getElementById("notice").innerHTML = "若要填写到达信息,请填写完整!";
			Mobi.scrollToTop('webContainerBox');
			return 0;
		}
	}

	if(returnTime+returnDate+returnNumber+returnStation!="" && returnStyle!='自驾'){

		if( returnTime=="" || returnDate=="" || returnNumber=="" || returnStation==""  ){
			document.getElementById("notice").style.display="block";
			document.getElementById("notice").innerHTML="若要填写返程信息,请填写完整!";
			Mobi.scrollToTop('webContainerBox');
			return 0
		}
	}
	if(imageFile!=""){
		var idx = imageFile.lastIndexOf(".");
		var lastName = imageFile.substring(idx,imageFile.length);
		var name = lastName.toLowerCase();
		if(name != ".jpg" && name != ".jpeg" && name != ".png") {
			document.getElementById("notice").style.display="block";
			document.getElementById("notice").innerHTML="照片格式错误，必须为jpg 或者 png!";
			Mobi.scrollToTop('webContainerBox');
			return 0;
		}
		var size=$("#imageFile")[0].files[0].size;
		if(size<20480){
			document.getElementById("notice").style.display="block";
			document.getElementById("notice").innerHTML="照片大小需大于20kb!";
			Mobi.scrollToTop('webContainerBox');
			return 0;
		}
	}

	document.updateUserForm.submit();
	layer.load(0);
	// $.post("checkImage.action",{
	// 			imageFile: imageFile
	// },function(result) {
	// 	if(result == 1){
	// 		document.getElementById("notice").style.display = "block";
	// 		document.getElementById("notice").innerHTML = "请选择大于500KB的照片!";
	// 		return 0;
	// 	}else if(result == 2){
	// 		document.getElementById("notice").style.display = "block";
	// 		document.getElementById("notice").innerHTML = "请选择JPG或PNG格式的照片!";
	// 		return 0;
	// 	}else if(result == 3){
	// 		document.getElementById("notice").style.display = "block";
	// 		document.getElementById("notice").innerHTML = "请选择大于500KB并且为JPG或PNG格式的照片!";
	// 		return 0;
	// 	}else{
	// 		document.updateUserForm.submit();
	// 	}
	// });

}

</script>
<script>
	function checkhotal(x) {
		if(x.value=='自行安排'){
			$("#checkin").val('');
			$("#checkout").val('');
			$("#checkin").attr('readonly', 'readonly');
			$("#checkin").parent().parent().hide();
			$("#checkout").attr('readonly', 'readonly');
			$("#checkout").parent().parent().hide();
		}
		else{
			$("#checkin").val('');
			$("#checkout").val('');
			$("#checkin").removeAttr('readonly');
			$("#checkin").parent().parent().show();
			$("#checkout").removeAttr('readonly');
			$("#checkout").parent().parent().show();

		}
	}
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
