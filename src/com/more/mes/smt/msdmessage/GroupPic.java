package com.more.mes.smt.msdmessage;

import java.io.File;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 参数配置-系统功能-新增
 * @ClassName AddFuncInfo
 * @author WZY
 */
public class GroupPic implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("rawtypes")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String path = modelAction.getRequest().getSession().getServletContext().getRealPath(
      "buss/images/count");
    File file = new File(path);
    File[] files = file.listFiles();
    LinkedList<Map> list = new LinkedList<Map>();
    Map map = null;
    if (files != null)
    {
      for (File file2 : files)
      {
        map = new HashMap<String, Object>();
        map.put("picName", file2.getName());
        list.add(map);
      }
    }

    modelAction.setDataList(list);
    return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面

  }
}
