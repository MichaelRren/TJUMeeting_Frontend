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
<html>
<head>
<title>管理中心</title>
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
<link rel="stylesheet" id="mobiCubeNavigationCss" type="text/css"
	href="css/cubeNavigation.min.css?v=201706201429" />

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
#module303 {
	border: none;
}

#module303 {
	padding: 0px;
}

#module303 .formMiddle303 {
	border: none;
}

#module303 .formMiddle303 {
	padding: 0px;
}

#module303 .formBannerTitle303 {
	border: none;
}

#module303 .formBannerTitle303 {
	padding: 0px;
}

#module303 {
	background: none;
}

#module303 .formMiddle303 {
	background: none;
}

#module303 .g_background {
	background: none;
}

#module303 .formMiddle303 .formMiddleCenter303 {
	background: none;
}

#module303 .formMiddleContent303 {
	background: none;
}
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

#navbar_104 .icon-navItemIcon:before {
	content: '';
	content: '';
}

#navbar_104 .icon-navItemIcon {
	background-image: none;
}

.open .navItem:nth-child(8) {
	transition-delay: 400ms;
}

#navbar_105 .icon-navItemIcon:before {
	content: '';
	content: '';
}

#navbar_105 .icon-navItemIcon {
	background-image: none;
}

.open .navItem:nth-child(10) {
	transition-delay: 480ms;
}

.open .navItem:nth-child(12) {
	transition-delay: 560ms;
}

.open .navItem:nth-child(14) {
	transition-delay: 640ms;
}
</style>


<style id='mobiCubeStyleModule'>
#module303 {
	overflow: hidden;
}
</style>

<style id='mobiSearchStyleModule'>
</style>

<!-- 输出底部样式 -->
<style id='fixedAreaBoxStyle'>
</style>

