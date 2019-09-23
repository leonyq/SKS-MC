package com.more.mes.terminal.service.oracle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

public class TerminalService {

    /**
     * ModelService
     */
    static private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
    
    /**
     * Logger
     */
    static private final Log log = LogFactory.getLog("TerminalService");
	   
   /**
    * 执行Sql语句
    * @param strSql
    * @return
    */
   static public List DoSingleSqlQuery(String strSql)
   {
	   try
	   {
	       return modelService.listDataSql(strSql);
	   }
	   catch(Exception ex)
	   {
           	log.info("DoSingleSqlQuery:"+ex.toString());
           	return null;
	   }
   }
   
   /**
    * 获取指令信息
    * @param cmdCode
    * @return
    */
   static public List GetCmd(String cmdCode)
   {
	   try
	   {
		   /*String strSql="SELECT A.TCL_NAME FROM T_COMMAND_LIST A WHERE LOWER(A.TCL_CODE)=LOWER(?)";
		   return modelService.listDataSql(strSql, new Object[]{cmdCode});*/
		   String strSql="SELECT A.TCL_CODE,A.TCL_NAME FROM T_COMMAND_LIST A";
		   return modelService.listDataSql(strSql);
	   }
	   catch(Exception ex)
	   {
		   log.info("GetCmd:"+ex.toString());
		   return null;
	   }
   }
   
   /**
    * 获取特殊定义指令信息
    * @param cmdCode
    * @return
    */
   static public List GetCmdSpecial(String cmdCode)
   {
       try
       {
    	   /*String strSql="SELECT A.TCL_SPECIAL FROM T_COMMAND_LIST_SPECIAL A WHERE LOWER(A.TCL_CODE)=LOWER(?)";
		   return modelService.listDataSql(strSql, new Object[]{cmdCode});*/
		   String strSql="SELECT A.TCL_CODE,A.TCL_SPECIAL FROM T_COMMAND_LIST_SPECIAL A";
		   return modelService.listDataSql(strSql);
       }
       catch(Exception ex)
       {
    	   log.info("GetCmdSpecial:"+ex.toString());
    	   return null;
       }
   }
   
   /**
    * 获取特殊定义指令信息
    * @param cmdCode
    * @return
    */
   static public List GetCmdSpecialCode()
   {
       try
       {
    	   String strSql="SELECT A.TCL_CODE,A.TCL_SPECIAL FROM T_COMMAND_LIST_SPECIAL A";
		   return modelService.listDataSql(strSql);
       }
       catch(Exception ex)
       {
    	   log.info("GetCmdSpecialCode:"+ex.toString());
    	   return null;
       }
   }
   
   /**
    * 获取工作中心业务命令
    * @return
    */
   static public List GetWorkStationCmd(String workStation){
	   try{
		   String strSql="SELECT \r\n" + 
		   		"E.TCL_CODE,\r\n" + 
		   		"E.TCL_NAME\r\n" + 
		   		"FROM T_WORKSTATION A\r\n" + 
		   		"INNER JOIN T_WORKSTATION_CMD B ON A.TW_STATIONSN = B.TW_STATIONSN\r\n" + 
		   		"INNER JOIN T_COMMAND_SET C ON B.TCS_CODE = C.TCS_CODE\r\n" + 
		   		"INNER JOIN T_COMMAND_SET_DETAIL D ON C.TCS_CODE = D.TCS_CODE\r\n" + 
		   		"INNER JOIN T_COMMAND_LIST E ON D.TCL_CODE = E.TCL_CODE \r\n" + 
		   		"WHERE TCL_TYPE='B' \r\n" + 
		   		"AND A.TW_STATIONSN=?";
		   return modelService.listDataSql(strSql,new Object[]{workStation});
	   }
	   catch(Exception ex){
		   log.error("GetWorkStationCmd:",ex);
		   return null;
	   }
   }
   
   /**
    * 获取用户信息
    * @param userCode
    * @return
    */
   static public List GetUserInfo(String workStation, String userCode)
   {
	   try
	   {
		   String strSql="SELECT\r\n" + 
		   		"      A.LOGIN_NAME,\r\n" + 
		   		"      A.NAME,\r\n" + 
		   		"      A.PHOTO,\r\n" + 
		   		"      A.PHOTO_NAME,\r\n" + 
		   		"      T.JOB_NAME AS ROLE_NAME\r\n" + 
		   		"      FROM SY_USER A\r\n" + 
		   		"      LEFT JOIN (\r\n" + 
		   		"      SELECT\r\n" + 
		   		"      A.USER_ID,\r\n" + 
		   		"      B.ID AS JOB_ID,\r\n" + 
		   		"      B.JOB_NAME\r\n" + 
		   		"      FROM SY_USER_JOB A\r\n" + 
		   		"      LEFT JOIN SY_JOB B ON A.JOB_ID=B.ID\r\n" + 
		   		"      WHERE B.ID IS NOT NULL\r\n" + 
		   		"      AND B.ID IN (\r\n" + 
		   		"      SELECT\r\n" + 
		   		"      A.JOB_ID\r\n" + 
		   		"      FROM T_CO_JOB_CMDLIST A\r\n" + 
		   		"      WHERE A.CMJ_TCS_CODE IN (\r\n" + 
		   		"      SELECT\r\n" + 
		   		"      A.TCS_CODE\r\n" + 
		   		"      FROM T_WORKSTATION_CMD A\r\n" + 
		   		"      WHERE A.TW_STATIONSN=?\r\n" + 
		   		"      )\r\n" + 
		   		"      )\r\n" + 
		   		"      )T ON T.USER_ID=A.ID\r\n" + 
		   		"      WHERE LOWER(A.LOGIN_NAME)=LOWER(?) AND ROWNUM=1";
		   return modelService.listDataSql(strSql, new Object[]{workStation,userCode});
	   }
	   catch(Exception ex)
	   {
		   log.info("GetUserInfo:"+ex.toString());
		   return null;
	   }
   }
   
