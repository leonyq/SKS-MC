package com.more.mes.smt.outmoinfo;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 时序信息表---关结
 * 
 * @author WZY
 */
public class ShutPreparaInterval implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String iframeId = request.getParameter("iframeid");
    String arryid = request.getParameter("arryid");
    if(arryid!=null && !arryid.equals("")) {
    	String arr[] = arryid.split(",");// id
        

        try
        {
          for (int i = 0; i < arr.length; i++ )
          {
            String id = arr[i];//获取勾选id
            /*
             * if(i==0){ for (int j = 0; j < state.length; j++ ) { String stauts= state[j]; if
             * (stauts.equals("关结")) { return modelAction.alertParentInfo(modelAction.getText(
             * "有记录以关结")); } } }
             */
             
            //将状态改为关结
            ArrayList delWkList = new ArrayList();
            TableDataMapExt device = new TableDataMapExt();
            device.setTableName("T_WMS_OUT_MO_INFO");
            device.getColMap().put("WOM_STATUS", "3");
            device.setSqlWhere(" and id=?");
            delWkList.add(id);
            device.setSqlWhereArgs(delWkList);
            modService.edit(device);

          }
        }
        catch (Exception e)
        {
          // TODO: handle exception
          throw new BussException(modelAction.getText("关结失败"), e);
        }
    }
    return modelAction.reloadIframeById(iframeId, modelAction.getText("关结成功"));
  }

}
