package com.more.mes.smt.snconfigure;

import java.text.SimpleDateFormat;
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
 * 保存新增的编码生成配置信息
 * 
 * @author development
 */
public class SaveConfigureInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("_DATA_AUTH");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");

      String infoId = StringUtils.getUUID();
      String conCode = request.getParameter("paraMap1@0#CCC_CONFIGURE_CODE");// 配置编码
      String conName = request.getParameter("paraMap1@0#CCC_CONFIGURE_NAME");// 配置名称
      String conType = request.getParameter("paraMap1@0#CCC_CONFIGURE_TYPE");// 配置类型
      String defaultFlag = request.getParameter("paraMap1@0#CCC_DEFAULT_FLAG");// 默认标志
      String memo = request.getParameter("paraMap1@0#CCC_MEMO");// 备注
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

      String sql = "SELECT T.ID FROM T_CO_SN_CONFIGURE T WHERE T.CCC_CONFIGURE_CODE=? AND T.DATA_AUTH=? ";
      List<String> list = modelService.listDataSql(sql, new Object[] {conCode,dataAuth});
      if (list != null && !list.isEmpty())
      {
        return modelAction.alertParentInfo(modelAction.getText("配置编码已存在，请更换"));
      }
      sql = "SELECT T.ID FROM T_CO_SN_CONFIGURE T WHERE T.CCC_CONFIGURE_NAME=? AND T.DATA_AUTH=? ";
      list = modelService.listDataSql(sql, new Object[] {conName,dataAuth});
      if (list != null && !list.isEmpty())
      {
        return modelAction.alertParentInfo(modelAction.getText("配置名称已存在，请更换"));
      }
      if ("Y".equals(defaultFlag))
      {
        sql = "SELECT T.ID FROM T_CO_SN_CONFIGURE T WHERE T.CCC_CONFIGURE_TYPE=? AND T.DATA_AUTH=? AND T.CCC_DEFAULT_FLAG='Y'";
        list = modelService.listDataSql(sql, new Object[] {conType,dataAuth});
        if (list != null && !list.isEmpty())
        {
          return modelAction.alertParentInfo(modelAction.getText("该类型下已存在默认的条码配置，请更换"));
        }
      }
      // 增加数据
      TableDataMapExt cscMap = new TableDataMapExt();
      cscMap.setTableName("T_CO_SN_CONFIGURE");
      CommMethod.addSysDefCol(cscMap.getColMap(), modelAction.getUser());
      cscMap.getColMap().put("ID", infoId);
      cscMap.getColMap().put("CCC_CONFIGURE_CODE", conCode);
      cscMap.getColMap().put("CCC_CONFIGURE_NAME", conName);
      cscMap.getColMap().put("CCC_CONFIGURE_TYPE", conType);
      cscMap.getColMap().put("CCC_DEFAULT_FLAG", defaultFlag);
      cscMap.getColMap().put("CCC_MEMO", memo);
      if (dataAuth != null)
      {
        cscMap.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(cscMap);

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
        detailMap.getColMap().put("CCD_CONFIGURE_ID", infoId);// 条码配置ID
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
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }

}
