package com.more.mes.smt.ipqctest;

import java.text.SimpleDateFormat;
import java.util.List;

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
 * 保存新增的IPQC检测信息
 * 
 * @author ht
 */
public class SaveDetailInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("_DATA_AUTH");
    String qiiItemCode = request.getParameter("paraMap1@0#QII_ITEM_CODE");
    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    String sql = "select T.QII_ITEM_CODE from T_QM_IPQC_ITEM T where T.QII_ITEM_CODE =? AND T.DATA_AUTH=?";
    List list = modelService.listDataSql(sql, new Object[] {qiiItemCode,dataAuth});
    if (list != null && list.size() > 0)
    {
      return modelAction.alertParentInfo((modelAction.getText("项目编码已存在！")));
    }
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      // 获取新的检测项信息
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      
      String userId = CommMethod.getSessionUser().getId();// 记录人
      String qiiItemCode2 = request.getParameter("paraMap1@0#QII_ITEM_CODE");// 项目代码
      String qiiItemName = request.getParameter("paraMap1@0#QII_ITEM_NAME");// 项目名称
      String qiiItemType = request.getParameter("paraMap1@0#QII_ITEM_TYPE");// 项目类型
      String qiiEffectiveFlag = request.getParameter("paraMap1@0#QII_EFFECTIVE_FLAG");// 有效标志
      String qiiTestContent = request.getParameter("paraMap1@0#QII_TEST_CONTENT");// 检测内容
      if (qiiEffectiveFlag == null || qiiEffectiveFlag == "" || qiiEffectiveFlag.equals(""))
      {
        qiiEffectiveFlag = "N";
      }
      // 插入新增的检测项信息
      TableDataMapExt saveExt = new TableDataMapExt();
      saveExt.setTableName("T_QM_IPQC_ITEM");
      CommMethod.addSysDefCol(saveExt.getColMap(), modelAction.getUser());
      saveExt.getColMap().put("QII_ITEM_CODE", qiiItemCode2);// 项目代码
      saveExt.getColMap().put("QII_ITEM_NAME", qiiItemName);// 项目名称
      saveExt.getColMap().put("QII_ITEM_TYPE", qiiItemType);// 项目类型
      saveExt.getColMap().put("QII_EFFECTIVE_FLAG", qiiEffectiveFlag);// 有效标志
      saveExt.getColMap().put("QII_TEST_CONTENT", qiiTestContent);// 检测内容
      saveExt.getColMap().put("QII_MAINTAIN_EMP", userId);// 维护人
      saveExt.getColMap().put("QII_MAINTAIN_DATE", DateUtil.getCurDate());// 维护时间
      if (dataAuth != null && !dataAuth.equals(""))
      {
        saveExt.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(saveExt);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), isCloseWin);
  }
}
