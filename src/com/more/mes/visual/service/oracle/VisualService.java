package com.more.mes.visual.service.oracle;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.util.StringUtil;

import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.common.method.DateUtil;

public class VisualService {
	static private final Log log = LogFactory.getLog("com.more.mes.visual.service.VisualService");
	private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
	 public List getDullStock(String areaSn)
	 {
		 try
		 {
		    String sql = "SELECT * FROM(\r\n" + 
		    		"SELECT  T.WSI_ITEM_CODE,SUM(NVL(T.WSI_ITEM_NUM,0)) AS ITEM_NUM\r\n" + 
		    		"FROM T_WMS_STOCK_INFO T\r\n" + 
		    		"WHERE T.WSI_WH_CODE=? AND NVL(SYSDATE-DECODE((SELECT A.VR_VALUE FROM T_SYS_PARAMETER_INI A WHERE A.VR_CLASS='WMS0018' AND ROWNUM<=1),'0'\r\n" + 
		    		" ,T.WSI_RECEIVE_TIME,'1',T.EDIT_TIME),0)>\r\n" + 
		    		"(SELECT A.VR_DEF_VALUE FROM T_SYS_PARAMETER_INI A WHERE A.VR_CLASS='WMS0017' AND ROWNUM<=1 )\r\n" + 
		    		"GROUP BY T.WSI_ITEM_CODE\r\n" + 
		    		"ORDER BY SUM(NVL(T.WSI_ITEM_NUM,0)) DESC)\r\n" + 
		    		"WHERE ROWNUM<=5";
		    Map<String, String> sqlParaMap = new HashMap<String, String>();
		    sqlParaMap.put("areaSn", areaSn);
	        List list = modelService.listDataSql(sql, new Object[] {areaSn});
		    return list;
		 }
		 catch(Exception ex)
		   {
	            log.info("getDullStock:"+ex.toString());
	           	return null;
		   }
	 }	
	 
