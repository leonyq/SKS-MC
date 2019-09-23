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
 * @Description 保存FEEDER保养维修信息
 * @ClassName SaveMTService
 * @author csj
 * @Company: morelean
 */
public class SaveMTService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口

    TableDataMapExt tdMap = new TableDataMapExt();

    tdMap.setTableName("T_CO_FEEDER_MAINTENANCE");

    TableDataMapExt feederMap = new TableDataMapExt();
    feederMap.setTableName("T_CO_FEEDER_INFOR");

    Map<String, Object> mtMap = SaveMTService.getParameters(modelAction);
    String type = StringUtils.toString(mtMap.get("TCFM_TYPE"));
    String reporter = StringUtils.toString(mtMap.get("TCFM_REPORTER"));
    String mtMan = StringUtils.toString(mtMap.get("TCFM_MT_MAN"));
    String audit = StringUtils.toString(mtMap.get("TCFM_AUDIT"));
    String remark = StringUtils.toString(mtMap.get("TCFM_DEFECT_REMARK"));
    String ecCode = StringUtils.toString(mtMap.get("TCF_EC_CODE"));
    Date mtDate = DateUtil.parseDate(StringUtils.toString(mtMap.get("TCFM_DATETIME")),
      "yyyy-MM-dd HH:mm:ss");
    String ecDesc = StringUtils.toString(mtMap.get("TCF_EC_DES"));
    
    // 保存并关闭窗口
    String iframeId = request.getParameter("iframeId");
    try
    {
      String[] idStrs=new String[]{};
      String[] snStrs=new String[]{};
      String idStr = request.getParameter("ids");
      String snStr = request.getParameter("sns");
      if(idStr!=null&&!idStr.equals("")) {
    	  idStrs = idStr.split(",");
      }
      if(snStr!=null&&!snStr.equals("")) {
    	  snStrs = snStr.split(",");
      }
      List<Object> sqlWList =null;
      int idStrsLen = idStrs.length;
      for (int i = 0; i < idStrsLen; i++ )
      {
    	sqlWList = new ArrayList<Object>();
        String feederId = idStrs[i];
        feederId = feederId.substring(5, feederId.length());
        sqlWList.add(feederId);
        sqlWList.add(dataAuth);
        feederMap.setSqlWhere(" and ID=? and data_auth=? ");
        feederMap.setSqlWhereArgs(sqlWList);
        feederMap.getColMap().put("TCF_MT_LASTTIME", mtDate);
        feederMap.getColMap().put("TCF_LAST_COUNT", 0);

        modelService.edit(feederMap);

        String saveSn = snStrs[i];
        tdMap.getColMap().clear();
        CommMethod.addSysDefCol(tdMap.getColMap(), modelAction.getUser());
        // map.put("ID", saveId);
        tdMap.getColMap().put("TCF_FEEDER_ID", feederId);
        tdMap.getColMap().put("TCF_FEEDER_SN", saveSn);
        tdMap.getColMap().put("TCFM_TYPE", type);
        tdMap.getColMap().put("TCFM_REPORTER", reporter);
        tdMap.getColMap().put("TCFM_MT_MAN", mtMan);
        tdMap.getColMap().put("TCFM_AUDIT", audit);
        tdMap.getColMap().put("TCFM_DEFECT_REMARK", remark);
        tdMap.getColMap().put("TCFM_DATETIME", mtDate);
        tdMap.getColMap().put("TCF_EC_CODE", ecCode);
        tdMap.getColMap().put("TCF_EC_DES", ecDesc);
        if (dataAuth != null)
        {
          tdMap.getColMap().put("DATA_AUTH", dataAuth);// 组织结构
        }

        modelService.save(tdMap);

      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保养/维修失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保养/维修成功"), isCloseWin);
  }

  // 获取参数值
  public static Map<String, Object> getParameters(ModelAction modelAction)
  {
    Map<String, Object> mtMap = new HashMap<String, Object>();
    String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm:ss");
    HttpServletRequest requert = modelAction.getRequest();
    String type = requert.getParameter("paraMap1@0#TCFM_TYPE");
    String reporter = requert.getParameter("paraMap1@0#TCFM_REPORTER");
    String mtMan = requert.getParameter("paraMap1@0#TCFM_MT_MAN");
    String audit = requert.getParameter("paraMap1@0#TCFM_AUDIT");
    String remark = requert.getParameter("paraMap1@0#TCFM_DEFECT_REMARK");
    String ecCode = requert.getParameter("paraMap1@0#TCF_EC_CODE");
    String ecDesc = requert.getParameter("paraMap1@0#TCF_EC_DES");

    mtMap.put("TCFM_TYPE", type);
    mtMap.put("TCFM_REPORTER", reporter);
    mtMap.put("TCFM_MT_MAN", mtMan);
    mtMap.put("TCFM_AUDIT", audit);
    mtMap.put("TCFM_DEFECT_REMARK", remark);
    mtMap.put("TCF_EC_CODE", ecCode);
    mtMap.put("TCFM_DATETIME", nowDate);
    mtMap.put("TCF_EC_DES", ecDesc);

    return mtMap;
  }

}
