package com.morelean.mcmes.productControl.pg;

import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dao.PaginationImpl;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.mes.other.common.method.CommonMethod;
 /**
  *要根据对应的视图模型/基础信息：视图公用类的名称来替换继承类SuperServer
  *
  */
public class GroupFinishReport implements FuncService
{
	private static final Log log = LogFactory.getLog("com.morelean.mcmes.productControl.GroupFinishReport");
	
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		
		//获取操作标识
		HttpServletRequest httpServletRequest = modelAction.getRequest();
		PaginationImpl impl=modelAction.getPage();//定义分页变量
		//获取分页变量
		String currentPage=httpServletRequest.getParameter("currentPage");
		String pageRecord=httpServletRequest.getParameter("pageRecord");
		impl.setCurrentPage(null==currentPage?1:Integer.parseInt(currentPage));
		impl.setPageRecord(null==pageRecord?20:Integer.parseInt(pageRecord));
		//获取操作方法
		String opt=httpServletRequest.getParameter("opt");
		
		String jsonData=null;
		List ajaxList=null;
		//根据不同的操作标识进行处理
		if("getMoNumberInfo".equals(opt)){
			ajaxList=this.getMoNumberInfo(httpServletRequest,modelService,impl);
		}
		else if("getAddMoNumberInfo".equals(opt)){
			ajaxList=this.getAddMoNumberInfo(httpServletRequest,modelService);
		}
		else if("getLineInfo".equals(opt)){
			ajaxList=this.getLineInfo(httpServletRequest,modelService);
		}
		else if("getMoRouteGroup".equals(opt)){
			ajaxList=this.getMoRouteGroup(httpServletRequest,modelService);
		}
		else if("moReport".equals(opt)){
			String result=this.moReport(httpServletRequest,modelService);
			Map map=new HashMap();
			map.put("result", result);
			ajaxList=new ArrayList();
			ajaxList.add(map);
		}
		
