package com.more.mes.pda.service.oracle;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.mes.pda.service.PdaBaseServiceUtils;

public class PdaServiceUtils extends PdaBaseServiceUtils{

	
	/**
	 * 链接测试
	 * @return
	 */
	public List<Map> checkConnect(){
		String sqlStr = "SELECT 1 FROM DUAL";
		List<Map> list = modelService.listDataSql(sqlStr);
		return list;
	}
	
	
	/**
	 * 登录APP版本升级接口
	 * @return
	 */
	
	public List<Map> getAppVersion(){
		String sqlStr = "SELECT NVL(T.TPU_VERSION,0.0) AS VERSION_NO FROM T_PDA_UPDATE T WHERE ROWNUM=1";
		List<Map> list = modelService.listDataSql(sqlStr);
		return list;
	}
	
	
	
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
    				"(SELECT A.WDI_DOC_NUM,NVL(A.WDI_URGENT_FLAG,'N') AS WDI_URGENT_FLAG,A.WDI_CREATE_TIME  \r\n" + 
    				"FROM T_WMS_DOC_INFO A  \r\n" + 
    				"LEFT JOIN T_WMS_DOC_TYPE B ON A.WDI_DOC_TYPE=B.WDT_TYPE_SN   \r\n" + 
    				"LEFT JOIN T_WMS_DISPATCH_TYPE C ON A.WDI_DISPATCH_TYPE=C.WDO_DISPATCH_SN AND A.DATA_AUTH=C.DATA_AUTH \r\n" + 
    				"AND A.WDI_DOC_TYPE=C.WDT_TYPE_SN \r\n" + 
    				"WHERE A.WDI_DOC_TYPE=? AND A.DATA_AUTH=? AND A.DATA_AUTH=B.DATA_AUTH  \r\n" + 
    				"AND (A.WDI_STATUS <>'3' OR  \r\n" + 
    				"DECODE(NVL(C.WDO_HANDOVER_FLAG,''),'',B.WDT_HANDOVER_FLAG,C.WDO_HANDOVER_FLAG)='Y') \r\n" + 
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
    				"ORDER BY NVL(T.WDI_URGENT_FLAG,'N') DESC,T.WDI_CREATE_TIME DESC";  		//生成参数

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
	