   /**
    * 获取品质预警信息
    * @param areaSn
    * @return
    */
   static public List GetQcWarnInfo(String workStation,String event,String dataAuth){
	   try{
		   String paramsFlag="";
		   List<Object> params=new ArrayList();
		   params.add(workStation);
		   params.add(dataAuth);
		   params.add(dataAuth);
		   for(String s:event.split(","))
		   {
			   if("".equals(paramsFlag)){
				   paramsFlag="?";
			   }
			   else{
				   paramsFlag+=",?";
			   }
			   params.add(s);
		   }
		   
		   String sqlStr="SELECT  \r\n" + 
		   		"A.QWL_EVENT AS WEVENT,  \r\n" + 
		   		"A.QWL_TYPE AS WTYPE,  \r\n" + 
		   		"A.QWL_MO_NUMBER AS WMONUMBER,  \r\n" + 
		   		"TO_CHAR(A.QWL_TIME,'YYYY-MM-DD HH24:MI:SS') AS WTIME,  \r\n" + 
		   		"A.QWL_CONTENT AS WCONTENT  \r\n" + 
		   		"FROM T_QC_WARNING_LOG A  \r\n" + 
		   		"WHERE A.QWL_AREA_SN IN ( \r\n" + 
		   		"SELECT \r\n" + 
		   		"B.CA_PARENTAREAID \r\n" + 
		   		"FROM T_CO_AREA B  \r\n" + 
		   		"WHERE B.CA_ID=? \r\n" + 
		   		"AND B.CA_TYPE='2' \r\n" + 
		   		"AND B.DATA_AUTH=?\r\n" + 
		   		") \r\n" + 
		   		"AND A.DATA_AUTH=?\r\n" + 
		   		"AND A.QWL_STATUS='N' AND A.QWL_EVENT IN ("+paramsFlag+")";
		   return modelService.listDataSql(sqlStr,params.toArray());
	   }
	   catch(Exception ex){
		   log.error("GetQcWarnInfo:",ex);
		   return null;
	   }
   }
   
   /**
    * 获取用户信息
    * @param userCode
    * @return
    */
   static public List GetUserInfoWithoutPhoto(String workStation, String userCode)
   {
	   try
	   {
		   String strSql="SELECT\r\n" + 
		   		"      A.LOGIN_NAME,\r\n" + 
		   		"      A.NAME,\r\n" + 
		   		"      A.PHOTO_NAME,\r\n" + 
		   		"      T.JOB_NAME AS ROLE_NAME\r\n" + 
		   		"      FROM SY_USER A\r\n" + 
		   		"      LEFT JOIN (\r\n" + 
		   		"      SELECT\r\n" + 
		   		"      A.USER_ID,\r\n" + 
		   		"      B.ID AS JOB_ID,\r\n" + 
		   		"      B.JOB_NAME\r\n" + 
		   		"      FROM SY_USER_JOB A\r\n" + 
		   		"      LEFT JOIN SY_JOB B ON A.JOB_ID=B.ID\r\n" + 
		   		"      WHERE B.ID IS NOT NULL\r\n" + 
		   		"      AND B.ID IN (\r\n" + 
		   		"      SELECT\r\n" + 
		   		"      A.JOB_ID\r\n" + 
		   		"      FROM T_CO_JOB_CMDLIST A\r\n" + 
		   		"      WHERE A.CMJ_TCS_CODE IN (\r\n" + 
		   		"      SELECT\r\n" + 
		   		"      A.TCS_CODE\r\n" + 
		   		"      FROM T_WORKSTATION_CMD A\r\n" + 
		   		"      WHERE A.TW_STATIONSN=?\r\n" + 
		   		"      )\r\n" + 
		   		"      )\r\n" + 
		   		"      )T ON T.USER_ID=A.ID\r\n" + 
		   		"      WHERE LOWER(A.LOGIN_NAME)=LOWER(?) AND ROWNUM=1";
		   return modelService.listDataSql(strSql, new Object[]{workStation,userCode});
	   }
	   catch(Exception ex)
	   {
		   log.info("GetUserInfo:"+ex.toString());
		   return null;
	   }
   }

   /**
    * 获取用户工种信息
    * @param workStation
    * @param userCode
    * @return
    */
   static public List GetUserJob(String workStation,String userCode)
   {
	   try
	   {
		   String strSql="SELECT\r\n" + 
		   		"      LISTAGG(T.JOB_NAME,'|') within group(order by T.JOB_NAME) AS JOB_NAME\r\n" + 
		   		"      FROM SY_USER A\r\n" + 
		   		"      LEFT JOIN (\r\n" + 
		   		"      SELECT\r\n" + 
		   		"      A.USER_ID,\r\n" + 
		   		"      B.ID AS JOB_ID,\r\n" + 
		   		"      B.JOB_NAME\r\n" + 
		   		"      FROM SY_USER_JOB A\r\n" + 
		   		"      LEFT JOIN SY_JOB B ON A.JOB_ID=B.ID\r\n" + 
		   		"      WHERE B.ID IS NOT NULL\r\n" + 
		   		"      AND B.ID IN (\r\n" + 
		   		"      SELECT\r\n" + 
		   		"      A.JOB_ID\r\n" + 
		   		"      FROM T_CO_JOB_CMDLIST A\r\n" + 
		   		"      WHERE A.CMJ_TCS_CODE IN (\r\n" + 
		   		"      SELECT\r\n" + 
		   		"      A.TCS_CODE\r\n" + 
		   		"      FROM T_WORKSTATION_CMD A\r\n" + 
		   		"      WHERE A.TW_STATIONSN=?\r\n" + 
		   		"      )\r\n" + 
		   		"      )\r\n" + 
		   		"      )T ON T.USER_ID=A.ID\r\n" + 
		   		"      WHERE LOWER(A.LOGIN_NAME)=LOWER(?)";
		   return modelService.listDataSql(strSql, new Object[]{workStation,userCode});
	   }
	   catch(Exception ex)
	   {
		   log.info("GetUserJob:"+ex.toString());
		   return null;
	   }
   }
   
   /**
    * 获取制令单信息
    * @param moNumber
    * @return
    */
   static public List GetMoInfo(String moNumber,String dataAuth)
   {
       try
       {
    	   String strSql="SELECT \r\n" + 
       	   		"NVL(B.CI_ITEM_CODE,'') CI_ITEM_CODE, \r\n" + 
       	   		"NVL(B.CI_ITEM_NAME,'') CI_ITEM_NAME, \r\n" + 
       	   		"NVL(B.CI_ITEM_SPEC,'') CI_ITEM_SPEC, \r\n" + 
       	   		"NVL(A.PM_TARGET_QTY,0) PM_TARGET_QTY, \r\n" + 
       	   		"NVL(A.PM_FINISH_COUNT,0) PM_FINISH_COUNT \r\n" + 
       	   		"FROM T_PM_MO_BASE A  \r\n" + 
       	   		"LEFT JOIN T_CO_ITEM B ON A.PM_MODEL_CODE=B.CI_ITEM_CODE  AND A.DATA_AUTH=B.DATA_AUTH\r\n" + 
       	   		"WHERE LOWER(A.PM_MO_NUMBER)=LOWER(?)\r\n" + 
       	   		"AND A.DATA_AUTH=?";
       	   return modelService.listDataSql(strSql,new Object[]{moNumber,dataAuth});
       }
       catch(Exception ex)
       {
    	   log.info("GetMoInfo:"+ex.toString());
    	   return null;
       }
   }
   
