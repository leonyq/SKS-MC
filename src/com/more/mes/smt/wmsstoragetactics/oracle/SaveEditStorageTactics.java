package com.more.mes.smt.wmsstoragetactics.oracle;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存修改的仓库存储策略信息
 * @author development
 *
 */
public class SaveEditStorageTactics implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String formId = request.getParameter("formId");
	    boolean totalFlag = false;
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	String id = request.getParameter("dataId");
			String wstWareHouse = request.getParameter("WST_WAREHOUSE");//仓库
			String wstWareArea = request.getParameter("WST_WARE_AREA");//库区
			String wstWareSite = request.getParameter("WST_WARE_SITE");//库位
			String wstContralType = request.getParameter("paraMapObj.WST_CONTRAL_TYPE");//管控类型
			String wstValidFlag = request.getParameter("paraMapObj.WST_VALID_FLAG");//有效标志
			String wstEffectiveFlag = request.getParameter("paraMapObj.WST_EFFECTIVE_FLAG");//有效时间管控
			String wstMemo = request.getParameter("paraMapObj.WST_MEMO");//备注
			String wstBeginTime = null;//开始时间
			String wstEndTime = null;//结束时间
			String wstContralValue = null;//管控值
			if(wstContralType.equals("1")){  //管控类型为物料类型
				wstContralValue = request.getParameter("paraMapObj.WST_CONTRAL_VALUE");
			}else if(wstContralType.equals("2")){  //管控类型为物料代码
				wstContralValue = request.getParameter("paraMapObj.WST_ITEMCODE_CTRL");
			}else if(wstContralType.equals("3")){  //管控类型为供应商
				wstContralValue = request.getParameter("paraMapObj.WST_SUPCODE_CTRL");
			}else if(wstContralType.equals("4")){  //管控类型为客户
				wstContralValue = request.getParameter("paraMapObj.WST_CUST_CTRL");
			}else if(wstContralType.equals("5")){  //管控类型为批次
				wstContralValue = "只允许存储相同批次物料";
			}
			if(wstValidFlag == null || wstValidFlag == "" || wstValidFlag.equals("")){
				wstValidFlag = "N";
		    }
			if(wstEffectiveFlag == null || wstEffectiveFlag == "" || wstEffectiveFlag.equals("")){
				wstEffectiveFlag = "N";
		    }else{
		    	wstBeginTime = request.getParameter("paraMapObj.WST_BEGIN_TIME");
		    	wstEndTime = request.getParameter("paraMapObj.WST_END_TIME");
		    }
			//仓库/库区/库位、管控类型、管控值进行唯一性校验
			String sql = "SELECT t.* FROM T_WMS_STORAGE_TACTICS t WHERE t.wst_area_sn=? " +
					"AND t.wst_contral_type=? AND t.wst_contral_value=? AND t.id!=? AND t.data_auth=? ";
			int count = 0;
			if(!wstWareSite.equals("")){
				count = modelService.countSql(sql, new Object[] {wstWareSite,wstContralType,wstContralValue,id,dataAuth});
			}else if(!wstWareArea.equals("")){
				count = modelService.countSql(sql, new Object[] {wstWareArea,wstContralType,wstContralValue,id,dataAuth});
			}else{
				count = modelService.countSql(sql, new Object[] {wstWareHouse,wstContralType,wstContralValue,id,dataAuth});
			}
			if (count != 0){
		        return modelAction.alertParentInfo(modelAction.getText("同一组织/仓库/库区/库位、管控类型管控值不能相同"));
		    }
			//若当前设置的为库位，需校验该是否违反库位所属的库区、仓库的设置规则
			if(!wstWareSite.equals("")){
				// String querySql = "select * from T_WMS_AREA t start with t.wa_area_sn=? " +
				// "connect by prior t.wa_superior_sn=t.wa_area_sn";
				String querySql = "select * from T_WMS_AREA t start with t.wa_area_sn=? and t.data_auth=? " +
						"connect by prior t.wa_superior_sn=t.wa_area_sn  ";

				List<Map> sList = modelService.listDataSql(querySql,
						new Object[] { wstWareSite, dataAuth, dataAuth });
				
				String checkSql = "SELECT t.* FROM T_WMS_STORAGE_TACTICS t WHERE t.wst_area_sn=? and t.data_auth=? ";
				List<Map> pList = null;
				boolean flag = false;
				if(wstContralType.equals("2")){ //如何选择管控类型为物料代码
				    for (int p = 1; p < sList.size(); p++){
				        pList = modelService.listDataSql(checkSql, new Object[]{ sList.get(p).get("WA_AREA_SN"), dataAuth});
				        String type = null;
				        String ctrlVal = null;
				        for (int i = 0; i < pList.size(); i++) {
				            type = (String) pList.get(i).get("WST_CONTRAL_TYPE"); //父级管控类型
				            ctrlVal = (String) pList.get(i).get("WST_CONTRAL_VALUE");//父级管控值
				            if(type.equals("1")){ //如果管控类型有物料类型,则ctrVal存的为物料类别
				                //根据选择的物料代码获取物料的物料类别
				                String checkSql1 = "SELECT t.ci_item_genre FROM T_CO_ITEM t WHERE t.ci_item_code=? AND t.data_auth=? ";
				                List<Map> tList = modelService.listDataSql(checkSql1,new Object[] { wstContralValue, dataAuth });
				                if(tList == null || tList.size() == 0) continue;
				                String itemType1 = (String) tList.get(0).get("CI_ITEM_GENRE"); //物料类别
				                if(itemType1.equals(ctrlVal)) {
				                    flag = true;
				                    break;
				                }
				            }
				            if(type.equals("2")){ //如果管控类型有物料代码，则ctrVal存的为物料料号
				                if(wstContralValue.equals(ctrlVal)){
				                    flag = true;
				                    break;
				                }
				            }
				        }
				        
				    }
				    if (!flag && pList.size() > 0) {
    							return modelAction.alertParentInfo(modelAction.getText("请选择仓库所对应类别的物料代码"));
				    }
				}
				//如果新增管控类型不是物料代码，则执行如下代码
				if(!flag){
				    for(int p = 1; p < sList.size(); p++) {
				        pList = modelService.listDataSql(checkSql,new Object[] { sList.get(p).get("WA_AREA_SN"), dataAuth });
				        // 父级若设置具体的物料/客户/供应商/批次规则，则子集不允许设置该类型
    					String type = null;
    					String ctrlVal = null;
    					for(int i=0; i<pList.size();i++){
    					    type = (String) pList.get(i).get("WST_CONTRAL_TYPE"); //父级管控类型
						    ctrlVal = (String) pList.get(i).get("WST_CONTRAL_VALUE"); //父级管控值
						    if(wstContralType.equals(type) && wstContralValue.equals(ctrlVal)){
						        flag = true;
						        break;
						    }
    					}
				    }
				    if(!flag) return modelAction.alertParentInfo(modelAction.getText("请选择仓库或库区所对应的管控类别"));
				}
				totalFlag = true;
			}
			if(!totalFlag){
			    	//若当前设置的为库区，需校验该是否违反库位所属仓库的设置规则
    			if(!wstWareArea.equals("")&&wstWareSite.equals("")){
    				// String querySql = "select * from T_WMS_AREA t start with t.wa_area_sn=? " +
    				// "connect by prior t.wa_superior_sn=t.wa_area_sn";
    			String querySql = "select * from T_WMS_AREA t start with t.wa_area_sn=?  and t.data_auth=? " +
						"connect by prior t.wa_superior_sn=t.wa_area_sn ";

    				List<Map> sList = modelService.listDataSql(querySql,
    						new Object[] { wstWareArea, dataAuth });
    				String WAREHOUSE="";
    				if(sList!=null && !sList.isEmpty()) {
    				    WAREHOUSE = (String) sList.get(1).get("WA_AREA_SN");// 仓库
    				}
    				String checkSql = "SELECT t.* FROM T_WMS_STORAGE_TACTICS t WHERE t.wst_area_sn=? AND t.data_auth=? ";
    				// 仓库判断
    				List<Map> pList1 = modelService.listDataSql(checkSql, new Object[] { WAREHOUSE, dataAuth });
    				String type = null;
    				String ctrlVal = null;
    				boolean flag = false;
    				//如果选择管控类型为物料代码
    				if (wstContralType.equals("2")){
    				    for (int i = 0; i < pList1.size(); i++){
        				    type = (String) pList1.get(i).get("WST_CONTRAL_TYPE");
        					ctrlVal = (String) pList1.get(i).get("WST_CONTRAL_VALUE");
            				if(type.equals("1")) { //如果父级管控类型为物料类型
            					// 取出仓库所设置的物料类别
        						String itemType = (String) pList1.get(i).get("WST_CONTRAL_VALUE"); //父级管控类别
        						// 根据选择的物料代码获取物料类别
        						String checkSql1 = "SELECT t.ci_item_genre FROM T_CO_ITEM t WHERE t.ci_item_code=? AND t.data_auth=? "; //父级管控物料类别
        						List<Map> tList = modelService.listDataSql(checkSql1,new Object[] { wstContralValue, dataAuth });
        						if(tList == null || tList.size() == 0) continue;
        						String itemType1 = (String) tList.get(0).get("CI_ITEM_GENRE"); //物料类别
        						if(itemType1.equals(ctrlVal)){
        						    flag = true;
        						    break;
        						}
        					}
        					
        					//如果父级有管控类型为物料代码类型，直接比较物料代码是否一致
        					if(type.equals("2")){
        					    if(wstContralValue.equals(ctrlVal)){
    				                    flag = true;
    				                    break;
    				            }
        					}
    					    if (!flag && pList1.size() > 0) {
    							return modelAction.alertParentInfo(modelAction.getText("请选择仓库所对应类别的物料代码"));
    					    }
    				    }
    				}
    				if(!flag){//选择的管控类型不是物料代码类型
    				    for (int i = 0; i < pList1.size(); i++){
    				       type = (String) pList1.get(i).get("WST_CONTRAL_TYPE");
        				   ctrlVal = (String) pList1.get(i).get("WST_CONTRAL_VALUE"); 
        				   if(type.equals(wstContralType) && ctrlVal.equals(wstContralValue)){
        				       flag = true;
        				       break;
        				   }
    				    }
    				    if(!flag) return modelAction.alertParentInfo(modelAction.getText("请选择仓库所对应的管控类别"));
    				}
    
    			}
    			totalFlag = true;
			}
	        //校验完成后进行保存 仓库存储策略信息
			List list = new ArrayList();
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_STORAGE_TACTICS");
			CommMethod.editSysDefCol(wms.getColMap(), modelAction.getUser());
			list.add(id);
			wms.setSqlWhere(" and id=?");
			wms.setSqlWhereArgs(list);
			wms.getColMap().put("WST_CONTRAL_TYPE", wstContralType);
			wms.getColMap().put("WST_CONTRAL_VALUE", wstContralValue);
			wms.getColMap().put("WST_VALID_FLAG", wstValidFlag);
			wms.getColMap().put("WST_EFFECTIVE_FLAG", wstEffectiveFlag);
			if(!wstEffectiveFlag.equals("N")){
				if(StringUtils.isNotBlank(wstBeginTime)){
				  
					wms.getColMap().put("WST_BEGIN_TIME", DateUtil.parseDate(wstBeginTime));
				}
				if(StringUtils.isNotBlank(wstEndTime)){
					wms.getColMap().put("WST_END_TIME",DateUtil.parseDate(wstEndTime));
				}
			}
			wms.getColMap().put("WST_MEMO", wstMemo);
			if(dataAuth!=null){
				wms.getColMap().put("DATA_AUTH", dataAuth);
		    }
			modelService.edit(wms);
    		    
			
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("修改失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
