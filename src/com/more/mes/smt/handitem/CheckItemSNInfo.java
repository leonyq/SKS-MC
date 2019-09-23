package com.more.mes.smt.handitem;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
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
/**
 *  
 * @author development
 *
 */
public class CheckItemSNInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest(); 
	    String item_sn = request.getParameter("item_sn");
	    String item_num = request.getParameter("item_num");  
	    String mo_number=request.getParameter("mo_number");
	     
	    String sql=" SELECT 1 FROM T_WIP_TRACKING WHERE WT_SN=?";
	    List<Map> itemList = modelService.listDataSql(sql, new Object[] {item_sn});
	    if(checkSnRule(item_sn,"717d253afce340059c734e96f2692cee",modelAction,modelService)){
    	    modelAction.setAjaxString("1");
	    }else{
    	    sql="SELECT *  \n"   +
                       "  FROM T_WMS_STOCK_INFO  \n"+
                       "  WHERE WSI_ITEM_SN = ?";
            String cSql = "select t.cr_item_mian from t_co_item_replace t\r\n" + 
            		///"left join t_pm_project_base t1 on t1.product_material=t.cr_model_code\r\n" + 
            		//"and t1.product_model=t.cr_moudle and t1.product_ver=t.cr_ver\r\n" + 
            		//"left join t_pm_mo_base t2 on t2.pm_project_id=t1.project_id\r\n" + 
            		"where t.cr_item_replace=? ";//t2.pm_mo_number=? and 
            itemList = modelService.listDataSql(sql, new Object[] {item_sn});
            Map<String, Object> map = new HashMap<String, Object>();
            if(itemList!=null&&itemList.size()>0){
            	List<Map<String, Object>> list = modelService.listDataSql(cSql, new Object[]{itemList.get(0).get("WSI_ITEM_CODE")});
            	if(list!=null&&list.size()>0){
            		map.put("itemMain", list.get(0).get("CR_ITEM_MIAN"));
            	}else{
            		map.put("itemMain", "");
            	}
            	
            }else{
            	map.put("itemMain", "");
            }
            
            modelAction.setAjaxMap(map);
            // if(itemList==null||itemList.size()==0){
            
            //     sql="SELECT *  \n"   +
            //           "  FROM T_WMS_STOCK_INFO_L  \n"+
            //           "  WHERE WSI_ITEM_SN = ?";
            //     itemList = modelService.listDataSql(sql, new Object[] {item_sn});
            // }
            modelAction.setAjaxString("2");
            modelAction.setAjaxList(itemList);
	    }
	    return BaseActionSupport.AJAX;
	}
	
	public boolean checkSnRule(String sn, String rule_id, ModelAction modelAction, ModelService modelService) {
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = {1, 2};
        int[] outplace = {3, 4, 5, 6, 7, 8, 9, 10};
        List<Object> list = new ArrayList<Object>();
        List<Object> outType = new ArrayList<Object>();
        list.add(sn);
        list.add(rule_id);
        outType.add("String");
        outType.add("String");
        outType.add("String");
        outType.add("String");
        outType.add("String");
        outType.add("String");
        outType.add("String");
        outType.add("String");
        pf.setClassName("P_C_CHECK_SN_RULE");//
        pf.setInPlace(inPlace);// 存储过程中in
        pf.setOutPlace(outplace); // 存储过程中out
        pf.setValArgs(list);// 存储过程中输入的参数
        pf.setTotalLen(list.size() + outType.size());// 总个数
        pf.setOutValType(outType);// 输出的参数
        List<Object> relist1 = modelService.procComm(pf);// 接收返回值
        String res = (String)relist1.get(7); // 校验结果
        if (res.indexOf("OK")!=0) {
            if (res.startsWith("NG:")) res = res.substring(3);
            modelAction.setAjaxString(res);
            return false;
        }
        return true;
    }

}