   /**
    * 根据工作中心和制令单 获取工序良品数量和不良品数量
    * @param workStatrion
    * @param moNumber
    * @return
    */
   static public List GetGroupQulityNum(String workStatrion,String dataAuth,String moNumber)
   {
	   try
	   {
		   //获取工序
		   String strSql="SELECT  \r\n" + 
		   		"T.CA_GROUP AS GROUP_CODE,  \r\n" + 
		   		"T.CA_PARENTAREAID, \r\n" + 
		   		"A.GROUP_NAME \r\n" + 
		   		"FROM T_CO_AREA T \r\n" + 
		   		"LEFT JOIN T_CO_GROUP A ON T.CA_GROUP = A.GROUP_CODE AND T.DATA_AUTH=A.DATA_AUTH\r\n" + 
		   		"WHERE T.CA_ID = ? AND T.DATA_AUTH=?";
	    	List dataList= modelService.listDataSql(strSql,new Object[]{workStatrion,dataAuth});
	    	if(dataList==null || dataList.size()<=0) return null;
	    	String _groupCode=((Map)dataList.get(0)).get("GROUP_CODE").toString();
	    	String _line=((Map)dataList.get(0)).get("CA_PARENTAREAID").toString();
	    	
	    	//获取数量
	    	if(null==moNumber){
	    		strSql="SELECT \r\n" + 
		    			"NVL(SUM(A.MGS_OK_PCS),0)+NVL(SUM(A.MGS_T_OK_PCS),0) OK_PCS, \r\n" + 
		    			"NVL(SUM(A.MGS_NG_PCS),0) NG_PCS \r\n" + 
		    			"FROM T_MID_GROUP_STATISTIC A \r\n" + 
		    			"WHERE A.MGS_WORK_DATE=TO_CHAR(SYSDATE,'YYYY-MM-DD') \r\n" + 
		    			"AND A.MGS_GROUP_CODE=?\r\n" + 
		    			"AND A.MGS_AREA_SN=?\r\n" + 
		    			"AND A.DATA_AUTH=?";
		    	return modelService.listDataSql(strSql,new Object[]{_groupCode,_line,dataAuth});
	    	}
	    	else {
	    		strSql="SELECT \r\n" + 
		    			"NVL(SUM(A.MGS_OK_PCS),0)+NVL(SUM(A.MGS_T_OK_PCS),0) OK_PCS, \r\n" + 
		    			"NVL(SUM(A.MGS_NG_PCS),0) NG_PCS \r\n" + 
		    			"FROM T_MID_GROUP_STATISTIC A \r\n" + 
		    			"WHERE A.MGS_WORK_DATE=TO_CHAR(SYSDATE,'YYYY-MM-DD') \r\n" + 
		    			"AND A.MGS_GROUP_CODE=?\r\n" + 
		    			"AND A.MGS_AREA_SN=?\r\n" + 
		    			"AND A.DATA_AUTH=?\r\n" + 
		    			"AND A.MGS_MO_NUMBER=?";
		    	return modelService.listDataSql(strSql,new Object[]{_groupCode,_line,dataAuth,moNumber});
	    	}
	   }
	   catch(Exception ex)
	   {
           log.info("GetQulityNumByWorkstation:"+ex.toString());
           return null;
	   }
   }
   
   /**
    * 获取车间、线体，工作中心名称
    * @param areaId
    * @return
    */
   static public List GetAreaName(String areaId,String dataAuth)
   {
	   try
	   {
		   /*String strSql="SELECT\r\n" + 
	   		"A.CA_ID,\r\n" + 
	   		"A.CA_NAME\r\n" + 
	   		"FROM T_CO_AREA A\r\n" + 
	   		"WHERE A.CA_ID=?";
		   return modelService.listDataSql(strSql,new Object[]{areaId});*/
		   if(null==dataAuth || "".equals(dataAuth)){
	    	   String strSql="SELECT \r\n" + 
	    		    "A.DATA_AUTH, \r\n" +
    		   		"A.CA_ID, \r\n" + 
    		   		"A.CA_NAME \r\n" + 
    		   		"FROM T_CO_AREA A \r\n" + 
    		   		"WHERE A.CA_TYPE='2'";
    		   return modelService.listDataSql(strSql);
	       }
	       else {
	    	   String strSql="SELECT \r\n" + 
	    			"A.DATA_AUTH, \r\n" +
    		   		"A.CA_ID, \r\n" + 
    		   		"A.CA_NAME \r\n" + 
    		   		"FROM T_CO_AREA A \r\n" + 
    		   		"WHERE A.CA_TYPE='2' AND A.DATA_AUTH=?";
    		   return modelService.listDataSql(strSql,new Object[]{dataAuth});
	       }
	   }
	   catch(Exception ex)
	   {
		   log.info("GetAreaName:"+ex.toString());
		   return null;
	   }
   }
   
   /**
    * 获取语种类型
    * @return
    */
   static public List GetLanguageType()
   {
	   try
	   {
		   String strSql="SELECT \r\n" + 
		   		"A.COLUMN_NAME AS LANGUAGE_TYPE \r\n" + 
		   		"FROM USER_TAB_COLS A \r\n" + 
		   		"WHERE A.table_name='T_SYS_LANGUAGE' \r\n" + 
		   		"AND A.COLUMN_NAME NOT IN ('MSGNAME','CREATE_USER','CREATE_DATE','UPDATE_USER','UPDATE_DATE')";
		   return modelService.listDataSql(strSql);
	   }
	   catch(Exception ex)
	   {
		   log.info(ex.toString());
		   return null;
	   }
   }
   
