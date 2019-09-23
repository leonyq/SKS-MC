/*
 * @File EditConfigureInfo.java
 * @Package com.more.mes.smt.snconfigure
 * @Copyinght Copyright (c) 2018
 * @Company morelean
 * @author csj
 * @date 2018-11-20 上午9:57:47
 * @version V1.0
 */

package com.more.mes.smt.snconfigure;

import java.util.ArrayList;
import java.util.List;

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
 * 保存修改的编码生成配置信息
 * 
 * @author development
 */
public class EditConfigureInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String dataId = modelAction.getDataId();
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      String conType = request.getParameter("conType");
      String conName = request.getParameter("paraMapObj.CCC_CONFIGURE_NAME");// 配置名称
      String defaultFlag = request.getParameter("paraMapObj.CCC_DEFAULT_FLAG");// 默认标志
      String memo = request.getParameter("paraMapObj.CCC_MEMO");// 备注
      if (defaultFlag == null || defaultFlag == "" || defaultFlag.equals(""))
      {
        defaultFlag = "N";
      }

      String[] codeSegents = request.getParameterValues("CODE_SEGENT");
      String[] itemValues = request.getParameterValues("ITEM_VALUE");
      String[] itemLens = request.getParameterValues("ITEM_LEN");
      String[] fillTypes = request.getParameterValues("FILL_TYPE");
      String[] FillChars = request.getParameterValues("FILL_CHAR");
      String[] startSeqs = request.getParameterValues("START_SEQ");
      String[] startResets = request.getParameter("startReset").split(",");

      String[] configureTypes = request.getParameterValues("CONFIGURE_TYPE");
      String[] configureVals = request.getParameterValues("CONFIGURE_VAL");

      String sql = "SELECT T.ID FROM T_CO_SN_CONFIGURE T WHERE T.CCC_CONFIGURE_NAME=? AND T.DATA_AUTH=? AND T.ID!=?";
      List<String> list = modelService.listDataSql(sql, new Object[] {conName,dataAuth,dataId});
      if (list != null && !list.isEmpty())
      {
        return modelAction.alertParentInfo(modelAction.getText("配置名称已存在，请更换"));
      }
      if ("Y".equals(defaultFlag))
      {
        sql = "SELECT T.ID FROM T_CO_SN_CONFIGURE T WHERE T.CCC_CONFIGURE_TYPE=? AND T.DATA_AUTH=? AND T.CCC_DEFAULT_FLAG='Y' AND T.ID!=?";
        list = modelService.listDataSql(sql, new Object[] {conType,dataAuth,dataId});
        if (list != null && !list.isEmpty())
        {
          return modelAction.alertParentInfo(modelAction.getText("该类型下已存在默认的条码配置，请更换"));
        }
      }
      // 修改数据
      ArrayList<Object> paraList = new ArrayList<Object>();
      TableDataMapExt cscMap = new TableDataMapExt();
      cscMap.setTableName("T_CO_SN_CONFIGURE");
      cscMap.setSqlWhere(" and ID = ? ");
      paraList.add(dataId);
      cscMap.setSqlWhereArgs(paraList);
      CommMethod.editSysDefCol(cscMap.getColMap(), modelAction.getUser());
      cscMap.getColMap().put("CCC_CONFIGURE_NAME", conName);
      cscMap.getColMap().put("CCC_DEFAULT_FLAG", defaultFlag);
      cscMap.getColMap().put("CCC_MEMO", memo);
      if (dataAuth != null)
      {
        cscMap.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.edit(cscMap);

      String sql2 = "DELETE FROM T_CO_SN_CONFIGURE_DETAIL T WHERE T.CCD_CONFIGURE_ID=? AND T.DATA_AUTH=? ";
      modelService.execSql(sql2, new Object[] {dataId,dataAuth});

      TableDataMapExt detailMap = new TableDataMapExt();
      detailMap.setTableName("T_CO_SN_CONFIGURE_DETAIL");
      for (int i = 0; i < codeSegents.length; i++ )
      {
        int itemLen = 0;
        int j = i + 1;
        if (itemLens[i] != "" && itemLens[i] != null)
        {
          itemLen = Integer.parseInt(itemLens[i]);
        }
        CommMethod.addSysDefCol(detailMap.getColMap(), modelAction.getUser());

        String infoId2 = StringUtils.getUUID();
        detailMap.getColMap().put("ID", infoId2);
        detailMap.getColMap().put("CCD_CONFIGURE_ID", dataId);// 条码配置ID
        detailMap.getColMap().put("CCD_CONFIGURE_SEQ", j);// 配置顺序
        detailMap.getColMap().put("CCD_CODE_SEGMENT", codeSegents[i]);// 码段 1、数据源 2、文本 3、日期变量 4、流水号
        detailMap.getColMap().put("CCD_ITEM_VALUE", itemValues[i]);// 值域
        if (codeSegents[i].equals("4"))
        {
          detailMap.getColMap().put("CCD_ITEM_LEN", itemLen);// 长度
          detailMap.getColMap().put("CCD_FILL_TYPE", fillTypes[i]);// 填充方式 0:无填充 1 左填充 2右填充
          detailMap.getColMap().put("CCD_FILL_CHAR", FillChars[i]);// 填充字符
          detailMap.getColMap().put("CCD_START_NUM", startSeqs[i]);// 起始流水号
        }
        detailMap.getColMap().put("CCD_START_RESET", startResets[i]);// 流水号计算
        detailMap.getColMap().put("CCD_CONFIGURE_TYPE", configureTypes[i]);// 数据源配置类型
        detailMap.getColMap().put("CCD_CONFIGURE_VAL", configureVals[i]);// 数据源配置内容
        if (dataAuth != null)
        {
          detailMap.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.save(detailMap);
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
