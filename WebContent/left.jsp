<%@include file="/common/sub_header.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 
<script type="text/javascript">
 function setMenu(obj){
  var objul=document.getElementById("menu"+obj)
  if(objul.style.display=="none"){
     objul.style.display="";
  }else{
     objul.style.display="none";
  }
  
  return false;
}
</script>
<div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
            <!--如果选择的是管理员，页面为一下布局  -->
               <c:if test="${type=='管理员'}">
                <li>
                    <a href="#" onclick="return setMenu(1)"><i class="icon-font">&#xe003;</i>系统管理</a>
                    <ul class="sub-menu" id="menu1">
                        <li><a href="<%=path %>/admin/list.jsp">管理员管理</a></li>
                         <li><a href="<%=path %>/userinfo/list.jsp">用户管理</a></li>
                      
                    </ul>
                </li>
                <li>
                    <a href="#" onclick="return setMenu(2)"><i class="icon-font">&#xe003;</i>车位管理</a>
                    <ul class="sub-menu" id="menu2">
                        <li><a href="<%=path %>/chewei/list.jsp">车位管理</a></li>
                        <li><a href="<%=path %>/fei/modFei.jsp">车费标准</a></li>
                        <li><a href="<%=path %>/chewei/jflist.jsp">停车缴费</a></li>
                        <li><a href="<%=path %>/chewei/cwlist.jsp">车位状态</a></li>
                        <li><a href="<%=path %>/cfei/list.jsp">停车记录查询</a></li>
                    </ul>
                </li>
               </c:if> 
               <!-- 如果是用户，显示一下菜单信息 -->
               <c:if test="${type=='用户'}">
                
                <li>
                    <a href="#" onclick="return setMenu(3)"><i class="icon-font">&#xe003;</i>个人信息管理</a>
                    <ul class="sub-menu" id="menu3">
                        <li><a href="<%=path %>/userinfo/myUserinfo.jsp">修改个人信息</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" onclick="return setMenu(4)"><i class="icon-font">&#xe003;</i>系统使用</a>
                    <ul class="sub-menu" id="menu4">
                        
                        <li><a href="<%=path %>/che/list.jsp">车辆信息</a></li>
                        <li><a href="<%=path %>/userinfo/getCard.jsp">卡余额</a></li>
                        <li><a href="<%=path %>/fei/viewFei.jsp">收费标准</a></li>
                        
                       <li><a href="<%=path %>/chewei/tlist.jsp">车位信息</a></li>
                        <li><a href="<%=path %>/cfei/lslist.jsp">停车记录查询</a></li>
                    </ul>
                </li>
               </c:if> 
              
            </ul>
        </div>
    </div>

