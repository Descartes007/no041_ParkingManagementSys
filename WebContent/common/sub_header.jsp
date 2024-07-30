<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%
   String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"/>
<head> 
<title>停车场管理系统</title>
<link  href="<%=path%>/inc/logincss.css" rel="stylesheet" type="text/css" ></link>
<link  href="<%=path%>/js/jquery/plugin/jquery-easyui/themes/default/easyui.css" type="text/css" rel="stylesheet"></link>
<link  href="<%=path%>/js/jquery/plugin/jquery-easyui/themes/icon.css" type="text/css" rel="stylesheet"></link>
<script type="text/javascript" src="<%=path%>/js/jquery/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery/plugin/jquery-easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery/plugin/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery/plugin/jquery-easyui/plugins/jquery.window.js"></script>
<script type="text/javascript" src="<%=path%>/js/calendar/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css"	href="<%=path%>/css/common.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/main.css" />
<script type="text/javascript" src="<%=path%>/js/libs/modernizr.min.js"></script>
<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
</head>
 