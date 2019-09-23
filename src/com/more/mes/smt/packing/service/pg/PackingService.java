/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.more.mes.smt.packing.service.pg;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
/**
 *
 * @author Chaos
 */
public class PackingService {
    
    /**
     * ModelService
     */
    static private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
//    static public List getMonitorLineCom()
//   {
//     String sql = "select ca_id key,ca_name value from t_co_area where ca_type='1' and ca_status='Y'";
//     List list = modelService.listSql(sql, null, null, null, null);
//     return list;
//   }
   
    private static final Log log = LogFactory
			.getLog("com.more.mes.smt.packing.service.PackingService");
    private static Boolean isPrintExecLog=true;//是否打印执行日志
   /**
    * 获取单个工单信息
    * @param projectID 工单号
    * @return  工单信息集合
    */
   static public List GetProjectSingleInfo(String projectID)
   {
       String sqlStr="SELECT\n" +
                    "A.PROJECT_ID,\n" +
                    "A.PRODUCT_MATERIAL\n" +
                    "FROM T_PM_PROJECT_BASE A\n" +
                    "WHERE A.PROJECT_ID=?";
       return modelService.listDataSql(sqlStr, new Object[] {projectID});
   }
   
   /**
    * 根据SN获取工单信息
    * @param itemSn
    * @return 
    */
   static public List GetProjectInfoBySn(String itemSn)
   {
       String sqlStr="SELECT\n" +
                    "A.WT_SN,\n" +
                    "A.WT_MO_NUMBER,\n" +
                    "C.CI_ITEM_CODE,\n" +
                    "C.CI_ITEM_NAME,\n" +
                    "C.CI_ITEM_SPEC,\n" +
                    "B.PM_TARGET_QTY\n" +
                    "FROM T_WIP_TRACKING A\n" +
                    "LEFT JOIN T_PM_MO_BASE B ON A.WT_MO_NUMBER=B.PM_MO_NUMBER\n" +
                    "LEFT JOIN T_CO_ITEM C ON B.PM_MODEL_CODE=C.CI_ITEM_CODE\n" +
                    "WHERE A.WT_SN=?";
       return modelService.listDataSql(sqlStr, new Object[] {itemSn});
   }
   
   /**
    * 获取数据库数据通用方法
    * @param strSql
    * @return
    */
   static public List GetPackingDataGrenal(String strSql)
   {
	   return modelService.listDataSql(strSql);
   }

   /**
    * 获取制令单已打包数量
    * @param moNumber
    * @return
    */
   static public int GetMoPackingNum(String moNumber)
   {
	   String sqlStr="SELECT\n" +
               "COUNT(1) AS COUNT\n" +
               "FROM T_PACK_SN_INFO A\n" +
               "WHERE A.PSI_MO_NUMBER=?";
	   List<Map> mapList= modelService.listDataSql(sqlStr, new Object[] {moNumber});
	   if(mapList!=null)
	   {
		   Map<String,Object> map=mapList.get(0);
           return ((BigDecimal)map.get("COUNT")).intValue();
	   }
	   else return -1;
   }
   
   
   //<editor-fold desc="方法">
   
