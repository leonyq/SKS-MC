package com.more.mes.smt.sample;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title
 * @Description 样本大小字码保存
 * @ClassName SampleCodeSave
 * @author Administrator
 * @version 1.0 developer 2017-9-29 created
 * @see SampleCodeSave
 * @since 2017-9-29
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class SampleCodeSave implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
@Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest t = modelAction.getRequest();
    String dataAuth = t.getParameter("dataAuth");
    if(StringUtils.isEmpty(dataAuth)){
      dataAuth=CommMethod.getUserDefDa(modelService, CommMethod.getSessionUser());
    }
    String testStep = t.getParameter("testStep");
    if (StringUtils.isNotEmpty(testStep))
    {
      String sql = "delete from T_QM_SAMPLE_CODE t where t.data_auth=? and t.qsc_test_step=? ";
      modelService.execSql(sql, new Object[] {dataAuth,testStep});
    }
    
    String isDel = t.getParameter("isDel");
    if(StringUtils.isNotEmpty(isDel)){
      modelAction.setAjaxMap(msgPopData(modelAction, "删除成功"));
      return BaseActionSupport.AJAX;
    }

    String sampleArr = t.getParameter("sampleArr");
    JSONArray component = JSONArray.fromObject(sampleArr);
    Map<String, Object> map1 = new HashMap<String, Object>();
    for (int i = 0; i < component.size(); i++ )
    {
      TableDataMapExt tdMap = new TableDataMapExt();
      tdMap.setTableName("T_QM_SAMPLE_CODE");
      Map map = tdMap.getColMap();
      map1 = (Map<String, Object>)component.get(i);
      map.put("QSC_TEST_STEP", testStep);
      if(map1.get("QSC_COLUMN_SEQ")!=null){
    	  map.put("QSC_COLUMN_SEQ", Integer.parseInt(map1.get("QSC_COLUMN_SEQ").toString()));
      }
      if(map1.get("QSC_END_NUM")!=null){
    	  map.put("QSC_END_NUM", Integer.parseInt(map1.get("QSC_END_NUM").toString()));
      }
      map.put("QSC_LETTER", map1.get("QSC_LETTER"));
      if(map1.get("QSC_START_NUM")!=null){
    	  map.put("QSC_START_NUM", Integer.parseInt(map1.get("QSC_START_NUM").toString()));
      }
      map.put("QSC_TEST_GRADE", map1.get("QSC_TEST_GRADE"));
      map.put("QSC_TEST_LEVEL", map1.get("QSC_TEST_LEVEL"));
      CommMethod.addSysDefCol(map, modelAction.getUser(),dataAuth);
      //map.put("DATA_AUTH", dataAuth);
      modelService.save(tdMap);
    }

    String msg = modelAction.getDefinedMsg();
    if (StringUtils.isBlank(msg))
    {
      msg = "保存成功";
    }
    modelAction.setAjaxMap(msgPopData(modelAction, msg));
    return BaseActionSupport.AJAX;
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