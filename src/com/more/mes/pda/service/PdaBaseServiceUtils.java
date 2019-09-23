package com.more.mes.pda.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;

public class PdaBaseServiceUtils {
	/**
	 * ModelService
	 */
	public ModelService modelService = (ModelService) SpringContextUtil
			.getBean("modelService");

	/**
	 * Logger
	 */
	public Log log = LogFactory.getLog(this.getClass().getName());
	public static Log logStatic = LogFactory.getLog("com.more.mes.pda.service.PdaBaseServiceUtils");
	
	//消息常量
	public static final String foundDataError="found data error";
	public static final String dataNotFound="data not found";
	public static final String foundNoVersion="No Version Data Found";
	public static final String foundNoData="未获取到任何数据";
	public static final String paramAnalysisFaild="参数解析异常";
	public static final String foundNoAreaData="未获取到仓库信息";
	public static final String foundNoCmdData="未获取到指令信息";
	public static final String foundNoCoData="未获取到项目信息";
	public static final String foundNoDocData="未获取到单据信息";
	public static final String foundNoDocTypeData="未获取到单据类型信息";
	public static final String foundNoItemCodeData="未获取到物料代码";
	public static final String foundNoLockItemData="未获取到物料锁定信息";
	public static final String foundNoLineData="未获取到线体信息";
	public static final String foundNoMonumberData="未获取到制令单";
	public static final String userNameError="用户名错误";
	public static final String foundNoBackupDocData="未获取到备料单信息";
	public static final String foundNoItemSnData="未获取到物料SN";
	public static final String foundNoInventoryData="未获取到盘点单";
	public static final String foundNoTimeData="未获取时间";
	public static final String passWordError="密码错误";
	public static final String userNotFound="用户不存在";
	public static final String saveLoginInfoError="保存登录信息异常";
	public static final String foundNoUserData="保未获取到用户信息";
	public static final String foundNoWorkStationData="未获取到工作中心信息";
	public static final String optError="操作失败";
	private static String pdaSuccessInfoTemp="{\"chkLog\":\"true\",\"Message\":\"Get Data Successful\",\"Content\":%s}";
	private static String pdaFaildInfoTemp="{\"chkLog\":\"false\",\"Message\":\"%s\",\"Content\":[]}";

	public static String getPdaSuccessInfoTemp(){
		return pdaSuccessInfoTemp;
	}
	
	public static String getPdaFaildInfoTemp(){
		return pdaFaildInfoTemp;
	}
	
	/**
	 * 获取PDA设置信息
	 * 
	 * @param setingType
	 * @return
	 */
	public Map getPdaSetting(String setingType) {
		try {
			switch (setingType) {
			case "stockinfo":
				return pdaSettingStockInfo();
			default:
				break;
			}
			return null;
		} catch (Exception ex) {
			log.error("GetPdaSetting:", ex);
			return null;
		}
	}