   /**
    * 根据工作中心      获取前5大不良
    * @param moNumber
    * @return
    */
   static public List GetTop5Error(String workStation,String dataAuth)
   {
	   try
	   {
		   String strSql="SELECT  \r\n" + 
		   		"T.CA_GROUP AS GROUP_CODE,  \r\n" + 
		   		"T.CA_PARENTAREAID, \r\n" + 
		   		"A.GROUP_NAME \r\n" + 
		   		"FROM T_CO_AREA T \r\n" + 
		   		"LEFT JOIN T_CO_GROUP A ON T.CA_GROUP = A.GROUP_CODE AND T.DATA_AUTH=A.DATA_AUTH\r\n" + 
		   		"WHERE T.CA_ID = ?\r\n" + 
		   		"AND T.DATA_AUTH=?";
	       List dataList= modelService.listDataSql(strSql,new Object[]{workStation,dataAuth});
	       if(dataList==null || dataList.size()<=0) return null;
		   String _groupCode=((Map)dataList.get(0)).get("GROUP_CODE").toString();
		   String _line=((Map)dataList.get(0)).get("CA_PARENTAREAID").toString();
		   strSql="SELECT \r\n" + 
		   		"T.WE_ERROR_CODE AS ERROR_CODE, \r\n" + 
		   		"T.CEC_NAME AS ERROR_NAME, \r\n" + 
		   		"T.WE_ERROR_NUM AS ERROR_NUM \r\n" + 
		   		"FROM ( \r\n" + 
		   		"SELECT \r\n" + 
		   		"A.WE_ERROR_CODE,  \r\n" + 
		   		"B.CEC_NAME, \r\n" + 
		   		"NVL(SUM(A.WE_ERROR_NUM),0) WE_ERROR_NUM \r\n" + 
		   		"FROM T_WIP_ERROR A \r\n" + 
		   		"LEFT JOIN T_CO_ERROR_CODE B ON A.WE_ERROR_CODE=B.CEC_CODE AND A.DATA_AUTH=B.DATA_AUTH\r\n" + 
		   		"WHERE A.WE_TEST_GROUP=? \r\n" + 
		   		"AND A.WE_AREA_SN=?  \r\n" + 
		   		"AND A.WE_ERROR_NUM IS NOT NULL  \r\n" + 
		   		"AND TO_CHAR(A.WE_TEST_TIME,'YYYY-MM-DD')=TO_CHAR(SYSDATE,'YYYY-MM-DD') \r\n" + 
		   		"AND A.DATA_AUTH=?\r\n" + 
		   		"GROUP BY A.WE_ERROR_CODE,B.CEC_NAME \r\n" + 
		   		"ORDER BY NVL(SUM(A.WE_ERROR_NUM),0) DESC \r\n" + 
		   		")T WHERE ROWNUM<6";
		    return modelService.listDataSql(strSql,new Object[]{_groupCode,_line,dataAuth});
	   }
	   catch(Exception ex)
	   {
		   log.info("GetTop5Error:"+ex.toString());
		   return null;
	   }
   }
   
   /**
    * 根据制令单 和 工作中心 获取时段产量
    * @param moNumber
    * @param workStation
    * @return
    */
   static public List GetTimeOutPut(String workStation,String dataAuth)
   {
       try
       {
    	   String strSql="SELECT  \r\n" + 
       	   		"T.CA_GROUP AS GROUP_CODE,  \r\n" + 
       	   		"T.CA_PARENTAREAID, \r\n" + 
       	   		"A.GROUP_NAME \r\n" + 
       	   		"FROM T_CO_AREA T \r\n" + 
       	   		"LEFT JOIN T_CO_GROUP A ON T.CA_GROUP = A.GROUP_CODE AND T.DATA_AUTH=A.DATA_AUTH\r\n" + 
       	   		"WHERE T.CA_ID = ?\r\n" + 
       	   		"AND T.DATA_AUTH=?";
   	       List dataList= modelService.listDataSql(strSql,new Object[]{workStation,dataAuth});
   	       if(dataList==null || dataList.size()<=0) return null;
   		   String _groupCode=((Map)dataList.get(0)).get("GROUP_CODE").toString();
   		   String _line=((Map)dataList.get(0)).get("CA_PARENTAREAID").toString();
   		   strSql="SELECT \r\n" + 
   		   		"T.PTIME, \r\n" + 
   		   		"T.PVALUE \r\n" + 
   		   		"FROM ( \r\n" + 
   		   		"SELECT  \r\n" + 
   		   		"TO_CHAR(TO_DATE(A.MGS_BEGIN_TIME,'YYYY-MM-DD HH24:MI:SS'),'HH24') PTIME,  \r\n" + 
   		   		"NVL(SUM(NVL(A.MGS_OK_PCS,0)+NVL(A.MGS_T_OK_PCS,0)),0) PVALUE  \r\n" + 
   		   		"FROM T_MID_GROUP_STATISTIC A  \r\n" + 
   		   		"WHERE A.MGS_GROUP_CODE=? \r\n" + 
   		   		"AND A.MGS_AREA_SN=? \r\n" + 
   		   		"AND A.MGS_WORK_DATE=TO_CHAR(SYSDATE,'YYYY-MM-DD')  \r\n" + 
   		   		"AND A.DATA_AUTH=?\r\n" + 
   		   		"GROUP BY TO_CHAR(TO_DATE(A.MGS_BEGIN_TIME,'YYYY-MM-DD HH24:MI:SS'),'HH24') \r\n" + 
   		   		") T \r\n" + 
   		   		"ORDER BY T.PTIME ASC";
       	   return modelService.listDataSql(strSql,new Object[]{_groupCode,_line,dataAuth});
       }
       catch(Exception ex)
       {
           log.info("GetTimeOutPut:"+ex.toString());
           return null;
       }
   }
   
   /**
    * 根据SN获取制令单号
    * @param sn
    * @return
    */
   static public List GetMoNumberBySn(String sn,String dataAuth)
   {
	   try
	   {
		   String strSql="SELECT \r\n" + 
		   		"A.WT_MO_NUMBER \r\n" + 
		   		"FROM T_WIP_TRACKING A \r\n" + 
		   		"WHERE A.WT_SN=? \r\n" + 
		   		"AND A.DATA_AUTH=?\r\n" + 
		   		"AND ROWNUM=1";
		   return modelService.listDataSql(strSql,new Object[]{sn,dataAuth});
	   }
	   catch(Exception ex)
	   {
		   log.info("GetMoNumberBySn:"+ex.toString());
		   return null;
	   }
   }

