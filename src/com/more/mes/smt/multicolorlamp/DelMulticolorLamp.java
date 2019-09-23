package com.more.mes.smt.multicolorlamp;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;
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
 * @Title 多色灯删除类
 * @Description 多色灯删除类
 * @ClassName DelMulticolorLamp
 * @author lyq
 * @version 1.0 developer 2019-01-02 created
 * @see DelMulticolorLamp
 * @since 2019-01-02
 * @Copyright: Copyright (c) 2019
 * @Company: morelean
 */
public class DelMulticolorLamp implements FuncService
{
  /**
   * @param modelAction
   *          modelAction
   * @param modelService
   *          modelService
   * @return String
   * @see com.more.fw.core.dbo.model.service.impl.base.FuncService#exeFunc(com.more.fw.core.base.core.action.ModelAction,
   *      com.more.fw.core.dbo.model.service.ModelService)
   */
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    try
    {
      String delId = request.getParameter("delId");// 需要删除的id
      if(delId!=null&&!delId.equals("")) {
    	  String[] strArray = delId.split(",");
          List<Map<String, Object>> list = null;
          String existSql = "";

          // 判断货架灯有没有被使用
          
          existSql = "SELECT T.ID FROM T_WMS_MULTI_LIGHT T WHERE T.WML_STATUS='1' AND T.ID=?";
          for (int i = 0; i < strArray.length; i++ )
          {
            list = modelService.listDataSql(existSql, new Object[] {strArray[i]});
            if (list != null && !list.isEmpty())
            {
              return modelAction.alertParentInfo((modelAction.getText("货架灯使用中,无法删除")));
            }
          }
     
          String sql = "DELETE FROM T_WMS_MULTI_LIGHT T WHERE T.ID=?";
          for (int i = 0; i < strArray.length; i++ )
          {
            modelService.execSql(sql, new Object[] {strArray[i]});
          }
      }else{
          return modelAction.reloadParent(modelAction.getText("需要删除的id为空"));
      }
    }
    catch (Exception e)
    {
     log.error(e);
      throw new BussException(modelAction.getText("删除失败"), e);
    }
   return modelAction.reloadParent(modelAction.getText("删除成功"));
  }

}
