<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

	</head>

	<body>
		 <jsp:include page="/top.jsp"></jsp:include>
		<div class="container clearfix">
			 <jsp:include page="/left.jsp"></jsp:include>
			<!--/sidebar-->
			<div class="main-wrap">

				<div class="crumb-wrap">
					<div class="crumb-list">
						<i class="icon-font"></i><span>新增管理员</span>
					</div>
				</div>
				<div class="result-wrap">
					<div class="result-content">
						<form method="post" id="myform"
							name="myform" >
							<table class="insert-tab" width="100%">
								<tbody>
									 
									<tr>
										<th>
											<i class="require-red">*</i>登录名：
										</th>
										<td>
											<input class="common-text required" id="name" name="name"
												size="50" value="" type="text">
										</td>
									</tr>
									<tr>
										<th>
											<i class="require-red">@</i>密  码：
										</th>
										<td>
											<input class="common-text" name="pwd"  id="pwd" size="50"
												 type="password">
										</td>
									</tr>
									
									 
									<tr>
										<th></th>
										<td>
											<input class="btn btn-primary btn6 mr10" onclick="save();" value="提交"
												type="button">
												<!--按下返回退回上一页  -->
											<input class="btn btn6" onclick="history.go(-1)" value="返回"
												type="button">
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>

			</div>
			<!--/main-->
		</div>
	</body>
</html>
<script>

function save() {
	if ($("#name").val() == "") {
		$.messager.alert('警告', '登录名不能为空！', 'warning');
		return;
	}
	if ($("#pwd").val() == "") {
		$.messager.alert('警告', '密码不能为空！', 'warning');
		return;
	}
	//将数据提交給AddAdminAction去处理
	document.forms[0].action = "<%=path%>/AddAdminAction";
	document.forms[0].submit();

}
</script>
