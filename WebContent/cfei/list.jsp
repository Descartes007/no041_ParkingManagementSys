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
		<script type="text/javascript">
function method1(tableid) {
   

	varcurTbl = document.getElementById(tableid);
	
	varcurTbl.print();
	

}
</script>
	</head>
	<body>
	 <jsp:include page="/top.jsp"></jsp:include>
		<jsp:include page="/left.jsp"></jsp:include>
		<!--/sidebar-->
		<div class="main-wrap">

			<div class="crumb-wrap">
				<div class="crumb-list">
					<span class="crumb-name">停车记录查询</span>
				</div>
			</div>
			<div class="search-wrap">
				<div class="search-content">
					<form action="<%=path%>/cfei/list.jsp" method="post">
						<table class="search-tab">
							<tr>

								<th width="100">
									请输入车牌号:
								</th>
								<td>
									<input class="common-text" placeholder="关键字" name="queryName"
										value="" id="" type="text">
								</td>
								<th width="120">
									请输入停车日期:
								</th>
								<td>
									<input class="common-text" placeholder="关键字" name="queryName2"
										value="" id="" type="text" class="Wdate"
										onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})">
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
						<table class="result-tab" width="100%" id="tableExcel">
							<tr>


								<th>
									ID
								</th>
								<th>
									车牌号
								</th>

								<th>
									停车时间
								</th>

								<th>
									离开时间
								</th>

								<th>
									金额
								</th>

								<th>
									时长
								</th>

								<th>
									停车标准
								</th>
							</tr>
							<%
								DBManager dbm = new DBManager();
								Connection conn = dbm.getConnection();
								String queryName = request.getParameter("queryName");
								String sql = "select * from cfei where 1=1";
								if (queryName != null) {
									sql = sql + " and  hao like '%" + queryName + "%'";
								}

								String queryName2 = request.getParameter("queryName2");
								if (queryName2 != null) {
									sql = sql + " and  jdate like '%" + queryName2 + "%'";
								}

								System.out.println(sql);
								session.setAttribute("sql",sql);
								PreparedStatement pstmt = conn.prepareStatement(sql);
								ResultSet rs = pstmt.executeQuery();

								long jine = 0;

								while (rs.next()) {
									String id = rs.getString("id");
									jine = jine + Long.parseLong(rs.getString("jine"));
							%>
							<tr>


								<td>
									<%=id%>
								</td>
								<td title="">
									<%=rs.getString("hao")%>
								</td>

								<td title="">
									<%=rs.getString("jdate")%>
								</td>

								<td title="">
									<%=rs.getString("ldate")%>
								</td>

								<td title="">
									<%=rs.getString("jine")%>
								</td>

								<td title="">
									<%=rs.getString("shijian")%>
								</td>

								<td title="">
									<%=rs.getString("biao")%>
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
							共计<%=jine%>元     <a href="<%=path %>/upload/export.jsp">导出</a>

						</div>
					</div>
				</form>
			</div>
		</div>
		<!--/main-->
		</div>
	</body>
</html>
