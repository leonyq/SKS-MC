package com.more.mes.pda.service.pg;

import java.util.List;
import java.util.Map;

import com.more.mes.pda.service.PdaBaseServiceUtils;

public class PdaServiceUtils extends PdaBaseServiceUtils{

	/**
     * 根据单据类型查询单据信息
     * @param docType 单据类型
     * @param dataAuth 组织机构
     * @param areaSn 仓库SN
     * @return
     */
	@Override
    public List<Map> getDocForType(String docType,String dataAuth,String area){
    	try{
    		//初始化变量
    		String strDocType=null==docType?"":docType;
			String strOrgCode=null==dataAuth?"":dataAuth;
			String areaSn=null==area?"":area; 
    		String sqlStr="SELECT T.WDI_DOC_NUM,T.WDI_URGENT_FLAG FROM  \r\n" + 
    				"(SELECT A.WDI_DOC_NUM,COALESCE(A.WDI_URGENT_FLAG,'N') AS WDI_URGENT_FLAG,A.WDI_CREATE_TIME  \r\n" + 
    				"FROM T_WMS_DOC_INFO A  \r\n" + 
    				"LEFT JOIN T_WMS_DOC_TYPE B ON A.WDI_DOC_TYPE=B.WDT_TYPE_SN   \r\n" + 
    				"LEFT JOIN T_WMS_DISPATCH_TYPE C ON A.WDI_DISPATCH_TYPE=C.WDO_DISPATCH_SN AND A.DATA_AUTH=C.DATA_AUTH \r\n" + 
    				"AND A.WDI_DOC_TYPE=C.WDT_TYPE_SN \r\n" + 
    				"WHERE A.WDI_DOC_TYPE=? AND A.DATA_AUTH=? AND A.DATA_AUTH=B.DATA_AUTH  \r\n" + 
    				"AND (A.WDI_STATUS <>'3' OR  \r\n" + 
    				"(CASE COALESCE(C.WDO_HANDOVER_FLAG,'') WHEN '' THEN B.WDT_HANDOVER_FLAG ELSE C.WDO_HANDOVER_FLAG END)='Y') \r\n" + 
    				"AND ? NOT IN('DJ07','DJ08','DJ09')  \r\n" + 
    				"--2018-11-26 by cc 添加仓库过滤，可直接用下面的语句替换旧的，为确保查询结果，下面的语句先只做为过滤条件 \r\n" + 
    				"AND A.WDI_DOC_NUM IN ( \r\n" + 
    				"--入库 \r\n" + 
    				"SELECT DISTINCT \r\n" + 
    				"A.WRI_DOC_NUM AS WDI_DOC_NUM \r\n" + 
    				"FROM T_WMS_RECEIVE_ITEM A \r\n" + 
    				"LEFT JOIN T_WMS_RECEIVE_DOC B ON A.WRI_DOC_NUM=B.WRD_DOC_NUM \r\n" + 
    				"LEFT JOIN T_WMS_DOC_TYPE C ON B.WRD_DOC_TYPE=C.WDT_TYPE_SN   \r\n" + 
    				"LEFT JOIN T_WMS_DISPATCH_TYPE D ON B.WRD_DISPATCH_SN=D.WDO_DISPATCH_SN AND B.WRD_DOC_TYPE=D.WDT_TYPE_SN AND B.DATA_AUTH=D.DATA_AUTH \r\n" + 
    				"WHERE B.WRD_DOC_TYPE=? AND B.DATA_AUTH=? AND B.DATA_AUTH=C.DATA_AUTH  \r\n" + 
    				"AND (B.WRD_STATUS <>'3' OR  \r\n" + 
    				"--DECODE(NVL(D.WDO_HANDOVER_FLAG,''),'',C.WDT_HANDOVER_FLAG,D.WDO_HANDOVER_FLAG)='Y' \r\n" + 
    				"--单据交接标识为Y的情况下，判定单据是否已交接，需要显示未交接完成的单 \r\n" + 
    				"((CASE COALESCE(D.WDO_HANDOVER_FLAG,'') WHEN '' THEN C.WDT_HANDOVER_FLAG ELSE D.WDO_HANDOVER_FLAG END)='Y' AND EXISTS( \r\n" + 
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
    				"--出库 \r\n" + 
    				"SELECT DISTINCT \r\n" + 
    				"A.WOI_DOC_NUM AS WDI_DOC_NUM \r\n" + 
    				"FROM T_WMS_OUTSTOCK_ITEM A \r\n" + 
    				"LEFT JOIN T_WMS_OUTSTOCK_DOC B ON A.WOI_DOC_NUM=B.WOD_DOC_NUM \r\n" + 
    				"LEFT JOIN T_WMS_DOC_TYPE C ON B.WOD_DOC_TYPE=C.WDT_TYPE_SN   \r\n" + 
    				"LEFT JOIN T_WMS_DISPATCH_TYPE D ON B.WOD_DISPATCH_SN=D.WDO_DISPATCH_SN AND B.WOD_DOC_TYPE=D.WDT_TYPE_SN AND B.DATA_AUTH=D.DATA_AUTH \r\n" + 
    				"WHERE B.WOD_DOC_TYPE=? AND B.DATA_AUTH=? AND B.DATA_AUTH=C.DATA_AUTH  \r\n" + 
    				"AND (B.WOD_STATUS <>'3' OR  \r\n" + 
    				"--DECODE(NVL(D.WDO_HANDOVER_FLAG,''),'',C.WDT_HANDOVER_FLAG,D.WDO_HANDOVER_FLAG)='Y' \r\n" + 
    				"--单据交接标识为Y的情况下，判定单据是否已交接，需要显示未交接完成的单 \r\n" + 
    				"((CASE COALESCE(D.WDO_HANDOVER_FLAG,'') WHEN '' THEN C.WDT_HANDOVER_FLAG ELSE D.WDO_HANDOVER_FLAG END)='Y' AND EXISTS( \r\n" + 
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
    				"--调拨 \r\n" + 
    				"SELECT DISTINCT \r\n" + 
    				"A.WAI_DOC_NUM AS WDI_DOC_NUM \r\n" + 
    				"FROM T_WMS_ALLOT_ITEM A \r\n" + 
    				"LEFT JOIN T_WMS_ALLOT_DOC B ON A.WAI_DOC_NUM=B.WAD_DOC_NUM \r\n" + 
    				"LEFT JOIN T_WMS_DOC_TYPE C ON B.WAD_DOC_TYPE=C.WDT_TYPE_SN   \r\n" + 
    				"LEFT JOIN T_WMS_DISPATCH_TYPE D ON B.WAD_DISPATCH_SN=D.WDO_DISPATCH_SN AND B.WAD_DOC_TYPE=D.WDT_TYPE_SN AND B.DATA_AUTH=D.DATA_AUTH \r\n" + 
    				"WHERE B.WAD_DOC_TYPE=? AND B.DATA_AUTH=? AND B.DATA_AUTH=C.DATA_AUTH  \r\n" + 
    				"AND (B.WAD_STATUS <>'3' OR  \r\n" + 
    				"--DECODE(NVL(D.WDO_HANDOVER_FLAG,''),'',C.WDT_HANDOVER_FLAG,D.WDO_HANDOVER_FLAG)='Y' \r\n" + 
    				"--单据交接标识为Y的情况下，判定单据是否已交接，需要显示未交接完成的单 \r\n" + 
    				"((CASE COALESCE(D.WDO_HANDOVER_FLAG,'') WHEN '' THEN C.WDT_HANDOVER_FLAG ELSE D.WDO_HANDOVER_FLAG END)='Y' AND EXISTS( \r\n" + 
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
    				"--盘点单\r\n" + 
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
    				" \r\n" + 
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
    				"WHERE A.PM_STATUS IN('4','5') AND A.PM_CLOSE_DATE>(NOW()::TIMESTAMP+'-30 DAY') \r\n" + 
    				"AND ? IN('DJ09')  \r\n" + 
    				"AND A.DATA_AUTH=? \r\n" + 
    				")T \r\n" + 
    				"ORDER BY COALESCE(T.WDI_URGENT_FLAG,'N') DESC,T.WDI_CREATE_TIME DESC";
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
}
