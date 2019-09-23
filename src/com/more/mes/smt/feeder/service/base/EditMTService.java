package com.more.mes.smt.feeder.service.base;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description 修改FEEDER保存维修信息
 * @ClassName EditMTService
 * @author csj
 * @Company: morelean
 */
public class EditMTService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    List<Object> sqlWList= new ArrayList<Object>();
    List<Object> sqlWList2= new ArrayList<Object>();
    TableDataMapExt tdMap = new TableDataMapExt();
    tdMap.setTableName("T_CO_FEEDER_MAINTENANCE");
    String infoId = modelAction.getDataId();
    sqlWList.add(infoId);
    sqlWList.add(dataAuth);
    tdMap.setSqlWhere(" and ID=? and data_auth=? ");
    tdMap.setSqlWhereArgs(sqlWList);
    TableDataMapExt feederMap = new TableDataMapExt();
    feederMap.setTableName("T_CO_FEEDER_INFOR");

    Map<String, Object> mtMap = EditMTService.getParameters(modelAction);
    Map<String, Object> map = tdMap.getColMap();
    String type = StringUtils.toString(mtMap.get("TCFM_TYPE"));
    String reporter = StringUtils.toString(mtMap.get("TCFM_REPORTER"));
    String mtMan = StringUtils.toString(mtMap.get("TCFM_MT_MAN"));
    String audit = StringUtils.toString(mtMap.get("TCFM_AUDIT"));
    String remark = StringUtils.toString(mtMap.get("TCFM_DEFECT_REMARK"));
    Date mtDate = DateUtil.parseDate(StringUtils.toString(mtMap.get("TCFM_DATETIME")),
      "yyyy-MM-dd HH:mm:ss");
    String ecCode = StringUtils.toString(mtMap.get("TCF_EC_CODE"));
    String ecDesc = StringUtils.toString(mtMap.get("TCF_EC_DES"));

    String feederSql = "select t.TCF_FEEDER_ID from T_CO_FEEDER_MAINTENANCE t where t.ID=? and t.data_auth=? ";
    List<Map<String, String>> resultList = modelService.listDataSql(feederSql,
      new Object[] {infoId,dataAuth});
    String feederId ="";
    if(resultList!=null&&!resultList.isEmpty()){
        feederId = resultList.get(0).get("TCF_FEEDER_ID");
    }
    sqlWList2.add(feederId);
    sqlWList2.add(dataAuth);
    feederMap.setSqlWhere(" and ID=? and data_auth=? ");
    feederMap.setSqlWhereArgs(sqlWList2);
    feederMap.getColMap().put("TCF_MT_LASTTIME", mtDate);
    try
    {
      modelService.edit(feederMap);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }
    map.put("TCFM_TYPE", type);
    map.put("TCFM_REPORTER", reporter);
    map.put("TCFM_MT_MAN", mtMan);
    map.put("TCFM_AUDIT", audit);
    map.put("TCFM_DEFECT_REMARK", remark);
    map.put("TCFM_DATETIME", mtDate);
    map.put("TCF_EC_CODE", ecCode);
    map.put("TCF_EC_DES", ecDesc);
    /*
    if(dataAuth!=null){
      	map.put("DATA_AUTH", dataAuth);// 组织结构
    }
    
*/
    try
    {
      modelService.edit(tdMap);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }
    // 保存并关闭窗口
    String iframeId = request.getParameter("iframeId");
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
  }

  // 获取参数值
  public static Map<String, Object> getParameters(ModelAction modelAction)
  {
    Map<String, Object> mtMap = new HashMap<String, Object>();
    String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm:ss");
    HttpServletRequest requert = modelAction.getRequest();
    String type = requert.getParameter("paraMapObj.TCFM_TYPE");
    String reporter = requert.getParameter("paraMapObj.TCFM_REPORTER");
    String mtMan = requert.getParameter("paraMapObj.TCFM_MT_MAN");
    String audit = requert.getParameter("paraMapObj.TCFM_AUDIT");
    String remark = requert.getParameter("paraMapObj.TCFM_DEFECT_REMARK");
    String ecCode = requert.getParameter("paraMapObj.TCF_EC_CODE");
    String ecDesc = requert.getParameter("paraMapObj.TCF_EC_DES");

    mtMap.put("TCFM_TYPE", type);
    mtMap.put("TCFM_REPORTER", reporter);
    mtMap.put("TCFM_MT_MAN", mtMan);
    mtMap.put("TCFM_AUDIT", audit);
    mtMap.put("TCFM_DEFECT_REMARK", remark);
    mtMap.put("TCFM_DATETIME", nowDate);
    mtMap.put("TCF_EC_CODE", ecCode);
    mtMap.put("TCF_EC_DES", ecDesc);

    return mtMap;
  }

}
