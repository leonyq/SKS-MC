package com.more.mes.smt.outmoinfo.oracle;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.login.model.UserDto;
import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * 仓库时序备料定时器
 * @author development
 *
 */
public class OutMoInfoTimer implements IJobx{
	
	private final Log log = LogFactory.getLog(this.getClass());

	private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

	@SuppressWarnings("unchecked")
	@Override
	public void exec(Args arg0) throws Exception {
		try {
			//获取备料间隔
			String sql = "select t.vr_value from T_SYS_PARAMETER_INI t WHERE t.vr_class='WMS0016' ";
			Map<String, Object> map = modelService.queryForMap(sql);
			//获取提前备料周期（天）
			String sql1 = "select t.vr_value from T_SYS_PARAMETER_INI t WHERE t.vr_class='WMS0020' ";
			Map<String, Object> map1 = modelService.queryForMap(sql1);
			double advanceTime = 0;
			if(map1.get("VR_VALUE")!=null){
				advanceTime = Double.parseDouble((String) map1.get("VR_VALUE"));
			}
			if(map.get("VR_VALUE")!=null){
				SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
				//取出系统默认用户sys001
				String userSql = "select t.* from SY_USER t WHERE t.login_name='sys001' ";
				List<UserDto> user = modelService.listSql(userSql, null, null, null, null, new UserDto());
				//生成存在于中间表的备料单  (非smt阶别的)
				String itemSql = "select distinct t.*,t1.wom_standard_hours,t1.WOM_NEXT_NUM " +
						"from T_PM_MO_BASE t " +
						"LEFT JOIN T_WMS_OUT_MO_INFO t1 ON t1.WOM_MO_NUMBER=t.PM_MO_NUMBER " +
						"AND t1.WOM_PROCESS_FACE=t.PM_PROCESS_FACE AND t1.wom_next_time<SYSDATE " +
						"WHERE EXISTS(SELECT 1 FROM T_WMS_OUT_MO_INFO a " +
						"WHERE a.WOM_MO_NUMBER=t.PM_MO_NUMBER " +
						"and a.WOM_PROCESS_FACE=t.PM_PROCESS_FACE) AND t.pm_product_step!='1' ";
				List<Map> itemList = modelService.listDataSql(itemSql);
				if(itemList!=null&&itemList.size()>0){
					int itemNum = itemList.size();
					TableDataMapExt doc = new TableDataMapExt();
					doc.setTableName("T_WMS_DOC_INFO");
					TableDataMapExt out = new TableDataMapExt();
					out.setTableName("T_WMS_OUTSTOCK_DOC");
					String idSql = "select t.* from T_PM_PROJECT_DETAIL t " +
							"where t.PROJECT_ID=? ";
					for(int i=0;i<itemNum;i++){
						String WDI_DOC_NUM = getOutNo(user.get(0).getDeptId(),"DJ10","",modelService);
						// 增加仓库单据信息表数据
						doc.getColMap().clear();
						CommMethod.addSysDefCol(doc.getColMap(), user.get(0));
						doc.getColMap().put("WDI_DOC_NUM", WDI_DOC_NUM);
						doc.getColMap().put("WDI_STATUS", "1");
						doc.getColMap().put("WDI_DOC_TYPE", "DJ10");
						doc.getColMap().put("WDI_URGENT_FLAG", "N");
						doc.getColMap().put("WDI_CREATE_MAN", user.get(0).getId());
						doc.getColMap().put("WDI_CREATE_TIME", DateUtil.getCurDate());
						modelService.save(doc);
						
						//插入出库单信息
						out.getColMap().clear();
						CommMethod.addSysDefCol(out.getColMap(), user.get(0));
						out.getColMap().put("WOD_DOC_NUM", WDI_DOC_NUM);
						out.getColMap().put("WOD_DOC_TYPE", "DJ10");
						out.getColMap().put("WOD_STATUS", "1");
						out.getColMap().put("WOD_OUTSTOCK_DATE", sdf2.parse(DateUtil.getCurDateStr()));
						out.getColMap().put("WOD_URGENT_FLAG", "N");
						out.getColMap().put("WOD_CREATE_MAN", user.get(0).getId());
						out.getColMap().put("WOD_CREATE_TIME", DateUtil.getCurDate());
						modelService.save(out);
						
						//获取对应的物料bom信息
						List<Map> idList = modelService.listDataSql(idSql,new Object[] {itemList.get(i).get("PM_PROJECT_ID")});
						if(idList!=null&&idList.size()>0){
							int idNum = idList.size();
							TableDataMapExt outStockItem = new TableDataMapExt();
						    outStockItem.setTableName("T_WMS_OUTSTOCK_ITEM");
							for(int j=0;j<idNum;j++){
								if(idList.get(j).get("CBD_ITEM_CODE")!=null){
									//插入出库单物料信息
									outStockItem.getColMap().clear();
									CommMethod.addSysDefCol(outStockItem.getColMap(), user.get(0));
									outStockItem.getColMap().put("WOI_DOC_NUM", WDI_DOC_NUM);// 出库单号
							        outStockItem.getColMap().put("WOI_STATUS", "1");// 物料状态
							        outStockItem.getColMap().put("WOI_ITEM_CODE", idList.get(j).get("CBD_ITEM_CODE"));// 物料料号
							        outStockItem.getColMap().put("WOI_PLAN_NUM", itemList.get(i).get("WOM_NEXT_NUM"));// 计划数量
							        outStockItem.getColMap().put("WOI_ITEM_SEQ", 0);// 项次
							        outStockItem.getColMap().put("WOI_CONNECT_DOC", itemList.get(i).get("PM_MO_NUMBER"));// 关联单号
							        modelService.save(outStockItem);
								}
							}
						}
					}
				}
				//生成存在于中间表的备料单  (smt阶别的)
				String itemSmtSql = "select distinct t.*,t1.wom_standard_hours,t1.WOM_NEXT_NUM " +
						"from T_PM_MO_BASE t " +
						"LEFT JOIN T_WMS_OUT_MO_INFO t1 ON t1.WOM_MO_NUMBER=t.PM_MO_NUMBER " +
						"AND t1.WOM_PROCESS_FACE=t.PM_PROCESS_FACE AND t1.wom_next_time<SYSDATE " +
						"WHERE EXISTS(SELECT 1 FROM T_WMS_OUT_MO_INFO a " +
						"WHERE a.WOM_MO_NUMBER=t.PM_MO_NUMBER " +
						"and a.WOM_PROCESS_FACE=t.PM_PROCESS_FACE) AND t.pm_product_step='1' ";
				List<Map> itemSmtList = modelService.listDataSql(itemSmtSql);
				if(itemSmtList!=null&&itemSmtList.size()>0){
					int smtNum = itemSmtList.size();
					TableDataMapExt doc = new TableDataMapExt();
					doc.setTableName("T_WMS_DOC_INFO");
					TableDataMapExt out = new TableDataMapExt();
					out.setTableName("T_WMS_OUTSTOCK_DOC");
					String idSql = "select distinct t.* from t_co_material_detail t " +
							"WHERE t.cm_sn IN(SELECT a.cm_sn FROM t_co_material_line a " +
							"LEFT JOIN t_co_material_table b ON b.cm_sn=a.cm_sn AND b.cm_model_code=? " +
							" WHERE a.cml_area_sn=? )";
					for(int i=0;i<smtNum;i++){
						String WDI_DOC_NUM = getOutNo(user.get(0).getDeptId(),"DJ10","",modelService);
						// 增加仓库单据信息表数据
						doc.getColMap().clear();
						CommMethod.addSysDefCol(doc.getColMap(), user.get(0));
						doc.getColMap().put("WDI_DOC_NUM", WDI_DOC_NUM);
						doc.getColMap().put("WDI_STATUS", "1");
						doc.getColMap().put("WDI_DOC_TYPE", "DJ10");
						doc.getColMap().put("WDI_URGENT_FLAG", "N");
						doc.getColMap().put("WDI_CREATE_MAN", user.get(0).getId());
						doc.getColMap().put("WDI_CREATE_TIME", DateUtil.getCurDate());
						modelService.save(doc);
						
						//插入出库单信息
						out.getColMap().clear();
						CommMethod.addSysDefCol(out.getColMap(), user.get(0));
						out.getColMap().put("WOD_DOC_NUM", WDI_DOC_NUM);
						out.getColMap().put("WOD_DOC_TYPE", "DJ10");
						out.getColMap().put("WOD_STATUS", "1");
						out.getColMap().put("WOD_OUTSTOCK_DATE", sdf2.parse(DateUtil.getCurDateStr()));
						out.getColMap().put("WOD_URGENT_FLAG", "N");
						out.getColMap().put("WOD_CREATE_MAN", user.get(0).getId());
						out.getColMap().put("WOD_CREATE_TIME", DateUtil.getCurDate());
						modelService.save(out);
						
						//获取对应的料站明细信息
						List<Map> idList = modelService.listDataSql(idSql,new Object[] {itemSmtList.get(i).get("PM_MODEL_CODE"),itemSmtList.get(i).get("PM_AREA_SN")});
						if(idList!=null&&idList.size()>0){
							int idNum = idList.size();
							TableDataMapExt outStockItem = new TableDataMapExt();
						    outStockItem.setTableName("T_WMS_OUTSTOCK_ITEM");
							for(int j=0;j<idNum;j++){
								if(idList.get(j).get("CMD_ITEM_CODE")!=null){
									//插入出库单物料信息
									outStockItem.getColMap().clear();
									CommMethod.addSysDefCol(outStockItem.getColMap(), user.get(0));
									outStockItem.getColMap().put("WOI_DOC_NUM", WDI_DOC_NUM);// 出库单号
							        outStockItem.getColMap().put("WOI_STATUS", "1");// 物料状态
							        outStockItem.getColMap().put("WOI_ITEM_CODE", idList.get(j).get("CMD_ITEM_CODE"));// 物料料号
							        outStockItem.getColMap().put("WOI_PLAN_NUM", itemSmtList.get(i).get("WOM_NEXT_NUM"));// 计划数量   等于下次备料数
							        outStockItem.getColMap().put("WOI_ITEM_SEQ", 0);// 项次
							        outStockItem.getColMap().put("WOI_CONNECT_DOC", itemSmtList.get(i).get("PM_MO_NUMBER"));// 关联单号
							        modelService.save(outStockItem);
								}
							}
						}
					}
				}
				//  若当前制令单/面别/已存在记录，再判读状态是否为正常，若是则进行数据修改
				String upSql = "select * from T_WMS_OUT_MO_INFO where WOM_STATUS='1' ";
				List<Map> uList = modelService.listDataSql(upSql);
				if(uList!=null&&uList.size()>0){
					int num = uList.size();
					TableDataMapExt wom = new TableDataMapExt();
					wom.setTableName("T_WMS_OUT_MO_INFO");
					for(int i=0;i<num;i++){
						//修改累积备料量=累积备料量 + 下次备料数，当前备料数 = 下次备料数，当前备料时间 = 系统时间
						wom.setSqlWhere(" and id ='"+uList.get(i).get("ID")+"'");
						wom.put("WOM_OUT_NUM", (int)uList.get(i).get("WOM_OUT_NUM")+(int)uList.get(i).get("WOM_NEXT_NUM"));
						wom.put("WOM_CURRENT_NUM", uList.get(i).get("WOM_CURRENT_NUM"));
						wom.put("WOM_NEXT_TIME", DateUtil.getCurDate());
						//若计划数量-累积备料数<=2*（备料间隔/标准工时）时，下次备料数=计划数量-累积备料数，下次备料时间 = 系统时间+备料间隔
						int planNum = (int)uList.get(i).get("WOM_MO_NUM")-(int)uList.get(i).get("WOM_OUT_NUM");
						int cNum = 2*((int)map.get("VR_VALUE")*3600/(int)uList.get(i).get("WOM_STANDARD_HOURS"));
						int nextNum = (int)map.get("VR_VALUE")*3600/(int)uList.get(i).get("WOM_STANDARD_HOURS");
						if(planNum<=cNum){
							wom.put("WOM_NEXT_NUM", planNum);
							Date newDate = DateUtil.getCurDate();
							Calendar ca = Calendar.getInstance();
							ca.add(Calendar.HOUR, (int)map.get("VR_VALUE"));
							newDate = ca.getTime();
							wom.put("WOM_NEXT_TIME", newDate);
						}else{
							//若计划数量-累积备料数>2*（备料间隔/标准工时）则下次备料数=备料间隔/标准工时（取整），下次备料时间为空
							wom.put("WOM_NEXT_NUM", nextNum);
							wom.put("WOM_NEXT_TIME", "");
						}
						modelService.save(wom);
					}
				}
				//若当前制令单+面别不存在记录(smt阶别)，生成备料单以及时序信息
				String addSmtSql = "select t.*,t1.cst_standard_time from T_PM_MO_BASE t " +
					"LEFT JOIN t_co_standard_time t1 ON t1.cst_model_code=t.pm_model_code " +
					"AND t1.cst_step_code=t.pm_product_step AND t1.cst_process_face=t.pm_process_face " +
					"where NOT EXISTS" +
					"(SELECT 1 FROM T_WMS_OUT_MO_INFO a WHERE a.WOM_MO_NUMBER=t.PM_MO_NUMBER " +
					"and a.WOM_PROCESS_FACE=t.PM_PROCESS_FACE) and t.pm_product_step='1' " +
					"and t.PM_STATUS not in('4','5') and t.PM_SCHEDULE_DATE<SYSDATE+"+advanceTime+"/24 and rownum<=1 ";
				List<Map> aList = modelService.listDataSql(addSmtSql);
				if(aList!=null&&aList.size()>0){
					int count = aList.size();
					TableDataMapExt outMo = new TableDataMapExt();
					outMo.setTableName("T_WMS_OUT_MO_INFO");
					TableDataMapExt doc = new TableDataMapExt();
					doc.setTableName("T_WMS_DOC_INFO");
					TableDataMapExt out = new TableDataMapExt();
					out.setTableName("T_WMS_OUTSTOCK_DOC");
					String idSql = "select distinct t.* from t_co_material_detail t " +
							"WHERE t.cm_sn IN(SELECT a.cm_sn FROM t_co_material_line a " +
							"LEFT JOIN t_co_material_table b ON b.cm_sn=a.cm_sn AND b.cm_model_code=? " +
							" WHERE a.cml_area_sn=? )";
					for(int i=0;i<count;i++){//取到了标准工时
						if(aList.get(i).get("CST_STANDARD_TIME")!=null){
							int cNum = 2*((int)map.get("VR_VALUE")*3600/(int)aList.get(i).get("CST_STANDARD_TIME"));
							int outNum = (int)map.get("VR_VALUE")*3600/(int)aList.get(i).get("CST_STANDARD_TIME");
							int planNum = (int)aList.get(i).get("PM_TARGET_QTY")-outNum;
							//插入时序信息
							outMo.getColMap().clear();
							CommMethod.addSysDefCol(outMo.getColMap(), user.get(0));
							outMo.getColMap().put("WOM_MO_NUMBER", aList.get(i).get("PM_MO_NUMBER"));
							outMo.getColMap().put("WOM_MODEL_CODE", aList.get(i).get("PM_MODEL_CODE"));
							outMo.getColMap().put("WOM_PROCESS_FACE", aList.get(i).get("PM_PROCESS_FACE"));
							outMo.getColMap().put("WOM_MO_NUM", aList.get(i).get("PM_TARGET_QTY"));
							outMo.getColMap().put("WOM_STANDARD_HOURS", map.get("VR_VALUE"));
							//若计划量< 2*（备料间隔/标准工时）时,则当前备料数 = 计划量，下次备料数 = 0 ，累积备料数 =计划量，下次备料时间为空，状态为关结
							if((int)aList.get(i).get("PM_TARGET_QTY")<cNum){
								outMo.getColMap().put("WOM_OUT_NUM", aList.get(i).get("PM_TARGET_QTY"));
								outMo.getColMap().put("WOM_CURRENT_NUM", aList.get(i).get("PM_TARGET_QTY"));
								outMo.getColMap().put("WOM_NEXT_NUM", 0);
								outMo.getColMap().put("WOM_STATUS", "3");
							}else{//若计划量> 2*（备料间隔/标准工时）    
								//当前备料数 = 备料间隔/标准工时（取整），累积备料数 = 备料间隔/标准工时（取整），
								outMo.getColMap().put("WOM_OUT_NUM", outNum);
								outMo.getColMap().put("WOM_CURRENT_NUM", outNum);
								//若计划数量-累积备料数<=2*（备料间隔/标准工时）时，下次备料数=计划数量-累积备料数，
								//当前备料时间 = 系统时间，下次备料时间 = 预计开工时间+备料间隔。状态为正常
								if(planNum<=cNum){
									outMo.getColMap().put("WOM_NEXT_NUM", planNum);
									outMo.getColMap().put("WOM_STATUS", "1");
									Date newDate = DateUtil.getCurDate();
									Calendar ca = Calendar.getInstance();
									ca.add(Calendar.HOUR, (int)aList.get(i).get("PM_SCHEDULE_DATE"));
									newDate = ca.getTime();
									outMo.put("WOM_NEXT_TIME", newDate);
								}else{
									//若计划数量-累积备料数>2*（备料间隔/标准工时）则下次备料数=备料间隔/标准工时（取整），
									//当前备料时间 = 系统时间，下次备料时间 = 预计开工时间+备料间隔。状态为正常
									outMo.getColMap().put("WOM_NEXT_NUM", outNum);
									outMo.getColMap().put("WOM_STATUS", "1");
									Date newDate = DateUtil.getCurDate();
									Calendar ca = Calendar.getInstance();
									ca.add(Calendar.HOUR, (int)aList.get(i).get("PM_SCHEDULE_DATE"));
									newDate = ca.getTime();
									outMo.put("WOM_NEXT_TIME", newDate);
								}
							}
							modelService.save(outMo);
							//生成生产领料单
							String WDI_DOC_NUM = getOutNo(user.get(0).getDeptId(),"DJ10","",modelService);
							// 增加仓库单据信息表数据
							doc.getColMap().clear();
							CommMethod.addSysDefCol(doc.getColMap(), user.get(0));
							doc.getColMap().put("WDI_DOC_NUM", WDI_DOC_NUM);
							doc.getColMap().put("WDI_STATUS", "1");
							doc.getColMap().put("WDI_DOC_TYPE", "DJ10");
							doc.getColMap().put("WDI_URGENT_FLAG", "N");
							doc.getColMap().put("WDI_CREATE_MAN", user.get(0).getId());
							doc.getColMap().put("WDI_CREATE_TIME", DateUtil.getCurDate());
							modelService.save(doc);
							
							//插入出库单信息
							out.getColMap().clear();
							CommMethod.addSysDefCol(out.getColMap(), user.get(0));
							out.getColMap().put("WOD_DOC_NUM", WDI_DOC_NUM);
							out.getColMap().put("WOD_DOC_TYPE", "DJ10");
							out.getColMap().put("WOD_STATUS", "1");
							out.getColMap().put("WOD_OUTSTOCK_DATE", sdf2.parse(DateUtil.getCurDateStr()));
							out.getColMap().put("WOD_URGENT_FLAG", "N");
							out.getColMap().put("WOD_CREATE_MAN", user.get(0).getId());
							out.getColMap().put("WOD_CREATE_TIME", DateUtil.getCurDate());
							modelService.save(out);
							
							//获取对应的料站明细信息
							List<Map> idList = modelService.listDataSql(idSql,new Object[] {aList.get(i).get("PM_AREA_SN"),aList.get(i).get("PM_MODEL_CODE")});
							if(idList!=null&&idList.size()>0){
								int idNum = idList.size();
								TableDataMapExt outStockItem = new TableDataMapExt();
							    outStockItem.setTableName("T_WMS_OUTSTOCK_ITEM");
								for(int j=0;j<idNum;j++){
									if(idList.get(j).get("CMD_ITEM_CODE")!=null){
										//插入出库单物料信息
										outStockItem.getColMap().clear();
										CommMethod.addSysDefCol(outStockItem.getColMap(), user.get(0));
										outStockItem.getColMap().put("WOI_DOC_NUM", WDI_DOC_NUM);// 出库单号
								        outStockItem.getColMap().put("WOI_STATUS", "1");// 物料状态
								        outStockItem.getColMap().put("WOI_ITEM_CODE", idList.get(j).get("CMD_ITEM_CODE"));// 物料料号
								        outStockItem.getColMap().put("WOI_PLAN_NUM", (int)idList.get(j).get("CMD_POINT_NUM")*outNum);// 计划数量
								        outStockItem.getColMap().put("WOI_ITEM_SEQ", 0);// 项次
								        outStockItem.getColMap().put("WOI_CONNECT_DOC", aList.get(i).get("PM_MO_NUMBER"));// 关联单号
								        modelService.save(outStockItem);
									}
								}
							}
						}
					}
				}
				//若当前制令单+面别不存在记录(非smt阶别)，生成备料单以及时序信息
				String addSql = "select t.*,t1.cst_standard_time from T_PM_MO_BASE t " +
					"LEFT JOIN t_co_standard_time t1 ON t1.cst_model_code=t.pm_model_code " +
					"AND t1.cst_step_code=t.pm_product_step AND t1.cst_process_face=t.pm_process_face " +
					"where NOT EXISTS" +
					"(SELECT 1 FROM T_WMS_OUT_MO_INFO a WHERE a.WOM_MO_NUMBER=t.PM_MO_NUMBER " +
					"and a.WOM_PROCESS_FACE=t.PM_PROCESS_FACE) and t.pm_product_step='1' " +
					"and t.PM_STATUS not in('4','5') and t.PM_SCHEDULE_DATE<SYSDATE+"+advanceTime+"/24 and rownum<=1 ";
				List<Map> addList = modelService.listDataSql(addSql);
				if(addList!=null&&addList.size()>0){
					int count = addList.size();
					TableDataMapExt outMo = new TableDataMapExt();
					outMo.setTableName("T_WMS_OUT_MO_INFO");
					TableDataMapExt doc = new TableDataMapExt();
					doc.setTableName("T_WMS_DOC_INFO");
					TableDataMapExt out = new TableDataMapExt();
					out.setTableName("T_WMS_OUTSTOCK_DOC");
					String idSql = "select t.* from T_PM_PROJECT_DETAIL t " +
							"where t.PROJECT_ID=? ";
					for(int i=0;i<count;i++){//取到了标准工时
						if(addList.get(i).get("CST_STANDARD_TIME")!=null){
							int cNum = 2*((int)map.get("VR_VALUE")*3600/(int)addList.get(i).get("CST_STANDARD_TIME"));
							int outNum = (int)map.get("VR_VALUE")*3600/(int)addList.get(i).get("CST_STANDARD_TIME");
							int planNum = (int)addList.get(i).get("PM_TARGET_QTY")-outNum;
							//插入时序信息
							outMo.getColMap().clear();
							CommMethod.addSysDefCol(outMo.getColMap(), user.get(0));
							outMo.getColMap().put("WOM_MO_NUMBER", addList.get(i).get("PM_MO_NUMBER"));
							outMo.getColMap().put("WOM_MODEL_CODE", addList.get(i).get("PM_MODEL_CODE"));
							outMo.getColMap().put("WOM_PROCESS_FACE", addList.get(i).get("PM_PROCESS_FACE"));
							outMo.getColMap().put("WOM_MO_NUM", addList.get(i).get("PM_TARGET_QTY"));
							outMo.getColMap().put("WOM_STANDARD_HOURS", map.get("VR_VALUE"));
							//若计划量< 2*（备料间隔/标准工时）时,则当前备料数 = 计划量，下次备料数 = 0 ，累积备料数 =计划量，下次备料时间为空，状态为关结
							if((int)addList.get(i).get("PM_TARGET_QTY")<cNum){
								outMo.getColMap().put("WOM_OUT_NUM", addList.get(i).get("PM_TARGET_QTY"));
								outMo.getColMap().put("WOM_CURRENT_NUM", addList.get(i).get("PM_TARGET_QTY"));
								outMo.getColMap().put("WOM_NEXT_NUM", 0);
								outMo.getColMap().put("WOM_STATUS", "3");
							}else{//若计划量> 2*（备料间隔/标准工时）    
								//当前备料数 = 备料间隔/标准工时（取整），累积备料数 = 备料间隔/标准工时（取整），
								outMo.getColMap().put("WOM_OUT_NUM", outNum);
								outMo.getColMap().put("WOM_CURRENT_NUM", outNum);
								//若计划数量-累积备料数<=2*（备料间隔/标准工时）时，下次备料数=计划数量-累积备料数，
								//当前备料时间 = 系统时间，下次备料时间 = 预计开工时间+备料间隔。状态为正常
								if(planNum<=cNum){
									outMo.getColMap().put("WOM_NEXT_NUM", planNum);
									outMo.getColMap().put("WOM_STATUS", "1");
									Date newDate = DateUtil.getCurDate();
									Calendar ca = Calendar.getInstance();
									ca.add(Calendar.HOUR, (int)addList.get(i).get("PM_SCHEDULE_DATE"));
									newDate = ca.getTime();
									outMo.put("WOM_NEXT_TIME", newDate);
								}else{
									//若计划数量-累积备料数>2*（备料间隔/标准工时）则下次备料数=备料间隔/标准工时（取整），
									//当前备料时间 = 系统时间，下次备料时间 = 当前备料时间+备料间隔。状态为正常
									outMo.getColMap().put("WOM_NEXT_NUM", outNum);
									outMo.getColMap().put("WOM_STATUS", "1");
									Date newDate = DateUtil.getCurDate();
									Calendar ca = Calendar.getInstance();
									ca.add(Calendar.HOUR, (int)addList.get(i).get("PM_SCHEDULE_DATE"));
									newDate = ca.getTime();
									outMo.put("WOM_NEXT_TIME", newDate);
								}
							}
							modelService.save(outMo);
							//生成生产领料单
							String WDI_DOC_NUM = getOutNo(user.get(0).getDeptId(),"DJ10","",modelService);
							// 增加仓库单据信息表数据
							doc.getColMap().clear();
							CommMethod.addSysDefCol(doc.getColMap(), user.get(0));
							doc.getColMap().put("WDI_DOC_NUM", WDI_DOC_NUM);
							doc.getColMap().put("WDI_STATUS", "1");
							doc.getColMap().put("WDI_DOC_TYPE", "DJ10");
							doc.getColMap().put("WDI_URGENT_FLAG", "N");
							doc.getColMap().put("WDI_CREATE_MAN", user.get(0).getId());
							doc.getColMap().put("WDI_CREATE_TIME", DateUtil.getCurDate());
							modelService.save(doc);
							
							//插入出库单信息
							out.getColMap().clear();
							CommMethod.addSysDefCol(out.getColMap(), user.get(0));
							out.getColMap().put("WOD_DOC_NUM", WDI_DOC_NUM);
							out.getColMap().put("WOD_DOC_TYPE", "DJ10");
							out.getColMap().put("WOD_STATUS", "1");
							out.getColMap().put("WOD_OUTSTOCK_DATE", sdf2.parse(DateUtil.getCurDateStr()));
							out.getColMap().put("WOD_URGENT_FLAG", "N");
							out.getColMap().put("WOD_CREATE_MAN", user.get(0).getId());
							out.getColMap().put("WOD_CREATE_TIME", DateUtil.getCurDate());
							modelService.save(out);
							
							//获取对应的料站明细信息
							List<Map> idList = modelService.listDataSql(idSql,new Object[] {addList.get(i).get("PM_PROJECT_ID")});
							if(idList!=null&&idList.size()>0){
								int idNum = idList.size();
								TableDataMapExt outStockItem = new TableDataMapExt();
							    outStockItem.setTableName("T_WMS_OUTSTOCK_ITEM");
								for(int j=0;j<idNum;j++){
									if(idList.get(j).get("CBD_ITEM_CODE")!=null){
										//插入出库单物料信息
										outStockItem.getColMap().clear();
										CommMethod.addSysDefCol(outStockItem.getColMap(), user.get(0));
										outStockItem.getColMap().put("WOI_DOC_NUM", WDI_DOC_NUM);// 出库单号
								        outStockItem.getColMap().put("WOI_STATUS", "1");// 物料状态
								        outStockItem.getColMap().put("WOI_ITEM_CODE", idList.get(j).get("CBD_ITEM_CODE"));// 物料料号
								        outStockItem.getColMap().put("WOI_PLAN_NUM", (int)idList.get(j).get("CBD_ITEM_NUM")*outNum);// 计划数量
								        outStockItem.getColMap().put("WOI_ITEM_SEQ", 0);// 项次
								        outStockItem.getColMap().put("WOI_CONNECT_DOC", addList.get(i).get("PM_MO_NUMBER"));// 关联单号
								        modelService.save(outStockItem);
									}
								}
							}
						}
					}
				}
			}
		} catch (Exception e) {
			log.error(e);
			throw new Exception();
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public String getOutNo(String dataAuth,String prefix,String dispatchSn,ModelService modelService){
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = {1, 2, 3};
	    int[] outplace = {4, 5};
	    List<Object> list = new ArrayList<Object>();
	    List<Object> outType = new ArrayList<Object>();
	    list.add(dataAuth);
	    list.add(prefix);
	    list.add(dispatchSn);
	    outType.add("String");
	    outType.add("String");
	    pf.setClassName("P_C_GET_DOC_NO");//生成检验单号
	    pf.setInPlace(inPlace);//存储过程中in 
	    pf.setOutPlace(outplace); //存储过程中out
	    pf.setValArgs(list);//存储过程中输入的参数
	    pf.setTotalLen(list.size()+outType.size());//总个数
	    pf.setOutValType(outType);//输出的参数
	    List<Object> relist = modelService.procComm(pf);//接收返回值
	    String res = (String) relist.get(0);  //结果
		return res;
	}

}
