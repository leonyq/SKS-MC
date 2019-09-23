package com.more.mes.smt.outmoinfo;

import java.util.Date;

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
 * @Description 時序信息表--新增保存
 * @ClassName DelParameter
 * @author WZY
 */

public class AddPreparaInterval implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {

    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();

    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    String cstModelCode = request.getParameter("cstModelCode");// 机种
    String womMoNum = request.getParameter("womMoNum");// 计划数量
    String womOutNum = request.getParameter("womOutNum");// 累积备料数
    String nextTimes = request.getParameter("nextTimes");// 下次备料时间
    String cstProcessFace = request.getParameter("cstProcessFace");// 面别
    String womMoNumber = request.getParameter("paraMap1@0#WOM_MO_NUMBER");// 制令单号operateTime
    String operateTime = request.getParameter("operateTime");// 当前时间
    String womNextNum = request.getParameter("womNextNum");// 下次备料号
    String state = request.getParameter("state");// 状态
    String preparaInterval = request.getParameter("preparaInterval");// 物料间隔
    String standardHours = request.getParameter("standardHours");// 标准工时
    String womMemo = request.getParameter("paraMap1@0#WOM_MEMO");// 备注
    String womCurrentNum = request.getParameter("womCurrentNum");// 当前备料数
    String dataAuth = request.getParameter("_DATA_AUTH");
    String id = StringUtils.getUUID();
    String userId = CommMethod.getSessionUser().getId();

    Date operateTimes = DateUtil.parseDate(operateTime, "yyyy-MM-dd HH:mm:ss"); // 当前时间
    Date nextTime = DateUtil.parseDate(nextTimes, "yyyy-MM-dd HH:mm:ss"); // 当前时间
    try
    {
      TableDataMapExt dExt = new TableDataMapExt();
      dExt.setTableName("T_WMS_OUT_MO_INFO");
      CommMethod.addSysDefCol(dExt.getColMap(), modelAction.getUser());
      dExt.getColMap().put("WOM_MO_NUMBER", womMoNumber);

      dExt.getColMap().put("WOM_STATUS", state);
      dExt.getColMap().put("WOM_MODEL_CODE", cstModelCode);
      dExt.getColMap().put("WOM_PROCESS_FACE", cstProcessFace);
      if (StringUtils.isNotBlank(womMoNum))
      {
        dExt.getColMap().put("WOM_MO_NUM", Integer.valueOf(womMoNum));
      }
      if (StringUtils.isNotBlank(preparaInterval))
      {
        dExt.getColMap().put("WOM_PREPARA_INTERVAL", Double.valueOf(preparaInterval));
      }
      if (StringUtils.isNotBlank(standardHours))
      {
        dExt.getColMap().put("WOM_STANDARD_HOURS", Double.valueOf(standardHours));
      }
      if (StringUtils.isNotBlank(womOutNum))
      {
        dExt.getColMap().put("WOM_OUT_NUM", Integer.valueOf(womOutNum));
      }
      //dExt.getColMap().put("WOM_OUT_NUM", womOutNum);
      if (StringUtils.isNotBlank(womCurrentNum))
      {
        dExt.getColMap().put("WOM_CURRENT_NUM", Integer.valueOf(womCurrentNum));
      }
      //dExt.getColMap().put("WOM_CURRENT_NUM", womCurrentNum);
      if (StringUtils.isNotBlank(womNextNum))
      {
        dExt.getColMap().put("WOM_NEXT_NUM", Integer.valueOf(womNextNum));
      }
      //dExt.getColMap().put("WOM_NEXT_NUM", womNextNum);
      dExt.getColMap().put("WOM_NEXT_TIME", nextTime);
      dExt.getColMap().put("WOM_OPERATE_TIME", operateTimes);
      dExt.getColMap().put("WOM_OPERATE_EMP", userId);
      dExt.getColMap().put("WOM_MEMO", womMemo);
      if (null != dataAuth)
      {
        dExt.getColMap().put("DATA_AUTH", dataAuth);
      }
      // dExt.getColMap().put("ID", id);
      modelService.save(dExt);

    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }

    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }

}