	  public List getWhcode()
	 {
		 try
		 {
		    String sql = "SELECT A.WA_AREA_SN,A.WA_AREA_NAME,A.WA_SET_INFO \r\n" + 
                          "FROM T_WMS_AREA A \r\n" + 
                          "WHERE A.WA_AREA_TYPE='1'\r\n" + 
                          "ORDER BY A.WA_AREA_SN ";
		    List list = modelService.listDataSql(sql);  
		    return list;
		 }
		 catch(Exception ex)
		   {
	            log.info("getWhcode:"+ex.toString());
	           	return null;
		   }
	 }
	  public List getWhcodeWithDataAuth(String dataAuth)
		 {	
		  	String sqlWhere = "";
		  	if(StringUtils.isNotEmpty(dataAuth)) {
		  		sqlWhere = " AND A.DATA_AUTH = '"+dataAuth+"' ";
		  	}
			 try
			 {
			    String sql = "SELECT A.WA_AREA_SN,A.WA_AREA_NAME,A.WA_SET_INFO \r\n" + 
	                          "FROM T_WMS_AREA A \r\n" + 
	                          "WHERE A.WA_AREA_TYPE='1'\r\n" + sqlWhere+
	                          "ORDER BY A.WA_AREA_SN ";
			    List list = modelService.listDataSql(sql);  
			    return list;
			 }
			 catch(Exception ex)
			   {
		            log.info("getWhcode:"+ex.toString());
		           	return null;
			   }
		 }
	  public List getArea(String areaSn)
	 {
		  try
			 {
			    String sql = "SELECT A.WA_AREA_SN,A.WA_AREA_NAME,A.WA_SUPERIOR_SN,A.AREA_TYPE,A.FREE , A.WA_FACE, A.WA_STAROGE_TYPE,A.WA_STOREY_NO,A.WA_FLOW_NO  FROM (\r\n" + 
			    		"                                          SELECT A.*,CASE WHEN A.AREA_TYPE!='库位' THEN '' WHEN B.WSI_STORAGE_CODE IS NULL AND A.AREA_TYPE='库位' THEN '空闲'  \r\n" + 
			    		"                                          WHEN B.WSI_INSPECT_FLAG<>'Y' THEN '未检验' WHEN B.WSI_INVALID_DATE IS NOT NULL AND B.WSI_INVALID_DATE>SYSDATE THEN '保质期超期'  \r\n" + 
			    		"                                          WHEN E.WSI_ITEM_NUM>F.CI_MAX_STOCK THEN '超安全库存' WHEN ADD_MONTHS(SYSDATE,-3)>B.WSI_RECEIVE_TIME THEN '呆料三个月' \r\n" + 
			    		"                                          END AS FREE FROM(\r\n" + 
			    		"                                            SELECT A.WA_AREA_SN,A.WA_AREA_NAME,A.WA_SUPERIOR_SN,A.WA_FACE, A.WA_STAROGE_TYPE,A.WA_STOREY_NO,A.WA_FLOW_NO,DECODE(A.WA_AREA_TYPE,'3','库位','2','库区','1','仓库') AS AREA_TYPE \r\n" + 
			    		"                                            FROM T_WMS_AREA A START WITH A.WA_AREA_SN=? CONNECT BY prior A.WA_AREA_SN=A.WA_SUPERIOR_SN)A\r\n" + 
			    		"                                            LEFT JOIN T_WMS_STOCK_INFO B  ON A.WA_AREA_SN=B.WSI_STORAGE_CODE AND A.AREA_TYPE='库位'\r\n" + 
			    		"                                            LEFT JOIN T_CO_ITEM C ON B.WSI_ITEM_CODE=C.CI_ITEM_CODE \r\n" + 
			    		"                                            LEFT JOIN (\r\n" + 
			    		"                                              SELECT A.WSI_ITEM_CODE,SUM(NVL(A.WSI_ITEM_NUM,0)) AS WSI_ITEM_NUM \r\n" + 
			    		"                                              FROM T_WMS_STOCK_INFO A \r\n" + 
			    		"                                              GROUP BY A.WSI_ITEM_CODE)E ON B.WSI_ITEM_CODE=E.WSI_ITEM_CODE\r\n" + 
			    		"                                            LEFT JOIN T_CO_ITEM F ON E.WSI_ITEM_CODE=F.CI_ITEM_CODE)A\r\n" + 
			    		"                                          	 ORDER BY A.WA_AREA_SN";
			    Map<String, String> sqlParaMap = new HashMap<String, String>();
			    sqlParaMap.put("areaSn", areaSn);
		        List list = modelService.listDataSql(sql, new Object[] {areaSn});
			    return list;
			 }
			 catch(Exception ex)
			   {
		            log.info("getArea:"+ex.toString());
		           	return null;
			   }
	 }
	 
	 public List getStockRank(String areaSn)
	 {
		 try
		 {
		    String sql = "SELECT * FROM(\r\n" + 
		    		"SELECT SUM(A.WSI_ITEM_NUM) AS COUNT,A.WSI_ITEM_CODE\r\n" + 
		    		"FROM T_WMS_STOCK_INFO A WHERE A.WSI_WH_CODE=? AND  A.WSI_STOCK_FLAG='2'\r\n" + 
		    		"AND A.WSI_INSPECT_FLAG='Y' AND A.WSI_FREEZE_FLAG='N'\r\n" + 
		    		"GROUP BY A.WSI_ITEM_CODE\r\n" + 
		    		"ORDER BY COUNT DESC)\r\n" + 
		    		"WHERE ROWNUM<=5";
		    Map<String, String> sqlParaMap = new HashMap<String, String>();
		    sqlParaMap.put("areaSn", areaSn);
	        List list = modelService.listDataSql(sql, new Object[] {areaSn});
		    return list;
		 }
		 catch(Exception ex)
		   {
	            log.info("getstockrank:"+ex.toString());
	           	return null;
		   }
	 }
	 
