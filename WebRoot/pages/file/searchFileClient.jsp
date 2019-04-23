<%@ page language="java" contentType="text/html"
         import="java.util.*,com.ictwsn.bean.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/showBo.css"/>
    <link rel="stylesheet" type="text/css" href="css/pintuer.css">
    <link rel="stylesheet" type="text/css" href="css/admin.css">

</head>
<body>
<div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 文件列表</strong> <a href="" style="float:right; display:none;">添加字段</a>
        <li style="padding-right:10px;float:right;"><span class="r" style="float:right;">共有数据：<strong>${totalCount}</strong> 条</span></li>

    </div>
    <table class="table table-hover text-center">
        <tr>
            <th width="600px">文件描述</th>
            <th width="300px">上传时间</th>
            <th width="124px">操作</th>
        </tr>
        <c:forEach var="list" items="${filist}">
            <tr id="operator_tr_${list.fileId}">
                <td width="600px">${list.fileDescription}</td>
                <td width="300px">${list.updateTime}</td>
                <td width="124px"><input type="button" id="editButton" onclick="javascript:window.location.href='downloadFile.do?fileId=${list.fileId}'" value="下载"></td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="8"><div class="pagelist">
                <c:choose>
                    <c:when test="${page==1}">
                        <a>上一页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${prePageHref}">上一页</a>
                    </c:otherwise>
                </c:choose>
                &nbsp;&nbsp;${page}/${maxPage}&nbsp;&nbsp;
                <c:choose>
                    <c:when test="${page==maxPage}">
                        <a>下一页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${nextPageHref}">下一页</a>
                    </c:otherwise>
                </c:choose>
            </div>
            </td>
        </tr>
    </table>
</div>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/pintuer.js"></script>
<script type="text/javascript" src="js/showBo.js"></script>

</body>
</html>