   //<editor-fold desc="private">
   /**
    * 绝对条件map
    */
   static private Map<String, String > mapSql = new HashMap<String, String>(){{  
	      //<editor-fold desc="根据SN获取工单信息">
	      put("PACK_001","SELECT\n" +
	                    "A.WT_SN,\n" +
	                    "A.WT_MO_NUMBER,\n" +
	                    "C.CI_ITEM_CODE,\n" +
	                    "C.CI_ITEM_NAME,\n" +
	                    "C.CI_ITEM_SPEC,\n" +
	                    "B.PM_TARGET_QTY\n" +
	                    "FROM T_WIP_TRACKING A\n" +
	                    "LEFT JOIN T_PM_MO_BASE B ON A.WT_MO_NUMBER=B.PM_MO_NUMBER\n" +
	                    "LEFT JOIN T_CO_ITEM C ON B.PM_MODEL_CODE=C.CI_ITEM_CODE\n" +
	                    "WHERE A.WT_SN=?");      
	      //</editor-fold>
	      
	      //<editor-fold desc="获取制令单已打包数量">
	      put("PACK_002", "SELECT\r\n" + 
	      		"COALESCE(SUM(A.PSI_SN_NUM),0) AS PACKEDNUM\r\n" + 
	      		"FROM T_PACK_SN_INFO A\r\n" + 
	      		"WHERE A.PSI_MO_NUMBER=?\r\n" + 
		        "AND A.PSI_SN IS NOT NULL");
	      //</editor-fold>
	      
	      //<editor-fold desc="获取单个制令单信息 ">
	      put("PACK_003", "SELECT\n" +
	    		  "A.PM_MO_NUMBER,\n" +
	    		  "B.CI_ITEM_CODE,\n" +
	    		  "B.CI_ITEM_NAME,\n" +
	    		  "B.CI_ITEM_SPEC,\n" +
	    		  "B.CI_STANDARD_WEIGHTS,\n" +
	    		  "A.PM_PROJECT_ID,\n" +
	    		  "A.PM_FQC_NUM,\n" +
	    		  "A.PM_TARGET_QTY\n" +
	    		  "FROM T_PM_MO_BASE A\n" +
	    		  "LEFT JOIN T_CO_ITEM B ON A.PM_MODEL_CODE=B.CI_ITEM_CODE\n" +
	    		  "WHERE A.PM_MO_NUMBER=?");
	      //</editor-fold>
	      
		  //<editor-fold desc="获取指定物料信息 ">
	      put("PACK_004", "SELECT\n" +
	    		  "A.CI_ITEM_CODE,\n" +
	    		  "A.CI_ITEM_NAME,\n" +
	    		  "A.CI_ITEM_SPEC,\n" +
	    		  "A.CI_STANDARD_WEIGHTS\n" +
	    		  "FROM T_CO_ITEM A\n" +
	    		  "WHERE A.CI_ITEM_CODE=? ");
	      //</editor-fold>
	      
		  //<editor-fold desc="获取SN对应的制令单号 ">
	      put("PACK_005", "SELECT\n" +
	    		  "A.WT_MO_NUMBER,\n" +
	    		  "B.TW_STATIONNAME\n" +
	    		  "FROM T_WIP_TRACKING A\n" +
	    		  "LEFT JOIN T_WORKSTATION B ON A.WT_WORK_STATION=B.TW_STATIONSN\n" +
	    		  "WHERE A.WT_SN=?");
	      //</editor-fold>
	      
	     //<editor-fold desc="判定是否存在工单BOM ">
	      put("PACK_006", "SELECT\n" +
	    		  "COUNT(1) AS COUNT\n" +
	    		  "FROM T_PM_PROJECT_DETAIL A\n" +
	    		  "LEFT JOIN T_PM_MO_BASE B ON A.PROJECT_ID=B.PM_PROJECT_ID\n" +
	    		  "WHERE A.CBD_ITEM_CODE=?\n" +
	    		  "AND B.PM_MO_NUMBER=?");
	      //</editor-fold>
	      
	      //<editor-fold desc="根据策略编码获取策略明细信息">
	      put("PACK_007", "SELECT \r\n" + 
	      		"A.PTD_LEVEL, \r\n" + 
	      		"A.PTD_LEVEL_NAME, \r\n" + 
	      		"A.PTD_CAPACITY, \r\n" + 
	      		"C.TBR_NAME AS PTD_LABLE_RULE, \r\n" +
	      	    "A.PTD_CREATE_RULE, \r\n"+
	      		"CASE A.PTD_TITLE_FLAG WHEN 'Y' THEN '是' WHEN 'N' THEN '否' ELSE '' END AS  PTD_TITLE_FLAG,\r\n"+
	      		"CASE A.PTD_LABLE_PRINT WHEN 'Y' THEN '是'\r\n" + 
	      		"WHEN 'N' THEN '否'\r\n" + 
	      		"ELSE '' END AS PTD_LABLE_PRINT,\r\n" + 
	      		"B.LABEL_NAME AS PTD_LABLE_TEMPLATE, \r\n" + 
	      		"CASE A.PTD_LIST_PRINT WHEN 'Y' THEN '是' \r\n" + 
	      		"WHEN 'N' THEN '否' \r\n" + 
	      		"ELSE '' END AS PTD_LIST_PRINT,\r\n" + 
	      		"A.PTD_LIST_TEMPLATE \r\n" + 
	      		"FROM T_PACK_TACTICS_DETAIL A \r\n" + 
	      		"LEFT JOIN ML_TEMPLATE B ON A.PTD_LABLE_TEMPLATE=B.ID \r\n" + 
	      		"LEFT JOIN T_CO_BARCODE_ROUL C ON A.PTD_LABLE_RULE=C.ID \r\n" + 
	      		"WHERE A.PTD_SN=?\r\n" + 
	      		"ORDER BY A.PTD_LEVEL ASC");
	      //</editor-fold>
	      
	      //<editor-fold desc="根据策略编码获取策略信息">
	      put("PACK_008", "SELECT\n" +
	    		  "A.PTI_SN,\n" +
	    		  "A.PTI_AUTO_INSPECT,\n" +
	    		  "A.PTI_INSPECT_NUM,\n" +
	    		  "A.PTI_WEIGH_WAY,\n" +
	    		  "A.PTI_DEVIATE_RANGE,\n" +
	    		  "A.PTI_MIX_FLAG,\n" +
	    		  "A.PTI_ROUTE_CHECK\n" +
	    		  "FROM T_PACK_TACTICS_INFO A\n" +
	    		  "WHERE A.PTI_SN=?");
	      //</editor-fold>
	      
	    //<editor-fold desc="根据容器名称获取当前容器及其所有子容器中的产品SN">
	      put("PACK_009", "SELECT \r\n" + 
	      		"A.PSI_SN, \r\n" + 
	      		"A.PSI_TAKEPLACE,\r\n" + 
	      		"CASE WHEN (A.PSI_SN='' OR A.PSI_SN=NULL) THEN 0 ELSE A.PSI_SN_NUM END AS PSI_SN_NUM,\r\n" + 
	      		"CASE WHEN (A.PSI_SN='' OR A.PSI_SN=NULL) THEN '' ELSE B.NAME END AS PSI_EMP,\r\n" + 
	      		"CASE WHEN (A.PSI_SN='' OR A.PSI_SN=NULL) THEN '' ELSE TO_CHAR(A.PSI_TIME,'YYYY-MM-DD HH24:MI:SS') END AS PSI_TIME\r\n" + 
	      		"FROM T_PACK_SN_INFO A \r\n" + 
	      		"LEFT JOIN SY_USER B ON A.PSI_EMP=B.LOGIN_NAME \r\n" + 
	      		"WHERE A.PSI_CONTAINER_SN IN ( \r\n" + 
	      		"WITH RECURSIVE CON AS ( \r\n" + 
	      		"SELECT \r\n" + 
	      		"A.PSI_CONTAINER_SN \r\n" + 
	      		"FROM T_PACK_CONTAINER_INFO A \r\n" + 
	      		"WHERE A.PSI_CONTAINER_SN=?\r\n" + 
	      		" \r\n" + 
	      		"UNION ALL  \r\n" + 
	      		" \r\n" + 
	      		"SELECT \r\n" + 
	      		"B.PSI_CONTAINER_SN \r\n" + 
	      		"FROM T_PACK_CONTAINER_INFO B,CON \r\n" + 
	      		"WHERE B.PCI_PARENT_SN=CON.PSI_CONTAINER_SN \r\n" + 
	      		") SELECT PSI_CONTAINER_SN FROM CON) \r\n" + 
	      		"ORDER BY A.PSI_TAKEPLACE DESC");
	      //</editor-fold>
              
              //<editor-fold desc="根据容器名称获取当前容器及其所有父容器">
	      put("PACK_010", "WITH RECURSIVE CON AS (\r\n" + 
	      		"SELECT\r\n" + 
	      		"A.PSI_CONTAINER_SN,\r\n" + 
	      		"A.PCI_PARENT_SN,\r\n" + 
	      		"A.PCI_CAPACITY,\r\n" + 
	      		"A.PCI_PACK_NUM,\r\n" + 
	      		"A.PCI_LEVEL\r\n" + 
	      		"FROM T_PACK_CONTAINER_INFO A \r\n" + 
	      		"WHERE A.PSI_CONTAINER_SN=''\r\n" + 
	      		"\r\n" + 
	      		"UNION ALL \r\n" + 
	      		"\r\n" + 
	      		"SELECT\r\n" + 
	      		"B.PSI_CONTAINER_SN,\r\n" + 
	      		"B.PCI_PARENT_SN,\r\n" + 
	      		"B.PCI_CAPACITY,\r\n" + 
	      		"B.PCI_PACK_NUM,\r\n" + 
	      		"B.PCI_LEVEL\r\n" + 
	      		"FROM T_PACK_CONTAINER_INFO B,CON\r\n" + 
	      		"WHERE B.PCI_PARENT_SN=CON.PSI_CONTAINER_SN\r\n" + 
	      		") SELECT * FROM CON");
	      //</editor-fold>
              
              //<editor-fold desc="获取容器当前容量">
	      put("PACK_011", "SELECT\n" +
                            "A.PCI_PACK_NUM AS COUNT\n" +
                            "FROM T_PACK_CONTAINER_INFO A\n" +
                            "WHERE A.PSI_CONTAINER_SN=?");
	      //</editor-fold>
	      
	      //<editor-fold desc="判定制令单和工作中心是否匹配">
	      put("PACK_012", "SELECT\r\n" + 
	      		"COUNT(1) AS COUNT\r\n" + 
	      		"FROM T_PM_MO_ONLINE A\r\n" + 
	      		"WHERE A.PMO_NUMBER=?\r\n" + 
	      		"AND A.PMO_AREA_SN=(\r\n" + 
	      		"SELECT\r\n" + 
	      		"B.CA_PARENTAREAID\r\n" + 
	      		"FROM T_CO_AREA B\r\n" + 
	      		"WHERE B.CA_ID=?\r\n" + 
	      		"AND B.CA_TYPE='2'\r\n" + 
	      		")");
	      //</editor-fold>
	      
	      //<editor-fold desc="判定策略层级是否为在线打印">
	      put("PACK_013", "SELECT\r\n" + 
	      		"COALESCE(A.PTD_IS_ONLINE,'N') PTD_IS_ONLINE\r\n" + 
	      		"FROM T_PACK_TACTICS_DETAIL A\r\n" + 
	      		"WHERE A.PTD_SN=?\r\n" + 
	      		"AND A.PTD_LEVEL=?\r\n" + 
	      		"LIMIT 1");
	      //</editor-fold>
	      
	      //<editor-fold desc="获取包装策略的总层级数">
	      put("PACK_014", "SELECT\n" +
	    		  "COUNT(1) LVCOUNT\n" +
	    		  "FROM T_PACK_TACTICS_DETAIL A\n" +
	    		  "WHERE A.PTD_SN=?");
	      //</editor-fold>
	      
	      //<editor-fold desc="获取容器层级"
	      put("PACK_015", "SELECT\n" +
	    		  "A.PCI_LEVEL,\n" +
	    		  "A.PCI_LEVEL_NAME\n" +
	    		  "FROM T_PACK_CONTAINER_INFO A\n" +
	    		  "WHERE A.PSI_CONTAINER_SN=?");
	      //</editor-fold>
	      
	    //<editor-fold desc="策略信息层级非在线打印数量"
	      put("PACK_016", "SELECT\n" +
	    		  "COUNT(1) OFFLINECOUNT\n" +
	    		  "FROM T_PACK_TACTICS_DETAIL A\n" +
	    		  "WHERE A.PTD_SN=?\n" +
	    		  "AND (A.PTD_IS_ONLINE='N' OR A.PTD_IS_ONLINE IS NULL)");
	      //</editor-fold>
	      
	    //<editor-fold desc="根据容器SN获取对应的策略明细"
	      put("PACK_017", "SELECT\r\n" + 
		      		"A.*\r\n" + 
		      		"FROM T_PACK_TACTICS_DETAIL A\r\n" + 
		      		"WHERE A.PTD_SN=?\r\n" + 
		      		"AND A.PTD_LEVEL IN (\r\n" + 
		      		"SELECT\r\n" + 
		      		"B.PCI_LEVEL\r\n" + 
		      		"FROM T_PACK_CONTAINER_INFO B \r\n" + 
		      		"WHERE B.PSI_CONTAINER_SN=?\r\n" + 
		      		")");
	      //</editor-fold>
	    //<editor-fold desc="根据制令单获取检验批信息"
	      put("PACK_018", "SELECT \r\n" + 
	      		"T.QII_INSPECT_SN, \r\n" + 
	      		"T.QII_SEND_NUM \r\n" + 
	      		"FROM ( \r\n" + 
	      		"SELECT \r\n" + 
	      		"A.* \r\n" + 
	      		"FROM T_QM_INSPECT_INFO A \r\n" + 
	      		"WHERE A.QII_CONNECT_DOC=?\r\n" + 
	      		"AND A.QII_LIST_FLAG IN ('1','2','3') \r\n" + 
	      		"AND A.QII_TEST_STEP='1' \r\n" + 
	      		"ORDER BY A.QII_INSEPCT_TIME DESC \r\n" + 
	      		") T \r\n" + 
	      		"LIMIT 1");
	      //</editor-fold>
	      
	      //<editor-fold desc="根据ID获取占位SN临时表中数据"
	      put("PACK_019", "SELECT\r\n" + 
	      		"A.TAKEPALCE_SN \r\n" + 
	      		"FROM T_PACK_TAKEPLACE A \r\n" + 
	      		"WHERE A.ID=?");
	      //</editor-fold>
	      
	    //<editor-fold desc="获取系统参数值"
	      put("PACK_020", "SELECT\r\n" + 
	      		"A.VR_VALUE\r\n" + 
	      		"FROM T_SYS_PARAMETER_INI A\r\n" + 
	      		"WHERE A.VR_CLASS=?");
	      //</editor-fold>
	      
	      //<editor-fold desc="多语言 ">
	      put("Language", "SELECT\n" +
	    		  "A.CHINESE,\n" +
	    		  "A.ENGLISH,\n" +
	    		  "A.TRADITIONAL\n" +
	    		  "FROM T_SYS_LANGUAGE A\n" +
	    		  "WHERE A.MSGNAME=?");
	      //</editor-fold>
	      
	    //<editor-fold desc="数据字典 ">
	      put("SyDictVal", "SELECT\r\n" + 
	      		"A.CODE,\r\n" + 
	      		"A.VALUE\r\n" + 
	      		"FROM SY_DICT_VAL A\r\n" + 
	      		"WHERE A.DICT_CODE=?");
	      //</editor-fold>
	}};  
	
