package com.wang.util;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFFooter;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

import com.wang.db.DBManager;

/**
 * Excel导出操作
 *
 */
public class ExportExcelUtil {
	
	private static Connection conn ;  
	   
	
	
	//表头
	public static final String[] tableHeader = 
		{"序号","车牌号","停车时间","离开时间","金额","时长","收费标准"};
	//创建工作本
	public static HSSFWorkbook demoWorkBook = new HSSFWorkbook();
	//创建表
	public static HSSFSheet demoSheet = demoWorkBook.createSheet("Sheet1");
	//表头的单元格个数目  
	public static final short cellNumber = (short)tableHeader.length;
	//数据库表的列数 
	public static final int columNumber = tableHeader.length;
	
	/**
	 * 获得数据库连接
	 * @return conn
	 */
	public static Connection getConn(){  
		 
			 
			DBManager dbm=new DBManager();
			conn = dbm.getConnection();
		 
		return conn;
	 }
	
	/**
	 * 查找结果集
	 * @return
	 * @throws SQLException
	 */
	 public ResultSet selectAllDataFromDB(String sql) throws SQLException{
		conn = getConn();
		Statement stmt = conn.createStatement();  
		ResultSet rs = stmt.executeQuery(sql); 
		return rs;
	 }
	
	/**
	 * 创建表头
	 * @return
	 */
	public void createTableHeader(){
	//	HSSFHeader header = demoSheet.getHeader();
	//	header.setCenter("大区信息表");
		HSSFRow headerRow = demoSheet.createRow((short) 0);
		for(int i = 0;i < cellNumber;i++){
			HSSFCell headerCell = headerRow.createCell((short) i);
			//headerCell.setEncoding(HSSFCell.ENCODING_UTF_16);
			headerCell.setCellValue(tableHeader[i]);
			headerCell.setCellStyle(getTitleStyle());
		}
	}
	
	/**
	 * 创建行
	 * @param cells
	 * @param rowIndex
	 */
	public void createTableRow(List<String> cells,short rowIndex){
		//创建第rowIndex行
		HSSFRow row = demoSheet.createRow((short) rowIndex);
		row.setHeight((short) (15.625*20));
		HSSFCellStyle style = getCellStyle();
		for(short i = 0;i < cells.size();i++)
		{
			//创建第i个单元格
			HSSFCell cell = row.createCell((short) i);
			cell.setCellStyle(style);
			//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
	        cell.setCellValue(cells.get(i));
		}
	}
	
	/**
	 * 创建整个Excel表
	 * @throws SQLException 
	 *
	 */
	public void createExcelSheeet(String sql) throws SQLException{
		createTableHeader();
		
		ResultSet rs = selectAllDataFromDB(sql);
		int rowIndex = 1;
		while(rs.next()){
			List<String> list = new ArrayList<String>();
			for(int i = 1;i <= columNumber;i++)
			{
				list.add(rs.getString(i));
			}
			createTableRow(list,(short)rowIndex);
			rowIndex++;
		}
	}
	
	/**
	 * 导出表格
	 * @param sheet
	 * @param os
	 * @return 
	 * @throws IOException
	 */
	public void expord(OutputStream os) throws IOException{
		demoSheet.setGridsPrinted(true);
        HSSFFooter footer = demoSheet.getFooter();
        footer.setRight("Page " + HSSFFooter.page() + " of " +
        HSSFFooter.numPages());
        demoWorkBook.write(os);
	}
	
	/**
	 * 设置头部样式
	 * @return HSSFCellStyle
	 */
	public HSSFCellStyle getTitleStyle(){
		HSSFCellStyle style = demoWorkBook.createCellStyle();  
	    HSSFFont font = demoWorkBook.createFont();
	    
	    demoSheet.setColumnWidth((short)7, (short) 7000);
		demoSheet.setColumnWidth((short)8, (short) 7000);
		demoSheet.setColumnWidth((short)11, (short) 5000);
		demoSheet.setColumnWidth((short)12, (short) 5000);
	    
	    font.setFontName("Arial");  
	    font.setFontHeightInPoints((short) 10);// 设置字体大小  
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
        style.setFillForegroundColor(HSSFColor.LAVENDER.index);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中  
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);  
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);  
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);  
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);  
        style.setWrapText(true);  
        style.setFont(font);  
        return style;  
	}
	
	/**
	 * 设置表格格样式
	 * @return HSSFCellStyle
	 */
	public HSSFCellStyle getCellStyle(){
		HSSFCellStyle style = demoWorkBook.createCellStyle();  
        HSSFFont font = demoWorkBook.createFont();  
        font.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFillForegroundColor(HSSFColor.LIGHT_GREEN.index);
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中  
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);  
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);  
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);  
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN); 
        style.setFont(font);  
        return style;  
	}
}

