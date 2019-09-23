package com.more.mes.labelmanage.template;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 添加标签模板
 * @Description 〈功能详细描述〉
 * @ClassName AddTemplate
 * @author csh
 * @version 1.0 developer 2018-3-29 created
 * @see AddTemplate
 * @since 2018-3-29
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class AddTemplate implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String dataAuth = String.valueOf(CommMethodMc.getRequest().getSession().getAttribute("mcDataAuth"));
    SynchroTemplateAction templateAction = new SynchroTemplateAction();
    Map ajaxMap = new HashMap();
    ajaxMap = templateAction.synchroTemplate(dataAuth, modelService);
    String alertMsg1 = modelAction.getText("同步模板成功");
    ajaxMap.put("alertMsg", msgPopData(modelAction, alertMsg1).get("alertMsg"));
    ajaxMap.put("title", msgPopData(modelAction, alertMsg1).get("title"));
    ajaxMap.put("width", msgPopData(modelAction, alertMsg1).get("width"));
    ajaxMap.put("height", msgPopData(modelAction, alertMsg1).get("height"));
    ajaxMap.put("time", msgPopData(modelAction, alertMsg1).get("time"));
    return modelAction.outJson(CommMethod.bean2Json(ajaxMap), Constants.CHARACTER_ENCODING_UTF_8);
  }

  private Map msgPopData(ModelAction modelAction, String alertMsg)
  {
    Map map = new HashMap<String, Object>();
    String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
    title = modelAction.getText(title);
    String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
    String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
    String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
    map.put("title", title);
    map.put("width", width);
    map.put("height", height);
    map.put("time", time);
    map.put("alertMsg", alertMsg);
    return map;
  }
}
