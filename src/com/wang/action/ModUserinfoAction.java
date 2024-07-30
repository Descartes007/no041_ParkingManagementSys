package com.wang.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wang.db.DBManager;

import java.sql.*;
 
public class ModUserinfoAction extends HttpServlet {
 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String age = request.getParameter("age");
		String tel = request.getParameter("tel");

		DBManager dbm = new DBManager();
		//修改用户信息
		String sql = "update userinfo set name='" + name + "',pwd='" + pwd
				+ "',age='" + age + "',tel='" + tel + "' where id=" + id;
		System.out.println(sql);

		Statement stat = null;
		Connection conn = null;
		try {
			conn = dbm.getConnection();
			stat = conn.createStatement();
			stat.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (stat != null)
					stat.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		String type = request.getParameter("type");
		if (type != null && type.length() > 0) {
			out
			.println("<script>alert('修改成功！');window.location.href='userinfo/myUserinfo.jsp'</script>");
		} else {
			response.sendRedirect("userinfo/list.jsp");
		}
		out.flush();
		out.close();
	}
 
}