	public List<Map> getDocInfoALL_1(String TypeSn,String OCode
			,String DocSn,String SaleSn,String StartTime,String EndTime,String strOrgCode){
		String sqlStr = "SELECT T.WDI_DOC_NUM 单号,TO_CHAR(T.WDI_CREATE_TIME,'YYYY-MM-DD HH24:MI:SS') 时间,T.WDI_STATUS 状态,T.WDI_URGENT_FLAG 加急标识\r\n" + 
				"                                    FROM (SELECT T.ROWID,T.WDI_DOC_NUM,T.WDI_CREATE_TIME,\r\n" + 
				"                                    DECODE(T.WDI_STATUS,'1','开立','2','操作中','3','关结') AS WDI_STATUS,T.WDI_URGENT_FLAG \r\n" + 
				"                                    FROM T_WMS_DOC_INFO T\r\n" + 
				"                                    WHERE (T.WDI_DOC_TYPE=?)\r\n" + 
				"                                    AND (T.DATA_AUTH=? OR NVL(?,'0')='0')\r\n" + 
				"                                    AND (T.WDI_DOC_NUM=? OR NVL(?,'0')='0')\r\n" + 
				"                                    AND (TO_DATE(TO_CHAR(T.WDI_CREATE_TIME,'YYYY-MM-DD'),'YYYY-MM-DD')>=TO_DATE(?,'YYYY-MM-DD') OR NVL(?,'0')='0')\r\n" + 
				"                                    AND (TO_DATE(TO_CHAR(T.WDI_CREATE_TIME,'YYYY-MM-DD'),'YYYY-MM-DD')<=TO_DATE(?,'YYYY-MM-DD') OR NVL(?,'0')='0')\r\n" + 
				"                                    --AND T.WDI_STATUS<>'3' \r\n" + 
				"                                    AND (? IS NULL OR 0<(SELECT COUNT(1) FROM T_WMS_RECEIVE_ITEM A WHERE T.WDI_DOC_NUM=A.WRI_DOC_NUM AND A.WRI_CONNECT_DOC=?))\r\n" + 
				"                                    AND T.DATA_AUTH=?\r\n" + 
				"                                    ORDER BY T.WDI_URGENT_FLAG DESC,T.WDI_CREATE_TIME DESC,T.WDI_DOC_NUM DESC)T\r\n" + 
				"                                    WHERE ROWNUM<=50";
		 Object[] params=new Object[] {
         		TypeSn,
         		OCode,
         		OCode,
         		DocSn,
         		DocSn,
         		StartTime,
         		StartTime,
         		EndTime,
         		EndTime,
         		SaleSn,
         		SaleSn,
         		strOrgCode
         };
		List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	
	public List<Map> getDocInfoALL_2(String TypeSn,String OCode
			,String DocSn,String SaleSn,String StartTime,String EndTime,String strOrgCode){
		String sqlStr = "SELECT T.WDI_DOC_NUM 单号,TO_CHAR(T.WDI_CREATE_TIME,'YYYY-MM-DD HH24:MI:SS') 时间,T.WDI_STATUS 状态,T.WDI_URGENT_FLAG 加急标识\r\n" + 
				"                                    FROM (SELECT T.ROWID,T.WDI_DOC_NUM,T.WDI_CREATE_TIME,\r\n" + 
				"                                    DECODE(T.WDI_STATUS,'1','开立','2','操作中','3','关结') AS WDI_STATUS,T.WDI_URGENT_FLAG \r\n" + 
				"                                    FROM T_WMS_DOC_INFO T\r\n" + 
				"                                    WHERE (T.WDI_DOC_TYPE=?)\r\n" + 
				"                                    AND (T.DATA_AUTH=? OR NVL(?,'0')='0')\r\n" + 
				"                                    AND (T.WDI_DOC_NUM=? OR NVL(?,'0')='0')\r\n" + 
				"                                    AND (TO_DATE(TO_CHAR(T.WDI_CREATE_TIME,'YYYY-MM-DD'),'YYYY-MM-DD')>=TO_DATE(?,'YYYY-MM-DD') OR NVL(?,'0')='0')\r\n" + 
				"                                    AND (TO_DATE(TO_CHAR(T.WDI_CREATE_TIME,'YYYY-MM-DD'),'YYYY-MM-DD')<=TO_DATE(?,'YYYY-MM-DD') OR NVL(?,'0')='0')\r\n" + 
				"                                    --AND T.WDI_STATUS<>'3' \r\n" + 
				"                                    AND (? IS NULL OR 0<(SELECT COUNT(1) FROM T_WMS_OUTSTOCK_ITEM A WHERE T.WDI_DOC_NUM=A.WOI_DOC_NUM AND A.WOI_CONNECT_DOC=?))\r\n" + 
				"                                    ORDER BY T.WDI_URGENT_FLAG DESC,T.WDI_CREATE_TIME DESC,T.WDI_DOC_NUM DESC)T\r\n" + 
				"                                    WHERE ROWNUM<=50";
		Object[] params=new Object[] {
        		TypeSn,
        		OCode,
        		OCode,
        		DocSn,
        		DocSn,
        		StartTime,
        		StartTime,
        		EndTime,
        		EndTime,
        		SaleSn,
        		SaleSn
        };
		List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	
	public List<Map> getDocInfoALL_DJ07(String TypeSn,String OCode
			,String DocSn,String SaleSn,String StartTime,String EndTime,String strOrgCode){
		String sqlStr =  "SELECT T.PM_MO_NUMBER 制令单号,TO_CHAR(T.PM_ISSUED_DATE,'YYYY-MM-DD HH24:MI:SS') 下达时间,\r\n" + 
				"                                            DECODE(T.PM_STATUS,'0','开立','1','投产','2','上线','3','下线','4','关结','5','异常关结') 制令单状态\r\n" + 
				"                                            FROM (SELECT T.* \r\n" + 
				"                                            FROM T_PM_MO_BASE T\r\n" + 
				"                                            WHERE --T.PM_STATUS NOT IN ('4','5') AND \r\n" + 
				"                                            (T.DATA_AUTH=? OR NVL(?,'0')='0')\r\n" + 
				"                                            AND (T.PM_MO_NUMBER=? OR NVL(?,'0')='0')\r\n" + 
				"                                            AND (TO_DATE(TO_CHAR(T.PM_ISSUED_DATE,'YYYY-MM-DD'),'YYYY-MM-DD')>=TO_DATE(?,'YYYY-MM-DD') OR NVL(?,'0')='0')\r\n" + 
				"                                            AND (TO_DATE(TO_CHAR(T.PM_ISSUED_DATE,'YYYY-MM-DD'),'YYYY-MM-DD')<=TO_DATE(?,'YYYY-MM-DD') OR NVL(?,'0')='0') \r\n" + 
				"                                            ORDER BY T.PM_ISSUED_DATE DESC,T.PM_MO_NUMBER DESC)T\r\n" + 
				"                                            WHERE ROWNUM<=50";
		Object[] params=new Object[] {
        		OCode,
        		OCode,
        		DocSn,
        		DocSn,
        		StartTime,
        		StartTime,
        		EndTime,
        		EndTime
        };
		List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	
	public List<Map> getDocInfoALL_DJ17(String TypeSn,String OCode
			,String DocSn,String SaleSn,String StartTime,String EndTime,String strOrgCode){
		String sqlStr =  "SELECT * FROM (SELECT T.WID_DOC_NUM 盘点单号,TO_CHAR(T.WID_CREATE_TIME,'YYYY-MM-DD HH24:MI:SS') 开单时间,\r\n" + 
				"                                            DECODE(T.WID_STATUS,'1','开立','2','操作中','3','关结','4','人工关结') 状态\r\n" + 
				"                                            FROM T_WMS_INVENTORY_DOC T \r\n" + 
				"                                            WHERE (T.DATA_AUTH=? OR NVL(?,'0')='0')\r\n" + 
				"                                            AND (T.WID_DOC_NUM=? OR NVL(?,'0')='0')\r\n" + 
				"                                            AND (TO_DATE(TO_CHAR(T.WID_CREATE_TIME,'YYYY-MM-DD'),'YYYY-MM-DD')>=TO_DATE(?,'YYYY-MM-DD') OR NVL(?,'0')='0')\r\n" + 
				"                                            AND (TO_DATE(TO_CHAR(T.WID_CREATE_TIME,'YYYY-MM-DD'),'YYYY-MM-DD')<=TO_DATE(?,'YYYY-MM-DD') OR NVL(?,'0')='0')\r\n" + 
				"                                            --AND T.WID_STATUS NOT IN ('3','4') \r\n" + 
				"                                            ORDER BY T.WID_CREATE_TIME DESC,T.WID_DOC_NUM DESC)T\r\n" + 
				"                                            WHERE ROWNUM<=50";
		Object[] params=new Object[] {
        		OCode,
        		OCode,
        		DocSn,
        		DocSn,
        		StartTime,
        		StartTime,
        		EndTime,
        		EndTime
        };
		List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	public List<Map> getDocInfoALL_DJ18(String TypeSn,String OCode
			,String DocSn,String SaleSn,String StartTime,String EndTime,String strOrgCode){
		String sqlStr =  "SELECT * FROM(SELECT T.WSD_DOC_NUM 单号,TO_CHAR(T.WAD_CREATE_TIME,'YYYY-MM-DD HH24:MI:SS') 时间,\r\n" + 
				"                                            DECODE(T.WAD_SCARP_TYPE,'1','超过保质期','2','故障损坏','3','人为损坏','4','生产损耗','5','其他') 类型 \r\n" + 
				"                                            FROM T_WMS_SCARP_DOC T\r\n" + 
				"                                            WHERE (T.DATA_AUTH=? OR NVL(?,'0')='0')\r\n" + 
				"                                            AND (T.WSD_DOC_NUM=? OR NVL(?,'0')='0')\r\n" + 
				"                                            AND (TO_DATE(TO_CHAR(T.WAD_CREATE_TIME,'YYYY-MM-DD'),'YYYY-MM-DD')>=TO_DATE(?,'YYYY-MM-DD') OR NVL(?,'0')='0')\r\n" + 
				"                                            AND (TO_DATE(TO_CHAR(T.WAD_CREATE_TIME,'YYYY-MM-DD'),'YYYY-MM-DD')<=TO_DATE(?,'YYYY-MM-DD') OR NVL(?,'0')='0')\r\n" + 
				"                                            ORDER BY T.WAD_CREATE_TIME DESC,T.WSD_DOC_NUM DESC)T\r\n" + 
				"                                            WHERE ROWNUM<=50";
		Object[] params=new Object[] {
        		OCode,
        		OCode,
        		DocSn,
        		DocSn,
        		StartTime,
        		StartTime,
        		EndTime,
        		EndTime
        };
		List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	
	public List<Map> getDocInfoALL_DJ19(String TypeSn,String OCode
			,String DocSn,String SaleSn,String StartTime,String EndTime,String strOrgCode){
		String sqlStr =   "SELECT * FROM(SELECT T.WRD_DOC_NUM 复检单号,T.WRD_TEST_DOC 检验单号,T.WRD_ITEM_CODE 品号,\r\n" + 
				"                                                A.CI_ITEM_NAME 品名,T.WRD_ITEM_NUM 物料数量, TO_CHAR(T.WRD_CREATE_TIME,'YYYY-MM-DD HH24:MI:SS') 时间,\r\n" + 
				"                                                DECODE(T.WRD_TEST_STEP,'0','IQC','1','FQC','2','OQC','3','IPQC') 检测阶别,\r\n" + 
				"                                                DECODE(T.WRD_SAMPLE_TYPE,'1','外购物料检验','2','委外产品检验','3','客供料检验','4','驻厂检验','5','特殊订单物料检验','6','库存物料周期复检') 检验类型\r\n" + 
				"                                                FROM T_WMS_RECHECK_DOC T\r\n" + 
				"                                                LEFT JOIN T_CO_ITEM A ON T.WRD_ITEM_CODE=A.CI_ITEM_CODE\r\n" + 
				"                                                WHERE (T.DATA_AUTH=? OR NVL(?,'0')='0')\r\n" + 
				"                                                AND (T.WRD_DOC_NUM=? OR NVL(?,'0')='0')\r\n" + 
				"                                                AND (TO_DATE(TO_CHAR(T.WRD_CREATE_TIME,'YYYY-MM-DD'),'YYYY-MM-DD')>=TO_DATE(?,'YYYY-MM-DD') OR NVL(?,'0')='0')\r\n" + 
				"                                                AND (TO_DATE(TO_CHAR(T.WRD_CREATE_TIME,'YYYY-MM-DD'),'YYYY-MM-DD')<=TO_DATE(?,'YYYY-MM-DD') OR NVL(?,'0')='0')\r\n" + 
				"                                                ORDER BY T.WRD_CREATE_TIME DESC,T.WRD_DOC_NUM DESC)T\r\n" + 
				"                                                WHERE ROWNUM<=50";
		 Object[] params=new Object[] {
         		OCode,
         		OCode,
         		DocSn,
         		DocSn,
         		StartTime,
         		StartTime,
         		EndTime,
         		EndTime
         };
		 List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	
	public List<Map> getDocInfoALL_DJ20(String TypeSn,String OCode
			,String DocSn,String SaleSn,String StartTime,String EndTime,String strOrgCode){
		String sqlStr =   "SELECT * FROM(SELECT T.WLD_LOCK_DOC 单号,TO_CHAR(T.WLD_CREATE_TIME,'YYYY-MM-DD HH24:MI:SS') 时间,\r\n" + 
				"                                            DECODE(T.WLD_LOCK_STATUS,'1','锁定','2','解锁') 状态 \r\n" + 
				"                                            FROM T_WMS_LOCKSTOCK_DOC T\r\n" + 
				"                                            WHERE (T.DATA_AUTH=? OR NVL(?,'0')='0')\r\n" + 
				"                                            AND (T.WLD_LOCK_DOC=? OR NVL(?,'0')='0')\r\n" + 
				"                                            AND (TO_DATE(TO_CHAR(T.WLD_CREATE_TIME,'YYYY-MM-DD'),'YYYY-MM-DD')>=TO_DATE(?,'YYYY-MM-DD') OR NVL(?,'0')='0')\r\n" + 
				"                                            AND (TO_DATE(TO_CHAR(T.WLD_CREATE_TIME,'YYYY-MM-DD'),'YYYY-MM-DD')<=TO_DATE(?,'YYYY-MM-DD') OR NVL(?,'0')='0')\r\n" + 
				"                                            ORDER BY T.WLD_CREATE_TIME DESC,T.WLD_LOCK_DOC DESC)T\r\n" + 
				"                                            WHERE ROWNUM<=50";
		Object[] params=new Object[] {
        		OCode,
        		OCode,
        		DocSn,
        		DocSn,
        		StartTime,
        		StartTime,
        		EndTime,
        		EndTime
        };
		 List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	
	public List<Map> getDocItem_1(String TypeSn,
			String DocSn,String strOrgCode){
		String sqlStr =   "select a.wri_doc_num 进货单号, a.wri_item_code 品号,\r\n" + 
				"                                        b.ci_item_name 品名,b.ci_item_spec 规格,\r\n" + 
				"                                        NVL(a.wri_plan_num,0) 计划量,NVL(a.wri_receive_num,0) 已收量\r\n" + 
				"                                        from t_Wms_Receive_Item a\r\n" + 
				"                                        left join T_CO_ITEM b on a.wri_item_code=b.ci_item_code and a.data_auth=b.data_auth\r\n" + 
				"                                        where a.wri_doc_num=? and a.data_auth=? order by 品号 asc";
		 Object[] params=new Object[] {
         		DocSn,
         		strOrgCode
         };
		 List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	
	
	public List<Map> getDocItem_DJ07(String TypeSn,
			String DocSn,String strOrgCode){
		String sqlStr =   "select t.project_id 工单号,b.ci_item_code 品号,\r\n" + 
				"                                        b.ci_item_name 品名,NVL(t.PRODUCT_COUNT,0) 生产数量,\r\n" + 
				"                                        NVL(t.FINISH_COUNT,0) 完工数量,t.CREATE_TIME 开立时间, \r\n" + 
				"                                        DECODE(T.PROJECT_TYPE,'0','正常','1','试产','2','RMA','3','其他')工单类型,\r\n" + 
				"                                        decode(t.PROJECT_STATUS, '0', '开立', '1', '投产', '2', '关结') 状态\r\n" + 
				"                                        from t_pm_project_base t \r\n" + 
				"                                        left join T_CO_ITEM b on t.product_material = b.ci_item_code and t.data_auth=b.data_auth\r\n" + 
				"                                        where t.project_id = ? and t.data_auth=? ";
		 Object[] params=new Object[] {
         		DocSn,
         		strOrgCode
         };
		 List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	
	public List<Map> getDocItem_DJ16(String TypeSn,
			String DocSn,String strOrgCode){
		String sqlStr =   "select b.ci_item_code 品号, b.ci_item_name 品名,\r\n" + 
				"                                            b.ci_item_spec 规格,a.wai_plan_num 计划数量,\r\n" + 
				"                                            a.wai_allot_num 已调数量,t.WAD_CREATE_TIME 开单时间,\r\n" + 
				"                                            decode(t.WAD_STATUS,'1','开立','2','操作中','3','关结') 调拨状态\r\n" + 
				"                                            from T_WMS_ALLOT_DOC t\r\n" + 
				"                                            left join T_WMS_ALLOT_ITEM a on t.wad_doc_num = a.wai_doc_num\r\n" + 
				"                                            left join T_CO_ITEM b on a.wai_item_code = b.ci_item_code and t.data_auth=b.data_auth\r\n" + 
				"                                            where t.wad_doc_num = ? and t.data_auth=? order by t.WAD_ALLOT_DATE desc";
		 Object[] params=new Object[] {
         		DocSn,
         		strOrgCode
         };
		 List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	
	public List<Map> getDocItem_DJ20(String TypeSn,
			String DocSn,String strOrgCode){
		String sqlStr =   "SELECT T.WLD_LOCK_DOC 单号,T.WLD_ITEM_CODE 品号,A.CI_ITEM_NAME 品名,\r\n" + 
				"                                            T.WLD_LOCK_NUM 锁定数量,DECODE(T.WLD_LOCK_STATUS,'1','锁定','2','解锁') 锁定状态\r\n" + 
				"                                            FROM T_WMS_LOCKSTOCK_DETAIL T \r\n" + 
				"                                            LEFT JOIN T_CO_ITEM A ON T.WLD_ITEM_CODE=A.CI_ITEM_CODE and t.data_auth=a.data_auth\r\n" + 
				"                                            WHERE T.WLD_LOCK_DOC =? and t.data_auth=? ";
		 Object[] params=new Object[] {
         		DocSn,
         		strOrgCode
         };
		 List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	
	public List<Map> getItemCode(String itemSn,
			String strOrgCode){
		String sqlStr =   "SELECT T.WLD_LOCK_DOC 单号,T.WLD_ITEM_CODE 品号,A.CI_ITEM_NAME 品名,\r\n" + 
				"                                            T.WLD_LOCK_NUM 锁定数量,DECODE(T.WLD_LOCK_STATUS,'1','锁定','2','解锁') 锁定状态\r\n" + 
				"                                            FROM T_WMS_LOCKSTOCK_DETAIL T \r\n" + 
				"                                            LEFT JOIN T_CO_ITEM A ON T.WLD_ITEM_CODE=A.CI_ITEM_CODE and t.data_auth=a.data_auth\r\n" + 
				"                                            WHERE T.WLD_LOCK_DOC =? and t.data_auth=? ";
		Object[] params=new Object[] {
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				strOrgCode
		};
		 List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	
	public List<Map> getItemNumN(String itemCode,
			String itemSn,String strOrgCode){
		String sqlStr =   "select nvl(sum(T.WSI_ITEM_NUM), 0) AS NUM\r\n" + 
				"                                          from t_wms_stock_info T\r\n" + 
				"                                         where EXISTS( select I.WSI_STORAGE_CODE\r\n" + 
				"                                                      from t_wms_stock_info I\r\n" + 
				"                                                     where ((I.WSI_ITEM_SN LIKE ?||'%'\r\n" + 
				"                                                        OR I.WSI_FIRST_SN LIKE ?||'%'\r\n" + 
				"                                                        OR I.WSI_SECOND_SN LIKE ?||'%'\r\n" + 
				"                                                        OR I.WSI_THIRD_SN LIKE ?||'%'\r\n" + 
				"                                                        OR I.WSI_FOURTH_SN LIKE ?||'%')\r\n" + 
				"                                                        OR (I.WSI_STORAGE_CODE LIKE ?||'%')\r\n" + 
				"                                                        OR (I.WSI_ITEM_CODE LIKE ?||'%'))\r\n" + 
				"                                           AND T.WSI_STOCK_FLAG = '2'\r\n" + 
				"                                           AND T.WSI_ITEM_CODE IN (?)\r\n" + 
				"                                           AND T.WSI_STORAGE_CODE=I.WSI_STORAGE_CODE)\r\n" + 
				"                                           AND T.DATA_AUTH=?";
		Object[] params=new Object[] {
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemCode,
				strOrgCode
		};
		 List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	
	public List<Map> getItemNumY(String itemCode,
			String itemSn,String strOrgCode){
		String sqlStr =   "select nvl(sum(T.WSI_ITEM_NUM), 0) AS NUM\r\n" + 
				"                                          from t_wms_stock_info T\r\n" + 
				"                                         where EXISTS( select I.WSI_WH_CODE\r\n" + 
				"                                                      from t_wms_stock_info I\r\n" + 
				"                                                     where ((I.WSI_ITEM_SN LIKE ?||'%'\r\n" + 
				"                                                        OR I.WSI_FIRST_SN LIKE ?||'%'\r\n" + 
				"                                                        OR I.WSI_SECOND_SN LIKE ?||'%'\r\n" + 
				"                                                        OR I.WSI_THIRD_SN LIKE ?||'%'\r\n" + 
				"                                                        OR I.WSI_FOURTH_SN LIKE ?||'%')\r\n" + 
				"                                                        OR (I.WSI_STORAGE_CODE LIKE ?||'%')\r\n" + 
				"                                                        OR (I.WSI_ITEM_CODE LIKE ?||'%'))\r\n" + 
				"                                           AND T.WSI_STOCK_FLAG = '2'\r\n" + 
				"                                           AND T.WSI_ITEM_CODE IN (?)\r\n" + 
				"                                           AND T.WSI_WH_CODE=I.WSI_WH_CODE)\r\n" + 
				"                                           AND T.DATA_AUTH=?";
		Object[] params=new Object[] {
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemCode,
				strOrgCode
		};
		 List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	
	public List<Map> getSNList(String itemSn,
			String docNumber,String strOrgCode){
		String sqlStr =   "select T.WID_ITEM_SN    CO_SN,\r\n" + 
				"                                               T.WID_ITEM_CODE  ST_ITEM_CODE,\r\n" + 
				"                                               T.WID_STOCK_NUM  ST_STOCK_NUM,\r\n" + 
				"                                               DECODE(WID_ITEM_STATUS,'1',T.WID_STOCK_NUM,T.WID_INVENTORY_NUM)  WSCDS_CHECK_NUM\r\n" + 
				"                                                from T_WMS_INVENTORY_DETAIL T\r\n" + 
				"                                                WHERE EXISTS(SELECT A.WSI_ITEM_SN FROM T_WMS_STOCK_INFO A\r\n" + 
				"                                                WHERE (A.WSI_ITEM_SN=?\r\n" + 
				"                                                OR A.WSI_FIRST_SN=?\r\n" + 
				"                                                OR A.WSI_SECOND_SN=?\r\n" + 
				"                                                OR A.WSI_THIRD_SN=?\r\n" + 
				"                                                OR A.WSI_FOURTH_SN=?)\r\n" + 
				"                                                AND A.WSI_ITEM_SN=T.WID_ITEM_SN\r\n" + 
				"                                                AND A.DATA_AUTH=?\r\n" + 
				"                                                AND T.WID_DOC_NUM = ?\r\n" + 
				"                                                AND T.WID_ITEM_STATUS<>'4')\r\n" + 
				"                                                AND T.DATA_AUTH=?";
		Object[] params=new Object[] {
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				strOrgCode,
				docNumber,
				strOrgCode
		};
		 List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	public List<Map> GetSplitLog(String oldItem,
			String itemSn,String itemCode,String strOrgCode){
		String sqlStr =   "select T.WID_ITEM_SN    CO_SN,\r\n" + 
				"                                               T.WID_ITEM_CODE  ST_ITEM_CODE,\r\n" + 
				"                                               T.WID_STOCK_NUM  ST_STOCK_NUM,\r\n" + 
				"                                               DECODE(WID_ITEM_STATUS,'1',T.WID_STOCK_NUM,T.WID_INVENTORY_NUM)  WSCDS_CHECK_NUM\r\n" + 
				"                                                from T_WMS_INVENTORY_DETAIL T\r\n" + 
				"                                                WHERE EXISTS(SELECT A.WSI_ITEM_SN FROM T_WMS_STOCK_INFO A\r\n" + 
				"                                                WHERE (A.WSI_ITEM_SN=?\r\n" + 
				"                                                OR A.WSI_FIRST_SN=?\r\n" + 
				"                                                OR A.WSI_SECOND_SN=?\r\n" + 
				"                                                OR A.WSI_THIRD_SN=?\r\n" + 
				"                                                OR A.WSI_FOURTH_SN=?)\r\n" + 
				"                                                AND A.WSI_ITEM_SN=T.WID_ITEM_SN\r\n" + 
				"                                                AND A.DATA_AUTH=?\r\n" + 
				"                                                AND T.WID_DOC_NUM = ?\r\n" + 
				"                                                AND T.WID_ITEM_STATUS<>'4')\r\n" + 
				"                                                AND T.DATA_AUTH=?";
		Object[] params=new Object[] {
				strOrgCode,
				oldItem,
				oldItem,
				oldItem,
				itemSn,
				itemSn,
				itemSn,
				itemCode,
				itemCode,
				itemCode,
				strOrgCode
		};
		 List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	public List<Map> GetStockInfo(String itemSn,
			String strOrgCode){
		String sqlStr =   "SELECT ROWNUM  序号,T.*\r\n" + 
				"                                            FROM (SELECT\r\n" + 
				"                                            I.WSI_ITEM_CODE  品号,\r\n" + 
				"                                            I.WSI_ITEM_NUM     数量,\r\n" + 
				"                                            I.WSI_ITEM_SN       条码,\r\n" + 
				"                                            I.WSI_FIRST_SN       一级容器,\r\n" + 
				"                                            I.WSI_SECOND_SN       二级容器,\r\n" + 
				"                                            I.WSI_THIRD_SN       三级容器,\r\n" + 
				"                                            I.WSI_FOURTH_SN       四级容器,\r\n" + 
				"                                            I.WSI_WH_CODE         仓库SN,\r\n" + 
				"                                            I.WSI_DISTRICT_CODE  库区SN,\r\n" + 
				"                                            I.WSI_STORAGE_CODE         库位,\r\n" + 
				"                                            J.WA_AREA_NAME 库位名称，\r\n" + 
				"                                            DECODE(I.WSI_ITEM_FLAG,'Y','良品','N','不良') 品质\r\n" + 
				"                                            ,DECODE(I.WSI_RETURN_FLAG,'N','否','Y','是') 退料,\r\n" + 
				"                                            TO_CHAR(I.WSI_INVALID_DATE,'YYYY-MM-DD HH24:MI:SS') 失效期,\r\n" + 
				"                                            I.WSI_SUP_CODE   供应商,\r\n" + 
				"                                            TO_CHAR(I.WSI_PRODUCE_DATE,'YYYY-MM-DD HH24:MI:SS') 生产日期,\r\n" + 
				"                                            DECODE(I.WSI_FREEZE_FLAG,'Y','冻结','N','解冻') 解冻状态,\r\n" + 
				"                                            DECODE(I.WSI_INSPECT_FLAG,'Y','已检','N','未检')  检测状态,\r\n" + 
				"                                            TO_CHAR(I.WSI_RECEIVE_TIME,'YYYY-MM-DD HH24:MI:SS') 入库时间,\r\n" + 
				"                                            I.WSI_RECEIVE_EMP    入库人,\r\n" + 
				"                                            I.DATA_AUTH          机构代码,\r\n" + 
				"                                            DECODE(I.WSI_STOCK_FLAG,'1','未入库','2','在库','非在库') 库存状态,\r\n" + 
				"                                            I.WSI_CONNECT_DOC      工单号,\r\n" + 
				"                                            I.WSI_SALE_DOC     订单号,\r\n" + 
				"                                            I.WSI_LOT_NO      批次,\r\n" + 
				"                                            M.CI_ITEM_NAME 品名,\r\n" + 
				"                                            M.CI_ITEM_SPEC 规格\r\n" + 
				"                                            FROM T_WMS_STOCK_INFO I \r\n" + 
				"                                            INNER JOIN T_CO_ITEM M ON I.WSI_ITEM_CODE=M.CI_ITEM_CODE AND M.DATA_AUTH=?\r\n" + 
				"                                            LEFT JOIN T_WMS_AREA J ON I.WSI_STORAGE_CODE=J.WA_AREA_SN\r\n" + 
				"                                            WHERE ((I.WSI_ITEM_SN LIKE ?||'%'\r\n" + 
				"                                                OR I.WSI_FIRST_SN LIKE ?||'%'\r\n" + 
				"                                                OR I.WSI_SECOND_SN LIKE ?||'%'\r\n" + 
				"                                                 OR I.WSI_THIRD_SN LIKE ?||'%'\r\n" + 
				"                                                OR I.WSI_FOURTH_SN LIKE ?||'%')\r\n" + 
				"                                                OR (I.WSI_STORAGE_CODE LIKE ?||'%')\r\n" + 
				"                                              OR (I.WSI_ITEM_CODE LIKE ?||'%'))\r\n" + 
				"                                            AND I.DATA_AUTH=?\r\n" + 
				"                                            ORDER BY I.WSI_ITEM_SN )T";
		Object[] params=new Object[] {
				strOrgCode,
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				itemSn,
				strOrgCode
		};
		 List<Map> list = modelService.listDataSql(sqlStr,params);
		return list;
	}
	
	public List<Map> getSysTime(){
		String sqlStr =   "SELECT TO_NUMBER(SYSDATE -  \r\n" + 
				"                                           TO_DATE('1970-01-01 8:0:0', 'YYYY-MM-DD HH24:MI:SS')) * 24 * 60 * 60 * 1000  AS TIME\r\n" + 
				"                                           FROM DUAL";
		
		 List<Map> list = modelService.listDataSql(sqlStr);
		return list;
	}
	
}
