<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>信息收集</title>
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>  
</head>
<body>
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">           
            </div>         
            <form id="loginForm" name="loginForm" action="userlogin.do" method="post">
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>欢迎参加“六卓越一拔尖”计划2.0启动大会</h1></div>
                <div class="text-center"><h5>手机用户请不要使用微信自带的浏览器</h5></div>
                <div class="text-center"><h5>电脑用户推荐使用360或谷歌浏览器</h5></div>
                <%--<div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">--%>
                    <%--<div class="form-group">--%>
                        <%--<div class="field field-icon-right">--%>
                            <%--<input type="text" class="input input-big" maxlength='50' id='userNumber' name='userNumber' value="${userNumber}"--%>
                                   <%--placeholder="请输入手机号" />--%>
                            <%--<span class="icon icon-user margin-small"></span>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<c:choose>--%>
                    <%--<c:when test="${message==-1}">--%>
                        <%--<div style="color:#F00;"><span id="notice" style=" margin-left:10%;display:none" >手机号错误!</span></div>--%>
                    <%--</c:when>--%>
                <%--</c:choose>--%>
                <div style="padding:30px;"><input type="button" onclick="location.href='addUser1Before.action'" class="button button-block bg-main text-big input-big" value="进入信息收集"></div>
                <%--<div class="text-right" id="adduser0"><a href="addUser1Before.action" style="font-size:19px"> 正式参会代表信息收集</a></div>--%>
                <%--<div class="text-right" id="adduser1"><a style="font-size:19px" href="addUser0Before.action">列席代表信息收集</a>--%>
                </div>
            </div>
            </form>          
        </div>
    </div>
</div>
<script src="js/jquery.js"></script>
<script type="text/javascript" charset="UTF-8" src="js/showBo.js"></script>
<script type="text/javascript">

</script>
<script type="text/javascript">

</script>


</body>
</html>