	/**
	 * PDA设置信息：物料查询
	 * 
	 * @return
	 */
	public Map pdaSettingStockInfo() {
		try {
			Map returnMap = new HashMap();
			returnMap.put("序号", new HashMap() {
				{
					put("width", "50");
					put("visiable", "true");
				}
			});
			returnMap.put("品号", new HashMap() {
				{
					put("width", "100");
					put("visiable", "true");
				}
			});
			returnMap.put("数量", new HashMap() {
				{
					put("width", "50");
					put("visiable", "true");
				}
			});
			returnMap.put("条码", new HashMap() {
				{
					put("width", "200");
					put("visiable", "true");
				}
			});
			returnMap.put("一级容器", new HashMap() {
				{
					put("width", "200");
					put("visiable", "true");
				}
			});
			returnMap.put("二级容器", new HashMap() {
				{
					put("width", "200");
					put("visiable", "true");
				}
			});
			returnMap.put("三级容器", new HashMap() {
				{
					put("width", "200");
					put("visiable", "true");
				}
			});
			returnMap.put("四级容器", new HashMap() {
				{
					put("width", "200");
					put("visiable", "true");
				}
			});
			returnMap.put("仓库SN", new HashMap() {
				{
					put("width", "100");
					put("visiable", "true");
				}
			});
			returnMap.put("库位", new HashMap() {
				{
					put("width", "100");
					put("visiable", "true");
				}
			});
			returnMap.put("库位名称", new HashMap() {
				{
					put("width", "100");
					put("visiable", "true");
				}
			});
			returnMap.put("品质", new HashMap() {
				{
					put("width", "50");
					put("visiable", "true");
				}
			});
			returnMap.put("退料", new HashMap() {
				{
					put("width", "50");
					put("visiable", "true");
				}
			});
			returnMap.put("失效期", new HashMap() {
				{
					put("width", "120");
					put("visiable", "true");
				}
			});
			returnMap.put("供应商", new HashMap() {
				{
					put("width", "100");
					put("visiable", "true");
				}
			});
			returnMap.put("生产日期", new HashMap() {
				{
					put("width", "120");
					put("visiable", "true");
				}
			});
			returnMap.put("解冻状态", new HashMap() {
				{
					put("width", "50");
					put("visiable", "true");
				}
			});
			returnMap.put("检测状态", new HashMap() {
				{
					put("width", "50");
					put("visiable", "true");
				}
			});
			returnMap.put("入库时间", new HashMap() {
				{
					put("width", "120");
					put("visiable", "true");
				}
			});
			returnMap.put("入库人", new HashMap() {
				{
					put("width", "100");
					put("visiable", "true");
				}
			});
			returnMap.put("机构代码", new HashMap() {
				{
					put("width", "100");
					put("visiable", "true");
				}
			});
			returnMap.put("库存状态", new HashMap() {
				{
					put("width", "50");
					put("visiable", "true");
				}
			});
			returnMap.put("工单号", new HashMap() {
				{
					put("width", "100");
					put("visiable", "true");
				}
			});
			returnMap.put("订单号", new HashMap() {
				{
					put("width", "100");
					put("visiable", "true");
				}
			});
			returnMap.put("批次", new HashMap() {
				{
					put("width", "100");
					put("visiable", "true");
				}
			});
			returnMap.put("品名", new HashMap() {
				{
					put("width", "100");
					put("visiable", "true");
				}
			});
			returnMap.put("规格", new HashMap() {
				{
					put("width", "100");
					put("visiable", "true");
				}
			});
			return returnMap;
		} catch (Exception ex) {
			log.error("pdaSettingStockInfo:", ex);
			return null;
		}
	}

	/**
	 * Map 转 Json
	 * 
	 * @param map
	 * @return
	 */
	public String MapToJson(Map dataMap) {
		try {
			JSONArray json = JSONArray.fromObject(dataMap);
			return json.toString();
		} catch (Exception ex) {
			log.error("MapToJson:", ex);
			return null;
		}
	}
	
	/**
	    * Map 转  Json
	    * @param map
	    * @return
	    */
	   public String MapListToJson(List<Map> mapList)
	   {
		   try
		   {
			   JSONArray json = JSONArray.fromObject(mapList);
			   return json.toString();
		   }
		   catch(Exception ex)
		   {
			   log.error("MapListToJson:",ex);
			   return null;
		   }
	   }

	/**
	 * 获取制令单号
	 * 
	 * @param strLine
	 * @param dataAuth
	 * @return
	 */
	public List<Map> getMoBase(String strLine, String dataAuth) {
		try {
			// 执行
			String sqlStr = "SELECT T.PM_MO_NUMBER FROM T_PM_MO_BASE T\r\n"
					+ "WHERE T.PM_AREA_SN=?\r\n"
					+ "AND T.PM_STATUS NOT IN('4','5')\r\n"
					+ "AND T.DATA_AUTH=?";
			Object[] params = new Object[] { strLine, dataAuth };
			List<Map> mapList = modelService.listDataSql(sqlStr, params);
			// 释放资源
			params = null;
			return mapList;
		} catch (Exception e) {
			log.error("getMoBase:", e);
			return null;
		}
	}
	