	 public List warehouseInventory(String areaSn,String areaType)
	 {
		 try
		 {
			 String sql="";
			 if("1".equals(areaType)){
				 sql = "SELECT A.WSI_STORAGE_CODE,"+
				       "	A.WSI_ITEM_SN,"+
				       "	A.WSI_ITEM_CODE,"+
				       "	B.CI_ITEM_NAME,"+
				       "	B.CI_ITEM_SPEC,"+
				       "	C.SUPPLIER_NAME,"+
				       "	A.WSI_LOT_NO,"+
				       "	A.WSI_ITEM_NUM,"+
				       "	DECODE(A.WSI_STOCK_FLAG,"+
				        "      '1',"+
				        "      '未入库',"+
				        "      '2',"+
				        "      '在库',"+
				        "      '3',"+
				        "      '已备料',"+
				        "      '4',"+
				        "      '调拨',"+
				        "      '5',"+
				        "      '盘点',"+
				        "      '6',"+
				        "      '锁定') AS WSI_STOCK_FLAG,"+
				       "	DECODE(A.WSI_ITEM_FLAG, '1', '良品', '2', '不良品') AS WSI_ITEM_FLAG,"+
				       "	CASE"+
				       " 	WHEN (CASE"+
				       "         WHEN B.CI_SLUGGISH_CYCLE IS NULL OR B.CI_SLUGGISH_CYCLE = 0 THEN"+
				       "          (SELECT TO_NUMBER(D.VR_VALUE)"+
				       "             FROM T_SYS_PARAMETER_INI D"+
				       "            WHERE D.VR_CLASS = 'WMS0017')"+
				       "         ELSE"+
				       "          B.CI_SLUGGISH_CYCLE"+
				       "       END) < SYSDATE - DECODE((SELECT PI2.VR_VALUE"+
				       "                                 FROM T_SYS_PARAMETER_INI PI2"+
				       "                                WHERE PI2.VR_CLASS = 'WMS0018'),"+
				       "                               '0',"+
				       "                               A.WSI_RECEIVE_TIME,"+
				       "                              '1',"+
				       "                              A.EDIT_TIME) THEN"+
				       "   '呆滞'"+
				       "  ELSE"+
				       "   '正常'"+
					   "	 END AS dull"+
					   "  FROM T_WMS_STOCK_INFO A"+
					   "  LEFT JOIN T_CO_ITEM B"+
					   "    ON A.WSI_ITEM_CODE = B.CI_ITEM_CODE"+
					   "  LEFT JOIN T_CO_SUPPLIER C"+
					   "    ON A.WSI_SUP_CODE = C.SUPPLIER_CODE"+
					   " 	WHERE A.WSI_STORAGE_CODE IS NOT NULL"+
						"   AND A.WSI_STORAGE_CODE = ?";
				 
			      
			 }else{
				 sql = "select *"+
					  " 	from (SELECT A.WSI_STORAGE_CODE,"+
					  "             A.WSI_ITEM_SN,"+
					  "             A.WSI_ITEM_CODE,"+
					  "             row_number() OVER(PARTITION BY WSI_STORAGE_CODE ORDER BY A.WSI_STORAGE_CODE desc) as row_flg,"+
					  "             B.CI_ITEM_NAME,"+
					  "             B.CI_ITEM_SPEC,"+
					  "             C.SUPPLIER_NAME,"+
					  "             D.WA_SUPERIOR_SN,"+
					  "             D.WA_STAROGE_TYPE,"+
					  "             D.WA_FACE,"+
					  "				D.WA_FLOW_NO,"+
					  "				D.WA_STOREY_NO,"+
					  "             A.WSI_LOT_NO,"+
					  "             A.WSI_ITEM_NUM,"+
					  "             DECODE(A.WSI_STOCK_FLAG,"+
					  "                    '1',"+
					  "                    '未入库',"+
					  "                    '2',"+
					  "                    '在库',"+
					  "                    '3',"+
					  "                    '已备料',"+
					 "                     '4',"+
					 "                     '调拨',"+
					 "                      '5',"+
					 "                     '盘点',"+
					 "                     '6',"+
					 "                     '锁定') AS WSI_STOCK_FLAG,"+
					 "              DECODE(A.WSI_ITEM_FLAG, '1', '良品', '2', '不良品') AS WSI_ITEM_FLAG,"+
					 "              CASE"+
					 "        WHEN (CASE"+
					 "               WHEN B.CI_SLUGGISH_CYCLE IS NULL OR B.CI_SLUGGISH_CYCLE = 0 THEN"+
					 "                (SELECT TO_NUMBER(D.VR_VALUE)"+
					 "                   FROM T_SYS_PARAMETER_INI D"+
					 "                  WHERE D.VR_CLASS = 'WMS0017' AND ROWNUM<=1)"+
					 "               ELSE"+
					 "                B.CI_SLUGGISH_CYCLE"+
					 "             END) < SYSDATE - DECODE((SELECT PI2.VR_VALUE"+
					 "                                       FROM T_SYS_PARAMETER_INI PI2"+
					 "                                      WHERE PI2.VR_CLASS = 'WMS0018' AND ROWNUM<=1),"+
					 "                                     '0',"+
					 "                                      A.WSI_RECEIVE_TIME,"+
					 "                                     '1',"+
					 "                                    A.EDIT_TIME) THEN"+
					 "         '呆滞'"+
					 "        ELSE"+
					 "         '正常'"+
					 "              END AS DULL"+
					 "         FROM T_WMS_STOCK_INFO A"+
					 "         LEFT JOIN T_CO_ITEM B"+
					 "           ON A.WSI_ITEM_CODE = B.CI_ITEM_CODE"+
					 "         LEFT JOIN T_CO_SUPPLIER C"+
					  "          ON A.WSI_SUP_CODE = C.SUPPLIER_CODE"+
					 "         LEFT JOIN T_WMS_AREA D"+
					 "           ON A.WSI_STORAGE_CODE = D.WA_AREA_SN"+
					 "        WHERE A.WSI_STORAGE_CODE IS NOT NULL"+
					 "          AND A.WSI_WH_CODE = ?)"+
					 "	where row_flg = 1";
			      
			 
			 }
		     Map<String, String> sqlParaMap = new HashMap<String, String>();
	       sqlParaMap.put("areaSn", areaSn);
	       List list = modelService.listDataSql(sql, new Object[] {areaSn});
	       return list;
		 }
		 catch(Exception ex)
		   {
	            log.info("warehouseInventory:"+ex.toString());
	           	return null;
		   }
	 }	
	 
