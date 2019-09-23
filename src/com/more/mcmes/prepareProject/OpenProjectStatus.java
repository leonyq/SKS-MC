package com.more.mcmes.prepareProject;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * 工单关联
 *
 * @author:phantomsaber
 * @version:2019/7/3 4:38
 * @email:phantomsaber@foxmail.com
 **/
public class OpenProjectStatus implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());
    private String ok = "OK";

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        // 获取封装的数据
        HttpServletRequest request = modelAction.getRequest();
        String workOrders = request.getParameter("workOrderSn");
        String[] split = workOrders.split("\\|");
        String ajaxRes = null;

        Boolean splitFlag = null;

        if(workOrders.length() > 0){
            try {
                splitFlag = !StringUtils.isEmpty(split[1]);
            } catch (Exception e) {
                split = workOrders.split(",| ");
            }
            try {
                splitFlag = !StringUtils.isEmpty(split[1]);
            } catch (Exception e) {
                splitFlag = !StringUtils.isEmpty(split[0]);
            }
        }else{
            modelAction.setAjaxString("请选择至少一条数据");
            return BaseActionSupport.AJAX;
        }




        if(!splitFlag){
//            throw new BussException(modelAction.getText("备料失败,工单分隔符格式错误,请使用'|' ','与空格"));
            modelAction.setAjaxString("启用失败");
            return BaseActionSupport.AJAX;
        }

        String dataAuth = modelAction.getCurrUser().getData_auth();
        String userId = modelAction.getCurrUser().getId();

      
        
      	try{
          for (int i = 0; i < split.length; i++) {
            int res = 0;
            String curWorkOrder = StringUtils.toString(split[i]);
           	
            if (!StringUtils.isEmpty(curWorkOrder)) {
              String sql = "UPDATE T_PM_PROJECT_BASE T SET T.PROJECT_STATUS='0' WHERE 1=1 AND T.PROJECT_ID = '"+curWorkOrder+"'";
              res =  modelService.execSql(sql);
            }
            
           
        }
        }catch(BussException e){
			e.printStackTrace();
            throw new BussException(modelAction.getText("启用失败," + e.getMessage()), e.getMessage());
        }
      
      
      
      	String iframeId = modelAction.getRequest().getParameter("iframeId");
        if (iframeId == null) {
            iframeId = "iframe10";
        }
        String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");

        modelAction.setAjaxString("启用成功！");
        return BaseActionSupport.AJAX;
//        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("备料成功"), "0");
    }

  
}
