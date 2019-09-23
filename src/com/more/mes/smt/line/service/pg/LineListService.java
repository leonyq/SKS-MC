/**
 * 
 */
package com.more.mes.smt.line.service.pg;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;

/**
 * @Title 线体仿真展示服务类
 * @Description
 * @ClassName LineListService
 * @author csj
 * @version 1.0 developer 2017-8-14 created
 * @see LineListService
 * @since 2017-8-14
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class LineListService
{

  private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

  /**
   * @Description: 获取线体展示列表
   * @return List
   * @throws
   */
  public List getShowLineList()
  {
    String sql = "SELECT DISTINCT (AA.CA_PARENTAREAID) AS LINE_SN," + "  D.CA_NAME AS LINE_NAME,"
                 + " D.CA_PARENTAREAID AS AREA_SN," + "  AA.CD_DEVICE_SN AS DEVICE_SN,"
                 + " AA.VALUE AS DEVICE_TYPE," + "  AA.CD_DEVICE_NAME AS DEVICE_NAME"
                 + " FROM (WITH T AS (SELECT *" + "   FROM T_CO_AREA E"
                 + " CONNECT BY PRIOR E.CA_PARENTAREAID = E.CA_ID" + " START WITH CA_TYPE = '2')"
                 + "  SELECT *" + "    FROM T" + " LEFT JOIN T_CO_AREA_DEVICE A"
                 + "    ON T.CA_ID = A.CA_ID" + " LEFT JOIN T_CO_DEVICE B"
                 + "     ON A.CAD_DEVICE_ID = B.ID"
                 + " LEFT JOIN SY_DICT_VAL C ON B.CD_DEVICE_TYPE = C.CODE "
                 + " WHERE A.CAD_DEVICE_ID IS NOT NULL) AA" + "   LEFT JOIN T_CO_AREA D"
                 + " ON AA.CA_PARENTAREAID = D.CA_ID";
    List list = modelService.listSql(sql, null, null, null, null);
    return list;
  }

  /**
   * @Description: 获取车间信息
   * @return List
   * @throws
   */
  public List getWorksationInfo()
  {
    String sql = "SELECT T.CA_ID ,T.CA_NAME,T.WA_SET_INFO FROM T_CO_AREA T WHERE T.CA_TYPE='0'";
   
    List list = modelService.listSql(sql, null, null, null, null);
    return list;
  }
  
  public List getWorksationInfoWithDataAuth(String dataAuth){
    String sqlWhere = "";
    if(StringUtils.isNotEmpty(dataAuth)){
        sqlWhere = " AND T.DATA_AUTH = '"+dataAuth+"'";
    }
    String sql = "SELECT T.CA_ID ,T.CA_NAME,T.WA_SET_INFO FROM T_CO_AREA T WHERE T.CA_TYPE='0'"+sqlWhere;
   
    List list = modelService.listSql(sql, null, null, null, null);
    return list;
  }

  /**
   * @Description: 获取线体信息
   * @return List
   * @throws
   */
  public List getAreaInfo(String areaSn)
  {
    String sql = "SELECT T.CA_ID, T.CA_NAME FROM T_CO_AREA T WHERE T.CA_PARENTAREAID= ? and T.CA_TYPE='1' ";
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("areaSn", areaSn);
    List list = modelService.listDataSql(sql, new Object[] {areaSn});
    return list; 
  }
  /**
   * 获取仓库下
   * @param areaSn
   * @return
   */
  public List getWorkstationDevice(String areaSn){
	  String sql = "select t.ca_id,"+
			       "t2.ca_type,"+
			       "t.id,"+
			       "t3.cd_device_sn,"+
			       "t3.cd_device_name,"+
			       "t3.cd_device_type,"+
			       "t3.picture_path"+
			  "	from t_co_area t2, t_co_area_device t"+
			  "	left join t_co_device t3"+
			  " on t.cad_device_id = t3.id"+
			  "	where t2.CA_TYPE = '0'"+
			  " and t.ca_id = t2.ca_id"+
			  " and t.ca_id = ?";
	    Map<String, String> sqlParaMap = new HashMap<String, String>();
	    sqlParaMap.put("areaSn", areaSn);

	    List list = modelService.listDataSql(sql, new Object[] {areaSn});
	    return list;
  }
  /**
   * @Description: 获取线体设备信息列表
   * @return List
   * @throws
   */
  public List getAreaDeviceInfo(String areaSn,String areaType)
  {
    String sql = "select t1.ca_id,t1.id,t3.cd_device_sn,t3.cd_device_name,t3.picture_path,t3.picture_name"+
				  "	from T_CO_AREA_DEVICE t1"+
				  "	left join T_CO_AREA t2 on t1.ca_id = t2.ca_id"+
				  "	left join t_co_device t3 on t1.cad_device_id=t3.id"+
				  "	where t1.ca_id=?";
    if ("2".equals(areaType)){
    	sql+="	and t2.ca_type='0'";
    }
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("areaSn", areaSn);
    List list = modelService.listDataSql(sql, new Object[] {areaSn});
    String sqlNext="	select t1.ca_id,"+
				   "    t1.id,"+
				   "    t3.cd_device_sn,"+
				   "    t3.cd_device_name,"+
				   "    t3.picture_path,"+
				   "    t3.picture_name"+
				   "	from T_CO_AREA_DEVICE t1"+
				   "		left join T_CO_AREA t2"+
				   "	on t1.ca_id = t2.ca_id"+
				   "	left join t_co_device t3"+
				   " 	 on t1.cad_device_id = t3.id"+
    			   "	where t1.ca_id in (select ca_id"+
				   "                   from T_CO_AREA"+
				   "                  where ca_parentareaid = ?"+
				   "                    and ca_type = '2')";
     sqlParaMap = new HashMap<String, String>();
     sqlParaMap.put("areaSn", areaSn);
    List AreaPoint = modelService.listDataSql(sqlNext, new Object[] {areaSn});
    list.addAll(AreaPoint);
    return list;
  }
  
  /**
   * 获取设备仓库目录以下设备
   * @param areaSn
   * @return
   */
  public List getAreaBaseDevice(String areaSn)
  {
    String sql = "select t1.ca_id,t3.cd_device_sn,t3.cd_device_name,t3.picture_path,t3.picture_name"+
				  "	from T_CO_AREA_DEVICE t1"+
				  "	left join T_CO_AREA t2 on t1.ca_id = t2.ca_id"+
				  "	left join t_co_device t3 on t1.cad_device_id=t3.id"+
				  "	where t1.ca_id=?";
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("areaSn", areaSn);
    List list = modelService.listDataSql(sql, new Object[] {areaSn});
    return list;
  }
  /**
   * @Description: 添加线体信息
   * @return List
   * @throws
   */
  public void addAreaInfo(String setInfo, String areaSn)

  {
    try{
    	 TableDataMapExt ext = new TableDataMapExt();
    	 ext.setTableName("T_CO_AREA");
    	 ext.setSqlWhere(" and CA_ID='" + areaSn + "'");
    	 ext.getColMap().put("WA_SET_INFO",setInfo);
    	 modelService.edit(ext);
    }catch(Exception e){
    	e.printStackTrace();
    	
    }
	 
  }

  /**
   * @Description: 获取线体参数信息
   * @return List
   * @throws
   */
  public List getWorkShopInfo(String areaSn)
  {
    String sql = "SELECT * FROM T_CO_WORKSHOP_SIMULATION T WHERE T.AREA_ID=?";
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("areaSn", areaSn);

    List list = modelService.listDataSql(sql, new Object[] {areaSn});
    return list;
  }

  /**
   * @Description: 获取生产前十大不良
   * @return List
   * @throws
   */
  public List getErrorCodeInfo(String areaSn)
  {
    String sql = "select * from (SELECT"+
				"		substr(aa.cec_name, 1, 8) cec_name,"+
				"		aa.num,"+
				"	ROW_NUMBER () OVER () AS rownum"+
				"	FROM"+
				"		("+
				"			SELECT"+
				"				coalesce (SUM(T .we_error_num), 0) num,"+
				"				b.ca_parentareaid,"+
				"				A .cec_name"+
				"			FROM"+
				"				t_wip_error T"+
				"			LEFT JOIN t_co_error_code A ON T .we_error_code = A .cec_code"+
				"			LEFT JOIN t_co_area b ON b.ca_id = T .WE_AREA_SN"+
				"			WHERE"+
				"				substr("+
				"					to_char("+
				"						T .we_test_time,"+
				"						'yyyy-mm-dd hh24:mi:ss'"+
				"					),"+
				"					1,"+
				"					10"+
				"				) = substr("+
				"					to_char("+
				"						CURRENT_DATE,"+
				"						'yyyy-mm-dd hh24:mi:ss'"+
				"					),"+
				"					1,"+
				"					10"+
				"				)"+
				"			GROUP BY"+
				"				b.ca_parentareaid,"+
				"				A .cec_name"+
				"			ORDER BY"+
				"				num DESC"+
				"		) aa"+
				"	WHERE"+
				"		aa.ca_parentareaid = ?) AA"+
				"	where  rownum <= 5";
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("areaSn", areaSn);
    List list = modelService.listDataSql(sql, new Object[] {areaSn});
    return list;
  }

  /**
   * @Description: 获取线体直通率信息
   * @return List
   * @throws
   */
  public List getLineRateInfo(String areaSn)
  {
	  String sql = "SELECT"+
					"	CASE"+
					"	WHEN SUM (COALESCE(A .MPS_MO_INPUT, 0)) = 0 THEN"+
					"	0"+
					"	ELSE"+
					"	ROUND("+
					"		SUM (COALESCE(A .MPS_OK_PCS, 0)) / SUM (COALESCE(A .MPS_MO_INPUT, 0)) * 100,"+
					"		2"+
					"	)"+
					"	END AS PERCNT"+
					"	FROM"+
					"	T_MID_PRODUCT_STATISTIC A"+
					"	LEFT JOIN T_CO_AREA B ON B.CA_ID = A .MPS_AREA_SN"+
					"	LEFT JOIN T_CO_AREA C ON C .CA_ID = B.CA_PARENTAREAID"+
					"	WHERE"+
					"	A .MPS_WORK_DATE = to_char(CURRENT_DATE, 'yyyy-MM-dd')"+
					"	AND C .CA_ID = ?";
	    Map<String, String> sqlParaMap = new HashMap<String, String>();
	    sqlParaMap.put("areaSn", areaSn);
	    List list = modelService.listDataSql(sql, new Object[] {areaSn});
	    return list;
  }

  /**
   * @Description: 获取DPPM信息
   * @return List
   * @throws
   */
  public List getDppmInfo(String areaSn)
  {

	    String sql ="SELECT"+
					"	ROUND("+
					"	SUM ("+
					"		coalesce (T1.CST_STANDARD_TIME, 0) * T .MPS_MO_OUTPUT"+
					"	) / ("+
					"		CASE"+
					"		WHEN T2.CAL_ID IS NULL THEN"+
					"			("+
					"				SELECT"+
					"					SUM (aa.sumtime)"+
					"				FROM"+
					"					("+
					"						SELECT"+
					"							date_part('day', C .CALW_END ::timestamp - C .CALW_START::timestamp) - (C .CALW_REST_TOTAL * 60) sumtime"+
					"						FROM"+
					"							T_CO_CALENDAR B"+
					"						LEFT JOIN T_CO_CALENDAR_WORKTIME C ON C .CAL_ID = B. ID"+
					"						WHERE"+
					"							B.CAL_DEFAULT_FLAG = 'Y'"+
					"						AND TO_CHAR(CURRENT_DATE, 'HH24') > TO_CHAR(C .CALW_START, 'HH24')"+
					"						UNION ALL"+
					"							SELECT"+
					"								("+
					"									TO_DATE("+
					"										TO_CHAR(CURRENT_DATE, 'HH24:MI:SS'),"+
					"										'HH24:MI:SS'"+
					"									) - TO_DATE("+
					"										TO_CHAR(C .CALW_START, 'HH24:MI:SS'),"+
					"										'HH24:MI:SS'"+
					"									)"+
					"								) * 24 * 60 * 60 - (C .CALW_REST_TOTAL * 60) sumtime"+
					"							FROM"+
					"								T_CO_CALENDAR B"+
					"							LEFT JOIN T_CO_CALENDAR_WORKTIME C ON C .CAL_ID = B. ID"+
					"							WHERE"+
					"								B.CAL_DEFAULT_FLAG = 'Y'"+
					"							AND TO_CHAR(CURRENT_DATE, 'HH24:MI:SS') >= TO_CHAR(C .CALW_START, 'HH24:MI:SS')"+
					"							AND TO_CHAR(CURRENT_DATE, 'HH24:MI:SS') < TO_CHAR(C .CALW_END, 'HH24:MI:SS')"+
					"					) aa"+
					"			)"+
					"		ELSE"+
					"			("+
					"				SELECT"+
					"					SUM (BB.sumtime)"+
					"				FROM"+
					"					("+
					"						SELECT"+
					"							date_part('day', F .CALW_END ::timestamp - F .CALW_START::timestamp) * 24 * 60 * 60 - (F.CALW_REST_TOTAL * 60) sumtime"+
					"						FROM"+
					"							T_CO_CALENDAR_WORKTIME F"+
					"						WHERE"+
					"							F.CAL_ID = T2.CAL_ID"+
					"						AND TO_CHAR(CURRENT_DATE, 'HH24') > TO_CHAR(F.CALW_START, 'HH24')"+
					"						UNION ALL"+
					"							SELECT"+
					"								("+
					"									TO_DATE("+
					"										TO_CHAR(CURRENT_DATE, 'HH24:MI:SS'),"+
					"										'HH24:MI:SS'"+
					"									) - TO_DATE("+
					"										TO_CHAR(F.CALW_START, 'HH24:MI:SS'),"+
					"										'HH24:MI:SS'"+
					"									)"+
					"								) * 24 * 60 * 60 - (F.CALW_REST_TOTAL * 60) sumtime"+
					"							FROM"+
					"								T_CO_CALENDAR_WORKTIME F"+
					"							WHERE"+
					"								F.CAL_ID = T2.CAL_ID"+
					"							AND TO_CHAR(CURRENT_DATE, 'HH24:MI:SS') >= TO_CHAR(F.CALW_START, 'HH24:MI:SS')"+
					"							AND TO_CHAR(CURRENT_DATE, 'HH24:MI:SS') < TO_CHAR(F.CALW_END, 'HH24:MI:SS')"+
					"					) BB"+
					"			)"+
					"		END"+
					"	)::numeric,2"+
					"	) EFF,"+
					"	A .ca_id"+
					"	FROM"+
					"	T_MID_PRODUCT_STATISTIC T"+
					"	LEFT JOIN t_co_area A ON T .mps_area_sn = A .ca_id"+
					"	LEFT JOIN t_co_standard_time t1 ON t1.cst_model_code = T .mps_model_code"+
					"	AND T .MPS_AREA_SN = T1.CST_AREA_SN"+
					"	AND T .MPS_PROCESS_FACE = T1.CST_PROCESS_FACE"+
					"	LEFT JOIN T_CO_CALENDAR_LINE T2 ON T2.AREA_ID = T .MPS_AREA_SN"+
					"	WHERE"+
					"	A .ca_parentareaid = ?"+
					"	AND T .mps_work_date = substr("+
					"	to_char("+
					"		CURRENT_DATE,"+
					"		'yyyy-mm-dd hh24:mi:ss'"+
					"	),"+
					"	1,"+
					"	10"+
					"	)"+
					"	GROUP BY"+
					"	A .ca_id,"+
					"	T2.CAL_ID"+
					"	ORDER BY"+
					"	EFF DESC";
	    Map<String, String> sqlParaMap = new HashMap<String, String>();
	    sqlParaMap.put("areaSn", areaSn);
	    List list = modelService.listDataSql(sql, new Object[] {areaSn});
	    return list;
  }

  /**
   * @Description: 获取PPM信息
   * @return List
   * @throws
   */
  public List getPpmInfo(String areaSn)
  {
    String sql = "SELECT"+
				 "			BB.CA_ID,"+
				"			EXP ("+
				"				SUM ("+
				"					CASE WHEN BB.DIRECRT=0 THEN 0"+
				"					ELSE LN (BB.DIRECRT)"+
				"					 END"+
				"				)"+
				"			) DIRECRT"+
				"		FROM"+
				"			("+
				"				SELECT"+
				"					AA.CA_ID,"+
				"					ROUND("+
				"						1 - ("+
				"							SUM (AA.MGS_NG_PCS) / ("+
				"								SUM (AA.MGS_OK_PCS) + SUM (AA.MGS_NG_PCS)"+
				"							)"+
				"						),"+
				"						4"+
				"					) DIRECRT,"+
				"					AA.MGS_GROUP_CODE"+
				"				FROM"+
				"					("+
				"						SELECT"+
				"							A .CA_ID,"+
				"							T .MGS_NG_PCS,"+
				"							T .MGS_OK_PCS,"+
				"							T .MGS_GROUP_CODE"+
				"						FROM"+
				"							T_CO_AREA A"+
				"						LEFT JOIN T_MID_GROUP_STATISTIC T ON T .MGS_AREA_SN = A .CA_ID"+
				"						WHERE"+
				"							A .CA_PARENTAREAID =?"+
				"						AND T .MGS_WORK_DATE = SUBSTR("+
				"							TO_CHAR("+
				"								CURRENT_DATE,"+
				"								'YYYY-MM-DD HH24:MI:SS'"+
				"							),"+
				"							1,"+
				"							10"+
				"						)"+
				"					) AA"+
				"				GROUP BY"+
				"					AA.CA_ID,"+
				"					AA.MGS_GROUP_CODE"+
				"				ORDER BY"+
				"					AA.CA_ID"+
				"			) BB"+
				"		GROUP BY"+
				"			BB.CA_ID";
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("areaSn", areaSn);
    List list = modelService.listDataSql(sql, new Object[] {areaSn});
    return list;
  }

  /**
   * @Description: 获取时段产量信息列表
   * @return List
   * @throws
   */
  public List getLineProductionInfo(String areaSn)
  {
    String sql = "select sum(t1.MPS_MO_INPUT) as MPS_MO_INPUT, sum(t1.MPS_MO_OUTPUT) as MPS_MO_OUTPUT,t1.MPS_PERIOD as MPS_PERIOD "
                 + "	from T_MID_PRODUCT_STATISTIC t1  "
                 + "	left join T_CO_AREA t2  "
                 + "	on t1.mps_area_sn = t2.ca_id  "
                 + "	where 1 = 1  "
                 + "	and t2.ca_parentareaid =? " + "group by t1.MPS_PERIOD";
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("areaSn", areaSn);
    List list = modelService.listDataSql(sql, new Object[] {areaSn});
    return list;
  }
  /**
   * 获取时段常量
   * @param areaSn
   * @return
 * @throws ParseException 
   */
  public List TimeInterval(String areaSn) throws ParseException{
	  String sql = "SELECT"+
					"	TO_CHAR(T2.CALW_START, 'HH24') || '-' || TO_CHAR(T2.CALW_END, 'HH24') TIME_BUCKET,"+
					"	TO_CHAR(T2.CALW_START, 'HH24:MI') START_TIME,"+
					"	TO_CHAR(T2.CALW_END, 'HH24:MI') END_TIME,"+
					"	T2.CALW_INTER_DAY,"+
					"	CASE"+
					"	WHEN T2.CALW_INTER_DAY = 'Y' THEN"+
					"	TO_CHAR(CURRENT_DATE - 1, 'YYYY-MM-DD')"+
					"	ELSE"+
					"	TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD')"+
					"	END WORK_DATE"+
					"	FROM"+
					"	T_CO_CALENDAR_WORKTIME T2"+
					"	LEFT JOIN T_CO_CALENDAR_LINE T3 ON T3.CAL_ID = T2.CAL_ID"+
					"	LEFT JOIN T_CO_KANBAN_CONFIG A ON T3.AREA_ID = A .CKC_AREA_SN"+
					"	WHERE"+
					"	A .CKC_AREA_SN = ?"+
					"	ORDER BY"+
					"	TIME_BUCKET";
	  Map<String, String> sqlParaMap = new HashMap<String, String>();
	  sqlParaMap.put("areaSn", areaSn);
	  List<Map> timeBucketList = modelService.listDataSql(sql, new Object[] {areaSn});
	  List<Map> valList = new ArrayList<Map>();//产量
	  if(timeBucketList == null || timeBucketList.isEmpty()){
		  sql = "SELECT TO_CHAR(C.CALW_START, 'HH24') || '-' || TO_CHAR(C.CALW_END, 'HH24') TIME_BUCKET,\n" + 
      			"						       TO_CHAR(C.CALW_START, 'HH24:MI') START_TIME,\n" + 
      			"						       TO_CHAR(C.CALW_END, 'HH24:MI') END_TIME,\n" + 
      			"						       C.CALW_INTER_DAY,\n" + 
      			"       CASE\n" + 
      			"         WHEN C.CALW_INTER_DAY = 'Y' THEN\n" + 
      			"          TO_CHAR(CURRENT_DATE - 1, 'YYYY-MM-DD')\n" + 
      			"         ELSE\n" + 
      			"          TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD')\n" + 
      			"       END WORK_DATE"+
      			"						  FROM T_CO_CALENDAR B\n" + 
      			"						  LEFT JOIN T_CO_CALENDAR_WORKTIME C\n" + 
      			"						    ON C.CAL_ID = B.ID\n" + 
      			"						 WHERE B.CAL_DEFAULT_FLAG = 'Y'\n" + 
      			" ORDER BY TIME_BUCKET";
		  timeBucketList = modelService.listSql(sql, null, null, null, null);
	  }
	  String sql2 = "SELECT SUM(AA.MPS_PO_OUTPUT) MPS_PO_OUTPUT,AA.BEGIN_TIME,AA.END_TIME,AA.MPS_WORK_DATE FROM(" +
      		"SELECT T.MPS_PO_OUTPUT,\n" + 
      		"       SUBSTR(T.MPS_BEGIN_TIME, 12, 5) BEGIN_TIME,\n" + 
      		"       SUBSTR(T.MPS_END_TIME, 12, 5) END_TIME,\n" + 
      		"       T.MPS_WORK_DATE\n" + 
      		"  FROM T_MID_PRODUCT_STATISTIC T\n" + 
      		" WHERE T.MPS_AREA_SN in (SELECT B.CA_ID  \n" + 
      		"             	FROM T_CO_KANBAN_CONFIG A  \n" + 
      		"             	LEFT JOIN T_CO_AREA B ON B.CA_PARENTAREAID=A.CKC_AREA_SN \n" + 
      		"             	WHERE A.CKC_AREA_SN = ?)"+
      		"   AND T.MPS_WORK_DATE =\n" + 
      		"       SUBSTR(TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD HH24:MI:SS'), 1, 10)\n" + 
      		"UNION ALL\n" + 
      		"SELECT T.MPS_PO_OUTPUT,\n" + 
      		"       SUBSTR(T.MPS_BEGIN_TIME, 12, 5) BEGIN_TIME,\n" + 
      		"       SUBSTR(T.MPS_END_TIME, 12, 5) END_TIME,\n" + 
      		"       T.MPS_WORK_DATE\n" + 
      		"  FROM T_MID_PRODUCT_STATISTIC T\n" + 
      		" WHERE T.MPS_AREA_SN in (SELECT B.CA_ID  \n" + 
      		"             		FROM T_CO_KANBAN_CONFIG A  \n" + 
      		"             		LEFT JOIN T_CO_AREA B ON B.CA_PARENTAREAID=A.CKC_AREA_SN \n" + 
      		"             		WHERE A.CKC_AREA_SN = ?)"+
      		"   AND T.MPS_WORK_DATE =\n" + 
      		"       SUBSTR(TO_CHAR(CURRENT_DATE - 1, 'YYYY-MM-DD HH24:MI:SS'), 1, 10)" +
      		")AA\n" + 
      		"            GROUP BY AA.BEGIN_TIME,AA.END_TIME,AA.MPS_WORK_DATE\n" + 
      		"             ORDER BY AA.BEGIN_TIME  " ;
	  sqlParaMap = new HashMap<String, String>();
	  sqlParaMap.put("areaSn", areaSn);
	  valList = modelService.listDataSql(sql2, new Object[] {areaSn,areaSn});
	 List valueList=new ArrayList();
      // 用对象保存数据
      Object[] objArray = null;        
      int tSize = timeBucketList.size();//时段列表数量
      int vSize = valList.size();//产量列表数量
                  
      //当前时段往前取6个
      SimpleDateFormat df = new SimpleDateFormat("HH:mm");//设置日期格式
      Date now = df.parse(df.format(new Date()));
      Date beginTime = null;
      Date endTime = null;
      int startCount = 0;//起始取数下标值，默认为0
      for (int i = 0; i < tSize; i++) {
      	beginTime = df.parse(timeBucketList.get(i).get("START_TIME").toString());
          endTime = df.parse(timeBucketList.get(i).get("END_TIME").toString());
      	//如果当前时间落在该时段内
      	if(belongCalendar(now, beginTime, endTime)){
      		if(i > 5){//往前取6
      			startCount = i - 5;
      		}
      	}
		}
      
      for (int i = startCount; i < tSize; i++) {
      	if(valueList.size() == 6){
      		break;
      	}
      	objArray = new Object[2];
      		for(int j = 0;j < vSize; j++){
      			System.out.println("aa"+timeBucketList.get(i).get("START_TIME"));
      			System.out.println("aa"+valList.get(j).get("BEGIN_TIME"));
      			System.out.println("aa"+timeBucketList.get(i).get("END_TIME"));
      			System.out.println("aa"+valList.get(j).get("END_TIME"));
      			System.out.println("aa"+timeBucketList.get(i).get("WORK_DATE"));
      			System.out.println("aa"+valList.get(j).get("MPS_WORK_DATE"));
      			
      			if(timeBucketList.get(i).get("START_TIME")!=null&&valList.get(j).get("BEGIN_TIME")!=null&&timeBucketList.get(i).get("END_TIME")!=null&&valList.get(j).get("END_TIME")!=null
      					&&timeBucketList.get(i).get("WORK_DATE")!=null&&valList.get(j).get("MPS_WORK_DATE")!=null){
      				//时段相同的，在valueList中放入产量
      				if(timeBucketList.get(i).get("START_TIME").toString().equals(valList.get(j).get("BEGIN_TIME").toString())
              				&& timeBucketList.get(i).get("END_TIME").toString().equals(valList.get(j).get("END_TIME").toString())
              				&& timeBucketList.get(i).get("WORK_DATE").toString().equals(valList.get(j).get("MPS_WORK_DATE").toString())){
              			objArray[0] = timeBucketList.get(i).get("TIME_BUCKET").toString();
              			objArray[1] = valList.get(j).get("MPS_PO_OUTPUT").toString();
              			HashMap map=new HashMap();
              			map.put("value", valList.get(j).get("MPS_PO_OUTPUT").toString());
              			map.put("name",  timeBucketList.get(i).get("TIME_BUCKET").toString());
                      	valueList.add(map);
              		} 
      			}
          		
      		}
      		
      		if(objArray[0]==null){
       			HashMap map=new HashMap();
      			map.put("value", 0);
      			map.put("name",  timeBucketList.get(i).get("TIME_BUCKET"));
              	valueList.add(map);
       		}
      		
      	
		} 
	  return valueList;
  }
  /**
   * 获取时段直通率
   * @param areaSn
   * @return
 * @throws ParseException 
   */
  public  List periodThroughRate(String areaSn) throws ParseException{
	  List valueList=new ArrayList();
	  String sql = "SELECT TO_CHAR(T2.CALW_START, 'HH24') || '-' ||"
				+"	       TO_CHAR(T2.CALW_END, 'HH24') TIME_BUCKET,"
				+"	       TO_CHAR(T2.CALW_START, 'HH24:MI') START_TIME,"
				+"	       TO_CHAR(T2.CALW_END, 'HH24:MI') END_TIME,"
				+"	       T2.CALW_INTER_DAY,"+
				"       CASE\n" + 
				"         WHEN T2.CALW_INTER_DAY = 'Y' THEN\n" + 
				"          TO_CHAR(CURRENT_DATE - 1, 'YYYY-MM-DD')\n" + 
				"         ELSE\n" + 
				"          TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD')\n" + 
				"       END WORK_DATE"					
				+"	  FROM T_CO_CALENDAR_WORKTIME T2"
				+"	  LEFT JOIN T_CO_CALENDAR_LINE T3"
				+"	    ON T3.CAL_ID = T2.CAL_ID"
				+"	  LEFT JOIN T_CO_KANBAN_CONFIG A"
				+"	    ON T3.AREA_ID = A.CKC_AREA_SN"
				+"	 WHERE A.CKC_AREA_SN = ?"
				+"	 ORDER BY TIME_BUCKET";
	  Map<String, String> sqlParaMap = new HashMap<String, String>();
	  sqlParaMap.put("areaSn", areaSn);
	  List<Map> timeBucketList = modelService.listDataSql(sql, new Object[] {areaSn});
	  if(timeBucketList == null || timeBucketList.isEmpty()){
		  sql = "SELECT TO_CHAR(C.CALW_START, 'HH24') || '-' || TO_CHAR(C.CALW_END, 'HH24') TIME_BUCKET,\n" + 
       			"						       TO_CHAR(C.CALW_START, 'HH24:MI') START_TIME,\n" + 
       			"						       TO_CHAR(C.CALW_END, 'HH24:MI') END_TIME,\n" + 
       			"						       C.CALW_INTER_DAY,\n" + 
       			"       CASE\n" + 
       			"         WHEN C.CALW_INTER_DAY = 'Y' THEN\n" + 
       			"          TO_CHAR(CURRENT_DATE - 1, 'YYYY-MM-DD')\n" + 
       			"         ELSE\n" + 
       			"          TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD')\n" + 
       			"       END WORK_DATE"+
       			"						  FROM T_CO_CALENDAR B\n" + 
       			"						  LEFT JOIN T_CO_CALENDAR_WORKTIME C\n" + 
       			"						    ON C.CAL_ID = B.ID\n" + 
       			"						 WHERE B.CAL_DEFAULT_FLAG = 'Y'\n" + 
       			" ORDER BY TIME_BUCKET";
		  timeBucketList = modelService.listSql(sql, null, null, null, null);
		  
	  }
	  List<Map> valList = new ArrayList<Map>();//直通率
      List<Map> pcsList = new ArrayList<Map>();//不良pcs数
	  //获取直通率
      String sql2 = "SELECT bb.BEGIN_TIME,bb.END_TIME,bb.MGS_WORK_DATE,exp(sum(CASE WHEN BB.DIRECRT=0 THEN 0 ELSE LN (BB.DIRECRT) END)) DIRECRT FROM(" +
      		"SELECT AA.BEGIN_TIME,AA.END_TIME,AA.MGS_WORK_DATE,\r\n" +
      		"CASE WHEN\r\n" + 
      		"(SUM(AA.MGS_OK_PCS)+SUM(AA.MGS_NG_PCS)) = 0 THEN 1 " +
      		"ELSE " + 
      		"ROUND(1 -(SUM(AA.MGS_NG_PCS)/(SUM(AA.MGS_OK_PCS)+SUM(AA.MGS_NG_PCS))),4) " +
      		"END DIRECRT\r\n" + 
      		",AA.MGS_GROUP_CODE\r\n" + 
      		"  FROM (SELECT SUBSTR(T.MGS_BEGIN_TIME, 12, 5) BEGIN_TIME,\r\n" + 
      		"               SUBSTR(T.MGS_END_TIME, 12, 5) END_TIME,\r\n" + 
      		"               T.MGS_WORK_DATE,\r\n" + 
      		"               T.MGS_NG_PCS,\r\n" + 
      		"               T.MGS_OK_PCS,\r\n" + 
      		"               T.MGS_GROUP_CODE\r\n" + 
      		"          FROM T_MID_GROUP_STATISTIC T\r\n" + 
      		"         WHERE T.MGS_AREA_SN in\r\n" + 
      		"               (SELECT B.CA_ID \r\n" + 
      		"             	FROM T_CO_KANBAN_CONFIG A \r\n" + 
      		"               LEFT JOIN T_CO_AREA B ON B.CA_PARENTAREAID=A.CKC_AREA_SN\r\n" + 
      		"             	WHERE A.CKC_AREA_SN = ?)"+ 
      		"           AND T.MGS_WORK_DATE =\r\n" + 
      		"               SUBSTR(TO_CHAR(CURRENT_DATE, 'yyyy-mm-dd hh24:mi:ss'), 1, 10)\r\n" + 
      		"        UNION ALL\r\n" + 
      		"        SELECT SUBSTR(T.MGS_BEGIN_TIME, 12, 5) BEGIN_TIME,\r\n" + 
      		"               SUBSTR(T.MGS_END_TIME, 12, 5) END_TIME,\r\n" + 
      		"               T.MGS_WORK_DATE,\r\n" + 
      		"               T.MGS_NG_PCS,\r\n" + 
      		"               T.MGS_OK_PCS,\r\n" + 
      		"               T.MGS_GROUP_CODE\r\n" + 
      		"          FROM T_MID_GROUP_STATISTIC T\r\n" + 
      		"         WHERE T.MGS_AREA_SN in\r\n" + 
      		"               (SELECT B.CA_ID \r\n" + 
      		"             	FROM T_CO_KANBAN_CONFIG A \r\n" + 
      		"               LEFT JOIN T_CO_AREA B ON B.CA_PARENTAREAID=A.CKC_AREA_SN\r\n" + 
      		"             	WHERE A.CKC_AREA_SN = ?)"+
      		"           AND T.MGS_WORK_DATE =\r\n" + 
      		"               SUBSTR(TO_CHAR(CURRENT_DATE - 1, 'yyyy-mm-dd hh24:mi:ss'), 1, 10)) AA\r\n" + 
      		"               GROUP BY AA.BEGIN_TIME,AA.END_TIME,AA.MGS_WORK_DATE,AA.MGS_GROUP_CODE\r\n" + 
      		"               ORDER BY AA.BEGIN_TIME ) bb\r\n" + 
      		"               GROUP BY bb.BEGIN_TIME,bb.END_TIME,bb.MGS_WORK_DATE";
	  
      sqlParaMap = new HashMap<String, String>();
	  sqlParaMap.put("areaSn", areaSn);
	  valList = modelService.listDataSql(sql2, new Object[] {areaSn,areaSn});
	//获取不良pcs数
      String pcsSql = "SELECT"+
						"		TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD') WORK_DATE,"+
						"		TO_CHAR(C .CALW_START, 'HH24:MI') BEGIN_TIME,"+
						"		TO_CHAR(C .CALW_END, 'HH24:MI') END_TIME,"+
						"		("+
						"			SELECT"+
						"				coalesce (SUM(T1.WE_ERROR_NUM), 0)"+
						"			FROM"+
						"				T_WIP_ERROR T1"+
						"			WHERE"+
						"				TO_CHAR(T1.WE_TEST_TIME, 'YYYY-MM-DD')=	TO_CHAR(CURRENT_DATE, 'YYYY-MM-DD')"+
						"			AND TO_CHAR("+
						"				T1.WE_TEST_TIME,"+
						"				'HH24:MI:SS'"+
						"			) >= TO_CHAR(C .CALW_START, 'HH24:MI:SS')"+
						"			AND TO_CHAR("+
						"				T1.WE_TEST_TIME,"+
						"				'HH24:MI:SS'"+
						"			) < TO_CHAR(C .CALW_END, 'HH24:MI:SS')"+
						"			AND T1.WE_AREA_SN IN ("+
						"				SELECT"+
						"					KA.CA_ID"+
						"				FROM"+
						"					T_CO_KANBAN_CONFIG F"+
						"				LEFT JOIN T_CO_AREA KA ON KA.CA_PARENTAREAID = F.CKC_AREA_SN"+
						"				WHERE"+
						"					F.CKC_AREA_SN = ?"+
						"			)"+
						"		) ERROR_NUM"+
						"	FROM"+
						"		T_CO_CALENDAR B"+
						"	LEFT JOIN T_CO_CALENDAR_WORKTIME C ON C .CAL_ID = B. ID"+
						"	WHERE"+
						"		B.CAL_DEFAULT_FLAG = 'Y'"+
						"	AND C .CALW_INTER_DAY = 'N'"+
						"	GROUP BY"+
						"		C .CALW_START,"+
						"		C .CALW_END"+
						"	UNION ALL"+
						"		SELECT"+
						"			TO_CHAR("+
						"				CURRENT_DATE - 1,"+
						"				'YYYY-MM-DD'"+
						"			) WORK_DATE,"+
						"			TO_CHAR(C .CALW_START, 'HH24:MI') BEGIN_TIME,"+
						"			TO_CHAR(C .CALW_END, 'HH24:MI') END_TIME,"+
						"			("+
						"				SELECT"+
						"					coalesce (SUM(T1.WE_ERROR_NUM), 0)"+
						"				FROM"+
						"					T_WIP_ERROR T1"+
						"				WHERE"+
						"	TO_CHAR(T1.WE_TEST_TIME, 'YYYY-MM-DD')=	TO_CHAR(CURRENT_DATE-1, 'YYYY-MM-DD')"+
						"				AND TO_CHAR("+
						"					T1.WE_TEST_TIME,"+
						"					'HH24:MI:SS'"+
						"				) >= TO_CHAR(C .CALW_START, 'HH24:MI:SS')"+
						"				AND TO_CHAR("+
						"					T1.WE_TEST_TIME,"+
						"					'HH24:MI:SS'"+
						"				) < TO_CHAR(C .CALW_END, 'HH24:MI:SS')"+
						"				AND T1.WE_AREA_SN IN ("+
						"					SELECT"+
						"						KA.CA_ID"+
						"					FROM"+
						"						T_CO_KANBAN_CONFIG F"+
						"					LEFT JOIN T_CO_AREA KA ON KA.CA_PARENTAREAID = F.CKC_AREA_SN"+
						"					WHERE"+
						"						F.CKC_AREA_SN = ?"+
						"				)"+
						"			) ERROR_NUM"+
						"		FROM"+
						"			T_CO_CALENDAR B"+
						"		LEFT JOIN T_CO_CALENDAR_WORKTIME C ON C .CAL_ID = B. ID"+
						"		WHERE"+
						"			B.CAL_DEFAULT_FLAG = 'Y'"+
						"		AND C .CALW_INTER_DAY = 'Y'"+
						"		GROUP BY"+
						"			C .CALW_START,"+
						"			C .CALW_END"+
						"		ORDER BY"+
						"			BEGIN_TIME" ;
      sqlParaMap = new HashMap<String, String>();
	  sqlParaMap.put("areaSn", areaSn);
	  pcsList = modelService.listDataSql(pcsSql, new Object[] {areaSn,areaSn});
	  // 用对象保存数据
      Object[] objArray = null;        
      int tSize = timeBucketList.size();//时段列表数量
      int vSize = valList.size();//直通率列表数量
      int pSize = pcsList.size();//PCS列表数量
     
      //当前时段往前取6个
      SimpleDateFormat df = new SimpleDateFormat("HH:mm");//设置日期格式
      Date now = df.parse(df.format(new Date()));
      Date beginTime = null;
      Date endTime = null;
      int startCount = 0;//起始取数下标值，默认为0
      for (int i = 0; i < tSize; i++) {
      	beginTime = df.parse(timeBucketList.get(i).get("START_TIME").toString());
         endTime = df.parse(timeBucketList.get(i).get("END_TIME").toString());
      	//如果当前时间落在该时段内
      	if(belongCalendar(now, beginTime, endTime)){
      		if(i > 5){//往前取6
      			startCount = i - 5;
      		}
      	}
		}
      
      for (int i = startCount; i < tSize; i++) {
      	if(valueList.size() == 6){
      		break;
      	}
      	objArray = new Object[3];
      		for(int j = 0;j < vSize; j++){
          		//时段相同的，在valueList中放入产量
          		if(timeBucketList.get(i).get("START_TIME").equals(valList.get(j).get("BEGIN_TIME"))
          				&& timeBucketList.get(i).get("END_TIME").equals(valList.get(j).get("END_TIME"))
          				&& timeBucketList.get(i).get("WORK_DATE").equals(valList.get(j).get("MGS_WORK_DATE"))){
          			objArray[0] = timeBucketList.get(i).get("TIME_BUCKET");
          			objArray[1] = valList.get(j).get("DIRECRT");
          			
                  	//valueList.add(objArray);
          		} 
      		}
      		if(objArray[0]==null){
      			objArray[0] = timeBucketList.get(i).get("TIME_BUCKET");
      			objArray[1] = "0";
      			//valueList.add(objArray);
      		}
      		for(int K = 0;K < pSize; K++){
          		//时段相同的，在valueList中放入PCS
          		if(timeBucketList.get(i).get("START_TIME").equals(pcsList.get(K).get("BEGIN_TIME"))
          				&& timeBucketList.get(i).get("END_TIME").equals(pcsList.get(K).get("END_TIME"))
          				&& timeBucketList.get(i).get("WORK_DATE").equals(pcsList.get(K).get("WORK_DATE"))){
          			objArray[2] = pcsList.get(K).get("ERROR_NUM");
          			
                  	valueList.add(objArray);
          		} 
      		}
      		
      		/*if((i+1) > valueList.size()){//补齐没有产量的时间段
      			objArray[0] = timeBucketList.get(i).get("TIME_BUCKET");
      			objArray[1] = "0";
      			valueList.add(objArray);
      		}*/
      	
		}  
	return valueList;
	  
  }
   
  /**
   * 判断时间是否在时间段内
   * @param nowTime
   * @param beginTime
   * @param endTime
   * @return
   */
  public static boolean belongCalendar(Date nowTime, Date beginTime, Date endTime) {
      Calendar date = Calendar.getInstance();
      date.setTime(nowTime);

      Calendar begin = Calendar.getInstance();
      begin.setTime(beginTime);

      Calendar end = Calendar.getInstance();
      end.setTime(endTime);

      return date.after(begin) && date.before(end);
  }
  
  /**
   * 获取看板SN号码
   * @param areaSn
   * @return
   */
  public List getCkcAreaSn(String areaSn)
  {
    String sql = "select ckc_area_sn  ,ckc_sn  from T_CO_KANBAN_CONFIG  where  ckc_area_sn=?";
    Map<String, String> sqlParaMap = new HashMap<String, String>();
    sqlParaMap.put("areaSn", areaSn);
    List list = modelService.listDataSql(sql, new Object[] {areaSn});
    return list;
  }
}
