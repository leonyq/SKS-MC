package com.more.mes.smt.ipqcdoc;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

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

public class EditDetailMessage implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String isclosewin = request.getParameter("isCloseWin");
    String formid = request.getParameter("formId");
    if (null == formid)
    {
      formid = request.getParameter("formIds");
    }

    String iframeId = request.getParameter("iframeId");

    try
    {
      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

      String id = request.getParameter("id");// id
      String userId = CommMethod.getSessionUser().getId();// 记录人
      String memo = request.getParameter("paraMap1@0#QID_COMMENT");// 备注
      String qidDocNum = request.getParameter("qidDocNum");// 编号
      String[] qiiItemCode = request.getParameterValues("QII_ITEM_CODE");// 明细代码
      String[] qiiItemName = request.getParameterValues("QII_ITEM_NAME");// 明细名称
      String[] qiiItemType = request.getParameterValues("QII_ITEM_TYPE");// 明细类型
      String[] qiiTestContent = request.getParameterValues("QII_TEST_CONTENT");// 明细内容
      String[] isCheckSelect = request.getParameterValues("isCheckSelect");// 明细结果

      int checkSelect = isCheckSelect.length;

      String status = "3";

      for (int i = 0; i < checkSelect; i++ )
      {
        if (StringUtils.isBlank(isCheckSelect[i]))
        {
          status = "2";
          break;
        }
      }

      TableDataMapExt savaExt = new TableDataMapExt();

      savaExt.setTableName("T_QM_IPQC_DOC");

      CommMethod.editSysDefCol(savaExt.getColMap(), modelAction.getUser());
      ArrayList<Object> paraList = new ArrayList<Object>();
      // savaExt.getColMap().put("QID_COMMENT", memo);
      savaExt.getColMap().put("QID_STATUS", status);
      savaExt.getColMap().put("QID_DOC_NUM", qidDocNum);
      savaExt.getColMap().put("QID_CONFIRM_EMP", userId);
      savaExt.getColMap().put("QID_CONFIRM_DATE", DateUtil.getCurDate());

      if (StringUtils.isNotBlank(dataAuth))
      {
        savaExt.getColMap().put("DATA_AUTH", dataAuth);
      }
      savaExt.setSqlWhere(" and id= ? ");
      // savaExt.setSqlWhere(" and id = '" + id + "'");
      paraList.add(id);
      savaExt.setSqlWhereArgs(paraList);
      modelService.edit(savaExt);

      ArrayList<Object> paraList2 = new ArrayList<Object>();
      TableDataMapExt delExt = new TableDataMapExt();
      delExt.setTableName("T_QM_IPQC_DETAIL");
      delExt.setSqlWhere(" and QID_DOC_NUM = ? ");
      paraList2.add(qidDocNum);
      delExt.setSqlWhereArgs(paraList2);
      modelService.del(delExt);

      TableDataMapExt addExt = new TableDataMapExt();
      addExt.setTableName("T_QM_IPQC_DETAIL");
      int itemCode = qiiItemCode.length;
      for (int i = 0; i < itemCode; i++ )
      {
        addExt.getColMap().clear();
        CommMethod.addSysDefCol(addExt.getColMap(), modelAction.getUser());
        addExt.getColMap().put("QID_DOC_NUM", qidDocNum);
        addExt.getColMap().put("QID_ITEM_CODE", qiiItemCode[i]);
        addExt.getColMap().put("QID_ITEM_NAME", qiiItemName[i]);
        addExt.getColMap().put("QID_ITEM_TYPE", qiiItemType[i]);
        addExt.getColMap().put("QID_TEST_CONTENT", qiiTestContent[i]);
        addExt.getColMap().put("QID_CONFIRM_RESULT", isCheckSelect[i]);
        if (StringUtils.isNotBlank(dataAuth))
        {
          savaExt.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.save(addExt);
      }

    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error(e);
      throw new BussException(modelAction.getText("确认失败"), e);
    }

    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("确认成功"), "0");
  }

}