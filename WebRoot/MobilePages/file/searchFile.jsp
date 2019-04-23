<%@ page language="java" contentType="text/html"
	import="java.util.*,com.ictwsn.bean.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>文件管理</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Cache-Control" content="no-transform" />
<meta name="viewport"
	content="width=client-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<!-- <meta name="viewport" content="width=client-width, initial-scale=1.0,maximum-scale=2.0, user-scalable=1"> -->
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
#module400 .formBannerTitle400 {
	display: none !important;
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
#module400 .icon-mSearchBtn {
	color: rgb(255, 105, 44);
}
</style>




<!-- 输出底部样式 -->
<style id='fixedAreaBoxStyle'>
</style>


<!-- 系统特殊隐藏栏目隐藏头部、banner -->


</head>
<body faiscoMobi="true" id="g_body" class="g_locale2052 mobiCol3">
	<script src="js/jquery-1.4.3.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		//html root的字体计算应该放在最前面，这样计算就不会有误差了/
		//2016.3.23 wjq update 之所以要加个判断返回一个20.5，是因为当用户在谷歌等浏览器直接输入手机端网站网址时，如果用户设置模块自定义样式的高度比较小，由于这时候的clientWidth为1920px，及返回的_htmlFontSize为40，这时候就会使模块太小，展示不完全，因此先取一个较为准确的值去展示。Mobi.resetHtmlFontSize()顺便也加了
		var _htmlFontSize = (function() {
			var clientWidth = document.documentElement ? document.documentElement.clientWidth
					: document.body.clientWidth;
			//if(clientWidth > 768) clientWidth = 768;
			if (clientWidth > 768 && clientWidth < 1280) {
				clientWidth = 768;
			} else if (clientWidth >= 1280) {
				clientWidth = 512;
			}
			document.documentElement.style.fontSize = clientWidth * 1 / 16
					+ "px";
			return clientWidth * 1 / 16;
		})();

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
			<a href='userlogin.do?userName=-1'
				class='g_close icon-gClose'></a><span class='title pageTitle'>文件列表
			
		</div>

		<div id="webBannerBox" class="webBannerBox  ">
			<div id='webBanner' style='display:none;' class='webBanner'></div>
		</div>
		<div id="webContainerBox" class="webContainerBox">
			<div id="webModuleContainer" class="webModuleContainer">

				<div id="module307" class="form Handle  formStyle6 " _autoheight="1"
					_height="0" _bheight="0" _intab="0">
					<div class="formMiddle formMiddle307" style="padding-bottom: 0px;">
						<div class="middleLeft middleLeft307"></div>
						<div class="middleCenter middleCenter307">
							<div class="formMiddleContent formMiddleContent307 moduleContent"
								_innertype="0" style="margin-bottom: 0.5rem;">
								<div class="newsList " id="newsList307">
									<c:forEach var="list" items="${filist}">
										<div id="newsLine${list.fileId}" class="newsLine line">
											<div id="lineBody${list.fileId}"
												class="lineBody lineBodyTable">
												<div class="linkTableCell">
													<div class="linkTable">
														<table width="100%" border="0">
															<tbody>
																<tr>
																	<td width="100%"><div align="left">
																		<a hidefocus="true"
																		   href="downloadFile.do?fileId=${list.fileId}"
																		   target="_self">${list.fileDescription}</a>
																		</div></td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
										<div id="sepLine${list.fileId}"
											class="g_separator separatorLine"></div>
									</c:forEach>

								</div>
								<div id="pagenation307" class="pagenation">
									<c:choose>
										<c:when test="${page==1}">
											<div class="pagePrev icon-pagePrev icon-cnListP pageDisable"></div>
										</c:when>
										<c:otherwise>
											<div class="pagePrev icon-pagePrev icon-cnListP">
												<a hidefocus="true"
													href="searchFile.do?page=${page-1}"></a>
											</div>
										</c:otherwise>
									</c:choose>
									<div id="pagenationSelectDiv307" class="pagenationSelectDiv">
										<select class="pageSelect"><option
												class="pageOptions" selected="selected" value="#">${page}&nbsp;&nbsp;/&nbsp;&nbsp;${maxPage}</option>
										</select>
									</div>
									<c:choose>
										<c:when test="${page==maxPage}">
											<div class="pageNext icon-pageNext icon-cnListN pageDisable">
											</div>
										</c:when>
										<c:otherwise>
											<div class="pageNext icon-pageNext icon-cnListN">
												<a hidefocus="true"
													href="searchFile.do?page=${page+1}"></a>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="middleRight middleRight307"></div>
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
								onclick="Mobi.scrollToTop('webContainerBox')">
								top<b></b>
							</div>
						</div>
					</div>
					<div class='technical'>
						<div class='technicalSupport footerInfo'>
							<font face='Arial'>©</font>2019&nbsp;-&nbsp;版权所有
						</div>
						<div class='technicalSupport'>
							<a href='http://www.tju.edu.cn/' target='_blank'
								hidefocus='true'>天津大学</a>
						</div>
					</div>
				</div>

			</div>
			<style id='mobiStyleService' type='text/css'></style>
			<div id='webCustomerServiceBox' class='webCustomerServiceBox'
				style='display:none;'>
				<div class='customerServiceDiv' id='customerServiceDiv'></div>
			</div>

			<div id="fullScreenDivCotainer" class='fullScreenDivCotainer'></div>
		</div>

		<div id="fixedAreaBox" class="fixedAreaBox fixedAreaBox1011_1"
			tplid="1011_1"></div>
	</div>

	<div class="webRight"></div>

	<script type="text/javascript" charset="utf-8"
		src="js/jqmobi.min.js?v=201706192138"></script>
	<script type="text/javascript" charset="utf-8"
		src="js/jqmobi_ui.min.js?v=201708111609"></script>
	<script id="mobiOperationJS" type="text/javascript" charset="utf-8"
		src="js/mobi.min.js?v=201708091152"></script>

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

</body>
</html>

