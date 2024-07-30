<%@include file="/common/sub_header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*,java.sql.*,com.wang.db.*" pageEncoding="UTF-8"%>


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
						<i class="icon-font"></i><span>修改管理员</span>
					</div>
				</div>
				<div class="result-wrap">
					<div class="result-content">
						<form method="post" id="myform"
							name="myform" >
							<table class="insert-tab" width="100%">
								<tbody>
									 <%
				DBManager dbm = new DBManager();
				Connection conn = dbm.getConnection();
				String id = request.getParameter("id");
				String sql = "select * from admin where id='" + id + "'";
				PreparedStatement stat = conn.prepareStatement(sql);
				ResultSet rs = stat.executeQuery();
				rs.next();
			%>
			 <input name="id" type="hidden" id="name" value='<%=id%>'>
									<tr>
										<th>
											<i class="require-red">*</i>姓名：
										</th>
										<td>
											<input class="common-text required" id="name" value='<%=rs.getString("userName")%>' name="name"
												size="50" value="" type="text">
										</td>
									</tr>
									<tr>
										<th>
											密码：
										</th>
										<td>
											<input class="common-text" name="pwd" value='<%=rs.getString("userPw")%>'  id="pwd" size="50"
												 type="password">
										</td>
									</tr>
									
									 <%
				if (rs != null)
					rs.close();
				if (stat != null)
					stat.close();
				if (conn != null)
					conn.close();
			%>	
									<tr>
										<th></th>
										<td>
											<input class="btn btn-primary btn6 mr10" onclick="save();" value="提交"
												type="button">
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
		$.messager.alert('警告', '姓名不能为空！', 'warning');
		return;
	}
	if ($("#pwd").val() == "") {
		$.messager.alert('警告', '密码不能为空！', 'warning');
		return;
	}
	document.forms[0].action = "<%=path%>/ModAdminAction";
	document.forms[0].submit();

}
</script>
