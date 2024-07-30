<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*,java.sql.*,com.wang.db.*"
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
					<span class="crumb-name">车辆信息</span>
				</div>
			</div>
			<div class="search-wrap">
				<div class="search-content">
					<form action="<%=path%>/che/list.jsp" method="post">
						<table class="search-tab">
							
						</table>
					</form>
				</div>
			</div>
			<div class="result-wrap">
				<form name="myform" id="myform" method="post">
					<div class="result-title">
						<div class="result-list" id="result-list">
							<a href="<%=path%>/che/addChe.jsp"><i class="icon-font"></i>添加车辆信息</a>

						</div>
					</div>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<tr>


								<th>
									ID
								</th>
								<th>
									车牌号
								</th>

								<th>
									车辆品牌
								</th>

								<th>
									照片
								</th>

								<th>
									备注
								</th>

								<th>
									操作
								</th>
							</tr>
							<%
								DBManager dbm = new DBManager();
								Connection conn = dbm.getConnection();
								String queryName = request.getParameter("queryName");
								String sql = "select * from che where uid="+request.getSession().getAttribute("uid");
								if (queryName != null) {
									sql = sql+ " and hao like '%" + queryName + "%'";
								}
								PreparedStatement pstmt = conn.prepareStatement(sql);
								ResultSet rs = pstmt.executeQuery();

								while (rs.next()) {
									String id = rs.getString("id");
							%>
							<tr>


								<td>
									<%=id%>
									<script type="text/javascript">
									   document.getElementById("result-list").style.display="none";
									</script>
								</td>
								<td title="">
									<%=rs.getString("hao")%>
								</td>

								<td title="">
									<%=rs.getString("leixing")%>
								</td>

								<td title="">
									<img src="<%=path%>/<%=rs.getString("pic")%>" height="100px" width="200px"/>
								</td>

								<td title="">
									<%=rs.getString("info")%>
								</td>

								<td>
									<a class="link-update"
										href="<%=path%>/che/modChe.jsp?id=<%=id%>">修改</a>
									<a class="link-del" href="<%=path%>/DelCheAction?id=<%=id%>">删除</a>
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
		<!--/main-->
		</div>
	</body>
</html>