	/**
     * 根据单据类型查询单据信息
     * @param docType 单据类型
     * @param dataAuth 组织机构
     * @param areaSn 仓库SN
     * @return
     */
    public List<Map> getDocForType(String docType,String dataAuth,String area){
    	try{
    		//初始化变量
    		String strDocType=null==docType?"":docType;
			String strOrgCode=null==dataAuth?"":dataAuth;
			String areaSn=null==area?"":area; 
    		String sqlStr="SELECT T.WDI_DOC_NUM,T.WDI_URGENT_FLAG FROM  \r\n" + 
    				"(SELECT A.WDI_DOC_NUM,NVL(A.WDI_URGENT_FLAG,'N') AS WDI_URGENT_FLAG,A.WDI_CREATE_TIME  \r\n" + 
    				"FROM T_WMS_DOC_INFO A  \r\n" + 
    				"LEFT JOIN T_WMS_DOC_TYPE B ON A.WDI_DOC_TYPE=B.WDT_TYPE_SN   \r\n" + 
    				"LEFT JOIN T_WMS_DISPATCH_TYPE C ON A.WDI_DISPATCH_TYPE=C.WDO_DISPATCH_SN AND A.DATA_AUTH=C.DATA_AUTH \r\n" + 
    				"AND A.WDI_DOC_TYPE=C.WDT_TYPE_SN \r\n" + 
    				"WHERE A.WDI_DOC_TYPE=? AND A.DATA_AUTH=? AND A.DATA_AUTH=B.DATA_AUTH  \r\n" + 
    				"AND (A.WDI_STATUS <>'3' OR  \r\n" + 
    				"DECODE(NVL(C.WDO_HANDOVER_FLAG,''),'',B.WDT_HANDOVER_FLAG,C.WDO_HANDOVER_FLAG)='Y') \r\n" + 
    				"AND ? NOT IN('DJ07','DJ08','DJ09')  \r\n" + 
    				"--2018-11-26 by cc Ìí¼Ó²Ö¿â¹ýÂË£¬¿ÉÖ±½ÓÓÃÏÂÃæµÄÓï¾äÌæ»»¾ÉµÄ£¬ÎªÈ·±£²éÑ¯½á¹û£¬ÏÂÃæµÄÓï¾äÏÈÖ»×öÎª¹ýÂËÌõ¼þ \r\n" + 
    				"AND A.WDI_DOC_NUM IN ( \r\n" + 
    				"--Èë¿â \r\n" + 
    				"SELECT DISTINCT \r\n" + 
    				"A.WRI_DOC_NUM AS WDI_DOC_NUM \r\n" + 
    				"FROM T_WMS_RECEIVE_ITEM A \r\n" + 
    				"LEFT JOIN T_WMS_RECEIVE_DOC B ON A.WRI_DOC_NUM=B.WRD_DOC_NUM \r\n" + 
    				"LEFT JOIN T_WMS_DOC_TYPE C ON B.WRD_DOC_TYPE=C.WDT_TYPE_SN   \r\n" + 
    				"LEFT JOIN T_WMS_DISPATCH_TYPE D ON B.WRD_DISPATCH_SN=D.WDO_DISPATCH_SN AND B.WRD_DOC_TYPE=D.WDT_TYPE_SN AND B.DATA_AUTH=D.DATA_AUTH \r\n" + 
    				"WHERE B.WRD_DOC_TYPE=? AND B.DATA_AUTH=? AND B.DATA_AUTH=C.DATA_AUTH  \r\n" + 
    				"AND (B.WRD_STATUS <>'3' OR  \r\n" + 
    				"--DECODE(NVL(D.WDO_HANDOVER_FLAG,''),'',C.WDT_HANDOVER_FLAG,D.WDO_HANDOVER_FLAG)='Y' \r\n" + 
    				"--µ¥¾Ý½»½Ó±êÊ¶ÎªYµÄÇé¿öÏÂ£¬ÅÐ¶¨µ¥¾ÝÊÇ·ñÒÑ½»½Ó£¬ÐèÒªÏÔÊ¾Î´½»½ÓÍê³ÉµÄµ¥ \r\n" + 
    				"(DECODE(NVL(D.WDO_HANDOVER_FLAG,''),'',C.WDT_HANDOVER_FLAG,D.WDO_HANDOVER_FLAG)='Y' AND EXISTS( \r\n" + 
    				"SELECT \r\n" + 
    				"F.WRD_DOC_NUM \r\n" + 
    				"FROM T_WMS_RECEIVE_DETAIL F \r\n" + 
    				"WHERE (F.WRD_HANDOVER_EMP IS NULL OR F.WRD_HANDOVER_EMP='') \r\n" + 
    				"AND F.WRD_DOC_NUM=B.WRD_DOC_NUM AND F.DATA_AUTH=B.DATA_AUTH \r\n" + 
    				"GROUP BY F.WRD_DOC_NUM,F.DATA_AUTH \r\n" + 
    				")) \r\n" + 
    				") \r\n" + 
    				"AND (A.WRI_WH_CODE=? OR A.WRI_WH_CODE IS NULL OR A.WRI_WH_CODE='') \r\n" + 
    				" \r\n" + 
    				"UNION ALL \r\n" + 
    				" \r\n" + 
    				"--³ö¿â \r\n" + 
    				"SELECT DISTINCT \r\n" + 
    				"A.WOI_DOC_NUM AS WDI_DOC_NUM \r\n" + 
    				"FROM T_WMS_OUTSTOCK_ITEM A \r\n" + 
    				"LEFT JOIN T_WMS_OUTSTOCK_DOC B ON A.WOI_DOC_NUM=B.WOD_DOC_NUM \r\n" + 
    				"LEFT JOIN T_WMS_DOC_TYPE C ON B.WOD_DOC_TYPE=C.WDT_TYPE_SN   \r\n" + 
    				"LEFT JOIN T_WMS_DISPATCH_TYPE D ON B.WOD_DISPATCH_SN=D.WDO_DISPATCH_SN AND B.WOD_DOC_TYPE=D.WDT_TYPE_SN AND B.DATA_AUTH=D.DATA_AUTH \r\n" + 
    				"WHERE B.WOD_DOC_TYPE=? AND B.DATA_AUTH=? AND B.DATA_AUTH=C.DATA_AUTH  \r\n" + 
    				"AND (B.WOD_STATUS <>'3' OR  \r\n" + 
    				"--DECODE(NVL(D.WDO_HANDOVER_FLAG,''),'',C.WDT_HANDOVER_FLAG,D.WDO_HANDOVER_FLAG)='Y' \r\n" + 
    				"--µ¥¾Ý½»½Ó±êÊ¶ÎªYµÄÇé¿öÏÂ£¬ÅÐ¶¨µ¥¾ÝÊÇ·ñÒÑ½»½Ó£¬ÐèÒªÏÔÊ¾Î´½»½ÓÍê³ÉµÄµ¥ \r\n" + 
    				"(DECODE(NVL(D.WDO_HANDOVER_FLAG,''),'',C.WDT_HANDOVER_FLAG,D.WDO_HANDOVER_FLAG)='Y' AND EXISTS( \r\n" + 
    				"SELECT \r\n" + 
    				"F.WOD_DOC_NUM \r\n" + 
    				"FROM T_WMS_OUTSTOCK_DETAIL F \r\n" + 
    				"WHERE (F.WOD_HANDOVER_EMP IS NULL OR F.WOD_HANDOVER_EMP='') \r\n" + 
    				"AND F.WOD_DOC_NUM=B.WOD_DOC_NUM AND F.DATA_AUTH=B.DATA_AUTH \r\n" + 
    				"GROUP BY F.WOD_DOC_NUM,F.DATA_AUTH \r\n" + 
    				")) \r\n" + 
    				") \r\n" + 
    				"AND (A.WOI_WH_CODE=? OR A.WOI_WH_CODE IS NULL OR A.WOI_WH_CODE='') \r\n" + 
    				" \r\n" + 
    				"UNION ALL  \r\n" + 
    				" \r\n" + 
    				"--µ÷²¦ \r\n" + 
    				"SELECT DISTINCT \r\n" + 
    				"A.WAI_DOC_NUM AS WDI_DOC_NUM \r\n" + 
    				"FROM T_WMS_ALLOT_ITEM A \r\n" + 
    				"LEFT JOIN T_WMS_ALLOT_DOC B ON A.WAI_DOC_NUM=B.WAD_DOC_NUM \r\n" + 
    				"LEFT JOIN T_WMS_DOC_TYPE C ON B.WAD_DOC_TYPE=C.WDT_TYPE_SN   \r\n" + 
    				"LEFT JOIN T_WMS_DISPATCH_TYPE D ON B.WAD_DISPATCH_SN=D.WDO_DISPATCH_SN AND B.WAD_DOC_TYPE=D.WDT_TYPE_SN AND B.DATA_AUTH=D.DATA_AUTH \r\n" + 
    				"WHERE B.WAD_DOC_TYPE=? AND B.DATA_AUTH=? AND B.DATA_AUTH=C.DATA_AUTH  \r\n" + 
    				"AND (B.WAD_STATUS <>'3' OR  \r\n" + 
    				"--DECODE(NVL(D.WDO_HANDOVER_FLAG,''),'',C.WDT_HANDOVER_FLAG,D.WDO_HANDOVER_FLAG)='Y' \r\n" + 
    				"--µ¥¾Ý½»½Ó±êÊ¶ÎªYµÄÇé¿öÏÂ£¬ÅÐ¶¨µ¥¾ÝÊÇ·ñÒÑ½»½Ó£¬ÐèÒªÏÔÊ¾Î´½»½ÓÍê³ÉµÄµ¥ \r\n" + 
    				"(DECODE(NVL(D.WDO_HANDOVER_FLAG,''),'',C.WDT_HANDOVER_FLAG,D.WDO_HANDOVER_FLAG)='Y' AND EXISTS( \r\n" + 
    				"SELECT \r\n" + 
    				"F.WAD_DOC_NUM \r\n" + 
    				"FROM T_WMS_ALLOT_DETAIL F \r\n" + 
    				"WHERE (F.WAD_HANDOVER_EMP IS NULL OR F.WAD_HANDOVER_EMP='') \r\n" + 
    				"AND F.WAD_DOC_NUM=B.WAD_DOC_NUM AND F.DATA_AUTH=B.DATA_AUTH \r\n" + 
    				"GROUP BY F.WAD_DOC_NUM,F.DATA_AUTH \r\n" + 
    				")) \r\n" + 
    				") \r\n" + 
    				"AND (A.WAI_OUT_WH=? OR A.WAI_OUT_WH IS NULL OR A.WAI_OUT_WH='') \r\n" + 
    				"\r\n" + 
    				"UNION ALL\r\n" + 
    				"\r\n" + 
    				"--ÅÌµãµ¥\r\n" + 
    				"SELECT DISTINCT \r\n" + 
    				"A.WID_DOC_NUM AS WDI_DOC_NUM \r\n" + 
    				"FROM T_WMS_INVENTORY_DETAIL A \r\n" + 
    				"LEFT JOIN T_WMS_INVENTORY_DOC B ON A.WID_DOC_NUM=B.WID_DOC_NUM \r\n" + 
    				"WHERE B.WID_DOC_TYPE=? AND B.DATA_AUTH=?\r\n" + 
    				"AND B.WID_STATUS <>'3'\r\n" + 
    				"AND (A.WID_WH_CODE=? OR A.WID_WH_CODE IS NULL OR A.WID_WH_CODE='') \r\n" + 
    				") \r\n" + 
    				" \r\n" + 
    				"UNION ALL   \r\n" + 
    				"                                       \r\n" + 
    				"SELECT A.PM_MO_NUMBER AS WDI_DOC_NUM,'N' AS WDI_URGENT_FLAG,A.CREATE_TIME AS WDI_CREATE_TIME \r\n" + 
    				"FROM T_PM_MO_BASE A \r\n" + 
    				"WHERE A.PM_STATUS NOT IN('4','5') \r\n" + 
    				"AND ? IN('DJ07','DJ08','DJ09') \r\n" + 
    				"AND A.DATA_AUTH=? \r\n" + 
    				" \r\n" + 
    				"UNION ALL  \r\n" + 
    				" \r\n" + 
    				"SELECT A.PM_MO_NUMBER AS WDI_DOC_NUM,'N' AS WDI_URGENT_FLAG,A.CREATE_TIME AS WDI_CREATE_TIME \r\n" + 
    				"FROM T_PM_MO_BASE A \r\n" + 
    				"WHERE A.PM_STATUS IN('4','5') AND A.PM_CLOSE_DATE>SYSDATE-30 \r\n" + 
    				"AND ? IN('DJ09')  \r\n" + 
    				"AND A.DATA_AUTH=? \r\n" + 
    				")T \r\n" + 
    				"ORDER BY NVL(T.WDI_URGENT_FLAG,'N') DESC,T.WDI_CREATE_TIME DESC";
    		//生成参数
    		Object[] params=new Object[] {
					strDocType,
					strOrgCode,
					strDocType,
					strDocType,
					strOrgCode,
					areaSn,
					strDocType,
					strOrgCode,
					areaSn,
					strDocType,
					strOrgCode,
					areaSn,
					strDocType,
					strOrgCode,
					areaSn,
					strDocType,
					strOrgCode,
					strDocType,
					strOrgCode
			};
    		//查询
    		List<Map> dataList = modelService.listDataSql(sqlStr,params);
    		params=null;
    		return dataList;
    	}
    	catch(Exception e){
    		log.error("getDocForType:",e);
    		return null;
    	}
    }
    
    /**
	 * 生成发送消息
	 * @return
	 */
	public static String createSendMessage(String format,String msg) {
		try {
			 return String.format(format, msg);
		}
		catch(Exception e) {
			logStatic.error("createSendMessage", e);
			return "{createSendMessage:[format="+format+"]"+e.toString()+"}";
		}
	}
}