   /**
    * 根据工作中心获取工序信息
    * @param workStation
    * @return
    */
   static public List GetGroupByWorkStation(String workStation,String dataAuth)
   {
       try
       {
    	   /*String strSql="SELECT \r\n" + 
	   		"T.CA_GROUP AS GROUP_CODE, \r\n" + 
	   		"T.CA_PARENTAREAID,\r\n" + 
	   		"A.GROUP_NAME\r\n" + 
	   		"FROM T_CO_AREA T\r\n" + 
	   		"LEFT JOIN T_CO_GROUP A ON T.CA_GROUP = A.GROUP_CODE\r\n" + 
	   		"WHERE T.CA_ID = ?";
		   return modelService.listDataSql(strSql,new Object[]{workStation});*/
	        if(null==dataAuth || "".equals(dataAuth)){
	        	String strSql="SELECT  \r\n" + 
		        	"T.DATA_AUTH,  \r\n" + 
        	   		"T.CA_ID,  \r\n" + 
        	   		"T.CA_GROUP AS GROUP_CODE,  \r\n" + 
        	   		"T.CA_PARENTAREAID, \r\n" + 
        	   		"A.GROUP_NAME \r\n" + 
        	   		"FROM T_CO_AREA T \r\n" + 
        	   		"LEFT JOIN T_CO_GROUP A ON T.CA_GROUP = A.GROUP_CODE AND T.DATA_AUTH=A.DATA_AUTH\r\n" + 
        	   		"WHERE T.CA_TYPE = '2'";
        	   return modelService.listDataSql(strSql);
	        }
	        else {
	        	String strSql="SELECT  \r\n" + 
	        	    "T.DATA_AUTH,  \r\n" + 
        	   		"T.CA_ID,  \r\n" + 
        	   		"T.CA_GROUP AS GROUP_CODE,  \r\n" + 
        	   		"T.CA_PARENTAREAID, \r\n" + 
        	   		"A.GROUP_NAME \r\n" + 
        	   		"FROM T_CO_AREA T \r\n" + 
        	   		"LEFT JOIN T_CO_GROUP A ON T.CA_GROUP = A.GROUP_CODE AND T.DATA_AUTH=A.DATA_AUTH\r\n" + 
        	   		"WHERE T.CA_TYPE = '2' AND T.DATA_AUTH=?";
        	   return modelService.listDataSql(strSql,new Object[]{dataAuth});
	        }
       }
       catch(Exception ex)
       {
    	   log.info("GetGroupByWorkStation:"+ex.toString());
    	   return null;
       }
   }
   
   /**
    * 获取ESOP信息
    * @param moNumber
    * @param groupCode
    * @return
    */
   static public List GetEsopInfo(String moNumber,String groupCode,String dataAuth)
   {
	   try
	   {
           if(null==dataAuth || "".equals(dataAuth)){
    		   String strSql="SELECT\r\n" + 
			   		"A.PM_PRODUCT_STEP,\r\n" + 
			   		"A.PM_PROCESS_FACE,\r\n" + 
			   		"A.PM_MODEL_CODE\r\n" + 
			   		"FROM T_PM_MO_BASE A\r\n" + 
			   		"WHERE A.PM_MO_NUMBER=?";
			   Map moMap=(Map)modelService.listDataSql(strSql,new Object[]{moNumber}).get(0);
			   strSql="SELECT\r\n" + 
			   		"T.CSI_GROUP,\r\n" + 
			   		"T.CSI_MODEL_CODE,\r\n" + 
			   		"T.CSI_PRODUCT_STEP,\r\n" + 
			   		"T.CSI_PROCESS_FACE,\r\n" + 
			   		"T.CSI_ADDRESS,\r\n" + 
			   		"T.CSI_FILE_NAME\r\n" + 
			   		"FROM (\r\n" + 
			   		"SELECT\r\n" + 
			   		"A.CSI_GROUP,\r\n" + 
			   		"A.CSI_MODEL_CODE,\r\n" + 
			   		"A.CSI_PRODUCT_STEP,\r\n" + 
			   		"A.CSI_PROCESS_FACE,\r\n" + 
			   		"A.CSI_ADDRESS,\r\n" + 
			   		"A.CSI_FILE_NAME\r\n" + 
			   		"FROM T_CO_ESOP_INFO A\r\n" + 
			   		"WHERE A.CSI_GROUP=?\r\n" + 
			   		"AND A.CSI_PROCESS_FACE=?\r\n" + 
			   		"AND A.CSI_MODEL_CODE=?\r\n" + 
			   		"AND A.CSI_VALID_FLAG='Y'\r\n" + 
			   		"AND A.CSI_VERSION IS NOT NULL\r\n" +
			   		"ORDER BY A.CSI_VERSION DESC\r\n" + 
			   		") T WHERE ROWNUM=1";
			   return modelService.listDataSql(strSql,new Object[]{groupCode,moMap.get("PM_PROCESS_FACE"),moMap.get("PM_MODEL_CODE")});
           }
           else {
    		   String strSql="SELECT\r\n" + 
			   		"A.PM_PRODUCT_STEP,\r\n" + 
			   		"A.PM_PROCESS_FACE,\r\n" + 
			   		"A.PM_MODEL_CODE\r\n" + 
			   		"FROM T_PM_MO_BASE A\r\n" + 
			   		"WHERE A.PM_MO_NUMBER=? AND A.DATA_AUTH=?";
			   Map moMap=(Map)modelService.listDataSql(strSql,new Object[]{moNumber,dataAuth}).get(0);
			   strSql="SELECT\r\n" + 
			   		"T.CSI_GROUP,\r\n" + 
			   		"T.CSI_MODEL_CODE,\r\n" + 
			   		"T.CSI_PRODUCT_STEP,\r\n" + 
			   		"T.CSI_PROCESS_FACE,\r\n" + 
			   		"T.CSI_ADDRESS,\r\n" + 
			   		"T.CSI_FILE_NAME\r\n" + 
			   		"FROM (\r\n" + 
			   		"SELECT\r\n" + 
			   		"A.CSI_GROUP,\r\n" + 
			   		"A.CSI_MODEL_CODE,\r\n" + 
			   		"A.CSI_PRODUCT_STEP,\r\n" + 
			   		"A.CSI_PROCESS_FACE,\r\n" + 
			   		"A.CSI_ADDRESS,\r\n" + 
			   		"A.CSI_FILE_NAME\r\n" + 
			   		"FROM T_CO_ESOP_INFO A\r\n" + 
			   		"WHERE A.CSI_GROUP=?\r\n" + 
			   		"AND A.CSI_PROCESS_FACE=?\r\n" + 
			   		"AND A.CSI_MODEL_CODE=?\r\n" + 
			   		"AND A.CSI_VALID_FLAG='Y'\r\n" + 
			   		"AND A.CSI_VERSION IS NOT NULL\r\n" + 
			   		"AND A.DATA_AUTH=?\r\n" + 
			   		"ORDER BY A.CSI_VERSION DESC\r\n" + 
			   		") T WHERE ROWNUM=1";
			   return modelService.listDataSql(strSql,new Object[]{groupCode,moMap.get("PM_PROCESS_FACE"),moMap.get("PM_MODEL_CODE"),dataAuth});
           }
	   }
	   catch(Exception ex)
	   {
           log.info("GetEsopInfo:"+ex.toString());
           return null;
	   }
   }
   
