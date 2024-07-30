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
					<span class="crumb-name">停车缴费</span>
				</div>
			</div>
			<div class="search-wrap">
				<div class="search-content">
					<form action="<%=path%>/chewei/tlist.jsp" method="post">
						<table class="search-tab">
							<tr>

								<th width="150">
									请输入车位号:
								</th>
								<td>
									<input class="common-text" placeholder="关键字" name="queryName"
										value="" id="" type="text">
								</td>
								<th width="50">
									区域:
								</th>
								<td>
									<input class="common-text" placeholder="关键字" name="queryName1"
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


						</div>
					</div>
					<div class="result-content">
						<table class="result-tab" width="100%">
							<tr>


								<th>
									ID
								</th>
								<th>
									车位号
								</th>

								<th>
									区域
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
								String queryName1 = request.getParameter("queryName1");
								String sql = "select * from chewei where 1=1";
								if (queryName != null) {
									sql = sql + " and hao like '%" + queryName + "%'";
								}
								if (queryName1 != null) {
									sql = sql + " and qu like '%" + queryName1 + "%'";
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
									<%=rs.getString("hao")%>
								</td>

								<td title="">
									<%=rs.getString("qu")%>
								</td>

								<td title="">
									<%=rs.getString("info")%>
								</td>

								<td>
									<%
										if (rs.getString("chepai") == null
													|| rs.getString("chepai").equals("")) {
									%>
									空闲
									<%
										} else {
									%>
									<a href="<%=path%>/fei/jf.jsp?id=<%=id%>"><%=rs.getString("chepai")%>&nbsp;缴费</a>
									<%
										}
									%>
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
