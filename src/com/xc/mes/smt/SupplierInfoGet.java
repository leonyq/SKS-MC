package com.xc.mes.smt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;

public class SupplierInfoGet implements IJobx
{
  /**
   * Args 参数设置类
   *  Map<String,Object> params 传人参数
   *  Object result 返回内容
  */
  @Override
  public void exec(Args args) throws Exception
  {
	List<Object[]> SupplierList = new ArrayList<Object[]>();
		/* 获取当前时间的相对的12小时的时间 begin */
		Date currentTime = new Date();
		java.text.Format formatter = new java.text.SimpleDateFormat(
				"yyyyMMddhhmmss");
		Calendar cal = Calendar.getInstance();
		cal.setTime(currentTime);
		cal.add(Calendar.HOUR_OF_DAY, -12);
		String agocurrentTime = formatter.format(cal.getTime());
		System.out.println(agocurrentTime);
		/* 获取当前时间的相对的12小时的时间 end */
		
		Connection con = null;
		String url = "jdbc:sqlserver://192.168.2.168:1433;DatabaseName=test";
		String user = "DNXC";
		String pwd = "dnxc";
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
//			con = DriverManager.getConnection(url, user, pwd);
//			String sql = "select MB001,MA002,MA003 from ACRMB where MODI_DATE >='"
//					+ currentTime + "'";
//			stmt = con.prepareStatement(sql);
//			rs = stmt.executeQuery();
//			
//			while(rs.next()){
//				SupplierList.add(new Object[]{rs.getString("MB001"),rs.getString("MB002"),rs.getString("MB003")});
//			}
			SupplierList.clear();
			SupplierList.add(new Object[]{"aaa","bbb","ccc"});
			initInfo(SupplierList);
			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
		}finally {
			try {
				if (stmt != null && rs != null) {
					stmt.close();
					rs.close();
					con.close();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
  }
  public void initInfo(List<Object[]> supplierList) {
		String uuid = StringUtils.getUUID();
		String initInfo = "insert into T_CO_SUPPLIER (ID,SUPPLIER_CODE,SUPPLIER_SHORTNAME,SUPPLIER_NAME) "
				+ "values (?,?,?,?)";
		for (int i = 0; i < supplierList.size(); i++) {
			CommMethod.getBaseService().execSql(initInfo,new Object[]{uuid, supplierList.get(i)[0],supplierList.get(i)[1], supplierList.get(i)[2],});
		}
		try {
			CommMethod.getBaseService().getConnection().commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
		}
		
	}
}
