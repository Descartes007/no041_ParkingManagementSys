<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>停车场管理系统</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
</head>
<body>
	<!-- 使用自定义css样式 div-signin 完成元素居中-->
	<div class="container div-signin">
		<div class="panel panel-primary div-shadow">
			<!-- h3标签加载自定义样式，完成文字居中和上下间距调整 -->
			<div class="panel-heading">
				<h3>停车场管理系统</h3>
			</div>
			<div class="panel-body">
				<!-- login form start -->
				<form method="post" id="form" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-3 control-label">用户名：</label>
						<div class="col-sm-9">
							<input class="form-control" type="text" placeholder="请输入用户名" name="username"
					id="username">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
						<div class="col-sm-9">
							<input class="form-control" type="password" placeholder="请输入密码" name="userpwd"
					id="userpwd">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">身&nbsp;&nbsp;&nbsp;&nbsp;份：</label>
						<div class="col-sm-9">
							<select class="form-control" name="type">
								<option value="管理员">管理员</option>
								<option value="用户">用户</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-3" style="padding: 0px;">
							<span class="text-danger" id="errorinfo" style="padding: 0 0 0 2px;height: 33px;line-height: 33px;"></span>
						</div>
						<div class="col-sm-9 padding-left-0">
							<div class="col-sm-4">
								<button type="button" class="btn btn-primary btn-block"
									id="submitBtn" onclick="login();">登&nbsp;&nbsp;陆</button>
							</div>
							<div class="col-sm-4">
								<button type="button" class="btn btn-primary btn-block" onclick="reg();">注&nbsp;&nbsp;册</button>
							</div>
							<div class="col-sm-4" style="padding:0;margin-left:-10px;width:auto;padding-top: 5px;">
							</div>
						</div>
					</div>
				</form>
				<!-- login form end -->
			</div>
		</div>
	</div>
	<!-- 页尾 版权声明 -->
	<div class="container">
		<div class="col-sm-12 foot-css">
			<p class="text-muted credit">
			</p>
		</div>
	</div>
</body>
<script type="text/javascript"> 
  
function login(){

     if($("#username").val() == ""){
          alert('请输入用户名！');
          return;
     }
      if( $("#userpwd").val() == ""){
          alert('请输入密码！');
          return;
     }  
 	 document.forms[0].action= "${pageContext.request.contextPath }/LoginAction";
	 document.forms[0].submit();
	 
	 
}

function reg(){
  	document.forms[0].action= "${pageContext.request.contextPath }/userinfo/regUserinfo.jsp";
		document.forms[0].submit();
	}
</script>

</html>