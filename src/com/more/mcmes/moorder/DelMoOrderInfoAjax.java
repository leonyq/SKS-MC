package com.more.mcmes.moorder;

import java.util.ArrayList;
import java.util.List;
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
 * 制令单-删除
 * 
 */
public class DelMoOrderInfoAjax implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
  
    try
    {
      String delId = request.getParameter("delId");
      String[] id = null ;
      if(StringUtils.isNotBlank(delId)) {
    	   id = delId.split(",");
      }
     

      int delLength = id.length;
      String listId;
      String sql = "select t.id from T_PM_PROJECT_BASE t"
                   + " left join T_PM_MO_BASE t1 on t.PROJECT_ID=t1.PM_PROJECT_ID"
                   + " where t1.id=? AND T.DATA_AUTH=? ";
      TableDataMapExt tabe = new TableDataMapExt();
      tabe.setTableName("T_PM_MO_BASE");
      List<Object> sqlList = null;
      List<Object> sqlList2 = null;
      for (int i = 0; i < delLength; i++ )
      {
    	  sqlList = new ArrayList<Object>();
    	  sqlList2 = new ArrayList<Object>();
    	  sqlList.add(id[i]);
        tabe.setSqlWhere("and ID=? ");
        tabe.setSqlWhereArgs(sqlList);

        List<Map> list = modelService.listDataSql(sql, new Object[] {id[i],dataAuth});

        if (null != list && list.size() > 0)
        {
          listId = list.get(0).get("id").toString();
          sqlList2.add(listId);
          TableDataMapExt editExt = new TableDataMapExt();
          CommMethod.editSysDefCol(editExt.getColMap(), modelAction.getUser());
          editExt.setTableName("T_PM_PROJECT_BASE");
          editExt.getColMap().put("PROJECT_OFONESELF", "N");
          editExt.setSqlWhere("and ID=? ");
          editExt.setSqlWhereArgs(sqlList2);
          modelService.del(tabe);
          modelService.edit(editExt);
        }

      }
    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error(e);
      throw new BussException(modelAction.getText("删除失败"));
    }

    return modelAction.reloadParent(modelAction.getText("删除成功"));
  }

}
