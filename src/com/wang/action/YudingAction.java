package com.wang.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wang.db.DBManager;

import java.sql.*;

 
public class YudingAction extends HttpServlet {
 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		//预订车位
		int uid = Integer.parseInt((String) request.getSession().getAttribute(
				"uid"));

		DBManager dbm = new DBManager();
		String hao = dbm.getChe(uid);

		if (hao != null) {
			if (dbm.isDing(hao) != null) {
				out
						.println("<script>alert('你的车已经停在车位上！');window.location.href='chewei/tlist.jsp'</script>");
			} else {
				java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				String sql = "update chewei set chepai='" + hao + "',adate='"
						+ format.format(new java.util.Date()) + "' where id="
						+ id;
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
				out.println("<script>alert('预订成功！');window.location.href='chewei/tlist.jsp'</script>");

			}

		} else {
			out.println("<script>alert('请添加车辆信息！');window.location.href='chewei/tlist.jsp'</script>");
		}

		
		out.flush();
		out.close();
	}
 
}
