package com.more.mes.smt.handitem;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
//import com.more.mes.other.common.method.CommonMethod631;
/**
 *  
 * @author development
 *
 */
public class SaveProductSNInfo implements FuncService {

    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        String sn = request.getParameter("sn");
        String item_list = request.getParameter("item_list");
        String workcenter = request.getParameter("workcenter");
        String mo_number = request.getParameter("mo_number");
        
        //判断点位是否被关联过
        JSONArray array1 = JSONArray.fromObject(item_list);
        List<ITEM_LIST> itemList1 = JSONArray.toList(array1, ITEM_LIST.class);
        String sql2 = "SELECT WHL_ITEM_CODE FROM T_WIP_HAND_ITEM_LOG WHERE WHL_MO_NUMBER=? AND WHL_SN=? AND WHL_WORKCENTER=? AND instr(WHL_POINT,?)>0 ";
        String point = null;
        String[] points = null;
        for (ITEM_LIST mitem : itemList1) {
        	point = mitem.getCBD_POINT();
        	points = point.split(",");
        	int num = points.length;
        	for(int i=0;i<num;i++){
        		List<Map<String, Object>> alist = modelService.listDataSql(sql2, new Object[]{mo_number, sn, workcenter,points[i]});
        		if(alist!=null&&alist.size()>0){
        			if(StringUtils.isNotBlank(mitem.getITEM_SN())){
        				
        				if(mitem.getCBD_ITEM_CODE().equals(alist.get(0).get("WHL_ITEM_CODE")))
	        			modelAction.setAjaxString("点位"+points[i]+"已绑定");
	        			return BaseActionSupport.AJAX;
        			}
        		}
        	}
        }
        String workcenter_sql = "SELECT CA_GROUP FROM T_CO_AREA WHERE CA_ID=?";
        List<Map> workcenter_list = modelService.listDataSql(workcenter_sql, new Object[]{workcenter});
        //手插工序 固定DIP001
        //若是手插工序只第一次过站，否则直接调用校验过站存储过程
        if (workcenter_list.get(0).get("CA_GROUP").toString().equals("DIP001")) {
            boolean if_pass = modelService.countSql("SELECT 1 FROM T_WIP_DETAIL WHERE WD_SN=? AND WD_GROUP_CODE = ?", new Object[]{sn,"DIP001"}) > 0;
            if (if_pass == false) {
                if (checkSnRoute(sn, workcenter,mo_number, modelAction, modelService)) {
                    if(saveSnInfo(sn, workcenter, mo_number, modelAction, modelService)==false){
                        return BaseActionSupport.AJAX;
                    }   
                }
                else{
                    return BaseActionSupport.AJAX;
                }
            } 
          //若是手工补焊只第一次过站，否则直接调用校验过站存储过程
        }else if(workcenter_list.get(0).get("CA_GROUP").toString().equals("SGBH001")){
        	boolean if_pass = modelService.countSql("SELECT 1 FROM T_WIP_DETAIL WHERE WD_SN=? AND WD_GROUP_CODE = ?", new Object[]{sn,"SGBH001"}) > 0;
            if (if_pass == false) {
                if (checkSnRoute(sn, workcenter,mo_number, modelAction, modelService)) {
                    if(saveSnInfo(sn, workcenter, mo_number, modelAction, modelService)==false){
                        return BaseActionSupport.AJAX;
                    }   
                }
                else{
                    return BaseActionSupport.AJAX;
                }
            }
        } else if (!workcenter_list.get(0).get("CA_GROUP").toString().equals("SMT003")) {
            if (checkSnRoute(sn, workcenter,mo_number, modelAction, modelService)) {
                if(saveSnInfo(sn, workcenter, mo_number, modelAction, modelService)==false){
                    return BaseActionSupport.AJAX;
                }
            }else{
                return BaseActionSupport.AJAX;
            }
        }
        
