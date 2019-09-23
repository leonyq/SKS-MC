package com.more.mes.smt.modelchecked.oracle;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.FuncCode;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class EditProjectItemSave implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String formId = request.getParameter("formId");
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");// 数据权限
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    String modelCode = request.getParameter("paraModelCode");
    String step = request.getParameter("paraStep");
    String[] itemNames = request.getParameterValues("qtiName");// 项目名称
    String[] itemSns = request.getParameterValues("qtiSn");// 项目代码
    String[] itemTypes = request.getParameterValues("qtiType");// 项目类型
    String[] itemClass = request.getParameterValues("itemClass");// 值域
    String[] maxValue = request.getParameterValues("maxValue");// 上限值
    String[] minValue = request.getParameterValues("minValue");// 下限值
    String[] itemUnit = request.getParameterValues("itemUnit");// 单位
    String[] testMethod = request.getParameterValues("testMethod");// 检测方法
    String[] testContent = request.getParameterValues("testContent");// 检测说明
    String[] testSeq = request.getParameterValues("testSeq");// 顺序
    if (itemSns == null)
    {
      return modelAction.alertInfoAddPic("请选择检测项目", "1");
    }
    int len = itemSns.length;
    // 删除原有数据
    ArrayList<Object> paraList = new ArrayList<Object>();
    TableDataMapExt modelTable = new TableDataMapExt();
    modelTable.setTableName("T_QM_MODEL_ITEM");
    modelTable.setSqlWhere(" and QMI_MODEL_CODE=?");
    paraList.add(modelCode);
    modelTable.setSqlWhereArgs(paraList);
    int res = modelService.del(modelTable);
    if (res < 1)
    {
      throw new BussException("修改失败");
    }
    // 添加修改后的数据
    for (int i = 0; i < len; i++ )
    {
      float maxValNum = 0;
      float minValNum = 0;
      int seqNum = 0;
      
      TableDataMapExt modTable = new TableDataMapExt();
      CommMethod.addSysDefCol(modTable.getColMap(), modelAction.getUser());
      modTable.setTableName("t_qm_model_item");
      Map moMap = modTable.getColMap();
      moMap.put("QMI_MODEL_CODE", modelCode);
      moMap.put("QMI_TEST_STEP", step);
      moMap.put("QMI_ITEM_NAME", itemNames[i]);
      moMap.put("QMI_ITEM_SN", itemSns[i]);
      moMap.put("QMI_ITEM_TYPE", itemTypes[i]);
      moMap.put("QMI_ITEM_CLASS", itemClass[i]);
      moMap.put("QMI_ITEM_MAXVALUE", maxValue[i]);
      moMap.put("QMI_ITEM_MINVALUE", minValue[i]);
      moMap.put("QMI_ITEM_UNIT", itemUnit[i]);
      moMap.put("QMI_TEST_METHOD", testMethod[i]);
      moMap.put("QMI_TEST_CONTENT", testContent[i]);
      moMap.put("QMI_TEST_SEQ", testSeq[i]);
      if (dataAuth != null)
      {
        moMap.put("DATA_AUTH", dataAuth);
      }
      res = modelService.save(modTable);
      if (res < 1)
      {
        throw new BussException(FuncCode.MS100_0001_002 + CommMethod.getText("修改失败"));
      }
    }
    return modelAction.reloadIframeById(iframeId, modelAction.getText("修改成功"));
  }

}