	/**
	 * where动态条件map
	 */
	static private Map<String,String> mapSqlWhere=new HashMap<String,String>(){{
		
		//<editor-fold desc="获取制令单信息 ">
	      put("PACK_W_001",  "SELECT \r\n" + 
	      		"A.PM_MO_NUMBER,\r\n" + 
	      		"B.CI_ITEM_CODE,\r\n" + 
	      		"B.CI_ITEM_NAME,\r\n" + 
	      		"B.CI_ITEM_SPEC\r\n" + 
	      		"FROM T_PM_MO_BASE A\r\n" + 
	      		"LEFT JOIN T_CO_ITEM B ON A.PM_MODEL_CODE=B.CI_ITEM_CODE\r\n" + 
	      		"LEFT JOIN T_CO_AREA C ON A.PM_AREA_SN=C.CA_ID AND C.CA_TYPE='1'\r\n" + 
	      		"LEFT JOIN SY_DICT_VAL D ON D.DICT_CODE='PM-STATUS' AND A.PM_STATUS=D.CODE\r\n" + 
	      		"WHERE 1=1 %s ");
	      //</editor-fold>
	      
	    //<editor-fold desc="获取物料信息 ">
	      put("PACK_W_002", "SELECT\n" +
	    		  "A.CI_ITEM_CODE,\n" +
	    		  "A.CI_ITEM_NAME,\n" +
	    		  "A.CI_ITEM_SPEC\n" +
	    		  "FROM T_CO_ITEM A\n" +
	    		  "WHERE 1=1 %s ");
	      //</editor-fold>
	      
	    //<editor-fold desc="获取容器信息 ">
	      put("PACK_W_003", "SELECT \n" +
	    		  "A.PSI_CONTAINER_SN,\n" +
	    		  "A.PCI_PARENT_SN,\n" +
	    		  "A.PCI_CAPACITY,\n" +
	    		  "A.PCI_PACK_NUM\n" +
	    		  "FROM T_PACK_CONTAINER_INFO A\n" +
	    		  "WHERE 1=1 %s\n" +
	    		  "ORDER BY A.PSI_CONTAINER_SN DESC" );
	      //</editor-fold>
              
              //<editor-fold desc="获取工作中心信息 ">
	      put("PACK_W_004", "SELECT\n" +
                            "A.CA_ID AS WORKSTATION_SN,\n" +
                            "A.CA_NAME AS WORKSTATION_NAME,\n" +
                            "B.CA_ID AS LINE_SN,\n" +
                            "B.CA_NAME AS LINE_NAME\n" +
                            "FROM T_CO_AREA A\n" +
                            "LEFT JOIN T_CO_AREA B ON A.CA_PARENTAREAID=B.CA_ID AND B.CA_TYPE='1'\n" +
                            "WHERE A.CA_TYPE='2' %s " );
	      //</editor-fold>
              
              //<editor-fold desc="获取线体信息 ">
	      put("PACK_W_005", "SELECT\r\n" + 
	      		"A.CA_ID,\r\n" + 
	      		"A.CA_NAME\r\n" + 
	      		"FROM T_CO_AREA A\r\n" + 
	      		"WHERE A.CA_TYPE='1'  \r\n" + 
	      		"AND A.CA_ID IN ( \r\n" + 
	      		"SELECT DISTINCT \r\n" + 
	      		"B.CA_PARENTAREAID \r\n" + 
	      		"FROM T_CO_AREA B \r\n" + 
	      		"LEFT JOIN T_CO_GROUP C ON B.CA_GROUP=C.GROUP_CODE \r\n" + 
	      		"WHERE C.GROUP_TYPE='4'  \r\n" + 
	      		"AND B.CA_TYPE='2' \r\n" + 
	      		") %s \r\n" + 
	      		"" );
	      //</editor-fold>
              
              //<editor-fold desc="获取容器信息 (注：PG中该语句只要一个WITH RECURSIVE就已经足够，考虑的包装程序兼容问题，外面又加了一层)">
	      put("PACK_W_006", "SELECT\r\n" + 
	      		"A.PSI_CONTAINER_SN,  \r\n" + 
	      		"A.PCI_PARENT_SN,  \r\n" + 
	      		"A.PCI_CAPACITY,  \r\n" + 
	      		"A.PCI_PACK_NUM,  \r\n" + 
	      		"A.PCI_AREA_SN,  \r\n" + 
	      		"A.PCI_LEVEL,  \r\n" + 
	      		"A.PCI_CONTAINER_FLAG,\r\n" + 
	      		"COALESCE(T.PCI_REAL_NUM,A.PCI_PACK_NUM) AS PCI_REAL_NUM\r\n" + 
	      		"FROM T_PACK_CONTAINER_INFO A\r\n" + 
	      		"LEFT JOIN (  \r\n" + 
	      		"SELECT  \r\n" + 
	      		"B.PSI_CONTAINER_SN,  \r\n" + 
	      		"SUM(COALESCE(B.PSI_SN_NUM,0)) AS PCI_REAL_NUM  \r\n" + 
	      		"FROM T_PACK_SN_INFO B  \r\n" + 
	      		"WHERE B.PSI_SN IS NOT NULL  \r\n" + 
	      		"GROUP BY B.PSI_CONTAINER_SN  \r\n" + 
	      		")T ON A.PSI_CONTAINER_SN=T.PSI_CONTAINER_SN\r\n" + 
	      		"WHERE 1=1 %s \r\n" + 
	      		"AND A.PSI_CONTAINER_SN IN (\r\n" + 
	      		"WITH RECURSIVE CON AS(  \r\n" + 
	      		"SELECT  \r\n" + 
	      		"A.PSI_CONTAINER_SN \r\n" + 
	      		"FROM T_PACK_CONTAINER_INFO A  \r\n" + 
	      		"WHERE 1=1 %s  \r\n" + 
	      		"\r\n" + 
	      		"UNION ALL  \r\n" + 
	      		"\r\n" + 
	      		"SELECT  \r\n" + 
	      		"B.PSI_CONTAINER_SN\r\n" + 
	      		"FROM T_PACK_CONTAINER_INFO B,CON  \r\n" + 
	      		"WHERE B.PCI_PARENT_SN=CON.PSI_CONTAINER_SN  \r\n" + 
	      		")  \r\n" + 
	      		"SELECT  \r\n" + 
	      		"CON.PSI_CONTAINER_SN\r\n" + 
	      		"FROM CON \r\n" + 
	      		")" );
	      //</editor-fold>
	      
	      //<editor-fold desc="获取工单物料信息 ">
	      put("PACK_W_007", "SELECT\n" +
							"B.CI_ITEM_CODE,\n" +
							"B.CI_ITEM_NAME,\n" +
							"B.CI_ITEM_SPEC\n" +
							"FROM T_PM_PROJECT_DETAIL A\n" +
							"LEFT JOIN T_CO_ITEM B ON A.CBD_ITEM_CODE=B.CI_ITEM_CODE\n" +
							"WHERE 1=1 %s ");
	      //</editor-fold>
	}};
	