	 public List poInCount(String areaSn)
	 {
	    
	     try
		 {
		    String sql = "SELECT DECODE(T.WDI_STATUS, '1', '开立', '2', '操作中', '3', '关结') STATUS,"+
					 "  COUNT(T.ID)  as COUNT"+
					 "	FROM T_WMS_DOC_INFO T"+
					 "	WHERE exists (SELECT *"+
					 " 	FROM T_WMS_RECEIVE_ITEM A"+
					 "  WHERE T.WDI_DOC_NUM = A.Wri_Doc_Num"+
					 "  and A.WRI_WH_CODE = ?)"+
					 "	GROUP BY T.WDI_STATUS"+
					 "	ORDER BY T.WDI_STATUS";
		    Map<String, String> sqlParaMap = new HashMap<String, String>();
	        sqlParaMap.put("areaSn", areaSn);
            List list = modelService.listDataSql(sql, new Object[] {areaSn});
		    return list;
		 }
		 catch(Exception ex)
		   {
	            log.info("poInCount:"+ex.toString());
	           	return null;
		   }
	 }	
	 
	 public List projectOutCount(String areaSn)
	 {
		   try
			 {
			    String sql = "SELECT DECODE(T.WDI_STATUS,'1','开立','2','操作中','3','关结') STATUS,COUNT(T.ID) as COUNT FROM T_WMS_DOC_INFO T"+
							"	WHERE exists ("+
							"	SELECT * FROM T_WMS_OUTSTOCK_ITEM A"+
							"	WHERE  T.WDI_DOC_NUM = A.WOi_Doc_Num"+
							"	and A.WOI_WH_CODE =?"+
							"	)"+
							"	GROUP BY T.WDI_STATUS"+
							"	ORDER BY T.WDI_STATUS";
			    Map<String, String> sqlParaMap = new HashMap<String, String>();
		        sqlParaMap.put("areaSn", areaSn);
	            List list = modelService.listDataSql(sql, new Object[] {areaSn});
			    return list;
			 }
			 catch(Exception ex)
			   {
		            log.info("poInCount:"+ex.toString());
		           	return null;
			   }
	 }
	 
