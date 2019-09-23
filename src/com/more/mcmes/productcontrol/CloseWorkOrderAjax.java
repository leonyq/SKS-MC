package com.more.mcmes.productcontrol;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;



/**
 * 工单关结
 */
public class CloseWorkOrderAjax implements FuncService
{
    private final Log log = LogFactory.getLog(this.getClass());

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService)
    {
        String formId1 = modelAction.getFormId();
        String formId = modelAction.getRequest().getParameter("formId");
        String iframeId = modelAction.getRequest().getParameter("iframeId");
        String[] delIds = modelAction.getRequest().getParameterValues(formId1 + "$ID");
        String docNum = modelAction.getRequest().getParameter("dataId");
        String reason = modelAction.getRequest().getParameter("PM_CLOSE_REASON");
       // String sql1 = "UPDATE T_PM_PROJECT_BASE SET PROJECT_STATUS ='2' WHERE PROJECT_ID=?  ";
            //  modelService.execSql(sql1, new Object[] { proId });
       try{
        TableDataMapExt delwms1 = new TableDataMapExt();
        delwms1.setTableName("T_PM_PROJECT_BASE");
        delwms1.setSqlWhere(" and ID=?");
        List<Object> wList = new ArrayList<Object>();
        wList.add(docNum);
        delwms1.setSqlWhereArgs(wList);
        
        delwms1.getColMap().put("PROJECT_STATUS", "2");
        delwms1.getColMap().put("PM_CLOSE_REASON", reason);
        modelService.edit(delwms1);
        modelService.delComm(modelAction.getRequest(), modelAction.getUser());
        
        String sql="UPDATE T_PM_MO_BASE T SET PM_STATUS='4' WHERE EXISTS (SELECT A.PROJECT_ID FROM T_PM_PROJECT_BASE A WHERE A.ID=?  " +
                " AND T.PM_PROJECT_ID=A.PROJECT_ID AND T.DATA_AUTH=A.DATA_AUTH) ";
        modelService.execSql(sql,new Object[] {docNum});
        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("关结成功"), "0");
        //return modelAction.delAjaxLoadTable(modelAction.getText("关结成功")); 
       }
       catch (Exception e)
      {
          		log.error(e);
		    throw new BussException(modelAction.getText("关结失败"), e);
    
      }
       
        //return modelAction.AJAX;
    }
}
