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
/**
 *  
 * @author development
 *
 */
public class GetItemSnNum implements FuncService {

    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest(); 
        String item_list = request.getParameter("item_list");
        String workcenter = request.getParameter("workcenter");
        String mo_number = request.getParameter("mo_number");
        String itemSns="'";
        JSONArray array = JSONArray.fromObject(item_list);
        List<ITEM_LIST> itemList = JSONArray.toList(array, ITEM_LIST.class);
        for (ITEM_LIST mitem : itemList) {
            if (!"".equals(mitem.getITEM_SN()) && mitem.getITEM_SN() != null) {
                itemSns+=mitem.getITEM_SN()+"','"  ;
            }
        }
        itemSns+="'";
        String sql="SELECT * FROM T_WMS_STOCK_INFO WHERE WSI_ITEM_SN IN("+itemSns+")"; 
        List<Map> itemMapList = modelService.listDataSql(sql);
        modelAction.setAjaxString("OK");
        modelAction.setAjaxList(itemMapList);
        return BaseActionSupport.AJAX;
    } 
    
     
}
