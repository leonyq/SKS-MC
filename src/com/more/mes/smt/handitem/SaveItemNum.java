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
public class SaveItemNum implements FuncService {

    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        String item_sn = request.getParameter("item_sn");
        String item_num = request.getParameter("item_num");
        //String workcenter = request.getParameter("workcenter");
        String mo_number = request.getParameter("mo_number");
        modelService.execSql("UPDATE T_WMS_STOCK_INFO SET WSI_ITEM_NUM=? WHERE WSI_ITEM_SN=? ",new Object[]{item_num,item_sn});
        //modelService.execSql("UPDATE T_WMS_STOCK_INFO_L SET WSI_ITEM_NUM=? WHERE WSI_ITEM_SN=? ",new Object[]{item_num,item_sn});
        //CommonMethod631.saveTaskLog(item_sn, modelAction.getUser().getLoginName(),item_num,"修改数量",mo_number,"", modelService);
        modelAction.setAjaxString("OK"); 
        return BaseActionSupport.AJAX;
    } 
     
}
