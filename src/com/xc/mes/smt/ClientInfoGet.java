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

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.base.login.model.UserDto;
import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;

public class ClientInfoGet implements IJobx {
	private final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	/**
	 * Args 参数设置类 Map<String,Object> params 传人参数 Object result 返回内容
	 */
	@Override
	public void exec(Args args) throws Exception {
		List<Object[]> clientList = new ArrayList<Object[]>();
// 		/* 获取当前时间的相对的12小时的时间 begin */
// 		Date currentTime = new Date();
// 		java.text.Format formatter = new java.text.SimpleDateFormat(
// 				"yyyyMMddhhmmss");
// 		Calendar cal = Calendar.getInstance();
// 		cal.setTime(currentTime);
// 		cal.add(Calendar.HOUR_OF_DAY, -12);
// 		String agocurrentTime = formatter.format(cal.getTime());
// 		System.out.println(agocurrentTime);
// 		/* 获取当前时间的相对的12小时的时间 end */

// 		// 创建数据库连接
// 		Connection con = null;
// 		String url = "jdbc:sqlserver://192.168.2.168:1433;DatabaseName=test";
// 		String user = "DNXC";
// 		String pwd = "dnxc";
// 		PreparedStatement stmt = null;
// 		ResultSet rs = null;

// 		try {

// 			con = DriverManager.getConnection(url, user, pwd);
// 			// 从erp查询客户信息
// 			String sql = "select MA001,MA002,MA003 from dbo.COPMA where MODI_DATE >='"
// 					+ "20161211111111" + "'";
// 			System.out.println(sql);
// 			stmt = con.prepareStatement(sql);
// 			rs = stmt.executeQuery();

// 			while (rs.next()) {
// 				clientList.add(new Object[]{rs.getString("MA001"),
// 						rs.getString("MA002"), rs.getString("MA003")});
// 			}
            clientList.add(new Object[]{"a","b","c"});
			initClientInfo(clientList);
// 		} catch (SQLException e) {
// 			// TODO: handle exception
// 			log.error(e);

// 		} catch (Exception e) {
// 			// TODO: handle exception
// 			log.error(e);

// 		} finally {
// 			try {
// 				if (stmt != null && rs != null) {
// 					stmt.close();
// 					rs.close();
                 // con.close();
// 				}
// 			} catch (SQLException e) {
// 				// TODO Auto-generated catch block
// 				log.error(e);
// 			}

// 		}

	}
	public void initClientInfo(List<Object[]> clientList) 
	{
	
		String uuid = StringUtils.getUUID();
		String intoInfo = "insert into T_CO_CUSTOMER(ID,CUST_CODE,CUST_ABBREVIATION,CUSTOMER) values (?,?,?,?)";
		for (int i = 0; i < clientList.size(); i++) 
		{
 			CommMethod.getBaseService().execSql(intoInfo,new Object[]{uuid, clientList.get(i)[0],clientList.get(i)[1], clientList.get(i)[2]});
		}	
		try {
			CommMethod.getBaseService().getConnection().commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			log.error(e);
		}
	}

}
