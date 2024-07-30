<%@include file="/common/sub_header.jsp"%>
<%@ page language="java"
	import="java.util.*,java.sql.*,com.wang.db.*"
	pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<link rel="stylesheet" type="text/css" href="css/main.css" />
		<script type="text/javascript" src="js/libs/modernizr.min.js">
</script>
	</head>
	<body>
		<jsp:include page="/top.jsp"></jsp:include>
		<jsp:include page="/left.jsp"></jsp:include>
			<!--/sidebar-->
			<div class="main-wrap">

				<div class="crumb-wrap">
					<div class="crumb-list">
						<span class="crumb-name">管理员管理</span>
					</div>
				</div>
				<div class="search-wrap">
					<div class="search-content">
						<form action="<%=path %>/admin/list.jsp" method="post">
							<table class="search-tab">
								<tr>
									
									<th width="150">
										请输入管理员名称:
									</th>
									<td>
										<input class="common-text" placeholder="关键字" name="queryName"
											value="" id="" type="text">
									</td>
									<td>
										<input class="btn btn-primary btn2" name="sub" value="查询"
											type="submit">
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<div class="result-wrap">
					<form name="myform" id="myform" method="post">
						<div class="result-title">
							<div class="result-list">
								<a href="<%=path %>/admin/addAdmin.jsp"><i class="icon-font"></i>新增管理员</a>
								
							</div>
						</div>
						<div class="result-content">
							<table class="result-tab" width="100%">
								<tr>
									
									
									<th>
										ID
									</th>
									<th>
										登录名
									</th>
									<th>
										密码
									</th>
								 
									<th>
										操作
									</th>
								</tr>
								<%
						DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();
						String queryName = request.getParameter("queryName");
						String sql = "select * from admin";
						if (queryName != null) {
							sql = "select * from admin where userName like '%" + queryName
									+ "%'";
						}
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();

						while (rs.next()) {
							String id = rs.getString("id");
					%>
								<tr>
									
									
									<td>
										<%=id%>
									</td>
									<td title="">
										<%=rs.getString("userName")%>
									</td>
									<td>
										<%=rs.getString("userPw")%>
									</td>
									 
									<td>
										<a class="link-update" href="<%=path %>/admin/modAdmin.jsp?id=<%=id %>">修改</a>
										<a class="link-del" href="<%=path %>/DelAdminAction?id=<%=id %>">删除</a>
									</td>
								</tr>
									<%
						}
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					%> 
							</table>
							<div class="list-page">
								 
							</div>
						</div>
					</form>
				</div>
			</div>
		  
	</body>
</html>