	 public List useRate(String areaSn)
	 {
		 try
		 {
		    String sql = "SELECT ROUND(SUM(NUM) / SUM(CAPACITY) * 100, 2) PERCENT"+
		    		" 	FROM (select T.WA_AREA_SN, COUNT(A.ID) NUM, T.WA_STORAGE_CAPACITY CAPACITY"+
				    "      from t_wms_area t"+
				    "      LEFT join t_wms_stock_info a"+
				    "        on a.WSI_DISTRICT_CODE = t.WA_AREA_SN"+
				    "       and a.wsi_wh_code = t.WA_SUPERIOR_SN"+
				    "     where t.WA_SUPERIOR_SN = ?"+
				    "       AND T.WA_STORAGE_CAPACITY IS NOT NULL"+
				    "     GROUP BY T.WA_AREA_SN, T.WA_STORAGE_CAPACITY) AA";
		    Map<String, String> sqlParaMap = new HashMap<String, String>();
		    sqlParaMap.put("areaSn", areaSn);
            List list = modelService.listDataSql(sql, new Object[] {areaSn});
	       return list;
		 }
		 catch(Exception ex)
		   {
	            log.info("useRate:"+ex.toString());
	           	return null;
		   }
	 }
	 
	 public List shelfStock(String areaSn)
	 {
		 try
		 {
		    String sql = "SELECT A.WSI_STORAGE_CODE AS SK_AREA_SN,"+
					      " A.WSI_ITEM_SN AS SK_ITEM_SN,"+
					      " A.WSI_ITEM_CODE AS SK_CO_ITEM_CODE,"+
					      " A.WSI_ITEM_NUM AS SK_AMOUNT,"+
					      " DECODE(A.WSI_INSPECT_FLAG, 'Y', '已检', 'N', '未检',NULL,'未检') AS SK_HAVE_CHECK,"+
					      " CEIL(NVL(SYSDATE - DECODE((SELECT PI2.VR_VALUE"+
					      "                            FROM T_SYS_PARAMETER_INI PI2"+
					      "                           WHERE PI2.VR_CLASS = 'WMS0018'),"+
					      "                           '0',"+
					      "                           A.WSI_RECEIVE_TIME,"+
					      "                           '1',"+
					      "                           A.EDIT_TIME),"+
					      "          0)) AS DULL"+
					  	  " FROM T_WMS_STOCK_INFO A"+
					 	  " WHERE A.WSI_STORAGE_CODE IS NOT NULL"+
					   	  " AND A.WSI_DISTRICT_CODE = ?"+
					 	 "	ORDER BY ROUND((NVL(SYSDATE - A.WSI_RECEIVE_TIME, 0)), 6) DESC";
	       Map<String, String> sqlParaMap = new HashMap<String, String>();
	       sqlParaMap.put("areaSn", areaSn);
	       List list = modelService.listDataSql(sql, new Object[] {areaSn});
	       return list;
		 }
		 catch(Exception ex)
		   {
	            log.info("shelfStock:"+ex.toString());
	           	return null;
		   }
	 }	
	 
	 public List shelfOccupancy(String areaSn)
	 {
		 try
		 {
		    String sql = "SELECT SUM(TOTAL_NUM) AS TOTAL_NUM,SUM(USE_NUM) AS USE_NUM,SUM(TOTAL_NUM)-SUM(USE_NUM) AS USELESS_NUM   \r\n" + 
                         "FROM (\r\n" + 
                         "SELECT 0 AS USE_NUM, COUNT(1) AS TOTAL_NUM FROM T_WMS_AREA A WHERE A.WA_AREA_TYPE='3' AND A.WA_SUPERIOR_SN='"+areaSn+"'    \r\n" + 
                         "UNION ALL\r\n" + 
                         "SELECT COUNT(DISTINCT T.WSI_STORAGE_CODE) AS USE_NUM,0 AS TOTAL_NUM FROM T_WMS_STOCK_INFO T\r\n" +  
                         "WHERE EXISTS( SELECT A.WA_AREA_SN FROM T_WMS_AREA A WHERE A.WA_AREA_TYPE='3'  AND A.WA_SUPERIOR_SN='"+areaSn+"'   \r\n" + 
                         "AND T.WSI_STORAGE_CODE=A.WA_AREA_SN))";
	        List list = modelService.listDataSql(sql);  
		    return list;
		 }
		 catch(Exception ex)
		   {
	            log.info("shelfOccupancy:"+ex.toString());
	           	return null;
		   }
	 }
	 
