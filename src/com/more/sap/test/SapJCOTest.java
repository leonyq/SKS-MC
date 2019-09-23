package com.more.sap.test;

import com.alibaba.fastjson.JSON;
import com.more.sap.comm.RfcManager;
import com.sap.conn.jco.JCoField;
import com.sap.conn.jco.JCoFunction;
import com.sap.conn.jco.JCoParameterList;
import com.sap.conn.jco.JCoTable;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.xml.bind.SchemaOutputResolver;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * JCO SAP连接测试
 * @author:phantomsaber
 * @version:2019/7/11 14:31
 * @email:phantomsaber@foxmail.com
 **/
public class SapJCOTest {
	private final Log log = LogFactory.getLog(this.getClass());

	public static void main(String[] args) {

		JCoFunction function = RfcManager.getFunction("ZFM_MES_001");
		RfcManager.execute(function);

		JCoTable itOut = function.getTableParameterList().getTable("IT_OUT");
		JCoTable itOut1 = function.getTableParameterList().getTable("IT_MATNR");

		Map<String, String> itOutMap = new HashMap<>();

		for (int i = 0; i < itOut.getNumRows(); i++) {
			itOut.setRow(i);
			itOutMap.put("PRODH", itOut.getString("PRODH"));
		}

		String jsonString = JSON.toJSONString(itOutMap);

		System.out.println("--- json: >>> ");
		System.out.println(jsonString);
	}
}