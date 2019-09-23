package com.more.mes.smt.handstickitem;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import net.sf.json.JSONArray;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.mes.smt.handitem.ITEM_LIST;
//import com.more.mes.other.common.method.CommonMethod631;
/**
 * 保存手贴物料信息
 * @author Administrator
 *
 */
public class SaveHandStickInfo implements FuncService{

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String sn = request.getParameter("sn");
        String item_list = request.getParameter("item_list");
        String workcenter = request.getParameter("workcenter");
        String mo_number = request.getParameter("mo_number");
        //判断产品sn是否存在
        String sql1 = "select t.WT_MO_NUMBER from t_wip_tracking t where t.WT_SN=? ";
        List<Map<String, Object>> list = modelService.listDataSql(sql1, new Object[]{sn});
        if(list!=null&&list.size()>0){
        	if(mo_number.equals(list.get(0).get("WT_MO_NUMBER"))){
        		JSONArray array = JSONArray.fromObject(item_list);
                List<ITEM_LIST> itemList = JSONArray.toList(array, ITEM_LIST.class);
                for (ITEM_LIST mitem : itemList) {
                    if (!"".equals(mitem.getITEM_SN()) && mitem.getITEM_SN() != null) {
                        String sql = "SELECT ID FROM T_WIP_HANDSTICK_LOG WHERE WHL_MO_NUMBER=? AND WHL_SN=? AND WHL_WORKCENTER=? AND WHL_ITEM_SN=?";
                        List<Map> existsList = modelService.listDataSql(sql, new Object[]{mo_number, sn, workcenter, mitem.getITEM_SN()});
                        TableDataMapExt handItemLog = new TableDataMapExt();
                        handItemLog.setTableName("T_WIP_HANDSTICK_LOG");
                        Map colMap = handItemLog.getColMap();
                        CommMethod.addSysDefCol(colMap, modelAction.getUser());
                        colMap.put("WHL_SN", sn);
                        colMap.put("WHL_ITEM_SN", mitem.getITEM_SN());
                        colMap.put("WHL_POINT", mitem.getCBD_POINT());
                        colMap.put("WHL_ITEM_CODE", mitem.getCBD_ITEM_CODE());
                        colMap.put("WHL_ITEM_LOT", "");
                        colMap.put("WHL_ITEM_NUM", mitem.getITEM_NUM());
                        colMap.put("WHL_POINT_NUM", mitem.getCBD_ITEM_NUM());
                        colMap.put("WHL_MO_NUMBER", mo_number);
                        colMap.put("WHL_WORKCENTER", workcenter);
                        if (existsList == null || existsList.size() == 0) {
                            colMap.put("ID", StringUtils.getUUID());
                            modelService.save(handItemLog);
                        } else {
                            handItemLog.setSqlWhere(" and ID='" + existsList.get(0).get("ID").toString() + "'");
                            modelService.edit(handItemLog);
                        }
                        
        	            //CommonMethod631.saveTaskLog(mitem.getITEM_SN(), modelAction.getUser().getLoginName(),"","手贴上料",mo_number,"", modelService);

                    }
                }
                modelAction.setAjaxString("OK");
                modelAction.setAjaxList(itemList);
        	}else{
        		modelAction.setAjaxString("NG:产品信息不属于该制令单");
        	}
        }else{
        	modelAction.setAjaxString("NG:产品信息不存在");
        }
		return BaseActionSupport.AJAX;
	}

}