	 public List alarm(String areaSn)
	 {
		 try
		 {
		    String sql = "SELECT OVERDUE, REINSPECTION, INACTIVE, BADNESS"+
						  "	FROM (SELECT SUM(OVERDUE) OVERDUE,"+
						  "             SUM(REINSPECTION) REINSPECTION,"+
						  "             SUM(INACTIVE) INACTIVE,"+
						  "             SUM(BADNESS) BADNESS"+
						  "        FROM (SELECT SUM(WSI_ITEM_NUM) AS OVERDUE,"+
						  "                     0 AS REINSPECTION,"+
						  "                     0 AS INACTIVE,"+
						  "                     0 AS BADNESS"+
						  "                FROM T_WMS_STOCK_INFO T"+
						  "               WHERE WSI_INVALID_DATE < SYSDATE"+
						  "                 AND T.WSI_WH_CODE = ?"+
						  "              UNION ALL"+
						  "              SELECT 0 AS OVERDUE,"+
						  "                     SUM(WSI_ITEM_NUM) AS REINSPECTION,"+
						  "                     0 AS INACTIVE,"+
						  "                     0 AS BADNESS"+
						  "                FROM T_WMS_STOCK_INFO T"+
						  "                LEFT JOIN T_CO_ITEM A"+
						  "                  ON T.WSI_ITEM_CODE = A.CI_ITEM_CODE"+
						  "               WHERE WSI_TEST_TIME + NVL(A.CI_RECHECK_DAYS, 0) < SYSDATE"+
						  "                 AND T.WSI_WH_CODE = ?"+
						  "              UNION ALL"+
						  "              SELECT 0 AS OVERDUE,"+
						  "                     0 AS REINSPECTION,"+
						  "                     SUM(WSI_ITEM_NUM) AS INACTIVE,"+
						  "                     0 AS BADNESS"+
						  "                FROM T_WMS_STOCK_INFO T"+
						  "                LEFT JOIN T_CO_ITEM A"+
						  "                  ON T.WSI_ITEM_CODE = A.CI_ITEM_CODE"+
						  "               WHERE (CASE"+
						  "                      WHEN (SELECT TO_NUMBER(B.VR_VALUE)"+
						  "                               FROM T_SYS_PARAMETER_INI B"+
						  "                              WHERE B.VR_CLASS = 'WMS0018' AND ROWNUM<=1) = '0' THEN"+
						  "                        T.WSI_RECEIVE_TIME"+
						  "                       ELSE"+
						  "                        T.EDIT_TIME"+
						  "                     END) + (CASE"+
						  "                       WHEN A.CI_SLUGGISH_CYCLE IS NULL OR"+
						  "                            A.CI_SLUGGISH_CYCLE = 0 THEN"+
						  "                        (SELECT TO_NUMBER(B.VR_VALUE)"+
						  "                           FROM T_SYS_PARAMETER_INI B"+
						  "                          WHERE B.VR_CLASS = 'WMS0017' AND ROWNUM<=1)"+
						  "                       ELSE"+
						  "                        A.CI_SLUGGISH_CYCLE"+
						  "                     END) < SYSDATE"+
						  "                 AND T.WSI_WH_CODE = ?"+
						  "              UNION ALL"+
						  "              SELECT 0 AS OVERDUE,"+
						  "                     0 AS REINSPECTION,"+
						  "                     0 AS INACTIVE,"+
						  "                     SUM(WSI_ITEM_NUM) AS BADNESS"+
						  "                FROM T_WMS_STOCK_INFO T"+
						  "               WHERE T.WSI_ITEM_FLAG = '2'"+
						  "                 AND T.WSI_WH_CODE = ?)) AA";
	       List list = modelService.listDataSql(sql, new Object[] {areaSn,areaSn,areaSn,areaSn});
	       return list;
		 }
		 catch(Exception ex)
		   {
	            log.info("alarm:"+ex.toString());
	           	return null;
		   }
	 }
}


