package com.more.mes.smt.sample;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 〈抽样方案明细新增〉
 * @Description 〈抽样方案明细新增〉
 * @ClassName DetailSave
 * @author Administrator
 * @version 1.0 developer 2017-9-22 created
 * @see DetailSave
 * @since 2017-9-22
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class DetailSave implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest t = modelAction.getRequest();
    String dataId = modelAction.getDataId();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String sql = "delete from T_QM_SAMPLING_DETAIL t where t.QSD_PLAN_ID = ? and t.data_auth = ? ";
    modelService.execSql(sql,new Object[] {dataId,dataAuth});
    String sampleArr = t.getParameter("sampleArr");
    JSONArray component = JSONArray.fromObject(sampleArr);
    Map<String, Object> map1 = new HashMap<String, Object>();
    for (int i = 0; i < component.size(); i++ )
    {
      TableDataMapExt tdMap = new TableDataMapExt();
      tdMap.setTableName("T_QM_SAMPLING_DETAIL");
      Map map = tdMap.getColMap();      
      map1 = (Map<String, Object>)component.get(i);
      map.put("QSD_PLAN_ID", dataId);
      map.put("QSD_AC_VALUE", map1.get("QSD_AC_VALUE"));
      if(map1.get("QSD_AQL_VALUE")!=null){
    	  map.put("QSD_AQL_VALUE", Double.parseDouble(map1.get("QSD_AQL_VALUE").toString()));
      }
      map.put("QSD_RE_VALUE", map1.get("QSD_RE_VALUE"));
      if(map1.get("QSD_ROW_SEQ")!=null){
    	  map.put("QSD_ROW_SEQ", Integer.parseInt(map1.get("QSD_ROW_SEQ").toString()));
      }
      map.put("QSD_SAMPLE_CODE", map1.get("QSD_SAMPLE_CODE"));
      if(map1.get("QSD_SAMPLE_NUM")!=null){
    	  map.put("QSD_SAMPLE_NUM", Integer.parseInt(map1.get("QSD_SAMPLE_NUM").toString()));
      }
      CommMethod.addSysDefCol(map, modelAction.getUser());
      modelService.save(tdMap);
    }

    String msg = modelAction.getDefinedMsg();
    if (StringUtils.isBlank(msg))
    {
      msg = "保存成功";
    }
    String alertMsg = modelAction.getText(msg);
    return addParentData(modelAction, alertMsg);
  }
  
  
  private String addParentData(ModelAction modelAction,String alertMsg)
  {
    String title=ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
    title=modelAction.getText(title);
    String width=ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
    String height=ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
    String time=ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
    StringBuffer content = new StringBuffer();
    content.append("<script>");
    content.append("try{");
    content.append("window.parent.closeAndRefreshTab('");
    content.append(alertMsg+"','"+title+"','"+width+"','"+height+"','"+time);
    content.append("');");
    content.append("}catch(e){alert(\"");
      content.append("\");}");
    content.append("</script>");
    modelAction.outHtml(content.toString(), Constants.CHARACTER_ENCODING_UTF_8);
    return null;
  }

}