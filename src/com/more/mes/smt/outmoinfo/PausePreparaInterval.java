package com.more.mes.smt.outmoinfo;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

import examples.newsgroups;

/**
 * 时序信息表---暂停
 * 
 * @author WZY
 */
public class PausePreparaInterval implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings({"unchecked", "unused"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String iframeId = request.getParameter("iframeid");
    String arryid = request.getParameter("arryid");
    if(arryid!=null && !arryid.equals("")) {
    	String arr[] = arryid.split(",");// id

        String sql = "select WOM_STATUS from T_WMS_OUT_MO_INFO where id=?";//查询当前id的状态

        try
        {
          for (int i = 0; i < arr.length; i++ )
          {
            String id = arr[i];//获取被勾选的id

            if (i == 0)
            {
              for (int j = 0; j < arr.length; j++ )
              {
                String stauts = arr[j];
                List<Map> list = modService.listDataSql(sql, new Object[] {stauts});//获取被勾选的id的状态
                Map<Object, Object> map = list.get(0);
                if (map.get("WOM_STATUS").equals("3") || map.get("WOM_STATUS") == "3")//判断状态是否是关结
                {
                  return modelAction.alertParentInfo(modelAction.getText("该条记录已关结"));
                }
              }

            }
            //改变状态，通过id。
            ArrayList delWkList = new ArrayList();
            TableDataMapExt device = new TableDataMapExt();
            device.setTableName("T_WMS_OUT_MO_INFO");
            device.getColMap().put("WOM_STATUS", "2");
            device.setSqlWhere(" and id=?");
            delWkList.add(id);
            device.setSqlWhereArgs(delWkList);
            modService.edit(device);

          }
        }
        catch (Exception e)
        {
          // TODO: handle exception
          log.error(e);
          throw new BussException(modelAction.getText("暂停失败"), e);
        }
    }
    return modelAction.reloadIframeById(iframeId, modelAction.getText("暂停成功"));
  }

}