		if(null!=jsonData){//直接返回json，适用于没有分页的情况下
			return modelAction.outJson(jsonData,Constants.CHARACTER_ENCODING_UTF_8); 
		}
		else if(null!=ajaxList){//返回List，适用于有分页的情况下
			modelAction.setAjaxList(ajaxList);
			modelAction.setAjaxPage(impl);
			return BaseActionSupport.AJAX;
		}
		else {
			modelAction.setAjaxPage(impl);
			return BaseActionSupport.AJAX;
		}
	}
	
	/**
	 * 获取制令单信息
	 * @param httpServletRequest
	 * @return
	 */
	private List getMoNumberInfo(HttpServletRequest httpServletRequest,ModelService modelService,PaginationImpl impl){
		try{
			//获取查询条件
			String dataAuth=httpServletRequest.getParameter("dataAuth");
			String startTime=httpServletRequest.getParameter("startTime");
			String endTime=httpServletRequest.getParameter("endTime");
			String moNumber=httpServletRequest.getParameter("moNumber");
			String itemCode=httpServletRequest.getParameter("itemCode");
			List<Object> paramObject=new ArrayList();
			List<Integer> paramTypeVar=new ArrayList();
			String strWhere="";
			if(StringUtils.isNotEmpty(dataAuth)){
				strWhere+=" AND A.DATA_AUTH=?";
				paramObject.add(dataAuth);
				paramTypeVar.add(Types.VARCHAR);
			}
			if(StringUtils.isNotEmpty(startTime)){
				strWhere+=" AND A.PM_SCHEDULE_DATE>=TO_DATE('?','YYYY-MM-DD HH24:MI:SS')";
				paramObject.add(startTime);
				paramTypeVar.add(Types.VARCHAR);
			}
			if(StringUtils.isNotEmpty(endTime)){
				strWhere+=" AND A.PM_DUE_DATE<=TO_DATE('?','YYYY-MM-DD HH24:MI:SS')";
				paramObject.add(endTime);
				paramTypeVar.add(Types.VARCHAR);
			}
			if(StringUtils.isNotEmpty(moNumber)){
				strWhere+=" AND A.PM_MO_NUMBER LIKE ?||'%'";
				paramObject.add(moNumber);
				paramTypeVar.add(Types.VARCHAR);
			}
			if(StringUtils.isNotEmpty(itemCode)){
				strWhere+=" AND A.PM_MODEL_CODE LIKE ?||'%'";
				paramObject.add(itemCode);
				paramTypeVar.add(Types.VARCHAR);
			}
			//查询数据
			String sqlStr="SELECT\r\n" + 
					"A.ID,\r\n" + 
					"A.PM_MO_NUMBER,\r\n" + 
					"A.PM_MODEL_CODE,\r\n" + 
					"A.PM_STATUS,\r\n" + 
					"C.VALUE AS STATUS_TEXT,\r\n" + 
					"COALESCE(B.CI_ITEM_NAME,' ') AS CI_ITEM_NAME,\r\n" + 
					"COALESCE(B.CI_ITEM_SPEC,' ') AS CI_ITEM_SPEC,\r\n" + 
					"COALESCE(A.PM_TARGET_QTY,0) AS PM_TARGET_QTY,\r\n" + 
					"COALESCE(A.PM_INPUT_COUNT,0) AS PM_INPUT_COUNT,\r\n" + 
					"COALESCE(A.PM_FINISH_COUNT,0) AS PM_FINISH_COUNT,\r\n" + 
					"TO_CHAR(A.PM_SCHEDULE_DATE,'YYYY-MM-DD HH24:MI:SS') AS PM_SCHEDULE_DATE,\r\n" + 
					"TO_CHAR(A.PM_DUE_DATE,'YYYY-MM-DD HH24:MI:SS') AS PM_DUE_DATE\r\n" + 
					"FROM T_PM_MO_BASE A\r\n" + 
					"LEFT JOIN T_CO_ITEM B ON A.PM_MODEL_CODE=B.CI_ITEM_CODE\r\n" + 
					"LEFT JOIN SY_DICT_VAL C ON C.DICT_CODE='PM-STATUS' AND A.PM_STATUS=C.CODE\r\n" + 
					"WHERE 1=1 AND A.PM_STATUS NOT IN ('4','5') AND A.PM_TARGET_QTY>A.PM_FINISH_COUNT %s";
			int[] paramType=new int[paramTypeVar.size()];
			for(int i=0,len=paramTypeVar.size();i<len;i++){
				paramType[i]=paramTypeVar.get(i);
			}
			return modelService.listSql(
					String.format(sqlStr, strWhere), impl,null, paramObject.toArray(), paramType, "ORDER BY PM_SCHEDULE_DATE DESC", null);
		}
		catch(Exception ex){
			log.error("getMoNumberInfo:",ex);
			return null;
		}
	}
	
	/**
	 * 报工新增界面获取制令单信息
	 * @param httpServletRequest
	 * @return
	 */
	private List getAddMoNumberInfo(HttpServletRequest httpServletRequest,ModelService modelService){
		try{
			//获取参数
			String moNumber=httpServletRequest.getParameter("moNumber");
			//查询数据
			String sqlStr="SELECT \r\n" + 
					"A.ID, \r\n" + 
					"A.PM_MO_NUMBER, \r\n" + 
					"A.PM_MODEL_CODE, \r\n" + 
					"A.PM_STATUS, \r\n" + 
					"C.VALUE AS STATUS_TEXT, \r\n" + 
					"COALESCE(B.CI_ITEM_NAME,' ') AS CI_ITEM_NAME, \r\n" + 
					"COALESCE(B.CI_ITEM_SPEC,' ') AS CI_ITEM_SPEC, \r\n" + 
					"COALESCE(A.PM_TARGET_QTY,0) AS PM_TARGET_QTY, \r\n" + 
					"COALESCE(A.PM_INPUT_COUNT,0) AS PM_INPUT_COUNT, \r\n" + 
					"COALESCE(A.PM_FINISH_COUNT,0) AS PM_FINISH_COUNT, \r\n" + 
					"TO_CHAR(A.PM_SCHEDULE_DATE,'YYYY-MM-DD HH24:MI:SS') AS PM_SCHEDULE_DATE, \r\n" + 
					"TO_CHAR(A.PM_DUE_DATE,'YYYY-MM-DD HH24:MI:SS') AS PM_DUE_DATE \r\n" + 
					"FROM T_PM_MO_BASE A \r\n" + 
					"LEFT JOIN T_CO_ITEM B ON A.PM_MODEL_CODE=B.CI_ITEM_CODE \r\n" + 
					"LEFT JOIN SY_DICT_VAL C ON C.DICT_CODE='PM-STATUS' AND A.PM_STATUS=C.CODE \r\n" + 
					"WHERE 1=1 AND A.PM_MO_NUMBER=?";
			return modelService.listDataSql(sqlStr,new Object[]{moNumber});
		}
		catch(Exception ex){
			log.error("getAddMoNumberInfo:",ex);
			return null;
		}
	}
	
	/**
	 * 报工新增界面获取线体信息
	 * @param httpServletRequest
	 * @return
	 */
	private List getLineInfo(HttpServletRequest httpServletRequest,ModelService modelService){
		try{
			//获取参数
			String moNumber=httpServletRequest.getParameter("moNumber");
			//查询数据
			String sqlStr="SELECT \r\n" + 
					"A.CA_ID, \r\n" + 
					"A.CA_NAME \r\n" + 
					"FROM T_CO_AREA A \r\n" + 
					"WHERE A.CA_TYPE='1' \r\n" + 
					"AND A.DATA_AUTH IN ( \r\n" + 
					"SELECT \r\n" + 
					"B.DATA_AUTH \r\n" + 
					"FROM T_PM_MO_BASE B  \r\n" + 
					"WHERE B.PM_MO_NUMBER=?\r\n" + 
					") \r\n" + 
					"AND A.CA_ID IN (\r\n" + 
					"SELECT\r\n" + 
					"A.CA_PARENTAREAID\r\n" + 
					"FROM T_CO_AREA A\r\n" + 
					"WHERE A.CA_TYPE='2'\r\n" + 
					"AND A.CA_GROUP IN (\r\n" + 
					"SELECT DISTINCT  \r\n" + 
					"D.CRC_GROUP_CODE\r\n" + 
					"FROM T_PM_MO_BASE A \r\n" + 
					"LEFT JOIN T_CO_TECHNICS B ON A.PM_TECH_SN=B.CT_ID \r\n" + 
					"LEFT JOIN T_CO_ROUTE C ON B.CT_ROUTE_CODE=C.CR_ROUTE_ID \r\n" + 
					"LEFT JOIN T_CO_ROUTE_CONTROL D ON C.CR_ROUTE_ID=D.CR_ROUTE_ID \r\n" + 
					"LEFT JOIN T_CO_GROUP E ON D.CRC_GROUP_CODE=E.GROUP_CODE \r\n" + 
					"WHERE A.PM_MO_NUMBER=?\r\n" + 
					"))\r\n" + 
					"ORDER BY A.CA_ID";
			return modelService.listDataSql(sqlStr,new Object[]{moNumber,moNumber});
		}
		catch(Exception ex){
			log.error("getLineInfo:",ex);
			return null;
		}
	}
	
	/**
	 * 报工新增界面获取制令单对应的流程工序
	 * @param httpServletRequest
	 * @return
	 */
	private List getMoRouteGroup(HttpServletRequest httpServletRequest,ModelService modelService){
		try{
			//获取参数
			String moNumber=httpServletRequest.getParameter("moNumber");
			//查询数据
			String sqlStr="SELECT  \r\n" + 
					"CASE WHEN CR_MO_INPUT=CRC_GROUP_CODE THEN 'Y' ELSE 'N' END AS IS_MO_START_GROUP,  \r\n" + 
					"CASE WHEN CR_MO_OUTPUT=CRC_GROUP_CODE THEN 'Y' ELSE 'N' END AS IS_MO_END_GROUP,  \r\n" + 
					"CASE WHEN CR_PO_INPUT=CRC_GROUP_CODE THEN 'Y' ELSE 'N' END AS IS_PO_START_GROUP,  \r\n" + 
					"CASE WHEN CR_PO_OUTPUT=CRC_GROUP_CODE THEN 'Y' ELSE 'N' END AS IS_PO_END_GROUP,\r\n" + 
					"CR_ROUTE_ID,  \r\n" + 
					"CRC_STEP_SEQU, \r\n" + 
					"CRC_GROUP_CODE,  \r\n" + 
					"GROUP_NAME  \r\n" + 
					"FROM (  \r\n" + 
					"SELECT DISTINCT \r\n" + 
					"C.CR_ROUTE_ID,\r\n" + 
					"C.CR_MO_INPUT,  \r\n" + 
					"C.CR_MO_OUTPUT,  \r\n" + 
					"C.CR_PO_INPUT,  \r\n" + 
					"C.CR_PO_OUTPUT,  \r\n" + 
					"D.CRC_STEP_SEQU,  \r\n" + 
					"D.CRC_GROUP_CODE,  \r\n" + 
					"E.GROUP_NAME  \r\n" + 
					"FROM T_PM_MO_BASE A  \r\n" + 
					"LEFT JOIN T_CO_TECHNICS B ON A.PM_TECH_SN=B.CT_ID  \r\n" + 
					"LEFT JOIN T_CO_ROUTE C ON B.CT_ROUTE_CODE=C.CR_ROUTE_ID  \r\n" + 
					"LEFT JOIN T_CO_ROUTE_CONTROL D ON C.CR_ROUTE_ID=D.CR_ROUTE_ID  \r\n" + 
					"LEFT JOIN T_CO_GROUP E ON D.CRC_GROUP_CODE=E.GROUP_CODE  \r\n" + 
					"WHERE A.PM_MO_NUMBER=?\r\n" + 
					") T ORDER BY CRC_STEP_SEQU ASC";
			return modelService.listDataSql(sqlStr,new Object[]{moNumber});
		}
		catch(Exception ex){
			log.error("getMoRouteGroup:",ex);
			return null;
		}
	}
	
	/**
	 * 制令单报工
	 * @param httpServletRequest
	 * @return string code :-1-异常;0-报工成功 ;1-制令单：报工数量+完工数量>计划数量 ;2-工单：报工数量+完工数量>计划数量;3-工厂日历信息校验失败;
	 *                      4:产品生产统计计算失败;5:工序统计计算失败;6:阶别统计计算失败
	 */
	private String moReport(HttpServletRequest httpServletRequest,ModelService modelService){
		try{
			//函数变量
			String result="0";
			int moPlanCount=-1;
			int moFinishCount=-1;
			int proPlanCount=-1;
			int ProFinishCount=-1;
			CalInfo period;//工厂日历时段信息
			//获取参数
			SubmitInfo submitInfo=new SubmitInfo();
			submitInfo.moNumber=httpServletRequest.getParameter("moNumber");//报工制令单
			submitInfo.line=httpServletRequest.getParameter("line");//报工线体
			submitInfo.routeId=httpServletRequest.getParameter("routeId");//流程ID
			submitInfo.group=httpServletRequest.getParameter("groupCode");//报工工序
			submitInfo.groupSeq=httpServletRequest.getParameter("groupSeq");//工序工艺顺序
			submitInfo.reportNum=Integer.parseInt(httpServletRequest.getParameter("reportNum"));//报工数量
			submitInfo.isMoStartGroup= "Y".equals(httpServletRequest.getParameter("isMoStartGroup"));//是否为制令单投入工序
			submitInfo.isMoEndGroup= "Y".equals(httpServletRequest.getParameter("isMoEndGroup"));//是否为制令单末道工序
			submitInfo.isPoStartGroup= "Y".equals(httpServletRequest.getParameter("isPoStartGroup"));//是否为工单投入工序
			submitInfo.isPoEndGroup= "Y".equals(httpServletRequest.getParameter("isPoEndGroup"));//是否为工单末道工序
			submitInfo.isOutputFace= "Y".equals(httpServletRequest.getParameter("isOutputFace"));//是否为产出面别
			submitInfo.face=httpServletRequest.getParameter("face");//面别
			submitInfo.track=httpServletRequest.getParameter("track");//轨道
			if(submitInfo.isMoStartGroup){
				submitInfo.moInputNum=submitInfo.reportNum;
			}
			if(submitInfo.isMoEndGroup){
				submitInfo.moOutputNum=submitInfo.reportNum;
			}
			if(submitInfo.isPoStartGroup){
				submitInfo.poInputNum=submitInfo.reportNum;
			}
			if(submitInfo.isPoEndGroup){
				submitInfo.poOutputNum=submitInfo.reportNum;
			}
			if(submitInfo.isOutputFace){
				submitInfo.outPutFaceNum=submitInfo.reportNum;
			}
			//获取制令单信息
			String sqlStr="select \r\n" + 
					"a.pm_mo_number,\r\n" + 
					"a.data_auth,\r\n" +
					"coalesce(a.pm_target_qty,0) as mo_plan_count,\r\n" + 
					"coalesce(a.pm_input_count,0) as mo_input_count,\r\n" + 
					"coalesce(a.pm_finish_count,0) as mo_finish_count,\r\n" + 
					"b.project_id,\r\n" + 
					"a.pm_model_code,\r\n" + 
					"coalesce(b.product_count,0) as pro_plan_count,\r\n" + 
					"coalesce(b.fqc_count,0) as pro_input_count,\r\n" + 
					"coalesce(b.finish_count,0) as pro_finish_count\r\n" + 
					"from t_pm_mo_base a\r\n" + 
					"left join t_pm_project_base b on a.pm_project_id=b.project_id\r\n" + 
					"where a.pm_mo_number=?";
			List<Map> dataList=modelService.listDataSql(sqlStr,new Object[]{submitInfo.moNumber});
			if(null==dataList || dataList.size()<=0){
				result="-1";
				return result;
			}
			Map moInfo=dataList.get(0);
			//工单号
			submitInfo.projectId=null==moInfo.get("project_id")?"":moInfo.get("project_id").toString();
			submitInfo.itemCode=null==moInfo.get("pm_model_code")?"":moInfo.get("pm_model_code").toString();
			submitInfo.dataAuth=null==moInfo.get("data_auth")?"":moInfo.get("data_auth").toString();
			//若为制令单末道工序，则判定制令单完工数量+报工数量是否大于计划数量
			if(submitInfo.isMoEndGroup){
				moPlanCount=null==moInfo.get("mo_plan_count")?0:Integer.parseInt(moInfo.get("mo_plan_count").toString());
				moFinishCount=null==moInfo.get("mo_finish_count")?0:Integer.parseInt(moInfo.get("mo_finish_count").toString());
				if(submitInfo.reportNum+moFinishCount>moPlanCount){
					result="1";
					return result;
				}
			}
			//若为末道工序，则判定工单完工数量+报工数量是否大于计划数量
			if(submitInfo.isPoEndGroup){
				proPlanCount=null==moInfo.get("pro_plan_count")?0:Integer.parseInt(moInfo.get("pro_plan_count").toString());
				ProFinishCount=null==moInfo.get("pro_finish_count")?0:Integer.parseInt(moInfo.get("pro_finish_count").toString());
				if(submitInfo.reportNum+ProFinishCount>proPlanCount){
					result="2";
					return result;
				}
			}
			//获取工序对应的工作中心
			sqlStr="SELECT\r\n" + 
					"A.*\r\n" + 
					"FROM T_CO_AREA A\r\n" + 
					"WHERE A.CA_TYPE='2'\r\n" + 
					"AND A.CA_GROUP=?\r\n" + 
					"AND COALESCE(A.CA_TRACK,'S')=?\r\n" + 
					"AND A.CA_PARENTAREAID IN (\r\n" + 
					"SELECT\r\n" + 
					"B.CA_ID\r\n" + 
					"FROM T_CO_AREA B \r\n" + 
					"WHERE B.CA_ID=?\r\n" + 
					")";
			dataList=modelService.listDataSql(sqlStr,new Object[]{submitInfo.group,submitInfo.track,submitInfo.line});
			if(null==dataList || dataList.size()<=0){
				result="-1";
				return result;
			}
			submitInfo.workStation=null==dataList.get(0).get("CA_ID")?"":dataList.get(0).get("CA_ID").toString();
			//获取工厂日历时段
			period=getPeriod(submitInfo.workStation,modelService);
			if(null==period){
				result="3";
				return result;
			}
			//阶别统计起始工序和结束工序判定
			sqlStr="SELECT \r\n" + 
					"T.ID\r\n" + 
					"FROM T_CO_ROUTE_COUNT T\r\n" + 
					"WHERE T.CR_ROUTE_ID = ?\r\n" + 
					"AND T.CRCO_START_GROUP = ?\r\n" + 
					"AND T.CRCO_START_SEQ = ?::NUMERIC";
			dataList=modelService.listDataSql(sqlStr,new Object[]{submitInfo.routeId,submitInfo.group,submitInfo.groupSeq});
            submitInfo.isStepInputGroup = null != dataList && dataList.size() > 0;
			sqlStr="SELECT \r\n" + 
					"T.ID\r\n" + 
					"FROM T_CO_ROUTE_COUNT T\r\n" + 
					"WHERE T.CR_ROUTE_ID = ?\r\n" + 
					"AND T.CRCO_END_GROUP = ?\r\n" + 
					"AND T.CRCO_END_SEQ = ?::NUMERIC";
			dataList=modelService.listDataSql(sqlStr,new Object[]{submitInfo.routeId,submitInfo.group,submitInfo.groupSeq});
            submitInfo.isStepOutputGroup = null != dataList && dataList.size() > 0;
			//修改数据
			MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
			try{
				//产品生产统计计算
				if(!optMidProductStatistic(submitInfo,period,modelService)){
					hbtran.rollback();// 错误时，回滚数据
					result="4";
					return result;
				}
				//工序统计计算
				if(!optMidGroupStatistic(submitInfo,period,modelService)){
					hbtran.rollback();// 错误时，回滚数据
					result="5";
					return result;
				}
				
				//阶别统计计算
				if(submitInfo.isStepInputGroup){
					if(!optMidStepStatisticInput(submitInfo,period,modelService)){
						hbtran.rollback();// 错误时，回滚数据
						result="6";
						return result;
					}
				}
				if(submitInfo.isStepOutputGroup){
					if(!optMidStepStatisticOutput(submitInfo,period,modelService)){
						hbtran.rollback();// 错误时，回滚数据
						result="6";
						return result;
					}
				}
				//修改制令单投入产出
				if(submitInfo.isMoStartGroup || submitInfo.isMoEndGroup){
					int input=submitInfo.isMoStartGroup?submitInfo.reportNum:0;
					int output=submitInfo.isMoEndGroup?submitInfo.reportNum:0;
					sqlStr="update t_pm_mo_base set pm_input_count=pm_input_count+?,pm_finish_count=pm_finish_count+? where pm_mo_number=?";
					if(modelService.execSql(sqlStr,new Object[]{input,output,submitInfo.moNumber})<=0){
						hbtran.rollback();// 错误时，回滚数据
						result="-1";
						return result;
					}
				}
				//修改工单投入产出
				if(submitInfo.isPoStartGroup || submitInfo.isPoEndGroup){
					int input=submitInfo.isPoStartGroup?submitInfo.reportNum:0;
					int output=submitInfo.isPoEndGroup?submitInfo.reportNum:0;
					sqlStr="update t_pm_project_base set fqc_count=coalesce(fqc_count,0)+?,finish_count=coalesce(finish_count,0)+? where project_id=?";
					if(modelService.execSql(sqlStr,new Object[]{input,output,submitInfo.projectId})<=0){
						hbtran.rollback();// 错误时，回滚数据
						result="-1";
						return result;
					}
				}
				//记录报工日志
				if(!optReportLog(submitInfo,modelService)){
					hbtran.rollback();// 错误时，回滚数据
					result="-1";
					return result;
				}
			}
			catch(Exception ex){
				hbtran.rollback();// 错误时，回滚数据
				result="-1";
				return result;
			}
			
			hbtran.commit();
			return result;
		}
		catch(Exception ex){
			log.error("moReport:",ex);
			return "-1";
		}
	}
	
	/**
	 * 获取工厂日历信息
	 * @return
	 */
	private CalInfo getPeriod(String workStation,ModelService modelService){
		try{
			//变量
			CalInfo calInfo=new CalInfo();//工厂日历对象
			Date currentDate=new Date();
			int currentMonth=currentDate.getMonth();//获取当前月
			String currentTime=CommonMethod.Common.date2String(currentDate, "HH:mm:ss");
			String currentTime1=CommonMethod.Common.date2String(currentDate, "HH:mm:ss");
			//获取工作中心对应的工厂日历(若不存在，则取默认工厂日历)
			String sqlStr="SELECT T.*\r\n" + 
					"FROM T_CO_CALENDAR T\r\n" + 
					"LEFT JOIN T_CO_CALENDAR_LINE A ON T.ID = A.CAL_ID\r\n" + 
					"LEFT JOIN T_CO_AREA B ON A.AREA_ID = B.CA_PARENTAREAID\r\n" + 
					"WHERE B.CA_ID = ?\r\n" + 
					"AND B.CA_TYPE = '2'";
			List<Map> dataList=modelService.listDataSql(sqlStr,new Object[]{workStation});
			if(null==dataList || dataList.size()<=0){
				sqlStr="SELECT T.* \r\n" + 
						"FROM T_CO_CALENDAR T\r\n" + 
						"WHERE T.CAL_DEFAULT_FLAG = 'Y'";
				dataList=modelService.listDataSql(sqlStr);
				if(null==dataList || dataList.size()<=0){
					return null;
				}
			}
			calInfo.id=dataList.get(0).get("ID").toString();
			calInfo.startMonth=Integer.parseInt(dataList.get(0).get("CAL_START_MONTH").toString());
			calInfo.endMonth=Integer.parseInt(dataList.get(0).get("CAL_END_MONTH").toString());
			//判定当前月份有效性
			if(calInfo.startMonth<calInfo.endMonth){
				if(currentMonth>calInfo.endMonth || currentMonth<calInfo.startMonth){
					return null;
				}
			}
			else {
				if(currentMonth>calInfo.endMonth && currentMonth<calInfo.startMonth){
					return null;
				}
			}
			//获取工作时段信息
			sqlStr="SELECT\r\n" + 
					"A.ID,\r\n" + 
					"A.CALW_START,\r\n" + 
					"A.CALW_END,\r\n" + 
					"COALESCE(A.CALW_REST_TOTAL,0) AS CALW_REST_TOTAL,\r\n" + 
					"A.CALW_TIME AS CALW_TIME,\r\n" + 
					"A.CALW_GROUP AS CALW_GROUP\r\n" + 
					"FROM T_CO_CALENDAR_WORKTIME A\r\n" + 
					"WHERE A.CAL_ID=?\r\n" + 
					"AND A.CALW_INTER_DAY='N'\r\n" + 
					"AND TO_TIMESTAMP('2018-01-01 '||TO_CHAR(A.CALW_START,'HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS')<=TO_TIMESTAMP('2018-01-01 '||?,'YYYY-MM-DD HH24:MI:SS')\r\n" + 
					"AND TO_TIMESTAMP('2018-01-01 '||TO_CHAR(A.CALW_END,'HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS')>TO_TIMESTAMP('2018-01-01 '||?,'YYYY-MM-DD HH24:MI:SS')\r\n" + 
					"\r\n" + 
					"UNION ALL\r\n" + 
					"\r\n" + 
					"SELECT\r\n" + 
					"A.ID,\r\n" + 
					"A.CALW_START,\r\n" + 
					"A.CALW_END,\r\n" + 
					"COALESCE(A.CALW_REST_TOTAL,0) AS CALW_REST_TOTAL,\r\n" + 
					"A.CALW_TIME AS CALW_TIME,\r\n" + 
					"A.CALW_GROUP AS CALW_GROUP\r\n" + 
					"FROM T_CO_CALENDAR_WORKTIME A\r\n" + 
					"WHERE A.CAL_ID=?\r\n" + 
					"AND A.CALW_INTER_DAY='Y'\r\n" + 
					"AND (TO_TIMESTAMP('2018-01-01 '||TO_CHAR(A.CALW_START,'HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS')<=TO_TIMESTAMP('2018-01-01 '||?,'YYYY-MM-DD HH24:MI:SS')\r\n" + 
					"OR TO_TIMESTAMP('2018-01-01 '||TO_CHAR(A.CALW_END,'HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS')>TO_TIMESTAMP('2018-01-01 '||?,'YYYY-MM-DD HH24:MI:SS'))";
			dataList=modelService.listDataSql(sqlStr,new Object[]{calInfo.id,currentTime,currentTime,calInfo.id,currentTime,currentTime});
			if(null==dataList || dataList.size()<=0){
				return null;
			}
			Map workTimeInfo=dataList.get(0);
			CalInfo resultCalInfo=new CalInfo();
			resultCalInfo.beginTime=workTimeInfo.get("CALW_START").toString();
			resultCalInfo.endTime=workTimeInfo.get("CALW_END").toString();
			resultCalInfo.restTime=Integer.parseInt(workTimeInfo.get("CALW_REST_TOTAL").toString());
			resultCalInfo.period=workTimeInfo.get("CALW_TIME").toString();
			resultCalInfo.group=workTimeInfo.get("CALW_GROUP").toString();
			return resultCalInfo;
		}
		catch(Exception ex){
			log.error("getPeriod:",ex);
			return null;
		}
	}
	
	/**
	 * 产品生产统计计算
	 * @return
	 */
	private Boolean optMidProductStatistic(SubmitInfo submitInfo,CalInfo calInfo,ModelService modelService){
		try{
			//变量
			Date currentDate=new Date();
			String currentDateTime=CommonMethod.Common.date2String(currentDate, "YYYY-MM-DD");
			//判定对应数据是否存在（若不存在则新增，若存在的则修改）
			String sqlStr="SELECT \r\n" + 
					"T.MPS_ID\r\n" + 
					"FROM T_MID_PRODUCT_STATISTIC T\r\n" + 
					"WHERE T.MPS_AREA_SN = ?\r\n" + 
					"AND T.MPS_PERIOD = ?\r\n" + 
					"AND T.MPS_MO_NUMBER = ?\r\n" + 
					"AND T.MPS_WORK_DATE = ?\r\n" + 
					"AND T.MPS_PROCESS_FACE = ?";
			List<Map> dataList=modelService.listDataSql(sqlStr,new Object[]{
					submitInfo.line,
					calInfo.period,
					submitInfo.moNumber,
					currentDateTime,
					submitInfo.face
					});
			if(null==dataList){
				return false;
			}
			if(dataList.size()>0){
				//更新
				sqlStr="UPDATE T_MID_PRODUCT_STATISTIC\r\n" + 
						"SET MPS_OK_PCS      = MPS_OK_PCS + ?,\r\n" + 
						"MPS_NG_POINTS   = MPS_NG_POINTS + 0,\r\n" + 
						"MPS_T_OK_PCS    = MPS_T_OK_PCS + 0,\r\n" + 
						"MPS_MO_INPUT    = MPS_MO_INPUT + ?,\r\n" + 
						"MPS_MO_OUTPUT   = MPS_MO_OUTPUT + ?,\r\n" + 
						"MPS_PO_INPUT    = MPS_PO_INPUT + ?,\r\n" + 
						"MPS_PO_OUTPUT   = MPS_PO_OUTPUT + ?,\r\n" + 
						"MPS_FACE_OUTPUT = MPS_FACE_OUTPUT + ?,\r\n" + 
						"MPS_SCRAP_QTY = MPS_SCRAP_QTY + 0\r\n" + 
						"WHERE MPS_AREA_SN = ?\r\n" + 
						"AND MPS_PERIOD = ?\r\n" + 
						"AND MPS_WORK_DATE = ?\r\n" + 
						"AND MPS_MO_NUMBER = ?\r\n" + 
						"AND MPS_PROCESS_FACE = ?";
                return modelService.execSql(sqlStr, new Object[]{
                        submitInfo.reportNum,
                        submitInfo.moInputNum,
                        submitInfo.moOutputNum,
                        submitInfo.poInputNum,
                        submitInfo.poOutputNum,
                        submitInfo.outPutFaceNum,
                        submitInfo.line,
                        calInfo.period,
                        currentDateTime,
                        submitInfo.moNumber,
                        submitInfo.face
                }) > 0;
			}
			else {
				sqlStr="INSERT INTO T_MID_PRODUCT_STATISTIC\r\n" + 
						"(MPS_ID,\r\n" + 
						"MPS_MO_NUMBER,\r\n" + 
						"MPS_PROJECT_ID,\r\n" + 
						"MPS_PROCESS_FACE,\r\n" + 
						"MPS_AREA_SN,\r\n" + 
						"MPS_MODEL_CODE,\r\n" + 
						"MPS_WORK_DATE,\r\n" + 
						"MPS_WORK_GROUP,\r\n" + 
						"MPS_PERIOD,\r\n" + 
						"MPS_BEGIN_TIME,\r\n" + 
						"MPS_END_TIME,\r\n" + 
						"MPS_REMOVED_TIME,\r\n" + 
						"MPS_OK_PCS,\r\n" + 
						"MPS_NG_POINTS,\r\n" + 
						"MPS_T_OK_PCS,\r\n" + 
						"MPS_TARGET_QTY,\r\n" + 
						"MPS_MO_INPUT,\r\n" + 
						"MPS_MO_OUTPUT,\r\n" + 
						"MPS_PO_INPUT,\r\n" + 
						"MPS_PO_OUTPUT,\r\n" + 
						"MPS_SCRAP_QTY,\r\n" + 
						"MPS_FACE_OUTPUT,\r\n" + 
						"DATA_AUTH)\r\n" + 
						"VALUES\r\n" + 
						"(F_C_GETNEWID(),\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"REPLACE(TO_CHAR(TO_TIMESTAMP(?,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS'),'1970-01-01',TO_CHAR(now(),'YYYY-MM-DD')),\r\n" + 
						"REPLACE(TO_CHAR(TO_TIMESTAMP(?,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS'),'1970-01-01',TO_CHAR(now(),'YYYY-MM-DD')),\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"0,\r\n" + 
						"0,\r\n" + 
						"0,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"0,\r\n" + 
						"?,\r\n" + 
						"?)";
                return modelService.execSql(sqlStr, new Object[]{
                        submitInfo.moNumber,
                        submitInfo.projectId,
                        submitInfo.face,
                        submitInfo.line,
                        submitInfo.itemCode,
                        currentDateTime,
                        calInfo.group,
                        calInfo.period,
                        calInfo.beginTime,
                        calInfo.endTime,
                        calInfo.restTime,
                        submitInfo.reportNum,
                        submitInfo.moInputNum,
                        submitInfo.moOutputNum,
                        submitInfo.poInputNum,
                        submitInfo.poOutputNum,
                        submitInfo.outPutFaceNum,
                        submitInfo.dataAuth
                }) > 0;
			}
        }
		catch(Exception ex){
			log.error("optMidProductStatistic:",ex);
			return false;
		}
	}
	
	/**
	 * 工序统计计算
	 * @return
	 */
	private Boolean optMidGroupStatistic(SubmitInfo submitInfo,CalInfo calInfo,ModelService modelService){
		try{
			//变量
			Date currentDate=new Date();
			String currentDateTime=CommonMethod.Common.date2String(currentDate, "YYYY-MM-DD");
			//判定对应数据是否存在（若不存在则新增，若存在的则修改）
			String sqlStr="SELECT \r\n" + 
					"T.MGS_ID\r\n" + 
					"FROM T_MID_GROUP_STATISTIC T\r\n" + 
					"WHERE T.MGS_AREA_SN = ?\r\n" + 
					"AND T.MGS_PERIOD = ?\r\n" + 
					"AND T.MGS_MO_NUMBER = ?\r\n" + 
					"AND T.MGS_WORK_DATE = ?\r\n" + 
					"AND T.MGS_PROCESS_FACE = ?\r\n" + 
					"AND T.MGS_GROUP_CODE = ?\r\n" + 
					"AND T.MGS_GROUP_SEQ = ?";
			List<Map> dataList=modelService.listDataSql(sqlStr,new Object[]{
					submitInfo.line,
					calInfo.period,
					submitInfo.moNumber,
					currentDateTime,
					submitInfo.face,
					submitInfo.group,
					submitInfo.groupSeq
					});
			if(null==dataList){
				return false;
			}
			if(dataList.size()>0){
				//更新
				sqlStr="UPDATE T_MID_GROUP_STATISTIC T\r\n" + 
						"SET MGS_OK_PCS  = MGS_OK_PCS + ?,\r\n" + 
						"MGS_NG_PCS      = MGS_NG_PCS + 0,\r\n" + 
						"MGS_NG_POINTS   = MGS_NG_POINTS + 0,\r\n" + 
						"MGS_T_OK_PCS    = MGS_T_OK_PCS + 0,\r\n" + 
						"MGS_T_NG_PCS    = MGS_T_NG_PCS + 0,\r\n" + 
						"MGS_T_NG_POINTS = MGS_T_NG_POINTS + 0,\r\n" + 
						"MGS_SCRAP_QTY   = MGS_SCRAP_QTY + 0\r\n" + 
						"WHERE T.MGS_AREA_SN = ?\r\n" + 
						"AND T.MGS_PERIOD = ?\r\n" + 
						"AND T.MGS_MO_NUMBER = ?\r\n" + 
						"AND T.MGS_GROUP_CODE = ?\r\n" + 
						"AND T.MGS_GROUP_SEQ = ?\r\n" + 
						"AND T.MGS_WORK_DATE = ?\r\n" + 
						"AND T.MGS_PROCESS_FACE = ?";
                return modelService.execSql(sqlStr, new Object[]{
                        submitInfo.reportNum,
                        submitInfo.line,
                        calInfo.period,
                        submitInfo.moNumber,
                        submitInfo.group,
                        submitInfo.groupSeq,
                        currentDateTime,
                        submitInfo.face
                }) > 0;
			}
			else {
				sqlStr="INSERT INTO T_MID_GROUP_STATISTIC\r\n" + 
						"(MGS_ID,\r\n" + 
						"MGS_MO_NUMBER,\r\n" + 
						"MGS_PROJECT_ID,\r\n" + 
						"MGS_PROCESS_FACE,\r\n" + 
						"MGS_AREA_SN,\r\n" + 
						"MGS_MODEL_CODE,\r\n" + 
						"MGS_GROUP_CODE,\r\n" + 
						"MGS_GROUP_SEQ,\r\n" + 
						"MGS_WORK_DATE,\r\n" + 
						"MGS_WORK_GROUP,\r\n" + 
						"MGS_PERIOD,\r\n" + 
						"MGS_BEGIN_TIME,\r\n" + 
						"MGS_END_TIME,\r\n" + 
						"MGS_REMOVED_TIME,\r\n" + 
						"MGS_OK_PCS,\r\n" + 
						"MGS_NG_PCS,\r\n" + 
						"MGS_NG_POINTS,\r\n" + 
						"MGS_T_OK_PCS,\r\n" + 
						"MGS_T_NG_PCS,\r\n" + 
						"MGS_T_NG_POINTS,\r\n" + 
						"MGS_SCRAP_QTY,\r\n" + 
						"DATA_AUTH)\r\n" + 
						"VALUES\r\n" + 
						"(F_C_GETNEWID(),\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"REPLACE(TO_CHAR(TO_TIMESTAMP(?,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS'),'1970-01-01',TO_CHAR(now(),'YYYY-MM-DD')),\r\n" + 
						"REPLACE(TO_CHAR(TO_TIMESTAMP(?,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS'),'1970-01-01',TO_CHAR(now(),'YYYY-MM-DD')),\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"0,\r\n" + 
						"0,\r\n" + 
						"0,\r\n" + 
						"0,\r\n" + 
						"0,\r\n" + 
						"0,\r\n" + 
						"?)";
                return modelService.execSql(sqlStr, new Object[]{
                        submitInfo.moNumber,
                        submitInfo.projectId,
                        submitInfo.face,
                        submitInfo.line,
                        submitInfo.itemCode,
                        submitInfo.group,
                        submitInfo.groupSeq,
                        currentDateTime,
                        calInfo.group,
                        calInfo.period,
                        calInfo.beginTime,
                        calInfo.endTime,
                        calInfo.restTime,
                        submitInfo.reportNum,
                        submitInfo.dataAuth
                }) > 0;
			}

        }
		catch(Exception ex){
			log.error("optMidGroupStatistic:",ex);
			return false;
		}
	}
	
	/**
	 * 阶别统计计算(投入工序)
	 * @return
	 */
	private Boolean optMidStepStatisticInput(SubmitInfo submitInfo,CalInfo calInfo,ModelService modelService){
		try{
			//变量
			Date currentDate=new Date();
			String currentDateTime=CommonMethod.Common.date2String(currentDate, "YYYY-MM-DD");
			//判定对应数据是否存在（若不存在则新增，若存在的则修改）
			String sqlStr="SELECT \r\n" + 
					"T.MSS_ID\r\n" + 
					"FROM T_MID_STEP_STATISTIC T\r\n" + 
					"WHERE  T.MSS_AREA_SN = ?\r\n" + 
					"AND T.MSS_BEGIN_GROUP = ?\r\n" + 
					"AND T.MSS_MO_NUMBER = ?\r\n" + 
					"AND T.MSS_WORK_DATE =?\r\n" + 
					"AND T.MSS_BEGIN_SEQ = ?\r\n" + 
					"AND T.MSS_PROCESS_FACE = ?\r\n" + 
					"AND T.MSS_PERIOD = ?";
			List<Map> dataList=modelService.listDataSql(sqlStr,new Object[]{
					submitInfo.line,
					submitInfo.group,
					submitInfo.moNumber,
					currentDateTime,
					submitInfo.groupSeq,
					submitInfo.face,
					calInfo.period
					});
			if(null==dataList){
				return false;
			}
			if(dataList.size()>0){
				//更新
				sqlStr="UPDATE T_MID_STEP_STATISTIC T\r\n" + 
						"SET MSS_STEP_INPUT = MSS_STEP_INPUT + ?\r\n" + 
						"WHERE T.MSS_AREA_SN = ?\r\n" + 
						"AND T.MSS_BEGIN_GROUP = ?\r\n" + 
						"AND T.MSS_MO_NUMBER = ?\r\n" + 
						"AND T.MSS_WORK_DATE = ?\r\n" + 
						"AND T.MSS_BEGIN_SEQ = ?\r\n" + 
						"AND T.MSS_PROCESS_FACE = ?\r\n" + 
						"AND T.MSS_PERIOD = ?";
                return modelService.execSql(sqlStr, new Object[]{
                        submitInfo.reportNum,
                        submitInfo.line,
                        submitInfo.group,
                        submitInfo.moNumber,
                        currentDateTime,
                        submitInfo.groupSeq,
                        submitInfo.face,
                        calInfo.period
                }) > 0;
			}
			else {
				sqlStr="INSERT INTO T_MID_STEP_STATISTIC\r\n" + 
						"(MSS_ID,\r\n" + 
						"MSS_MO_NUMBER,\r\n" + 
						"MSS_PROJECT_ID,\r\n" + 
						"MSS_PROCESS_FACE,\r\n" + 
						"MSS_AREA_SN,\r\n" + 
						"MSS_MODEL_CODE,\r\n" + 
						"MSS_COUNT_STEP,\r\n" + 
						"MSS_BEGIN_GROUP,\r\n" + 
						"MSS_BEGIN_SEQ,\r\n" + 
						"MSS_END_GROUP,\r\n" + 
						"MSS_END_SEQ,\r\n" + 
						"MSS_WORK_DATE,\r\n" + 
						"MSS_WORK_GROUP,\r\n" + 
						"MSS_PERIOD,\r\n" + 
						"MSS_BEGIN_TIME,\r\n" + 
						"MSS_END_TIME,\r\n" + 
						"MSS_REMOVED_TIME,\r\n" + 
						"MSS_STEP_INPUT,\r\n" + 
						"MSS_STEP_OUTPUT,\r\n" + 
						"MSS_T_OK_PCS,\r\n" + 
						"MSS_NG_PIONTS,\r\n" + 
						"MSS_OK_PCS,\r\n" + 
						"DATA_AUTH)\r\n" + 
						"SELECT F_C_GETNEWID(),\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"T.CRCO_STEP,\r\n" + 
						"T.CRCO_START_GROUP,\r\n" + 
						"T.CRCO_START_SEQ,\r\n" + 
						"T.CRCO_END_GROUP,\r\n" + 
						"T.CRCO_END_SEQ,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"REPLACE(TO_CHAR(TO_TIMESTAMP(?,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS'),'1970-01-01',TO_CHAR(now(),'YYYY-MM-DD')),\r\n" + 
						"REPLACE(TO_CHAR(TO_TIMESTAMP(?,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS'),'1970-01-01',TO_CHAR(now(),'YYYY-MM-DD')),\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"0,\r\n" + 
						"0,\r\n" + 
						"0,\r\n" + 
						"0,\r\n" + 
						"?\r\n" + 
						"FROM T_CO_ROUTE_COUNT T\r\n" + 
						"WHERE T.CR_ROUTE_ID = ?\r\n" + 
						"AND T.CRCO_START_GROUP = ?\r\n" + 
						"AND T.CRCO_START_SEQ = ?";
                return modelService.execSql(sqlStr, new Object[]{
                        submitInfo.moNumber,
                        submitInfo.projectId,
                        submitInfo.face,
                        submitInfo.line,
                        submitInfo.itemCode,
                        currentDateTime,
                        calInfo.group,
                        calInfo.period,
                        calInfo.beginTime,
                        calInfo.endTime,
                        calInfo.restTime,
                        submitInfo.reportNum,
                        submitInfo.dataAuth,
                        submitInfo.routeId,
                        submitInfo.group,
                        submitInfo.groupSeq
                }) > 0;
			}

        }
		catch(Exception ex){
			log.error("optMidStepStatisticInput:",ex);
			return false;
		}
	}
	
	/**
	 * 阶别统计计算(末道工序)
	 * @return
	 */
	private Boolean optMidStepStatisticOutput(SubmitInfo submitInfo,CalInfo calInfo,ModelService modelService){
		try{
			//变量
			Date currentDate=new Date();
			String currentDateTime=CommonMethod.Common.date2String(currentDate, "YYYY-MM-DD");
			//判定对应数据是否存在（若不存在则新增，若存在的则修改）
			String sqlStr="SELECT \r\n" + 
					"T.MSS_ID\r\n" + 
					"FROM T_MID_STEP_STATISTIC T\r\n" + 
					"WHERE  T.MSS_AREA_SN = ?\r\n" + 
					"AND T.MSS_END_GROUP = ?\r\n" + 
					"AND T.MSS_MO_NUMBER = ?\r\n" + 
					"AND T.MSS_WORK_DATE =?\r\n" + 
					"AND T.MSS_END_SEQ = ?\r\n" + 
					"AND T.MSS_PROCESS_FACE = ?\r\n" + 
					"AND T.MSS_PERIOD = ?";
			List<Map> dataList=modelService.listDataSql(sqlStr,new Object[]{
					submitInfo.line,
					submitInfo.group,
					submitInfo.moNumber,
					currentDateTime,
					submitInfo.groupSeq,
					submitInfo.face,
					calInfo.period
					});
			if(null==dataList){
				return false;
			}
			if(dataList.size()>0){
				//更新
				sqlStr="UPDATE T_MID_STEP_STATISTIC T\r\n" + 
						"SET MSS_OK_PCS = MSS_OK_PCS + ?\r\n" + 
						"WHERE T.MSS_AREA_SN = ?\r\n" + 
						"AND T.MSS_END_GROUP = ?\r\n" + 
						"AND T.MSS_MO_NUMBER = ?\r\n" + 
						"AND T.MSS_WORK_DATE = ?\r\n" + 
						"AND T.MSS_END_SEQ = ?\r\n" + 
						"AND T.MSS_PROCESS_FACE = ?\r\n" + 
						"AND T.MSS_PERIOD = ?";
                return modelService.execSql(sqlStr, new Object[]{
                        submitInfo.reportNum,
                        submitInfo.line,
                        submitInfo.group,
                        submitInfo.moNumber,
                        currentDateTime,
                        submitInfo.groupSeq,
                        submitInfo.face,
                        calInfo.period
                }) > 0;
			}
			else {
				sqlStr="INSERT INTO T_MID_STEP_STATISTIC\r\n" + 
						"(MSS_ID,\r\n" + 
						"MSS_MO_NUMBER,\r\n" + 
						"MSS_PROJECT_ID,\r\n" + 
						"MSS_PROCESS_FACE,\r\n" + 
						"MSS_AREA_SN,\r\n" + 
						"MSS_MODEL_CODE,\r\n" + 
						"MSS_COUNT_STEP,\r\n" + 
						"MSS_BEGIN_GROUP,\r\n" + 
						"MSS_BEGIN_SEQ,\r\n" + 
						"MSS_END_GROUP,\r\n" + 
						"MSS_END_SEQ,\r\n" + 
						"MSS_WORK_DATE,\r\n" + 
						"MSS_WORK_GROUP,\r\n" + 
						"MSS_PERIOD,\r\n" + 
						"MSS_BEGIN_TIME,\r\n" + 
						"MSS_END_TIME,\r\n" + 
						"MSS_REMOVED_TIME,\r\n" + 
						"MSS_STEP_INPUT,\r\n" + 
						"MSS_STEP_OUTPUT,\r\n" + 
						"MSS_T_OK_PCS,\r\n" + 
						"MSS_NG_PIONTS,\r\n" + 
						"MSS_OK_PCS,\r\n" + 
						"DATA_AUTH)\r\n" + 
						"SELECT F_C_GETNEWID(),\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"T.CRCO_STEP,\r\n" + 
						"T.CRCO_START_GROUP,\r\n" + 
						"T.CRCO_START_SEQ,\r\n" + 
						"T.CRCO_END_GROUP,\r\n" + 
						"T.CRCO_END_SEQ,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"?,\r\n" + 
						"REPLACE(TO_CHAR(TO_TIMESTAMP(?,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS'),'1970-01-01',TO_CHAR(now(),'YYYY-MM-DD')),\r\n" + 
						"REPLACE(TO_CHAR(TO_TIMESTAMP(?,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD HH24:MI:SS'),'1970-01-01',TO_CHAR(now(),'YYYY-MM-DD')),\r\n" + 
						"?,\r\n" + 
						"0,\r\n" + 
						"?,\r\n" + 
						"0,\r\n" + 
						"0,\r\n" + 
						"0,\r\n" + 
						"?\r\n" + 
						"FROM T_CO_ROUTE_COUNT T\r\n" + 
						"WHERE T.CR_ROUTE_ID = ?\r\n" + 
						"AND T.CRCO_START_GROUP = ?\r\n" + 
						"AND T.CRCO_START_SEQ = ?";
                return modelService.execSql(sqlStr, new Object[]{
                        submitInfo.moNumber,
                        submitInfo.projectId,
                        submitInfo.face,
                        submitInfo.line,
                        submitInfo.itemCode,
                        currentDateTime,
                        calInfo.group,
                        calInfo.period,
                        calInfo.beginTime,
                        calInfo.endTime,
                        calInfo.restTime,
                        submitInfo.reportNum,
                        submitInfo.dataAuth,
                        submitInfo.routeId,
                        submitInfo.group,
                        submitInfo.groupSeq
                }) > 0;
			}

        }
		catch(Exception ex){
			log.error("optMidStepStatisticOutput:",ex);
			return false;
		}
	}
	
	/**
	 * 记录报工日志
	 * @param submitInfo
	 * @param calInfo
	 * @param modelService
	 * @return
	 */
	private Boolean optReportLog(SubmitInfo submitInfo,ModelService modelService){
		try{
			String sqlStr="INSERT INTO T_PM_FINISH_REPORT\r\n" + 
					"(\r\n" + 
					"ID,\r\n" + 
					"TPFR_AREA_SN,\r\n" + 
					"TPFR_FACE,\r\n" + 
					"TPFR_GROUP,\r\n" + 
					"TPFR_GROUP_SEQ,\r\n" + 
					"TPFR_MONUMBER,\r\n" + 
					"TPFR_NUM,\r\n" + 
					"TPFR_TRACK,\r\n" + 
					"TPFR_REPORT_DATE\r\n" + 
					")VALUES\r\n" + 
					"(\r\n" + 
					"F_C_GETNEWID(),\r\n" + 
					"?,\r\n" + 
					"?,\r\n" + 
					"?,\r\n" + 
					"?,\r\n" + 
					"?,\r\n" + 
					"?,\r\n" + 
					"?,\r\n" + 
					"?\r\n" + 
					")";
            return modelService.execSql(sqlStr, new Object[]{
                    submitInfo.line,
                    submitInfo.face,
                    submitInfo.group,
                    submitInfo.groupSeq,
                    submitInfo.moNumber,
                    submitInfo.reportNum,
                    submitInfo.track,
                    new Date()
            }) > 0;
        }
		catch(Exception ex){
			log.error("optReportLog:",ex);
			return false;
		}
	}
	
	/**
	 * 工厂日历对象
	 * @author Chaos
	 *
	 */
	public class CalInfo{
		public String id;
		public int startMonth;
		public int endMonth;
		public String beginTime;
		public String endTime;
		public int restTime;
		public String period;
		public String group;
	}
	
	/**
	 * 提交数据对象
	 * @author Chaos
	 *
	 */
	public class SubmitInfo{
		public String workStation;
		public String line;
		public String group;
		public String groupSeq;
		public String moNumber;
		public String projectId;
		public int reportNum=0;
		public String track;
		public String face;
		public String itemCode;
		public Boolean isMoStartGroup;
		public Boolean isMoEndGroup;
		public Boolean isPoStartGroup;
		public Boolean isPoEndGroup;
		public Boolean isOutputFace;
		public Boolean isStepInputGroup;
		public Boolean isStepOutputGroup;
		public int moInputNum=0;
		public int moOutputNum=0;
		public int poInputNum=0;
		public int poOutputNum=0;
		public int outPutFaceNum=0;
        public String dataAuth;
        public String routeId;
	}
}

