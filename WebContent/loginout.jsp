<%
  /*退出验证实效，返回登录界面*/
  session.invalidate();
  response.sendRedirect("login.jsp");
%>