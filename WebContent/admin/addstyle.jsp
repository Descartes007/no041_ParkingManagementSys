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
						<form action="/jscss/admin/design/add" method="post" id="myform"
							name="myform" enctype="multipart/form-data">
							<table class="insert-tab" width="100%">
								<tbody>
									<tr>
										<th width="120">
											<i class="require-red">*</i>分类：
										</th>
										<td>
											<select name="colId" id="catid" class="required">
												<option value="">
													请选择
												</option>
												<option value="19">
													精品界面
												</option>
												<option value="20">
													推荐界面
												</option>
											</select>
										</td>
									</tr>
									<tr>
										<th>
											<i class="require-red">*</i>标题：
										</th>
										<td>
											<input class="common-text required" id="title" name="title"
												size="50" value="" type="text">
										</td>
									</tr>
									<tr>
										<th>
											作者：
										</th>
										<td>
											<input class="common-text" name="author" size="50"
												value="admin" type="text">
										</td>
									</tr>
									
									<tr>
										<th>
											内容：
										</th>
										<td>
											<textarea name="content" class="common-textarea" id="content"
												cols="30" style="width: 98%;" rows="10"></textarea>
										</td>
									</tr>
									<tr>
										<th></th>
										<td>
											<input class="btn btn-primary btn6 mr10" value="提交"
												type="submit">
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