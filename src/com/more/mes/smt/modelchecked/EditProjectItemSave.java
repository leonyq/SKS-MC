package com.more.mes.smt.modelchecked;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 机种检测项目 修改保存
 * @author development
 *
 */
public class EditProjectItemSave implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

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
    String modelCode = "";
    int len = 0;
    String itemGenre = "";
    try
    {
      modelCode = request.getParameter("modelCode");
      String step = request.getParameter("testStep");
      itemGenre = request.getParameter("itemGenre");
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
      len = itemSns.length;
      // 删除原有数据
      // ArrayList<Object> paraList = new ArrayList<Object>();
      // TableDataMapExt modelTable = new TableDataMapExt();
      // modelTable.setTableName("T_QM_MODEL_ITEM");
      // CommMethod.editSysDefCol(modelTable.getColMap(), modelAction.getUser());
      // modelTable.setSqlWhere(" and QMI_MODEL_CODE=? AND DATA_AUTH=?");
      // paraList.add(modelCode);
      // paraList.add(dataAuth);
      // modelTable.setSqlWhereArgs(paraList);
      // modelService.del(modelTable);

      ArrayList<Object> paraList = new ArrayList<Object>();
      TableDataMapExt modTable1 = new TableDataMapExt();
      CommMethod.editSysDefCol(modTable1.getColMap(), modelAction.getUser());
      modTable1.setTableName("T_QM_MODEL_ITEM");
      // modTable1.setSqlWhere(" and QMT_MODEL_CODE='" + modelCode + "'");
      if (!"".equals(modelCode))
      {
        modTable1.setSqlWhere(" and QMI_MODEL_CODE=? and DATA_AUTH = ? ");
        paraList.add(modelCode);
        paraList.add(dataAuth);
      }
      else
      {
        modTable1.setSqlWhere(" and QMI_MODEL_CODE is null and QMI_ITEM_GENRE = ? and DATA_AUTH = ? ");
        paraList.add(itemGenre);
        paraList.add(dataAuth);
      }
      modTable1.setSqlWhereArgs(paraList);
      modelService.del(modTable1);
      // 添加修改后的数据
      TableDataMapExt modTable = new TableDataMapExt();
      modTable.setTableName("t_qm_model_item");
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

        CommMethod.addSysDefCol(modTable.getColMap(), modelAction.getUser());
        Map moMap = modTable.getColMap();
        modTable.getColMap().put("ID", StringUtils.getUUID());
        modTable.getColMap().put("QMI_MODEL_CODE", modelCode);
        modTable.getColMap().put("QMI_ITEM_GENRE", itemGenre);
        modTable.getColMap().put("QMI_TEST_STEP", step);
        modTable.getColMap().put("QMI_ITEM_NAME", itemNames[i]);
        modTable.getColMap().put("QMI_ITEM_SN", itemSns[i]);
        modTable.getColMap().put("QMI_ITEM_TYPE", itemTypes[i]);
        modTable.getColMap().put("QMI_ITEM_CLASS", itemClass[i]);
        modTable.getColMap().put("QMI_ITEM_MAXVALUE", maxValNum);
        modTable.getColMap().put("QMI_ITEM_MINVALUE", minValNum);
        modTable.getColMap().put("QMI_ITEM_UNIT", itemUnit[i]);
        modTable.getColMap().put("QMI_TEST_METHOD", testMethod[i]);
        modTable.getColMap().put("QMI_TEST_CONTENT", testContent[i]);
        modTable.getColMap().put("QMI_TEST_SEQ", testSeq[i]);
        if (dataAuth != null)
        {
          modTable.put("DATA_AUTH", dataAuth);
        }
        modelService.save(modTable);
        // if (res < 1)
        // {
        // throw new BussException(FuncCode.MS100_0001_002 + CommMethod.getText("修改失败"));
        // }
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
    // return modelAction.reloadIframeById(iframeId, modelAction.getText("修改成功"));
  }

}
