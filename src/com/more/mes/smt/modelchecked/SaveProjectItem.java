package com.more.mes.smt.modelchecked;

import java.util.List;
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

/**
 * 机种检测项目 新增保存
 * @author development
 *
 */
public class SaveProjectItem implements FuncService
{

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    String dataAuth = request.getParameter("_DATA_AUTH");// 数据权限
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    String modelCode = request.getParameter("modelCode");// 机种
    String itemGenre = request.getParameter("itemGenre");
    String step = request.getParameter("paraMap1@0#QMI_TEST_STEP");// 检测阶别
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
    // 数据库中再次校验
    String sql = "select id from t_qm_model_item where QMI_MODEL_CODE=? and QMI_TEST_STEP=? and "
                 + "QMI_ITEM_SN=? and QMI_ITEM_TYPE=? and DATA_AUTH=? ";
    List tempList = null;
    for (int i = 0; i < len; i++ )
    {
      tempList = modelService.listDataSql(sql, new Object[] {modelCode, step, itemSns[i],
        itemTypes[i], dataAuth});
      if (!tempList.isEmpty() && tempList != null)
      {
        return modelAction.alertParentInfo(modelAction.getText("同一机种、检测阶别下的项目代码与项目类型不能相同"));
      }
    }
    int res = 0;
    for (int i = 0; i < len; i++ )
    {
      double maxValNum = 0;
      double minValNum = 0;
      int seqNum = 0;
      if (!StringUtils.isBlank(maxValue[i]))
      {
        maxValNum = Double.parseDouble(maxValue[i]);
      }
      if (!StringUtils.isBlank(minValue[i]))
      {
        minValNum = Double.parseDouble(minValue[i]);
      }
      if (!StringUtils.isBlank(testSeq[i]))
      {
        seqNum = Integer.parseInt(testSeq[i]);
      }
      TableDataMapExt modTable = new TableDataMapExt();
      CommMethod.addSysDefCol(modTable.getColMap(), modelAction.getUser());
      modTable.setTableName("t_qm_model_item");
      Map moMap = modTable.getColMap();
      moMap.put("QMI_MODEL_CODE", modelCode);
      moMap.put("QMI_ITEM_GENRE", itemGenre);
      moMap.put("QMI_TEST_STEP", step);
      moMap.put("QMI_ITEM_NAME", itemNames[i]);
      moMap.put("QMI_ITEM_SN", itemSns[i]);
      moMap.put("QMI_ITEM_TYPE", itemTypes[i]);
      moMap.put("QMI_ITEM_CLASS", itemClass[i]);
      moMap.put("QMI_ITEM_MAXVALUE", maxValNum);
      moMap.put("QMI_ITEM_MINVALUE", minValNum);
      moMap.put("QMI_ITEM_UNIT", itemUnit[i]);
      moMap.put("QMI_TEST_METHOD", testMethod[i]);
      moMap.put("QMI_TEST_CONTENT", testContent[i]);
      moMap.put("QMI_TEST_SEQ", seqNum);

      if (dataAuth != null)
      {
        moMap.put("DATA_AUTH", dataAuth);
      }
      res = modelService.save(modTable);
      if (res < 1)
      {
        throw new BussException(FuncCode.MS100_0001_002 + CommMethod.getText("新增失败"));
      }
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);

  }

}
