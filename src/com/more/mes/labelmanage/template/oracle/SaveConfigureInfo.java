package com.more.mes.labelmanage.template.oracle;

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
 * 打印模板---保存数据项信息
 * 
 * @author development
 */
public class SaveConfigureInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    String infoId = modelAction.getDataId();
    HttpServletRequest request = modelAction.getRequest();
    String sql = request.getParameter("paraMapObj.CLD_SQL");
    String oNames = request.getParameter("oNames");
    String colVals = request.getParameter("colVals");
    String codeAlias = request.getParameter("codeAlias");
    String numAlias = request.getParameter("numAlias");
    String itemAlias = request.getParameter("itemAlias");

    String[] itemSqls = request.getParameterValues("CLD_ITEM_SQL");
    String[] displayWays = request.getParameterValues("DISPLAY_WAY");
    String[] itemInfos = request.getParameterValues("ITEM_INFO");
    String[] listFlag = request.getParameterValues("listFlags");
    String[] listFlags = listFlag[0].split(",");

    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String formId = request.getParameter("formId");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    try
    {
      String getStockInfoSql = "SELECT T.* FROM T_CO_LABEL_DATACONFIGURE T WHERE T.CLD_LABEL_ID=?";
      List tempList = modelService.listDataSql(getStockInfoSql, new Object[] {infoId});
      if ((tempList == null) || tempList.isEmpty())
      {
        // 新增

        String[] tempStrs = oNames.split(",", -1);
        String[] tempStrs2 = colVals.split(",", -1);

        for (int i = 0; i < tempStrs.length - 1; i++ )
        {
          if (!tempStrs2[i].equals("") || listFlags[i].equals("Y"))
          {
            TableDataMapExt cldMap = new TableDataMapExt();
            cldMap.setTableName("T_CO_LABEL_DATACONFIGURE");
            CommMethod.addSysDefCol(cldMap.getColMap(), modelAction.getUser());
            if (dataAuth != null)
            {
              cldMap.getColMap().put("DATA_AUTH", dataAuth);
            }

            cldMap.getColMap().put("CLD_LABEL_ID", infoId);// 模板ID
            cldMap.getColMap().put("CLD_ITEM_ALIAS", tempStrs[i]);// 别名
            cldMap.getColMap().put("CLD_COLUMN_NAME", tempStrs2[i]);// 列名
            cldMap.getColMap().put("CLD_SQL", itemSqls[i]);
            if ("Y".equals(listFlags[i]))
            {
              cldMap.getColMap().put("CLD_LIST_FLAG", "Y");
            }
            else
            {
              cldMap.getColMap().put("CLD_LIST_FLAG", "N");
            }

            modelService.save(cldMap);
          }

          // 保存
          if (!"".equals(displayWays[i]))
          {
            TableDataMapExt cldMap = new TableDataMapExt();
            cldMap.setTableName("T_CO_LABEL_DATACONFIGURE");
            CommMethod.addSysDefCol(cldMap.getColMap(), modelAction.getUser());
            if (dataAuth != null)
            {
              cldMap.getColMap().put("DATA_AUTH", dataAuth);
            }

            cldMap.getColMap().put("CLD_LABEL_ID", infoId);// 模板ID
            cldMap.getColMap().put("CLD_ITEM_ALIAS", tempStrs[i]);// 别名
            cldMap.getColMap().put("CLD_COLUMN_NAME", tempStrs2[i]);// 列名
            cldMap.getColMap().put("CLD_SQL", itemSqls[i]);
            if ("Y".equals(listFlags[i]))
            {
              cldMap.getColMap().put("CLD_LIST_FLAG", "Y");
            }
            else
            {
              cldMap.getColMap().put("CLD_LIST_FLAG", "N");
            }

            modelService.save(cldMap);
            // 保存模板数据项数据源配置信息表数据
            // 先删除
            if (!"".equals(itemInfos[i]))
            {
              String delSql = "delete from T_CO_LABEL_ITEM_DATASOURCE t where t.cld_label_id=? and t.cld_item_alias=?";
              modelService.execSql(delSql, new Object[] {infoId, tempStrs[i]});
            }
            if ("1".equals(displayWays[i]))
            {
              String[] itemInfoStrs = itemInfos[i].split("&&");
              for (int j = 0; j < itemInfoStrs.length; j++ )
              {
                String[] tempStr = itemInfoStrs[j].split(",");
                String colName = tempStr[0];
                String colWidth = tempStr[1];
                TableDataMapExt cldItemMap = new TableDataMapExt();
                cldItemMap.setTableName("T_CO_LABEL_ITEM_DATASOURCE");
                CommMethod.addSysDefCol(cldItemMap.getColMap(), modelAction.getUser());
                if (dataAuth != null)
                {
                  cldItemMap.getColMap().put("DATA_AUTH", dataAuth);
                }
                cldItemMap.getColMap().put("CLD_LABEL_ID", infoId);// 模板ID
                cldItemMap.getColMap().put("CLD_ITEM_ALIAS", tempStrs[i]);// 数据项别名
                cldItemMap.getColMap().put("CLD_DISPLAY_WAY", displayWays[i]);// 展示方式（1-列表显示，2-数据排列）
                cldItemMap.getColMap().put("CLD_COLUMN_NAME", colName);// 数据项列名
                cldItemMap.getColMap().put("CLD_COLUMN_WIDTH", colWidth);// 列宽(PX)

                modelService.save(cldItemMap);
              }
            }
            else if ("2".equals(displayWays[i]))
            {
              String[] tempStr = itemInfos[i].split(",");
              String colName = tempStr[0];
              String colRow = tempStr[1];
              String colNum = tempStr[2];
              TableDataMapExt cldItemMap = new TableDataMapExt();
              cldItemMap.setTableName("T_CO_LABEL_ITEM_DATASOURCE");
              CommMethod.addSysDefCol(cldItemMap.getColMap(), modelAction.getUser());
              if (dataAuth != null)
              {
                cldItemMap.getColMap().put("DATA_AUTH", dataAuth);
              }
              cldItemMap.getColMap().put("CLD_LABEL_ID", infoId);// 模板ID
              cldItemMap.getColMap().put("CLD_ITEM_ALIAS", tempStrs[i]);// 数据项别名
              cldItemMap.getColMap().put("CLD_DISPLAY_WAY", displayWays[i]);// 展示方式（1-列表显示，2-数据排列）
              cldItemMap.getColMap().put("CLD_COLUMN_NAME", colName);// 数据项列名
              cldItemMap.getColMap().put("CLD_ROW", colRow);// 行数
              cldItemMap.getColMap().put("CLD_COLUMN", colNum);// 列数
              modelService.save(cldItemMap);
            }
          }
        }

        String delSql2 = "delete from T_CO_LABEL_DATASOURCE t where t.cld_label_id=?";
        modelService.execSql(delSql2, new Object[] {infoId});

        TableDataMapExt cldMap2 = new TableDataMapExt();
        cldMap2.setTableName("T_CO_LABEL_DATASOURCE");
        CommMethod.addSysDefCol(cldMap2.getColMap(), modelAction.getUser());
        if (dataAuth != null)
        {
          cldMap2.getColMap().put("DATA_AUTH", dataAuth);
        }
        cldMap2.getColMap().put("CLD_LABEL_ID", infoId);// 模板ID
        cldMap2.getColMap().put("CLD_SQL", sql);// 别名
        cldMap2.getColMap().put("CLD_CODE_ALIAS", codeAlias);
        cldMap2.getColMap().put("CLD_NUM_ALIAS", numAlias);

        modelService.save(cldMap2);
      }
      else
      {
        // 修改
        // 先删除 再新增
        String delSql = "delete from T_CO_LABEL_DATACONFIGURE where CLD_LABEL_ID=? ";
        modelService.execSql(delSql, new Object[] {infoId});

        String[] tempStrs = oNames.split(",", -1);
        String[] tempStrs2 = colVals.split(",", -1);
        for (int i = 0; i < tempStrs.length - 1; i++ )
        {
          if (!tempStrs2[i].equals("") || listFlags[i].equals("Y"))
          {
            TableDataMapExt cldMap = new TableDataMapExt();
            cldMap.setTableName("T_CO_LABEL_DATACONFIGURE");
            CommMethod.addSysDefCol(cldMap.getColMap(), modelAction.getUser());
            if (dataAuth != null)
            {
              cldMap.getColMap().put("DATA_AUTH", dataAuth);
            }

            cldMap.getColMap().put("CLD_LABEL_ID", infoId);// 模板ID
            cldMap.getColMap().put("CLD_ITEM_ALIAS", tempStrs[i]);// 别名
            cldMap.getColMap().put("CLD_COLUMN_NAME", tempStrs2[i]);// 列名
            cldMap.getColMap().put("CLD_SQL", itemSqls[i]);
            if ("Y".equals(listFlags[i]))
            {
              cldMap.getColMap().put("CLD_LIST_FLAG", "Y");
            }
            else
            {
              cldMap.getColMap().put("CLD_LIST_FLAG", "N");
            }
            modelService.save(cldMap);
          }

          // 保存
          if ("N".equals(listFlags[i]))
          {
            String delSql2 = "delete from T_CO_LABEL_ITEM_DATASOURCE t where t.cld_label_id=? and t.cld_item_alias=?";
            modelService.execSql(delSql2, new Object[] {infoId, tempStrs[i]});
          }

          if (!"".equals(displayWays[i]))
          {
            TableDataMapExt cldMap = new TableDataMapExt();
            cldMap.setTableName("T_CO_LABEL_DATACONFIGURE");
            CommMethod.addSysDefCol(cldMap.getColMap(), modelAction.getUser());
            if (dataAuth != null)
            {
              cldMap.getColMap().put("DATA_AUTH", dataAuth);
            }

            cldMap.getColMap().put("CLD_LABEL_ID", infoId);// 模板ID
            cldMap.getColMap().put("CLD_ITEM_ALIAS", tempStrs[i]);// 别名
            cldMap.getColMap().put("CLD_COLUMN_NAME", tempStrs2[i]);// 列名
            cldMap.getColMap().put("CLD_SQL", itemSqls[i]);
            if ("Y".equals(listFlags[i]))
            {
              cldMap.getColMap().put("CLD_LIST_FLAG", "Y");
            }
            else
            {
              cldMap.getColMap().put("CLD_LIST_FLAG", "N");
            }
            modelService.save(cldMap);
            // 保存模板数据项数据源配置信息表数据
            // 先删除
            if (!"".equals(itemInfos[i]))
            {
              String delSql2 = "delete from T_CO_LABEL_ITEM_DATASOURCE t where t.cld_label_id=? and t.cld_item_alias=?";
              modelService.execSql(delSql2, new Object[] {infoId, tempStrs[i]});
            }

            if ("1".equals(displayWays[i]))
            {
              String[] itemInfoStrs = itemInfos[i].split("&&");
              for (int j = 0; j < itemInfoStrs.length; j++ )
              {
                String[] tempStr = itemInfoStrs[j].split(",");
                String colName = tempStr[0];
                String colWidth = tempStr[1];
                TableDataMapExt cldItemMap = new TableDataMapExt();
                cldItemMap.setTableName("T_CO_LABEL_ITEM_DATASOURCE");
                CommMethod.addSysDefCol(cldItemMap.getColMap(), modelAction.getUser());
                if (dataAuth != null)
                {
                  cldItemMap.getColMap().put("DATA_AUTH", dataAuth);
                }
                cldItemMap.getColMap().put("CLD_LABEL_ID", infoId);// 模板ID
                cldItemMap.getColMap().put("CLD_ITEM_ALIAS", tempStrs[i]);// 数据项别名
                cldItemMap.getColMap().put("CLD_DISPLAY_WAY", displayWays[i]);// 展示方式（1-列表显示，2-数据排列）
                cldItemMap.getColMap().put("CLD_COLUMN_NAME", colName);// 数据项列名
                cldItemMap.getColMap().put("CLD_COLUMN_WIDTH", colWidth);// 列宽(PX)

                modelService.save(cldItemMap);
              }
            }
            else if ("2".equals(displayWays[i]))
            {
              String[] tempStr = itemInfos[i].split(",");
              String colName = tempStr[0];
              String colRow = tempStr[1];
              String colNum = tempStr[2];
              TableDataMapExt cldItemMap = new TableDataMapExt();
              cldItemMap.setTableName("T_CO_LABEL_ITEM_DATASOURCE");
              CommMethod.addSysDefCol(cldItemMap.getColMap(), modelAction.getUser());
              if (dataAuth != null)
              {
                cldItemMap.getColMap().put("DATA_AUTH", dataAuth);
              }
              cldItemMap.getColMap().put("CLD_LABEL_ID", infoId);// 模板ID
              cldItemMap.getColMap().put("CLD_ITEM_ALIAS", tempStrs[i]);// 数据项别名
              cldItemMap.getColMap().put("CLD_DISPLAY_WAY", displayWays[i]);// 展示方式（1-列表显示，2-数据排列）
              cldItemMap.getColMap().put("CLD_COLUMN_NAME", colName);// 数据项列名
              cldItemMap.getColMap().put("CLD_ROW", colRow);// 行数
              cldItemMap.getColMap().put("CLD_COLUMN", colNum);// 列数
              modelService.save(cldItemMap);
            }
          }
        }

        String delSql2 = "delete from T_CO_LABEL_DATASOURCE t where t.cld_label_id=?";
        modelService.execSql(delSql2, new Object[] {infoId});

        // TableDataMapExt cldMap2 = new TableDataMapExt();
        // cldMap2.setTableName("T_CO_LABEL_DATASOURCE");
        // CommMethod.editSysDefCol(cldMap2.getColMap(), modelAction.getUser());
        // cldMap2.setSqlWhere(" and CLD_LABEL_ID='" + infoId + "'");
        // cldMap2.getColMap().put("CLD_SQL", sql);
        // cldMap2.getColMap().put("CLD_CODE_ALIAS", codeAlias);
        // cldMap2.getColMap().put("CLD_NUM_ALIAS", numAlias);
        // if (dataAuth != null)
        // {
        // cldMap2.getColMap().put("DATA_AUTH", dataAuth);
        // }
        // modelService.edit(cldMap2);
        TableDataMapExt cldMap2 = new TableDataMapExt();
        cldMap2.setTableName("T_CO_LABEL_DATASOURCE");
        CommMethod.addSysDefCol(cldMap2.getColMap(), modelAction.getUser());
        if (dataAuth != null)
        {
          cldMap2.getColMap().put("DATA_AUTH", dataAuth);
        }
        cldMap2.getColMap().put("CLD_LABEL_ID", infoId);// 模板ID
        cldMap2.getColMap().put("CLD_SQL", sql);// 别名
        cldMap2.getColMap().put("CLD_CODE_ALIAS", codeAlias);
        cldMap2.getColMap().put("CLD_NUM_ALIAS", numAlias);

        modelService.save(cldMap2);
      }
      TableDataMapExt cldMap3 = new TableDataMapExt();
      cldMap3.setTableName("ML_TEMPLATE");
      CommMethod.editSysDefCol(cldMap3.getColMap(), modelAction.getUser());
      cldMap3.setSqlWhere(" and ID='" + infoId + "'");
      if (dataAuth != null)
      {
        cldMap3.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.edit(cldMap3);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("配置失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("配置成功"), "0");
  }

}
