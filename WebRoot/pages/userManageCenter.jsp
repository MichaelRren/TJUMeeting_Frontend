<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.ictwsn.bean.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	//获取当前角色的权限信息
	RoleBean rb = null;
	if ((RoleBean) session.getAttribute("RoleBean") != null) {
        rb = (RoleBean) session.getAttribute("RoleBean");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>会议后台管理中心</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>   
</head>
<body style="background-color:#f2f9fd;" onload="authorityCheck();">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="images/TJULogo.jpg" class="radius-circle rotate-hover" height="50" alt="" />天津大学会议后台管理中心</h1>
  </div>
  <div class="head-l"><a href="userlogin.do?userNumber=-1" class="button button-little bg-green"><span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp; &nbsp;&nbsp;<a class="button button-little bg-red" href="logoff.do"><span class="icon-power-off"></span> 退出登录</a> </div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>管理列表</strong></div>
  <ul style="display:block">
      <li id="item_1"><a href="viewUser.do?userNumber=<%=rb.getUserNumber()%>" target="right"><span class="icon-caret-right"></span>个人信息</a></li>
      <li id="item_2"><a href="viewHotel.do?userNumber=<%=rb.getUserNumber()%>" target="right"><span class="icon-caret-right"></span>酒店信息</a></li>
      <li id="item_3"><a href="searchFile.do?page=1" target="right"><span class="icon-caret-right"></span>资料下载</a></li>
      <li id="item_4" style="display: none"><a href="viewLiaisonAndDriver.do?userNumber=<%=rb.getUserNumber()%>" target="right"><span class="icon-caret-right"></span>联络员与司机信息</a></li>
      <%--<li id="item_5" ><a href="viewNotification.do?page=1" target="right" id="notice"><span class="icon-caret-right"></span>通知</a> </li>--%>
      <%--<li id="item_6"><a href="searchFile.do?page=1" target="right"><span class="icon-caret-right">资料上传</span> </a></li>--%>
  </ul>   
</div>
<script type="text/javascript">
//权限控制,根据RoleBean的authority进行选择性显示
authorityCheck();
		function authorityCheck() {
			var authority = '${RoleBean.authority}';
			if (authority != null && authority != ''){		 
				var items = authority.split(",");
				if(items.length >= 2){
					document.getElementById("item_4").style.display='block';
				}
			}
		}
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
window.onload=function(){
    checkNotification();
}
function checkNotification() {
    setTimeout(checkNotification, 1000*30);
    $.post('getNotificationList.action',
        function (result) {
        if(result.length>2){
            document.getElementById("notice").style="color:red";
        }else{
            document.getElementById("notice").style="color:black";
        }
    });
}

</script>
<ul class="bread">
  <li><a href="viewUser.do?userNumber=<%=rb.getUserNumber()%>" target="right" class="icon-home"> 首页</a></li>
  <li><a id="a_leader_txt">管理中心</a></li>
  <li><b>当前用户：</b><span style="color:red;"><%=rb.getUserNumber()%></span>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="viewUser.do?userNumber=<%=rb.getUserNumber()%>" name="right" width="100%" height="100%"></iframe>
</div>
</body>
</html>