        if (!workcenter_list.get(0).get("CA_GROUP").toString().equals("SMT003")) {
	        JSONArray array = JSONArray.fromObject(item_list);
	        List<ITEM_LIST> itemList = JSONArray.toList(array, ITEM_LIST.class);
	        for (ITEM_LIST mitem : itemList) {
	            if (!"".equals(mitem.getITEM_SN()) && mitem.getITEM_SN() != null) {
	                String sql = "SELECT * FROM T_WIP_HAND_ITEM_LOG WHERE WHL_MO_NUMBER=? AND WHL_SN=? AND WHL_WORKCENTER=? AND WHL_ITEM_SN=?";
	                List<Map> existsList = modelService.listDataSql(sql, new Object[]{mo_number, sn, workcenter, mitem.getITEM_SN()});
	                TableDataMapExt handItemLog = new TableDataMapExt();
	                handItemLog.setTableName("T_WIP_HAND_ITEM_LOG");
	                Map colMap = handItemLog.getColMap();
	                CommMethod.addSysDefCol(colMap, modelAction.getUser());
	                colMap.put("WHL_SN", sn);
	                colMap.put("WHL_ITEM_SN", mitem.getITEM_SN());
	                
	                colMap.put("WHL_ITEM_CODE", mitem.getCBD_ITEM_CODE());
	                colMap.put("WHL_ITEM_LOT", mitem.getITEM_LOT());
	                
	                colMap.put("WHL_REMAIN_NUM", mitem.getREMAIN_NUM());
	                
	                colMap.put("WHL_MO_NUMBER", mo_number);
	                colMap.put("WHL_WORKCENTER", workcenter);
	                if (existsList == null || existsList.size() == 0) {
	                    colMap.put("ID", StringUtils.getUUID());
	                    colMap.put("WHL_POINT", mitem.getCBD_POINT());
	                    colMap.put("WHL_ITEM_NUM", mitem.getITEM_NUM());
	                    colMap.put("WHL_POINT_NUM", mitem.getCBD_ITEM_NUM());
	                    modelService.save(handItemLog);
	                } else {
	                    handItemLog.setSqlWhere(" and ID='" + existsList.get(0).get("ID").toString() + "'");
	                    colMap.put("WHL_POINT", existsList.get(0).get("WHL_POINT").toString()+","+mitem.getCBD_POINT());
	                    colMap.put("WHL_ITEM_NUM", Integer.parseInt(existsList.get(0).get("WHL_ITEM_NUM").toString())+mitem.getITEM_NUM());
	                    colMap.put("WHL_POINT_NUM", Integer.parseInt(existsList.get(0).get("WHL_POINT_NUM").toString())+mitem.getCBD_ITEM_NUM());
	                    modelService.edit(handItemLog);
	                }
	                modelService.execSql("UPDATE T_WMS_STOCK_INFO SET WSI_ITEM_NUM=WSI_ITEM_NUM-?,EDIT_TIME=SYSDATE,EDIT_USER=? WHERE WSI_ITEM_SN=?",new Object[]{mitem.getITEM_NUM(),modelAction.getUser().getId(),mitem.getITEM_SN()});
	                
		            //CommonMethod631.saveTaskLog(mitem.getITEM_SN(), modelAction.getUser().getLoginName(),StringUtils.toString(mitem.getITEM_NUM()),"手插上料",mo_number,"", modelService);
	
	            }
	        }
	        modelAction.setAjaxString("OK");
	        modelAction.setAjaxList(itemList);
        }
        
        //手贴
        if (workcenter_list.get(0).get("CA_GROUP").toString().equals("SMT003")){
        	String sql1 = "select t.MO_NUMBER from T_CO_SN_RELATION t where t.NEW_SN=? ";
            List<Map<String, Object>> list = modelService.listDataSql(sql1, new Object[]{sn});
            if(list!=null&&list.size()>0){
            	if(mo_number.equals(list.get(0).get("MO_NUMBER"))){
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
                            colMap.put("WHL_ITEM_LOT", mitem.getITEM_LOT());
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
                            
            	           // CommonMethod631.saveTaskLog(mitem.getITEM_SN(), modelAction.getUser().getLoginName(),"","手贴上料",mo_number,"", modelService);

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
        }
        
        return BaseActionSupport.AJAX;
    }
 public boolean checkSnRoute(String sn, String work_station,String mo_number, ModelAction modelAction, ModelService modelService) {
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = { 1, 2,3 };
		int[] outplace = { 3, 4, 5 , 6 };
        List<Object> list = new ArrayList<Object>();
        list.add(sn);
        list.add(work_station);
        list.add(mo_number);
        List outType = new ArrayList<Object>(); 
		outType.add("String");
		outType.add("String");
		outType.add("String");
		outType.add("String");
        pf.setClassName("P_XA_CHECK_SN");// 存储过程的名字
        pf.setInPlace(inPlace);// 存储过程中in
        pf.setOutPlace(outplace); // 存储过程中out
        pf.setValArgs(list);// 存储过程中输入的参数
        pf.setTotalLen(6);// 总个数
        pf.setOutValType(outType);// 输出的参数
        List<Object> relist = modelService.procComm(pf);// 接收返回值
        String res = StringUtils.toString(relist.get(3));
        if (res.indexOf("OK")!=0) {
            if (res.startsWith("NG:")) res = res.substring(3);
            modelAction.setAjaxString(res);
            return false;
        }
        modelAction.setAjaxString(res);
        return true;
    }


    public boolean saveSnInfo(String sn, String work_station, String mo_number, ModelAction modelAction, ModelService modelService) {

        String M_EMP = CommMethod.getSessionUser().getLoginName();// 员工号
        String FLOWCODE = "";// 流程码
        String RES = "";
        List<Object> bill = new ArrayList();// 输入过站信息
        // 生成清单
        bill.add(sn);
        bill.add(mo_number);
        bill.add(work_station);
        bill.add("");
        bill.add("");
        bill.add("");
        bill.add("");//
        bill.add(M_EMP);
        bill.add(0);// M_FLAG
        bill.add(FLOWCODE);
        bill.add(RES);
        String res = saveInfo(bill, modelService);
        if (res.indexOf("OK")!=0) {
            if (res.startsWith("NG:")) res = res.substring(3);
            modelAction.setAjaxString(res);
            return false;
        }
        modelAction.setAjaxString(res);
        return true;
    }

    public String saveInfo(List<Object> bill, ModelService modelService) {
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = {1, 2, 3, 4, 5, 6, 7, 8, 9};
        int[] outplace = {10, 11};
        List<Object> outType = new ArrayList<Object>();
        outType.add("String");
        outType.add("String");
        pf.setClassName("P_C_SAVE_SN_INFO");// 过站
        pf.setInPlace(inPlace);// 存储过程中in
        pf.setOutPlace(outplace); // 存储过程中out
        pf.setValArgs(bill.subList(0, 9));// 存储过程中输入的参数
        pf.setTotalLen(bill.size());// 总个数
        pf.setOutValType(outType);// 输出的参数
        List<Object> relist = modelService.procComm(pf);// 接收返回值
        String res = (String) relist.get(0); // 结果
        String res1 = (String) relist.get(1);
        return res1;
    }
    
     
}