</head>
<body faiscoMobi="true" id="g_body" class="g_locale2052 mobiCol3"
	onLoad="authorityCheck();">

	<script type="text/javascript">
		//html root的字体计算应该放在最前面，这样计算就不会有误差了/
		//2016.3.23 wjq update 之所以要加个判断返回一个20.5，是因为当用户在谷歌等浏览器直接输入手机端网站网址时，如果用户设置模块自定义样式的高度比较小，由于这时候的clientWidth为1920px，及返回的_htmlFontSize为40，这时候就会使模块太小，展示不完全，因此先取一个较为准确的值去展示。Mobi.resetHtmlFontSize()顺便也加了
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
		//权限控制,根据RoleBean的authority进行选择性显示
		function authorityCheck() {
			var authority = '${RoleBean.authority}';
			if (authority != null && authority != '') {
				var items = authority.split(",");
				if (items.length >= 2)
					document.getElementById("item_4").style.visibility = "visible";
			}
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
		<div id="webTopBox" class="webTopBox  ">
			<div id="webTop" class="webTop">

				

			</div>
		</div>
		<div id="webHeaderBox" class="webHeaderBox  ">
			<div class='navButton' id='navButton'>
				<div class='navButtonPanel'></div>
				<div class='menuNav'>
					<div class='menuNavTip icon-menuNavTip'></div>
				</div>
			</div>
			<div id='headerWhiteBg' class='headerSiteMaskWhiteBg'></div>
			<div id='headerBg' class='headerSiteMaskBg'></div>
			<div id='webHeader' class='webHeader webHeaderBg '>
				<div id='header' class='header' style='padding:0px;'>
					<span class='pageLogo   ' style='display:none;visibility:hidden;'
						id='pageLogo' sid='0' pw='160' ph='160'><div
							id='pageLogoImg' class='logoImg '
							style='background-image:url(//2.ss.faisys.com/image/no-pic.jpg);background-size: contain;background-position: center;background-repeat: no-repeat;'></div>
					</span><span class='pageTitle' id='pageTitle'>个人中心</span>
				</div>
			</div>
		</div>
		<div id="webHeaderBox" class="webHeaderBox  ">
			<div class='navButton' id='navButton'>
				<div class='navButtonPanel'></div>
				<div class='menuNav'>
					<div class='menuNavTip icon-menuNavTip'></div>
				</div>
			</div>
			<div id='headerWhiteBg' class='headerSiteMaskWhiteBg'></div>
			<div id='headerBg' class='headerSiteMaskBg'></div>
			<div id='webHeader' class='webHeader webHeaderBg '>
				<div id='header' class='header' style='padding:0px;'>
					<span class='pageLogo   ' style='display:none;visibility:hidden;'
						id='pageLogo' sid='0' pw='160' ph='160'><div
							id='pageLogoImg' class='logoImg '
							style='background-image:url(//2.ss.faisys.com/image/no-pic.jpg);background-size: contain;background-position: center;background-repeat: no-repeat;'></div>
					</span><span class='pageTitle' id='pageTitle'>个人中心</span>
				</div>
			</div>
		</div>

		<div id="webBannerBox" style="margin-top:2rem" class="webBannerBox">
			<div id="webBanner" class="webBanner hiddenDefaultBanner">
				<div id="bannerSwipe" class="swipe"
					style="height: 240px; visibility: visible;">
					<div id="bannerSwipeContainer"
						class="bannerSwipeContainer defaultBanner"
						style="width: 511.997px;">
						<div id="bannerItemAD0I7bKsBRACGAAgptW1wQUosPXU7QQwgAU4rAI"
							data-index="0"
							style="width: 511.997px; left: 0px; transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
							<a href="javascript:;" vheight="300" vwidth="640"
								class="bannerImageDiv customBanner"
								style="display:block; background-image:url(images/tju.jpg);"></a>
						</div>
					</div>
					<div id="bannerBullet" class="bannerBullet">
						<ul id="bullets" class="bullets">
							<li class="on" style="display:none;"></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="webContainerBox" class="webContainerBox">
			<div id="webModuleContainer" class="webModuleContainer">
				<div id='module303' _headerHiden='1'
					class='form Handle template1011 formStyle31 moduleStyle7'
					_autoHeight='1' _height='0' _bHeight='0' _inTab='0'>
					<div style='display:none;' _bannerAutoHeight='1'
						class='formBannerTitle formBannerTitle303'>
						<div class='titleLeft titleLeft303'></div>
						<div class='titleCenter titleCenter303'>
							<div class='titleText titleText303'>
								<div class='titleTextIcon icon-titleText'>&nbsp;</div>
								<div class='textContent'></div>
							</div>
							<div class='formBannerMore formBannerMore303'></div>
						</div>
						<div class='titleRight titleRight303'></div>
					</div>
					<div class='formMiddle formMiddle303'>
						<div class='middleLeft middleLeft303'></div>
						<div class='middleCenter middleCenter303'>
							<div class='formMiddleContent formMiddleContent303 moduleContent'
								_innerType='0'>
								<div class='cubeNavigationArea cubeNavigationArea7' value='7'
									id='cubeNavigation303'>
									<div class='cubeLink_row'>
										<div class='cubeLink cubeLink0 ' id='item_0' linkid='1'>
											<a class='cubeLink_a ' href='logoff.do' style='cursor:point;'
												id='cubeLink_a1_cubeNav303'>
												<div class='cubeLink_bg '></div>
												<div class='cubeLink_curtain'></div>
												<div class='cubeLink_ico icon-cube'></div>
												<div class='cubeLink_text g_link'>
													<div class='cubeLink_text_p '>
														注销登录
														<p class='cubeLink_subText_p'></p>
													</div>
												</div> </a>
										</div>
										<div class='cubeLink cubeLink1 ' id='item_1' linkid='2'>
											<a class='cubeLink_a '
												href='viewUser.do?userNumber=<%=rb.getUserNumber()%>'
												style='cursor:point;' id='cubeLink_a2_cubeNav303'>
												<div class='cubeLink_bg '></div>
												<div class='cubeLink_curtain'></div>
												<div class='cubeLink_ico icon-cube'></div>
												<div class='cubeLink_text g_link'>
													<div class='cubeLink_text_p '>
														个人信息
														<p class='cubeLink_subText_p'></p>
													</div>
												</div> </a>
										</div>
										<div class='cubeLink cubeLink2 ' id='item_2' linkid='3'>
												<a class='cubeLink_a ' href='searchFile.do?page=1' style='cursor:point;'
												   id='cubeLink_a3_cubeNav303'>
													<div class='cubeLink_bg '></div>
													<div class='cubeLink_curtain'></div>
													<div class='cubeLink_ico icon-cube'></div>
													<div class='cubeLink_text g_link'>
														<div class='cubeLink_text_p '>
															资料下载
															<p class='cubeLink_subText_p'></p>
														</div>
													</div> </a>
											</div>
										<div class='cubeLink cubeLink3 ' id='item_3' linkid='4'>
											<a class='cubeLink_a '
												href='viewHotel.do?userNumber=<%=rb.getUserNumber()%>'
												style='cursor:point;' id='cubeLink_a4_cubeNav303'>
												<div class='cubeLink_bg '></div>
												<div class='cubeLink_curtain'></div>
												<div class='cubeLink_ico icon-cube'></div>
												<div class='cubeLink_text g_link'>
													<div class='cubeLink_text_p '>
														酒店信息
														<p class='cubeLink_subText_p'></p>
													</div>
												</div> </a>
										</div>
										<div style="visibility:hidden" class='cubeLink cubeLink4 ' id='item_4' linkid='5'>
											<a class='cubeLink_a '
											   href='viewLiaisonAndDriver.do?userNumber=<%=rb.getUserNumber()%>'
											   style='cursor:point;' id='cubeLink_a5_cubeNav303'>
												<div class='cubeLink_bg '></div>
												<div class='cubeLink_curtain'></div>
												<div class='cubeLink_ico icon-cube'></div>
												<div class='cubeLink_text g_link'>
													<div class='cubeLink_text_p '>
														联络员与司机信息
														<p class='cubeLink_subText_p'></p>
													</div>
												</div> </a>
										</div>
									</div>
									<div class='cubeLink_row'>

										<div style="visibility:hidden" class='cubeLink cubeLink5 '
											id='item_5' linkid='6'>
											<a class='cubeLink_a ' href='logoff.do' style='cursor:point;'
												id='cubeLink_a6_cubeNav303'>
												<div class='cubeLink_bg '></div>
												<div class='cubeLink_curtain'></div>
												<div class='cubeLink_ico icon-cube'></div>
												<div class='cubeLink_text g_link'>
													<div class='cubeLink_text_p '>
														搜索
														<p class='cubeLink_subText_p'></p>
													</div>
												</div> </a>
										</div>
										<div style="visibility:hidden" class='cubeLink cubeLink6 '
											id='item_6' linkid='7'>
											<a class='cubeLink_a ' href='logoff.do' style='cursor:point;'
												id='cubeLink_a7_cubeNav303'>
												<div class='cubeLink_bg '></div>
												<div class='cubeLink_curtain'></div>
												<div class='cubeLink_ico icon-cube'></div>
												<div class='cubeLink_text g_link'>
													<div class='cubeLink_text_p '>
														购物车
														<p class='cubeLink_subText_p'></p>
													</div>
												</div> </a>
										</div>
										<div style="visibility:hidden" class='cubeLink cubeLink7 '
											id='item_7' linkid='8'>
											<a class='cubeLink_a ' href='logoff.do' style='cursor:point;'
												id='cubeLink_a8_cubeNav303'>
												<div class='cubeLink_bg '></div>
												<div class='cubeLink_curtain'></div>
												<div class='cubeLink_ico icon-cube'></div>
												<div class='cubeLink_text g_link'>
													<div class='cubeLink_text_p '>
														用户讨论
														<p class='cubeLink_subText_p'></p>
													</div>
												</div> </a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class='middleRight middleRight303'></div>
					</div>
				</div>

			</div>
		</div>
		<div id="webFooterBox" class="webFooterBox  ">
			<!--图片详情Div -->
			<div id='webFooter' class='webFooter'>
				<div id='footer' class='footer mallThemeFooter'>
					<div class='bottomdiv'>
						<div class='bottom'>
							<div class='backtop'
								onclick='Mobi.scrollToTop("webContainerBox")'>
								top<b></b>
							</div>
						</div>
					</div>
					<div class='technical'>
						<div class='technicalSupport footerInfo'>
							<font face='Arial'>©</font>2019&nbsp;-&nbsp;版权所有
						</div>
						<div class='technicalSupport'>
							<a href='#' target='_blank' hidefocus='true'>天津大学</a>
						</div>
					</div>
				</div>

			</div>


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
	</div>
	<div class="webRight"></div>

	<script type="text/javascript" charset="utf-8"
		src="js/jqmobi.min.js?v=201706192138"></script>
	<script type="text/javascript" charset="utf-8"
		src="js/jqmobi_ui.min.js?v=201708111609"></script>
	<script id="mobiOperationJS" type="text/javascript" charset="utf-8"
		src="js/mobi.min.js?v=201708091152"></script>

</body>
</html>

