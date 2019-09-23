package com.more.mes.smt.wmsdoc;

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
 * 保存新增的单据信息,指令信息以及关联收发类型信息
 * 
 * @author development
 */
public class SaveWmsDocInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      String wdtTypeSn = request.getParameter("paraMap1@0#WDT_TYPE_SN");// 类型编码
      String sql = "select t.WDT_TYPE_SN from T_WMS_DOC_TYPE t where t.WDT_TYPE_SN=? and t.data_auth=? ";
      int count = modelService.countSql(sql, new Object[] {wdtTypeSn,dataAuth});
      if (count != 0)
      {
        return modelAction.alertParentInfo(modelAction.getText("类型编码已存在"));
      }
      String wdtTypeName = request.getParameter("paraMap1@0#WDT_TYPE_NAME");// 类型名称
      String wdtDocPrefix = request.getParameter("paraMap1@0#WDT_DOC_PREFIX");// 单据前缀
      String wdtOperateType = request.getParameter("paraMap1@0#WDT_OPERATE_TYPE");// 出入库类型
      String wdtErpType = request.getParameter("paraMap1@0#WDT_ERP_TYPE");// ERP单据类别
      String wdtSampleFlag = request.getParameter("paraMap1@0#WDT_SAMPLE_FLAG");// 是否送检
      String wdtExcessReceive = request.getParameter("paraMap1@0#WDT_EXCESS_RECEIVE");// 超收标志
      String wdtExcessPick = request.getParameter("paraMap1@0#WDT_EXCESS_PICK");// 超发标志
      String wdtHandoverFlag = request.getParameter("paraMap1@0#WDT_HANDOVER_FLAG");// 交接标志
      String wdtUploadFlag = request.getParameter("paraMap1@0#WDT_UPLOAD_FLAG");// ERP同步标志
      String wdtPdaFlag = request.getParameter("paraMap1@0#WDT_PDA_FLAG");// PDA显示标志
      String wdtCreateRule = request.getParameter("paraMap1@0#WDT_CREATE_RULE");
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
          String sql1 = "select WDO_DISPATCH_SN from T_WMS_DISPATCH_TYPE where WDO_DISPATCH_SN=? and data_auth=? ";
          List<Map> list = modelService.listDataSql(sql1, new Object[] {wdoDispatchSns[i],dataAuth});
          if (null != list && list.size() > 0)
          {
            if (wdoDispatchSns[i].equals(list.get(0).get("WDO_DISPATCH_SN").toString()))
            {
              return modelAction.alertParentInfo(modelAction.getText("收发类型代码已存在"));
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
        wdtTestStep = request.getParameter("paraMap1@0#WDT_TEST_STEP");
        wdtSampleType = request.getParameter("paraMap1@0#WDT_SAMPLE_TYPE");
      }
      if (wdtExcessReceive == null)
      {
        wdtExcessReceive = "N";
      }
      if (wdtPdaFlag == null || wdtPdaFlag == "" || wdtPdaFlag.equals(""))
      {
        wdtPdaFlag = "N";
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
        WDT_HANDOVER_WAYS = request.getParameter("paraMap1@0#WDT_HANDOVER_WAYS");

      }

      // 插入单据类型信息
      TableDataMapExt wms = new TableDataMapExt();
      wms.setTableName("T_WMS_DOC_TYPE");
      CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
      wms.getColMap().put("ID", StringUtils.getUUID());
      wms.getColMap().put("WDT_TYPE_SN", wdtTypeSn);
      wms.getColMap().put("WDT_TYPE_NAME", wdtTypeName);
      wms.getColMap().put("WDT_DOC_PREFIX", wdtDocPrefix);
      wms.getColMap().put("WDT_OPERATE_TYPE", wdtOperateType);
      wms.getColMap().put("WDT_ERP_TYPE", wdtErpType);
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
      wms.getColMap().put("WDT_DELETE_FLAG", "N");

      if (dataAuth != null)
      {
        wms.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(wms);
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
      // 插入单据类型关联收发类型信息
      if (wdoDispatchSns != null && wdoDispatchSns.length > 0)
      {
        TableDataMapExt wms2 = new TableDataMapExt();
        wms2.setTableName("T_WMS_DISPATCH_TYPE");
        for (int i = 0; i < wdoDispatchSns.length; i++ )
        {
          CommMethod.addSysDefCol(wms2.getColMap(), modelAction.getUser());
          wms2.getColMap().put("ID", StringUtils.getUUID());
          wms2.getColMap().put("WDO_DISPATCH_SN", wdoDispatchSns[i]);
          wms2.getColMap().put("WDO_DISPATCH_NAME", wdoDispatchNames[i]);
          wms2.getColMap().put("WDO_DISPATCH_PREFIX", wdoDispatchPrefixs[i]);
          wms2.getColMap().put("WDO_SAMPLE_FLAG", wdoSampleFlags[i]);
          wms2.getColMap().put("WDO_TEST_STEP", wdoTestSteps[i]);
          wms2.getColMap().put("WDO_SAMPLE_TYPE", wdoSampleTypes[i]);
          wms2.getColMap().put("WDT_CREATE_RULE", wdtCreateRules[i]);
          String flae = null;
          if (StringUtils.isBlank(wdoHandoverFlags[i]))
          {
            flae = "N";
          }
          else
          {
            flae = "Y";
          }
          wms2.getColMap().put("WDO_HANDOVER_FLAG", flae);
          wms2.getColMap().put("WDO_HANDOVER_WAYS", wdoHandoverWays[i]);
          wms2.getColMap().put("WDO_UPLOAD_FLAG", wdoUploadFlags[i]);
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
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }

}