   /**
    * 根据机种和工序获取ESOP信息
    * @param itemCode
    * @param groupCode
    * @return
    */
   static public List GetEsopInfoByWhere(String whereStr)
   {
	   try
	   {
		   String strSql="SELECT\r\n" + 
		   		"T.CSI_GROUP,\r\n" + 
		   		"T.CSI_MODEL_CODE,\r\n" + 
		   		"T.CSI_PRODUCT_STEP,\r\n" + 
		   		"T.CSI_PROCESS_FACE,\r\n" + 
		   		"T.CSI_ADDRESS,\r\n" + 
		   		"T.CSI_SYS_NAME,\r\n" + 
		   		"T.CSI_FILE_NAME\r\n" + 
		   		"FROM (\r\n" + 
		   		"SELECT\r\n" + 
		   		"A.CSI_GROUP,\r\n" + 
		   		"A.CSI_MODEL_CODE,\r\n" + 
		   		"A.CSI_PRODUCT_STEP,\r\n" + 
		   		"A.CSI_PROCESS_FACE,\r\n" + 
		   		"A.CSI_ADDRESS,\r\n" + 
		   		"A.CSI_SYS_NAME,\r\n" + 
		   		"A.CSI_FILE_NAME\r\n" + 
		   		"FROM T_CO_ESOP_INFO A\r\n" + 
		   		"WHERE 1=1 %s \r\n" + 
		   		"AND A.CSI_VALID_FLAG='Y'\r\n" + 
		   		"AND A.CSI_VERSION IS NOT NULL\r\n" + 
		   		"ORDER BY A.CSI_VERSION DESC\r\n" + 
		   		") T ";
		   return modelService.listDataSql(String.format(strSql, whereStr));
	   }
	   catch(Exception ex)
	   {
           log.info("GetEsopInfo:"+ex.toString());
           return null;
	   }
   }
   
   /**
    * 根据工作中心获取制令单号
    * @param workStation
    * @return
    */
   static public List GetMoAndEmpByWorkstation(String workStation,String dataAuth)
   {
       try
       {
    	   Map returnMap=new HashMap();
    	   
    	   //获取工作中心所在的线别
    	   String strSql="SELECT \r\n" + 
    	   		"A.CA_PARENTAREAID \r\n" + 
    	   		"FROM T_CO_AREA A \r\n" + 
    	   		"WHERE A.CA_ID=?  \r\n" + 
    	   		"AND A.CA_TYPE='2' \r\n" + 
    	   		"AND A.DATA_AUTH=?";
    	   List mapList=modelService.listDataSql(strSql,new Object[]{workStation,dataAuth});
    	   if(mapList==null || mapList.size()<=0) return null;
    	   Map map=(Map)mapList.get(0);
    	   String line=map.get("CA_PARENTAREAID").toString();
    	   
    	   //获取制令单号
    	   strSql="SELECT \r\n" + 
    	   		"A.PMO_NUMBER \r\n" + 
    	   		"FROM T_PM_MO_ONLINE A \r\n" + 
    	   		"WHERE A.PMO_AREA_SN=?\r\n" + 
    	   		"AND A.DATA_AUTH=?";
    	   mapList=modelService.listDataSql(strSql,new Object[]{line,dataAuth});
    	   if(mapList!=null && mapList.size()>0) 
		   {
    		   map=(Map)mapList.get(0);
    		   returnMap.put("MONUMBER", map.get("PMO_NUMBER"));
		   }
    	   else returnMap.put("MONUMBER", "");
    	   
    	   //获取班别代码
    	   strSql="SELECT \r\n" + 
    	   		"B.CALW_GROUP \r\n" + 
    	   		"FROM T_CO_CALENDAR_LINE A \r\n" + 
    	   		"INNER JOIN T_CO_CALENDAR_WORKTIME B ON A.CAL_ID=B.CAL_ID  AND A.DATA_AUTH=B.DATA_AUTH\r\n" + 
    	   		"WHERE A.AREA_ID=? \r\n" + 
    	   		"AND A.DATA_AUTH=?\r\n" + 
    	   		"AND  \r\n" + 
    	   		"( \r\n" + 
    	   		"--非跨天 \r\n" + 
    	   		"(B.CALW_INTER_DAY='N'  \r\n" + 
    	   		"AND TO_CHAR(SYSDATE,'HH24:MI')>=TO_CHAR(B.CALW_START,'HH24:MI')  \r\n" + 
    	   		"AND TO_CHAR(SYSDATE,'HH24:MI')<=TO_CHAR(B.CALW_END,'HH24:MI')) \r\n" + 
    	   		"OR  \r\n" + 
    	   		"--跨天 \r\n" + 
    	   		"(B.CALW_INTER_DAY='Y'  \r\n" + 
    	   		"AND (TO_CHAR(SYSDATE,'HH24:MI')>=TO_CHAR(B.CALW_START,'HH24:MI') AND TO_CHAR(SYSDATE,'HH24:MI')<=TO_CHAR('23:59:59')) \r\n" + 
    	   		"AND (TO_CHAR(SYSDATE,'HH24:MI')<=TO_CHAR(B.CALW_END,'HH24:MI') AND TO_CHAR(SYSDATE,'HH24:MI')>=TO_CHAR('00:00:00')) \r\n" + 
    	   		") \r\n" + 
    	   		") \r\n" + 
    	   		"AND TO_CHAR(B.CALW_START,'HH24:MI') IS NOT NULL \r\n" + 
    	   		"AND TO_CHAR(B.CALW_END,'HH24:MI') IS NOT NULL";
    	   
    	   mapList=modelService.listDataSql(strSql,new Object[]{line,dataAuth});
    	   String calwGroup="";
    	   if(mapList!=null && mapList.size()>0) 
		   {
    		   map=(Map)mapList.get(0);
    		   calwGroup=map.get("CALW_GROUP").toString();
		   }
    	   
    	   //获取责任人
    	   strSql="SELECT \r\n" + 
    	   		"A.CAC_CHARGE_EMP \r\n" + 
    	   		"FROM T_CO_AREA_CHARGE A \r\n" + 
    	   		"WHERE A.CAC_GROUP=? \r\n" + 
    	   		"AND A.CA_ID=?\r\n" + 
    	   		"AND A.DATA_AUTH=?";
    	   mapList=modelService.listDataSql(strSql,new Object[]{calwGroup,line,dataAuth});
    	   if(mapList!=null && mapList.size()>0) 
	       {
    		   map=(Map)mapList.get(0);
	    	   returnMap.put("EMP", map.get("CAC_CHARGE_EMP"));
	       }
    	   else returnMap.put("EMP", "");
    	   
    	   List returnList=new ArrayList();
    	   returnList.add(returnMap);
    	   return returnList;
       }
       catch(Exception ex)
       {
          log.info("GetMoAndUserByWorkstation:"+ex.toString());    	
          return null;
       }
   }
   
