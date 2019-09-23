package com.more.mes.smt.passstation;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 *  
 * @author development
 *
 */
public class SavePassSNInfo implements FuncService {

    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        String sn = request.getParameter("sn"); 
        String workcenter = request.getParameter("workcenter");
        String mo_number = request.getParameter("mo_number");
        String qualityNo = request.getParameter("qualityNo"); //产品合格证号
        String img_list = request.getParameter("img_list");
        //判断产品信息是否存在
        String sql = "select * from v_lbj_detail_info t where t.JH=? ";
        List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[]{sn});
        if(list!=null&&list.size()>0){
        	modelAction.setAjaxString("OK:产品"+sn+"保存成功");
        	//if("".equals(img_list)==false){
            TableDataMapExt mTable = new TableDataMapExt();
            mTable.setTableName("T_WIP_SN_PHOTO_INFO");
            Map colMap = mTable.getColMap();
            CommMethod.addSysDefCol(colMap, modelAction.getUser());
            colMap.put("WSP_SN", sn); 
            colMap.put("WSP_QUALITY_NO", qualityNo);
            //colMap.put("WSP_MO_NUMBER", list.get(0).get("WT_MO_NUMBER"));
            //colMap.put("WSP_WORKCENTER", list.get(0).get("WT_WORK_STATION")); 
            colMap.put("WSP_PHOTOS", img_list); 
            colMap.put("ID", StringUtils.getUUID());
            modelService.save(mTable);
            
            //}
        }else{
        	modelAction.setAjaxString("NG:产品"+sn+"不存在");
        }
        
        return BaseActionSupport.AJAX;
    }
 public boolean checkSnRoute(String sn, String work_station, ModelAction modelAction, ModelService modelService) {
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = { 1, 2 };
		int[] outplace = { 3, 4, 5 , 6 };
        List<Object> list = new ArrayList<Object>();
        list.add(sn);
        list.add(work_station);
        List outType = new ArrayList<Object>(); 
		outType.add("String");
		outType.add("String");
		outType.add("String");
		outType.add("String");
        pf.setClassName("P_C_CHECK_SN");// 存储过程的名字
        pf.setInPlace(inPlace);// 存储过程中in
        pf.setOutPlace(outplace); // 存储过程中out
        pf.setValArgs(list);// 存储过程中输入的参数
        pf.setTotalLen(list.size() + outType.size());// 总个数
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