	/**
	 * 执行语句map
	 */
    static private Map<String,String> mapSqlExceSql=new HashMap<String,String>(){{
		
		 //<editor-fold desc="修改容器状态为关结 ">
	     put("PACK_EXEC_001",  "UPDATE T_PACK_CONTAINER_INFO\n" +
	    		  "SET PCI_CONTAINER_FLAG=?\n" +
	    		  "WHERE PSI_CONTAINER_SN=?");
	     //</editor-fold>
    }};
   
   /**
    * 执行SQL语句通用方法
    * @param strSql 语句
    * @param paramList 参数
    * @return
    */
   static private List DoSqlQuery(String strSql,Object params)
   {
	   if(params==null) return modelService.listDataSql(strSql);
	   else return modelService.listDataSql(strSql, (Object[])params);
   }
   
   /**
    * 执行Sql语句
    * @param strSql
    * @return
    */
   static private List DoSingleSqlQuery(String strSql)
   {
	   return modelService.listDataSql(strSql);
   }
   
   /**
    * 执行存储过程
    * @param procedureName
    * @param params
    */
   static private List DoProcedure(String proceName,Object params)
   {
	   // in 参
	   List<Object> inParams=new ArrayList<Object>();
	   List<Integer> inParamsFlag=new ArrayList<Integer>();
	   // out 参
	   List<Object> outParams=new ArrayList<Object>();
	   List<Integer> outParamsFlag=new ArrayList<Integer>();
	   
	   Map<String,Object[]> mapParam=(Map<String,Object[]>) params;
	   for(Map.Entry<String, Object[]> map:mapParam.entrySet())
	   {
		   Object[] obj=map.getValue();
           if(obj[0].toString().equals("IN"))
           {
        	   inParams.add(obj[1]);
        	   inParamsFlag.add(Integer.parseInt(obj[2].toString()));
           }
           else if(obj[0].toString().equals("OUT"))
           {
               outParams.add(obj[1]);
               outParamsFlag.add(Integer.parseInt(obj[2].toString()));
           }
           else if(obj[0].toString().equals("IN&OUT"))
           {
               inParams.add(obj[1]);
               inParamsFlag.add(Integer.parseInt(obj[2].toString()));
               
               outParams.add(obj[1]);
               outParamsFlag.add(Integer.parseInt(obj[2].toString()));
           }
	   }
	   
	   int[] inPlace=new int[inParamsFlag.size()];
	   for(int i=0;i<inParamsFlag.size();i++)
	   {
           inPlace[i]=inParamsFlag.get(i);	   
	   }
	   int[] outPlace=new int[outParamsFlag.size()];
	   for(int i=0;i<outParamsFlag.size();i++)
	   {
           outPlace[i]=outParamsFlag.get(i);		   
	   }
	   
	   ProFuncDto pdfDto=new ProFuncDto();
	   pdfDto.setClassName(proceName);
	   pdfDto.setInPlace(inPlace);
	   pdfDto.setValArgs(inParams);
	   pdfDto.setOutPlace(outPlace);
	   pdfDto.setOutValType(outParams);
	   pdfDto.setTotalLen(mapParam.size());
	 
       return modelService.procComm(pdfDto);
   }
   