   /**
    * 获取多语言信息
    * @param type
    * @param name
    * @return
    */
   static public List GetLanguage(String type)
   {
       try
       {
    	   String strSql="SELECT\r\n" + 
    			"A.MSGNAME AS LAN_OLD,\r\n" +
    	   		"A.%s LAN_REPLACE\r\n" + 
    	   		"FROM T_SYS_LANGUAGE A";
    	   return modelService.listDataSql(String.format(strSql, type));
       }
       catch(Exception ex)
       {
    	   log.info(ex.toString());
    	   return null;
       }
   }
   
   /**
    * 获取数据字典信息
    * @return
    */
   static public List GetDictVal(String dictCode)
   {
       try
       {
    	   String strSql="SELECT\r\n" + 
    	   		"A.CODE,\r\n" + 
    	   		"A.VALUE\r\n" + 
    	   		"FROM SY_DICT_VAL A\r\n" + 
    	   		"WHERE A.DICT_CODE=?";
    	   return modelService.listDataSql(strSql,new Object[]{dictCode});
       }
       catch(Exception ex)
       {
    	   log.info("GetDictVal:",ex);
    	   return null;
       }
   }
   
   /**
    * 获取工序信息
    * @return
    */
   static public List GetGroup(String dataAuth)
   {
	   try
	   {
		   if(null==dataAuth || "".equals(dataAuth)){
			   String strSql="SELECT \r\n" + 
			   		"A.GROUP_CODE, \r\n" + 
			   		"A.GROUP_NAME \r\n" + 
			   		"FROM T_CO_GROUP A";
		       return modelService.listDataSql(strSql);
		   }
		   else{
			   String strSql="SELECT \r\n" + 
			   		"A.GROUP_CODE, \r\n" + 
			   		"A.GROUP_NAME \r\n" + 
			   		"FROM T_CO_GROUP A\r\n" + 
			   		"WHERE A.DATA_AUTH=?";
		       return modelService.listDataSql(strSql,new Object[]{dataAuth});
		   }
	   }
	   catch(Exception ex)
	   {
           log.info(ex.toString());
           return null;
	   }
   }
   
   /**
    * Map 转  Json
    * @param map
    * @return
    */
   static public String MapToJson(List<Map> mapList)
   {
	   try
	   {
		   JSONArray json = JSONArray.fromObject(mapList);
		   return json.toString();
	   }
	   catch(Exception ex)
	   {
		   log.info("MapToJson:"+ex.toString());
		   return null;
	   }
   }
   
   /**
    * 记录DCT硬件信号日志
    * @param mapData
    * @return
    */
   public static String loggerSign(Map<String,String> mapData){
	   try{
		   //收集
		   String controllerIp=null!=mapData.get("controllerIp")? mapData.get("controllerIp") :"N/A";
		   String workStation=null!=mapData.get("workStation")? mapData.get("workStation") :"N/A";
		   String sensor=null!=mapData.get("sensor")? mapData.get("sensor") :"N/A";
		   String smema=null!=mapData.get("smema")? mapData.get("smema") :"N/A";
		   String redGreenLight=null!=mapData.get("redGreenLight")? mapData.get("redGreenLight") :"N/A";
		   String yellow=null!=mapData.get("yellow")? mapData.get("yellow") :"N/A";
		   String scaner=null!=mapData.get("scaner")? mapData.get("scaner") :"N/A";
		   String call=null!=mapData.get("call")? mapData.get("call") :"N/A";
		   String pass=null!=mapData.get("pass")? mapData.get("pass") :"N/A";
		   String lastTime=null!=mapData.get("lastTime")? mapData.get("lastTime") :"N/A";
	       //执行记录
		   //根据停机装置IP和工作中心查询是否有记录存在
		   String sqlStr="SELECT\r\n" + 
		   		"ID\r\n" + 
		   		"FROM T_CS_DCT_ACTUALSIGN \r\n" + 
		   		"WHERE TCDA_CONTROLLER_IP=?\r\n" + 
		   		"AND TCDA_WORKSTATION=?";
		   List<Map> dataList=modelService.listDataSql(sqlStr,new Object[]{controllerIp,workStation});
		   if(null==dataList || dataList.size()<=0){
			   //执行新增
			   sqlStr="INSERT INTO T_CS_DCT_ACTUALSIGN\r\n" + 
			   		"(\r\n" + 
			   		"ID,\r\n" + 
			   		"TCDA_CONTROLLER_IP,\r\n" + 
			   		"TCDA_WORKSTATION,\r\n" + 
			   		"TCDA_SENSOR,\r\n" + 
			   		"TCDA_SMEMA,\r\n" + 
			   		"TCDA_RED_GREEN,\r\n" + 
			   		"TCDA_YELLOW,\r\n" + 
			   		"TCDA_SCANER,\r\n" + 
			   		"TCDA_CALL,\r\n" + 
			   		"TCDA_PASS,\r\n" + 
			   		"TCDA_LAST_COLLECT_TIME\r\n" + 
			   		")VALUES\r\n" + 
			   		"(\r\n" + 
			   		"f_c_getnewid(),\r\n" + 
			   		"?,\r\n" + 
			   		"?,\r\n" + 
			   		"?,\r\n" + 
			   		"?,\r\n" + 
			   		"?,\r\n" + 
			   		"?,\r\n" + 
			   		"?,\r\n" + 
			   		"?,\r\n" + 
			   		"?,\r\n" + 
			   		"?\r\n" + 
			   		")";
			   int isSuc= modelService.execSql(sqlStr,new Object[]{
					   controllerIp,
					   workStation,
					   sensor,
					   smema,
					   redGreenLight,
					   yellow,
					   scaner,
					   call,
					   pass,
					   lastTime
			   });
			   if(isSuc<=0){
				   return "NG";
			   }
		   }
		   else {
			   //执行更新
			   //获取记录ID
			   String id=dataList.get(0).get("ID").toString();
			   sqlStr="UPDATE T_CS_DCT_ACTUALSIGN\r\n" + 
			   		"SET TCDA_CONTROLLER_IP=?,\r\n" + 
			   		"TCDA_WORKSTATION=?,\r\n" + 
			   		"TCDA_SENSOR=?,\r\n" + 
			   		"TCDA_SMEMA=?,\r\n" + 
			   		"TCDA_RED_GREEN=?,\r\n" + 
			   		"TCDA_YELLOW=?,\r\n" + 
			   		"TCDA_SCANER=?,\r\n" + 
			   		"TCDA_CALL=?,\r\n" + 
			   		"TCDA_PASS=?,\r\n" + 
			   		"TCDA_LAST_COLLECT_TIME=?\r\n" + 
			   		"WHERE ID=?";
			   int isSuc = modelService.execSql(sqlStr,new Object[]{
					   controllerIp,
					   workStation,
					   sensor,
					   smema,
					   redGreenLight,
					   yellow,
					   scaner,
					   call,
					   pass,
					   lastTime,
					   id
			   });
			   if(isSuc<=0){
				   return "NG";
			   }
		   }
		   return "OK";
	   }
	   catch(Exception e){
		   log.info("loggerSign:",e);
		   return "NG:"+e;
	   }
   }
   
