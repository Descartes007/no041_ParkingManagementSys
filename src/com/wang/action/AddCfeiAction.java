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
 * 添加车费
 *
 */
public class AddCfeiAction extends HttpServlet {	
 
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {	
	
		response.setContentType("text/html");	
		PrintWriter out = response.getWriter();	
		String hao=request.getParameter("hao");
		String jdate=request.getParameter("jdate");
		String ldate=request.getParameter("ldate");
		String jine=request.getParameter("jine");
		String adate=new java.util.Date().toLocaleString();	
		String shijian=request.getParameter("shijian");
		String biao=request.getParameter("biao");
			
		DBManager dbm = new DBManager();	
			
		//添加车费
		String sql = "insert into cfei(hao,jdate,ldate,jine,adate,shijian,biao) values('"+hao+"','"+jdate+"','"+ldate+"','"+jine+"','"+adate+"','"+shijian+"','"+biao+"')";	
		//更新车位
		String sql2 ="update chewei set chepai='',adate='' where chepai='"+hao+"'";
		//更新卡
		String sql3="update userinfo set jine=jine-"+jine+" where id in (select uid from che where hao='"+hao+"')";
		Statement stat = null;	
		Connection conn=null;	
		try {	
			conn=dbm.getConnection();	
			stat = conn.createStatement();	
			System.out.println(sql);
			System.out.println(sql2);
			System.out.println(sql3);
			stat.execute(sql);	
			stat.execute(sql2);	
			stat.execute(sql3);
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
		out.println("<script>alert('缴费成功！');window.location.href='chewei/jflist.jsp'</script>");
		out.flush();	
		out.close();	
	}	
	 
}	
