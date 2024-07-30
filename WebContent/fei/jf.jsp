<%@include file="/common/sub_header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8"
	import="java.util.*,java.sql.*,com.wang.db.*" pageEncoding="UTF-8"%>


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
						<i class="icon-font"></i><span>缴费</span>
					</div>
				</div>
				<div class="result-wrap">
					<div class="result-content">
						<form method="post" id="myform" name="myform">
							<table class="insert-tab" width="100%">
								<tbody>
									<%
										DBManager dbm = new DBManager();
										Connection conn = dbm.getConnection();
										

										String sql = "select * from chewei where id= "
												+ request.getParameter("id");
										PreparedStatement stat = conn.prepareStatement(sql);
										ResultSet rs = stat.executeQuery();
										rs.next();
										
										String bdate=rs.getString("adate");
										
										java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
										String ldate=format.format(new java.util.Date());
										long count=dbm.calcHour(bdate,ldate);
										String fei=(String)session.getAttribute("fei");
										
										long jine=count*Long.parseLong(fei);
										
										
										String yue=dbm.getYue(rs.getString("chepai"));
										
									    long yu=Long.parseLong(yue);
									    
									    boolean isNo=false;
									    if(jine>yu){
									       isNo=true;
									    }
										 
									%>
									<tr>
										<th>
											<i class="require-red"></i>车牌：
										</th>
										<td>
											<input class="common-text required" id="hao"
												value='<%=rs.getString("chepai")%>' name="hao" size="20"
												type="text" readonly="readonly">
										</td>
									</tr>

									<tr>
										<th>
											<i class="require-red"></i>停车时间：
										</th>
										<td>
											<input class="common-text required" id="jdate"
												value='<%=bdate%>' name="jdate" size="20"
												type="text" readonly="readonly">
										</td>
									</tr>
									<tr>
										<th>
											<i class="require-red"></i>离开时间：
										</th>
										<td>
											<input class="common-text required" id="ldate" value='<%=ldate%>'
												name="ldate" size="20" type="text"  readonly="readonly">
										</td>
									</tr>
									<tr>
										<th>
											<i class="require-red"></i>停车标准：
										</th>
										<td>
											<input class="common-text required" id="biao"
												value='<%=fei%>' name="biao"
												size="5" type="text"  readonly="readonly">
											元/小时
										</td>
									</tr>
									<tr>
										<th>
											<i class="require-red"></i>停车时长：
										</th>
										<td>
											<input class="common-text required" id="shijian"
												value='<%=count%>' name="shijian"
												size="5" type="text"  readonly="readonly">
											小时
										</td>
									</tr>
									<tr>
										<th>
											<i class="require-red"></i>费用：
										</th>
										<td>
											<input class="common-text required" id="jine"
												value='<%=jine%>' name="jine"
												size="5" type="text"  readonly="readonly">
											(卡内余额:<%=yu %>)	
										 
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
											<input class="btn btn-primary btn6 mr10" onclick="save();"
												value="提交" type="button">
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
    var isNo="<%=isNo%>";
    if(isNo=='true'){
       $.messager.alert('警告', '开内余额不足，请充值！', 'warning');
		return;
    }
	if ($("#name").val() == "") {
		$.messager.alert('警告', '姓名不能为空！', 'warning');
		return;
	}
	if ($("#pwd").val() == "") {
		$.messager.alert('警告', '密码不能为空！', 'warning');
		return;
	}
	document.forms[0].action = "<%=path%>/AddCfeiAction";
	document.forms[0].submit();

}
</script>