   /**
    * 获取组织机构信息
    * @return
    */
   public static List GetDataAuthInfo(){
	   try{
		   String strSql="SELECT\r\n" + 
		   		"A.ID AS O_CODE,\r\n" + 
		   		"A.NAME AS O_NAME\r\n" + 
		   		"FROM SY_DEPT A";
	       return modelService.listDataSql(strSql);
	   }
	   catch(Exception e){
		   log.error("GetDataAuthInfo:",e);
		   return null;
	   }
   }
   
   /**
    * 获取DMP信息
    * @return
    */
   public static List getDmpInfo(String dmpId){
	   try{
		   String strSql="";
		   if(null!=dmpId && !"".equals(dmpId)){
			   strSql="SELECT\r\n" + 
			   		"A.DMP_ID,\r\n" + 
			   		"A.IP,\r\n" + 
			   		"A.PORT,\r\n" + 
			   		"B.DMP_REMARK\r\n" + 
			   		"FROM T_DMP_IP_REFERENCE A\r\n" + 
			   		"LEFT JOIN T_DMP_SERVICE B ON A.DMP_ID=B.DMP_ID \r\n" + 
			   		"WHERE A.DMP_ID=?";
			   return modelService.listDataSql(strSql,new Object[]{dmpId});
		   }
		   else {
			   strSql="SELECT\r\n" + 
			   		"A.DMP_ID,\r\n" + 
			   		"A.IP,\r\n" + 
			   		"A.PORT,\r\n" + 
			   		"B.DMP_REMARK\r\n" + 
			   		"FROM T_DMP_IP_REFERENCE A\r\n" + 
			   		"LEFT JOIN T_DMP_SERVICE B ON A.DMP_ID=B.DMP_ID ";
		       return modelService.listDataSql(strSql);
		   }
	   }
	   catch(Exception e){
		   log.error("getDmpInfo:",e);
		   return null;
	   }
   }
   
   /**
    * 根据IP获取可以用的DMP信息
    * @return
    */
   public static List getDmpInfoByIp(String ip){
	   try{
		   String strSql="SELECT DISTINCT\r\n" + 
		   		"A.DMP_ID,\r\n" + 
		   		"B.DMP_REMARK\r\n" + 
		   		"FROM T_DMP_DEVICEIP_POOL A\r\n" + 
		   		"LEFT JOIN T_DMP_SERVICE B ON A.DMP_ID=B.DMP_ID\r\n" + 
		   		"WHERE F_STR2IPINT(A.START_IP)<=F_STR2IPINT(?) \r\n" + 
		   		"AND F_STR2IPINT(A.END_IP)>=F_STR2IPINT(?)";
		   return modelService.listDataSql(strSql,new Object[]{ip,ip});
	   }
	   catch(Exception e){
		   log.error("getDmpInfoByIp:",e);
		   return null;
	   }
   }
   
   /**
    * 根据工作中心SN获取工作中心的归属数据（车间/线体）
    * @return
    */
   public static List getWorkstationBelongInfo(String workStation){
	   try{
		   //获取工作中心对应的线体
		   String strSql="SELECT\r\n" + 
		   		"A.CA_ID AS WORKSTATION_SN,\r\n" + 
		   		"A.CA_NAME AS WORKSTATION_NAME,\r\n" + 
		   		"NVL(B.CA_ID,NVL(D.CA_ID,' ')) AS LINE_SN,\r\n" + 
		   		"NVL(B.CA_NAME,NVL(D.CA_NAME,' ')) AS LINE_NAME,\r\n" + 
		   		"NVL(C.CA_ID,' ') AS WORKSHOP_SN,\r\n" + 
		   		"NVL(C.CA_NAME,' ') AS WORKSHOP_NAME \r\n" + 
		   		"FROM T_CO_AREA A\r\n" + 
		   		"LEFT JOIN T_CO_AREA B ON A.CA_PARENTAREAID=B.CA_ID AND B.CA_TYPE='1'\r\n" + 
		   		"LEFT JOIN T_CO_AREA C ON B.CA_PARENTAREAID=C.CA_ID AND C.CA_TYPE='0'\r\n" + 
		   		"LEFT JOIN T_CO_AREA D ON A.CA_PARENTAREAID=D.CA_ID AND D.CA_TYPE='0'\r\n" + 
		   		"WHERE A.CA_ID=?\r\n" + 
		   		"AND A.CA_TYPE='2'";
		   return modelService.listDataSql(strSql,new Object[]{workStation});
	   }
	   catch(Exception e){
		   log.error("getWorkstationBelongInfo:",e);
		   return null;
	   }
   }
}
