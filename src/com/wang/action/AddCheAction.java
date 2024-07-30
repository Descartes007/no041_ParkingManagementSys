package com.wang.action;	
	
import java.io.IOException;	
import java.io.PrintWriter;	
import java.sql.*;	
	
import javax.servlet.ServletException;	
import javax.servlet.http.HttpServlet;	
import javax.servlet.http.HttpServletRequest;	
import javax.servlet.http.HttpServletResponse;

import com.wang.db.DBManager;	
	
/**
 * 添加汽车
 */
public class AddCheAction extends HttpServlet {	
	 
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {	
	
		response.setContentType("text/html");	
		PrintWriter out = response.getWriter();	
		String hao=request.getParameter("hao");
		String leixing=request.getParameter("leixing");
		String pic=request.getParameter("fujian");
		String info=request.getParameter("info");
		int uid=Integer.parseInt((String)request.getSession().getAttribute("uid"));
			
		DBManager dbm = new DBManager();	
			
		//1.添加车辆
		String sql = "insert into che(hao,leixing,pic,info,uid) values('"+hao+"','"+leixing+"','"+pic+"','"+info+"',"+uid+")";	
	
		Statement stat = null;	
		Connection conn=null;	
		try {	
			conn=dbm.getConnection();	
			stat = conn.createStatement();	
			System.out.println(sql);	
			stat.execute(sql);	
		} catch (SQLException e) {	
			 
			e.printStackTrace();	
		} finally {	
			try {	
				if(stat!=null)	
					stat.close();	
				if(conn!=null)	
					conn.close();	
			} catch (SQLException e) {	
				 
				e.printStackTrace();	
			}	
		}	
		response.sendRedirect("che/list.jsp");	
		out.flush();	
		out.close();	
	}	
 
}	
