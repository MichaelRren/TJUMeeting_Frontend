<%@ page language="java" contentType="text/html"
	import="java.util.*,com.ictwsn.bean.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	</div>

	<form action=""  class="form form-horizontal" id="form-article-add">

		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>酒店名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${user.hname}" readonly="readonly" id="hname" name="hname">
				<span id="liaisonName_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>酒店地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${hotel.hurl}" readonly="readonly" id="hurl" name="hurl">
				<span id="hurl_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>酒店房型：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${user.htype}" readonly="readonly" id="htype" name="htype">
				<span id="htype_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>入住时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${user.checkin}" readonly="readonly" id="checkin" name="checkin">
				<span id="checkin_notice" class="c-red"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>退房时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input w50" value="${user.checkout}" readonly="readonly" id="checkout" name="checkout">
				<span id="checkout_notice" class="c-red"></span>
			</div>
		</div>


		<%--<div class="row cl">--%>
			<%--<label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>个人照片：</label>--%>
			<%--<div class="formControls col-xs-8 col-sm-9">--%>
				<%--<img alt='ABUIABACGAAg7d3DzAUowKXpsgQwhAM48AE'--%>
					 <%--src='${db.userPhoto}' data-source="${db.userPhoto}"--%>
					 <%--style='width:30%' />--%>
				<%--<span id="userPhoto_notice" class="c-red"></span>--%>
			<%--</div>--%>
		<%--</div>--%>

	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="js/showBo.js"></script>
<script type="text/javascript">

</script> 
</body>
</html>
