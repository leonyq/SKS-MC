package com.more.mes.smt.wmsdoc;

import java.util.ArrayList;
import java.util.List;
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
 * 保存修改的单据信息
 * 
 * @author development
 */
public class SaveEditWmsDocInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      String id = request.getParameter("dataId");
      String wdtTypeSn = request.getParameter("WDT_TYPE_SN");// 类型编码
      String wdtTypeName = request.getParameter("paraMapObj.WDT_TYPE_NAME");// 类型名称
      String wdtDocPrefix = request.getParameter("paraMapObj.WDT_DOC_PREFIX");// 单据前缀
      String wdtOperateType = request.getParameter("paraMapObj.WDT_OPERATE_TYPE");// 出入库类型
      String wdtWrpType = request.getParameter("paraMapObj.WDT_ERP_TYPE");// ERP单据类别
      String wdtSampleFlag = request.getParameter("paraMapObj.WDT_SAMPLE_FLAG");// 是否送检
      String wdtExcessReceive = request.getParameter("paraMapObj.WDT_EXCESS_RECEIVE");// 超收标志
      String wdtExcessPick = request.getParameter("paraMapObj.WDT_EXCESS_PICK");// 超发标志
      String wdtHandoverFlag = request.getParameter("paraMapObj.WDT_HANDOVER_FLAG");// 交接标志
      String wdtUploadFlag = request.getParameter("paraMapObj.WDT_UPLOAD_FLAG");// ERP同步标志
      String wdtPdaFlag = request.getParameter("paraMapObj.WDT_PDA_FLAG");// PDA显示标志
      String wdtCreateRule = request.getParameter("paraMapObj.WDT_CREATE_RULE");
      String[] tcsCodes = request.getParameterValues("TCS_CODE");// 指令集代码
      String[] tclCodes = request.getParameterValues("TCL_CODE");// 指令代码
      String[] wdoDispatchSns = request.getParameterValues("WDO_DISPATCH_SN");// 收发类型代码
      String[] wdoDispatchNames = request.getParameterValues("WDO_DISPATCH_NAME");// 收发类型名称
      String[] wdoDispatchPrefixs = request.getParameterValues("WDO_DISPATCH_PREFIX");// 收发类型前缀
      String[] wdoSampleFlags = request.getParameterValues("isCheckSelect");// 是否送检
      String[] wdoTestSteps = request.getParameterValues("testStepSelect");// 检测阶别
      String[] wdoSampleTypes = request.getParameterValues("sampleSelect");// 检测类型
      String[] wdoHandoverFlags = request.getParameterValues("isHandSelect");// 是否交接
      String[] wdoHandoverWays = request.getParameterValues("handWaySelect");// 交接方式
      String[] wdoUploadFlags = request.getParameterValues("isERPSelect");// ERP同步标志
      String[] wdtCreateRules = request.getParameterValues("createRuleSelect");
      if (wdoDispatchSns != null && wdoDispatchSns.length > 0)
      {
        for (int i = 0; i < wdoDispatchSns.length; i++ )
        {
          for (int j = i + 1; j < wdoDispatchSns.length; j++ )
          {
            if (wdoDispatchSns[i].equals(wdoDispatchSns[j]))
            {
              return modelAction.alertParentInfo(modelAction.getText("收发类型代码不能相同"));
            }
          }
        }
      }
      if (wdoDispatchSns != null && wdoDispatchSns.length > 0)
      {
        for (int i = 0; i < wdoDispatchSns.length; i++ )
        {
          String sql1 = "select WDO_DISPATCH_SN from T_WMS_DISPATCH_TYPE where WDO_DISPATCH_SN=? AND DATA_AUTH=?  and WDT_TYPE_SN not in(?)";
          List<Map> list = modelService.listDataSql(sql1, new Object[] {wdoDispatchSns[i],dataAuth,
            wdtTypeSn});
          if (null != list && list.size() > 0)
          {
            if (wdoDispatchSns[i].equals(list.get(0).get("WDO_DISPATCH_SN").toString()))
            {
              return modelAction.alertParentInfo(modelAction.getText("收发类型代码不能相同"));
            }
          }
        }
      }
      String wdtTestStep = ""; // 检测阶别
      String wdtSampleType = ""; // 检验类型
      if (wdtSampleFlag == null || wdtSampleFlag == "" || wdtSampleFlag.equals(""))
      {
        wdtSampleFlag = "N";
      }
      else
      {
        wdtTestStep = request.getParameter("paraMapObj.WDT_TEST_STEP");
        wdtSampleType = request.getParameter("paraMapObj.WDT_SAMPLE_TYPE");
      }
      if (wdtPdaFlag == null || wdtPdaFlag == "" || wdtPdaFlag.equals(""))
      {
        wdtPdaFlag = "N";
      }

      if (wdtExcessReceive == null)
      {
        wdtExcessReceive = "N";
      }
      if (wdtExcessPick == null)
      {
        wdtExcessPick = "N";
      }
      if (wdtUploadFlag == null)
      {
        wdtUploadFlag = "N";
      }
      String WDT_HANDOVER_WAYS = ""; // 交接方式
      if (wdtHandoverFlag == null)
      {
        wdtHandoverFlag = "N";
      }
      else
      {
        WDT_HANDOVER_WAYS = request.getParameter("paraMapObj.WDT_HANDOVER_WAYS");
      }
      // 修改单据类型信息
      List list = new ArrayList();
      TableDataMapExt wms = new TableDataMapExt();
      wms.setTableName("T_WMS_DOC_TYPE");
      CommMethod.editSysDefCol(wms.getColMap(), modelAction.getUser());
      wms.setSqlWhere(" and ID=?");
      list.add(id);
      wms.setSqlWhereArgs(list);
      wms.getColMap().put("WDT_TYPE_NAME", wdtTypeName);
      wms.getColMap().put("WDT_DOC_PREFIX", wdtDocPrefix);
      wms.getColMap().put("WDT_OPERATE_TYPE", wdtOperateType);
      wms.getColMap().put("WDT_ERP_TYPE", wdtWrpType);
      wms.getColMap().put("WDT_SAMPLE_FLAG", wdtSampleFlag);
      wms.getColMap().put("WDT_TEST_STEP", wdtTestStep);
      wms.getColMap().put("WDT_SAMPLE_TYPE", wdtSampleType);
      wms.getColMap().put("WDT_EXCESS_RECEIVE", wdtExcessReceive);
      wms.getColMap().put("WDT_EXCESS_PICK", wdtExcessPick);
      wms.getColMap().put("WDT_HANDOVER_FLAG", wdtHandoverFlag);
      wms.getColMap().put("WDT_HANDOVER_WAYS", WDT_HANDOVER_WAYS);
      wms.getColMap().put("WDT_UPLOAD_FLAG", wdtUploadFlag);
      wms.getColMap().put("WDT_PDA_FLAG", wdtPdaFlag);
      wms.getColMap().put("WDT_CREATE_RULE", wdtCreateRule);
      if (dataAuth != null)
      {
        wms.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.edit(wms);
      // 先删除单据类型关联指令信息
      TableDataMapExt delwms1 = new TableDataMapExt();
      delwms1.setTableName("T_WMS_DOC_ORDER");
      delwms1.setSqlWhere(" and WDO_TYPE_SN=? and DATA_AUTH=? ");
      list.clear();
      list.add(wdtTypeSn);
      list.add(dataAuth);
      delwms1.setSqlWhereArgs(list);
      modelService.del(delwms1);
      // 插入单据类型关联指令信息
      if (tcsCodes != null && tcsCodes.length > 0)
      {
        TableDataMapExt wms1 = new TableDataMapExt();
        wms1.setTableName("T_WMS_DOC_ORDER");
        for (int i = 0; i < tcsCodes.length; i++ )
        {
          CommMethod.addSysDefCol(wms1.getColMap(), modelAction.getUser());
          wms1.getColMap().put("ID", StringUtils.getUUID());
          wms1.getColMap().put("WDO_ORDER_SET", tcsCodes[i]);
          wms1.getColMap().put("WDO_ORDER_SN", tclCodes[i]);
          wms1.getColMap().put("WDO_TYPE_SN", wdtTypeSn);
          if (dataAuth != null)
          {
            wms1.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.save(wms1);
        }
      }
      // 先删除单据类型关联收发类型信息
      TableDataMapExt delwms2 = new TableDataMapExt();
      delwms2.setTableName("T_WMS_DISPATCH_TYPE");
      delwms2.setSqlWhere(" and WDT_TYPE_SN=? and DATA_AUTH=? ");
      list.clear();
      list.add(wdtTypeSn);
      list.add(dataAuth);
      delwms2.setSqlWhereArgs(list);
      modelService.del(delwms2);
      // 插入单据类型关联收发类型信息
      String flae = null;
      if (wdoDispatchSns != null && wdoDispatchSns.length > 0)
      {
        TableDataMapExt wms2 = new TableDataMapExt();
        wms2.setTableName("T_WMS_DISPATCH_TYPE");
        for (int i = 0; i < wdoDispatchSns.length; i++ )
        {

          if (StringUtils.isBlank(wdoHandoverFlags[i]))
          {
            wdoHandoverFlags[i] = "N";
          }
          CommMethod.addSysDefCol(wms2.getColMap(), modelAction.getUser());
          wms2.getColMap().put("ID", StringUtils.getUUID());
          wms2.getColMap().put("WDO_DISPATCH_SN", wdoDispatchSns[i]);
          wms2.getColMap().put("WDO_DISPATCH_NAME", wdoDispatchNames[i]);
          wms2.getColMap().put("WDO_DISPATCH_PREFIX", wdoDispatchPrefixs[i]);
          wms2.getColMap().put("WDO_SAMPLE_FLAG", wdoSampleFlags[i]);
          wms2.getColMap().put("WDO_TEST_STEP", wdoTestSteps[i]);
          wms2.getColMap().put("WDO_SAMPLE_TYPE", wdoSampleTypes[i]);
          wms2.getColMap().put("WDO_HANDOVER_FLAG", wdoHandoverFlags[i]);
          wms2.getColMap().put("WDO_HANDOVER_WAYS", wdoHandoverWays[i]);
          wms2.getColMap().put("WDO_UPLOAD_FLAG", wdoUploadFlags[i]);
          wms2.getColMap().put("WDT_CREATE_RULE", wdtCreateRules[i]);
          wms2.getColMap().put("WDT_TYPE_SN", wdtTypeSn);
          if (dataAuth != null)
          {
            wms2.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.save(wms2);
        }
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
  }

}
