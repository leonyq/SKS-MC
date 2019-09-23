package com.morelean.mes.smt.indicator.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

public class IndicatorTableService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    return "";
  }

   // 工单下达校验制令单
  public String checkMoNum(String dataAuth,ModelAction modelAction, ModelService modelService, String projectId,
                           String proStep)
  {
    String mes = "";
    String sql = "";
    List<Map<String, Object>> result = null;
    try
    {
      String sql4 = "select VR_VALUE from  T_SYS_PARAMETER_INI where VR_CLASS='SMT0013' AND DATA_AUTH=? ";

      List<Map> list3 = modelService.listDataSql(sql4,new Object[] {dataAuth});

      String vrValue = list3.get(0).get("VR_VALUE").toString();

      if (vrValue.equals("1"))
      {
        sql = "SELECT * FROM T_PM_PROJECT_BASE T WHERE T.PROJECT_ID=? AND T.DATA_AUTH=? ";
        result = modelService.listDataSql(sql, new Object[] {projectId,dataAuth});
        if (!(result == null) && !result.isEmpty())
        {
          String modelCode = StringUtils.toString(result.get(0).get("PRODUCT_MATERIAL"));
          // 机种是否配置检查项目
          sql = "SELECT * FROM T_CO_ITEM_PROJECT T WHERE T.CO_ITEM_CODE=? AND T.DATA_AUTH=? ";
          result = modelService.listDataSql(sql, new Object[] {modelCode,dataAuth});
          if (!(result == null) && !result.isEmpty())
          {
            // 工单下达阶别是否与检查项目阶别一致
            sql = "SELECT DISTINCT T2.CO_PRODUCT_STEP " + " FROM T_CO_ITEM_PROJECT T "
                  + " LEFT JOIN T_CO_INDICATORR_PROJECT T2 "
                  + " ON T.CO_PROJECT_CODE = T2.CO_PROJECT_CODE " + " WHERE T.CO_ITEM_CODE = ? "
                  + " AND T2.CO_PRODUCT_STEP = ? AND T.DATA_AUTH=?";
            result = modelService.listDataSql(sql, new Object[] {modelCode, proStep,dataAuth});
            if (!(result == null) && !result.isEmpty())
            {
              // 所有项目是否都为已确认
              sql = "SELECT * FROM T_CO_ITEM_PROJECT T WHERE T.CO_ITEM_CODE=? AND T.CO_STATE='1' AND T.DATA_AUTH=? ";
              result = modelService.listDataSql(sql, new Object[] {modelCode,dataAuth});
              if (!(result == null) && !result.isEmpty())
              {
                mes = "指示单机种检查项目未都为已确认，是否放行?";
              }
              else
              {
                mes = "OK";
              }
            }
            else
            {
              mes = "工单下达阶别与指示单检查项目阶别不一致，是否放行?";
            }
          }
          else
          {
            mes = "机种未配置指示单检查项目，是否放行?";
          }
        }
        else
        {
          mes = "工单不存在";
        }
      }
      else
      {
        mes = "OK";
      }
    }
    catch (Exception e)
    {
      log.error("", e);
      throw new BussException(e);
    }
    return mes;
  }

  // 是否放行
  public String yOrnToRelease(ModelAction modelAction, ModelService modelService,
                              String projectId, boolean flag)
  {
    // 不放行 直接提示
    String mes = "";
    String sql = "";
    List<Map<String, Object>> result = null;
    try
    {
      if (flag == false)
      {
        mes = "工单不放行，无法下达";
      }
      else
      {
        sql = "SELECT * FROM T_PM_PROJECT_BASE T WHERE T.PROJECT_ID=?";
        result = modelService.listDataSql(sql, new Object[] {projectId});
        if (!(result == null) && !result.isEmpty())
        {
          String modelCode = StringUtils.toString(result.get(0).get("PRODUCT_MATERIAL"));

          TableDataMapExt tMap = new TableDataMapExt();
          tMap.setTableName("T_CO_RELEASE_INFO");
          String infoId = StringUtils.getUUID();
          CommMethod.addSysDefCol(tMap.getColMap(), modelAction.getUser());
          tMap.getColMap().put("ID", infoId);
          tMap.getColMap().put("CRI_MO_NUMBER", projectId);
          tMap.getColMap().put("CRI_MODEL_CODE", modelCode);
          tMap.getColMap().put("CRI_RELEASE_EMP", CommMethod.getSessionUser().getId());
          tMap.getColMap().put("CRI_RELEASE_TIME", DateUtil.getCurDate());
          modelService.save(tMap);
          mes = "OK";
        }
        else
        {
          mes = "工单不存在";
        }
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(e);
    }
    return mes;
  }

  // 制令单上线校验
  public String checkMoNumBfOnline(ModelAction modelAction, ModelService modelService, String moNum,String dataAuth)
  {
    String mes = "";
    String sql = "";
    List<Map<String, Object>> result = null;
    try
    {
      String sql4 = "select VR_VALUE from  T_SYS_PARAMETER_INI where VR_CLASS='SMT0013' AND DATA_AUTH=? ";

      List<Map> list3 = modelService.listDataSql(sql4,new Object[] {dataAuth});

      String vrValue = list3.get(0).get("VR_VALUE").toString();

      if (vrValue.equals("1"))
      {
        String indicatorSn = "";// 指示单号.
        sql = "SELECT T.PM_PROJECT_ID,T.PM_MODEL_CODE,T.PM_PRODUCT_STEP FROM T_PM_MO_BASE T WHERE T.PM_MO_NUMBER=? AND T.DATA_AUTH=? ";
        result = modelService.listDataSql(sql, new Object[] {moNum,dataAuth});
        String modelCode = StringUtils.toString(result.get(0).get("PM_MODEL_CODE"));
        String proStep = StringUtils.toString(result.get(0).get("PM_PRODUCT_STEP"));
        String projectId = StringUtils.toString(result.get(0).get("PM_PROJECT_ID"));
        // 是否放行
        sql = "SELECT T2.PM_MODEL_CODE " + " FROM T_CO_RELEASE_INFO T "
              + " LEFT JOIN T_PM_MO_BASE T2 " + " ON T.CRI_MO_NUMBER = T2.PM_PROJECT_ID AND T.DATA_AUTH=T2.DATA_AUTH "
              + " WHERE T2.PM_MO_NUMBER = ? AND T.DATA_AUTH=? ";
        result = modelService.listDataSql(sql, new Object[] {moNum,dataAuth});

        if (!(result == null) && !result.isEmpty())
        {
          mes = "OK";
          // 判断机种是否存在指示单 有新增制令单对应的指示单 没有过
          sql = "SELECT * FROM T_CO_INDICATORR T WHERE T.CO_MODEL_CODE=? AND T.CO_MO_NUMBER IS NULL AND T.DATA_AUTH=? ";
          result = modelService.listDataSql(sql, new Object[] {modelCode,dataAuth});
          if (!(result == null) && !result.isEmpty())
          {
            // 存在 新增指示单信息
            // /////////////////////////////////////////
            //String dataAuth = StringUtils.toString(result.get(0).get("DATA_AUTH"));
            indicatorSn = StringUtils.toString(result.get(0).get("CO_INDICATORR_SN"));// 指示单号
            TableDataMapExt tMap = new TableDataMapExt();
            tMap.setTableName("T_CO_INDICATORR_ONLINE");
            String infoId = StringUtils.getUUID();
            CommMethod.addSysDefCol(tMap.getColMap(), modelAction.getUser());
            tMap.getColMap().putAll(result.get(0));
            tMap.getColMap().put("CO_MO_NUMBER", moNum);
            tMap.getColMap().put("CO_INDICATORR_SN", indicatorSn);
            tMap.getColMap().put("ID", infoId);
            tMap.getColMap().put("CO_ONLINE_TIME", DateUtil.getCurDate());
            modelService.save(tMap);

            sql = "SELECT T2.* " + " FROM T_CO_INDICATORR T "
                  + " LEFT JOIN T_CO_INDICATORR_PROJECT_INFO T2 "
                  + " ON T.CO_INDICATORR_SN = T2.CO_INDICATORR_SN AND T.DATA_AUTH=T2.DATA_AUTH "
                  + " LEFT JOIN T_CO_INDICATORR_PROJECT T3 "
                  + " ON T2.CO_PROJECT_CODE = T3.CO_PROJECT_CODE AND T.DATA_AUTH=T3.DATA_AUTH " + " WHERE T.CO_MODEL_CODE = ? "
                  + " AND T.CO_MO_NUMBER IS NULL " + " AND T3.CO_PRODUCT_STEP = ? AND T.DATA_AUTH=?  ";
            result = modelService.listDataSql(sql, new Object[] {modelCode, proStep,dataAuth});
            if (!(result == null) && !result.isEmpty())
            {
              for (int i = 0; i < result.size(); i++ )
              {
                TableDataMapExt itemMap = new TableDataMapExt();
                itemMap.setTableName("T_CO_INDICATORR_ONLINEPRO_INFO");
                String infoId2 = StringUtils.getUUID();
                CommMethod.addSysDefCol(itemMap.getColMap(), modelAction.getUser());
                itemMap.getColMap().putAll(result.get(i));
                itemMap.getColMap().put("CO_INDICATORR_SN", indicatorSn);
                itemMap.getColMap().put("ID", infoId2);
                itemMap.getColMap().put("CO_INDICATORR_ID", infoId);
                modelService.save(itemMap);
              }
            }
          }
        }
        else
        {
          // 不存在在生产放行信息表 判断机种检查项目是否都为已确认
          sql = "SELECT * FROM T_CO_ITEM_PROJECT T WHERE T.CO_ITEM_CODE=? AND T.CO_STATE='1' AND T.DATA_AUTH=? ";
          result = modelService.listDataSql(sql, new Object[] {modelCode,dataAuth});
          if (!(result == null) && !result.isEmpty())
          {
            mes = "指示单机种检查项目未都为已确认，是否上线?";
          }
          else
          {
            mes = "OK";
            // 判断制令单是否存在指示单 没有新增制令单对应的指示单 有过
            sql = "SELECT * FROM T_CO_INDICATORR T WHERE T.CO_MO_NUMBER=?  AND T.CO_MO_NUMBER IS NULL AND T.DATA_AUTH=? ";
            result = modelService.listDataSql(sql, new Object[] {moNum,dataAuth});
            if (result == null || result.isEmpty())
            {
              // 不存在 新增指示单信息
              sql = "SELECT * FROM T_CO_INDICATORR T WHERE T.CO_MODEL_CODE=? AND T.DATA_AUTH=? ";
              result = modelService.listDataSql(sql, new Object[] {modelCode,dataAuth});
              if (!(result == null) && !result.isEmpty())
              {
                // 存在 新增指示单信息
                // /////////////////////////////////////////
                //String dataAuth = StringUtils.toString(result.get(0).get("DATA_AUTH"));
                indicatorSn = StringUtils.toString(result.get(0).get("CO_INDICATORR_SN"));// 指示单号
                TableDataMapExt tMap = new TableDataMapExt();
                tMap.setTableName("T_CO_INDICATORR_ONLINE");
                String infoId = StringUtils.getUUID();
                CommMethod.addSysDefCol(tMap.getColMap(), modelAction.getUser());
                tMap.getColMap().putAll(result.get(0));
                tMap.getColMap().put("CO_MO_NUMBER", moNum);
                tMap.getColMap().put("CO_INDICATORR_SN", indicatorSn);
                tMap.getColMap().put("ID", infoId);
                tMap.getColMap().put("CO_ONLINE_TIME", DateUtil.getCurDate());
                modelService.save(tMap);

                sql = "SELECT T2.* " + " FROM T_CO_INDICATORR T "
                      + " LEFT JOIN T_CO_INDICATORR_PROJECT_INFO T2  "
                      + " ON T.CO_INDICATORR_SN = T2.CO_INDICATORR_SN AND T.DATA_AUTH=T2.DATA_AUTH"
                      + " WHERE T.CO_MODEL_CODE = ?  AND T.CO_MO_NUMBER IS NULL AND T.DATA_AUTH=? ";
                result = modelService.listDataSql(sql, new Object[] {modelCode,dataAuth});
                if (!(result == null) && !result.isEmpty())
                {
                  for (int i = 0; i < result.size(); i++ )
                  {
                    TableDataMapExt itemMap = new TableDataMapExt();
                    itemMap.setTableName("T_CO_INDICATORR_ONLINEPRO_INFO");
                    String infoId2 = StringUtils.getUUID();
                    CommMethod.addSysDefCol(itemMap.getColMap(), modelAction.getUser());
                    itemMap.getColMap().putAll(result.get(i));
                    itemMap.getColMap().put("CO_INDICATORR_SN", indicatorSn);
                    itemMap.getColMap().put("ID", infoId2);
                    itemMap.getColMap().put("CO_INDICATORR_ID", infoId);
                    modelService.save(itemMap);
                  }
                }
              }
            }
            else
            {
              mes = "OK";
            }
          }
        }
      }
      else
      {
        mes = "OK";
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(e);
    }
    return mes;
  }

  @SuppressWarnings("unchecked")
  public String getIndicatorSn(String dataAuth, String prefix, String dispatchSn,
                               ModelService modelService)
  {
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3};
    int[] outplace = {4, 5};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(dataAuth);
    list.add(prefix);
    list.add(dispatchSn);
    outType.add("String");
    outType.add("String");
    pf.setClassName("P_C_GET_DOC_NO");// 生成检验单号
    pf.setInPlace(inPlace);// 存储过程中in
    pf.setOutPlace(outplace); // 存储过程中out
    pf.setValArgs(list);// 存储过程中输入的参数
    pf.setTotalLen(list.size() + outType.size());// 总个数
    pf.setOutValType(outType);// 输出的参数
    List<Object> relist = modelService.procComm(pf);// 接收返回值
    String res = (String)relist.get(0); // 结果
    return res;
  }
}