   //</editor-fold>
   
   //<editor-fold desc="public">
   
   /**
    * 接口调用函数
    * @param strKey SQL语句标识
    * @param params
    * @return
    */
   static public List Exce(String strFlag,Object params)
   {
	   String strSql=mapSql.get(strFlag);
	   if(strSql==null) return null;
	   return DoSqlQuery(strSql,params);
   }
   
   /**
    * 接口调用函数        拼接的Sql语句
    * @param strFlag
    * @param params
    * @return
    */
   static public List ExceWhere(String strFlag,Object params)
   {
	   long execStart=-1;// for route log
	   long execEnd=0;// for route log
	   if(isPrintExecLog) execStart=new Date().getTime();// for route log
	   
       String strSql=mapSqlWhere.get(strFlag);
       if(strSql==null) return null;
       List<String> paramList=new ArrayList();
       Object[] inParams=(Object[])params;
       try
       {
    	   for(Object param:inParams){
    		   paramList.add(param==null?"":param.toString());
    	   }
       }
       catch(Exception e){return null;}
       
       if(isPrintExecLog){
		   execEnd=new Date().getTime();// for route log
		   log.info("PickExecLogger::("+strFlag+")::产品包装-ExceWhere-解析参数::Cost -> "+(execEnd-execStart));// for route log
	   }
       
       if(isPrintExecLog) execStart=new Date().getTime();// for route log
       
       strSql=String.format(strSql, paramList.toArray());
       List returList=DoSingleSqlQuery(strSql);
       
       if(isPrintExecLog){
		   execEnd=new Date().getTime();// for route log
		   log.info("PickExecLogger::("+strFlag+")::产品包装-ExceWhere-执行查询::Cost -> "+(execEnd-execStart));// for route log
	   }
       
       return returList;
   }
   
   /**
    * 执行存储过程
    * @param proceName
    * @param params
    * @return
    */
   static public List ExceProcedure(String proceName,Object params)
   {
       return DoProcedure(proceName, params);
   }

   /**
    * 
    * @param strFlag
    * @param params
    * @return
    */
   static public Boolean ExceSql(String strFlag,Object params)
   {
	   try
	   {
		   String strSql=mapSqlExceSql.get(strFlag);
		   int isSuc= modelService.execSql(strSql,(Object[])params);
           return isSuc >= 0;
	   }
	   catch(Exception e)
	   {
		   return false;
	   }
   }
   
   //</editor-fold>
   
   
   //</editor-fold>
}
