package com.wang.action;	
import java.io.IOException;	
import java.io.PrintWriter;	
import java.sql.*;	
import javax.servlet.ServletException;	
import javax.servlet.http.HttpServlet;	
import javax.servlet.http.HttpServletRequest;	
import javax.servlet.http.HttpServletResponse;

import com.wang.db.DBManager;	
public class RegUserinfoAction extends HttpServlet {	
 
	private static final long serialVersionUID = 1L;
	 

	public void doPost(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {	
	
		response.setContentType("text/html");	
		PrintWriter out = response.getWriter();	
		String name=request.getParameter("name");
		String pwd=request.getParameter("pwd");
		String age=request.getParameter("age");
		String tel=request.getParameter("tel");
			
		DBManager dbm = new DBManager();	
			
		//用户注册
		String sql = "insert into userinfo(name,pwd,age,tel,jine) values('"+name+"','"+pwd+"','"+age+"','"+tel+"','0')";	
	
		Statement stat = null;	
		Connection conn=null;	
		try {	
			conn=dbm.getConnection();	
			stat = conn.createStatement();	
			System.out.println(sql);	
			stat.execute(sql);	
		} catch (SQLException e) {	
			// TODO Auto-generated catch block	
			e.printStackTrace();	
		} finally {	
			try {	
				if(stat!=null)	
					stat.close();	
				if(conn!=null)	
					conn.close();	
			} catch (SQLException e) {	
				// TODO Auto-generated catch block	
				e.printStackTrace();	
			}	
		}	
		out.println("<script>alert('注册成功请登录！');window.location.href='login.jsp'</script>");
		out.flush();	
		out.close();	
	}	
 
}	
