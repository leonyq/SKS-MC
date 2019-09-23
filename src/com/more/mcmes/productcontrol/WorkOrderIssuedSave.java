package com.more.mcmes.productcontrol;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.ss.formula.functions.Count;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.FuncCode;
import com.more.fw.core.dbo.model.dto.Smap;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Title 工单下达-保存
 * @Description 工单下达-保存
 * @ClassName WorkOrderIssuedSave
 * @author hys
 * @version 1.0 developer 2017-8-7 created
 * @see WorkOrderIssuedSave
 * @since 2017-8-7
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class WorkOrderIssuedSave implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings({"unused", "rawtypes", "unchecked"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();

    Smap paraMapObj = modelAction.getParaMapObj();
    String PROJECT_ID = request.getParameter("paraMapObj.PROJECT_ID");
    String PM_MO_NUMBER = request.getParameter("paraMapObj.PM_MO_NUMBER");
    String PM_SCHEDULE_DATE = request.getParameter("paraMapObj.PROLEPSIS_START_DATE");// 预计开工时间
    String PM_DUE_DATE = request.getParameter("paraMapObj.PROLEPSIS_END_DATE");// 预计完工时间
    String PM_TARGET_QTY = request.getParameter("paraMapObj.PM_TARGET_QTY");
    String PM_AREA_SN = request.getParameter("paraMapObj.PRODUCT_LINE");
    String PM_PROCESS_FACE = request.getParameter("paraMapObj.PM_PROCESS_FACE");// 获取加工面
    String custCode = request.getParameter("paraMapObj.CUST_CODE");
    String PM_ISSUED_DATE = request.getParameter("paraMapObj.PM_ISSUED_DATE");
    String PM_ISSUED_EMP = request.getParameter("paraMapObj.PM_ISSUED_EMP");
    String PM_MEMO = request.getParameter("paraMapObj.PM_MEMO");
    String maxMonumber = request.getParameter("maxMonumber");// 工单新增时的数量
    String PM_MODEL_CODE = request.getParameter("paraMapObj.PRODUCT_MATERIAL");// 机种 00000
    String PM_MODEL_CODE_VER = request.getParameter("paraMapObj.PRODUCT_MATERIAL_VER");// 机种 版本号
    String PROJECT_STEP = request.getParameter("paraMapObj.PROJECT_STEP");// 生产阶别
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));

    // String PM_PROCESS_FACE = request.getParameter("paraMapObj.PM_PROCESS_FACE");//获取加工面

    if (new BigDecimal(PM_TARGET_QTY).compareTo(new BigDecimal(maxMonumber)) > 0)
    {
      return modelAction.alertParentInfo((modelAction.getText("计划数量不能大于") + maxMonumber));
    }
    if (PM_SCHEDULE_DATE != null && PM_SCHEDULE_DATE.compareTo(PM_DUE_DATE) > 0)
    {
      return modelAction.alertParentInfo((modelAction.getText("预计开工时间不能大于预计完工时间")));

    }
    String sql = " select * from T_CO_AREA where  CA_ID =? and CA_TYPE=? and CA_PROJECT_STEP=? and data_auth=? ";
    
    int count = modelService.countSql(sql, new Object[]{PM_AREA_SN,"1",PROJECT_STEP,dataAuth});
    
    if (count<1)
    {
      //throw new BussException(FuncCode.MS100_0001_002 + CommMethod.getText("线别生产阶别与生产阶别不同"));
      return modelAction.alertParentInfo((modelAction.getText("线别生产阶别与生产阶别不同")));
    }

    String sqlItem = "select t.* from T_CO_ITEM t where t.ci_item_code = ? and t.data_auth=? ";// 先去物料信息表里面取
     sql = "select t.*,t1.cic_item_code from T_CO_ITEM_GROUP t left join T_CO_ITEM_CONNECT t1 on t1.CIG_SN = t.CIG_SN "
       + "where t1.cic_item_code = ? and t1.data_auth=? and t.data_auth=? ";
    List<Map> dataList = modelService.listDataSql(sql, new Object[] {PM_MODEL_CODE,dataAuth,dataAuth});
    List<Map> dataList0 = modelService.listDataSql(sqlItem, new Object[] {PM_MODEL_CODE,dataAuth});
    String sqlTransferRule = "select id from T_CO_BARCODE_ROUL where TBR_TYPE = '6' AND TBR_DEFAULT='Y' AND DATA_AUTH=? ";// 查找中转条码规则字段的id
    List<Map> transferRuleList = modelService.listDataSql(sqlTransferRule,new Object[] {dataAuth});
    String transferRuleId = null;
    if (transferRuleList == null || transferRuleList.isEmpty())
    {
      transferRuleId = "";
    }
    else
    {
      Map<String, String> transferRuleMap = transferRuleList.get(0);// 中转条码规则只有一条
      transferRuleId = transferRuleMap.get("id");
    }
    sql = "select PM_MO_NUMBER,pm_project_id,PM_TARGET_QTY,PM_STATUS,PM_PRODUCT_STEP"
          + " from t_pm_mo_base a where a.pm_project_id = ? AND A.DATA_AUTH=? ";

    List<Map> numList = modelService.listDataSql(sql, new Object[] {PROJECT_ID,dataAuth});// 工单下的制令单

    String no = "01";
    String subPm = "";
    String[] sub;
    int noe;
    int MaxCount = 0;
    int nowCount = 0;
    Map<String, String> mapPm = new HashMap<String, String>();
    if (numList != null && !numList.isEmpty())
    {
      for (int i = 0; i < numList.size(); i++ )
      {
        mapPm = numList.get(i);
        subPm = mapPm.get("PM_MO_NUMBER");
        sub = subPm.split("-");

        noe = sub.length - 1;
        subPm = sub[noe];// 取流水号
        nowCount = Integer.parseInt(subPm);
        if (nowCount > MaxCount)
        {
          MaxCount = nowCount;
        }
      }
      no = "0" + (MaxCount + 1);
    }
    String tail;
    String nos;

    if (PM_PROCESS_FACE.equals("2"))
    {
      // var step = "-0"+obj.value+"-";
      nos = "2";

    }
    else
    {
      nos = "1";
    }
    tail = PROJECT_ID + "-" + "0" + PROJECT_STEP + nos + "-" + no;
    
    sql=" select CTM_ID from T_CO_TECH_MODEL where CTM_PROCESS_FACE=? and CTM_PRODUCT_STEP=? and CTM_MODEL_CODE=? AND DATA_AUTH=? ";
    
    
    List<Map> list = modelService.listDataSql(sql, new Object[]{PM_PROCESS_FACE,PROJECT_STEP,PM_MODEL_CODE,dataAuth});
    
    if (null==list || list.size()==0)
    {
      /*
      sql = "select t6.CIG_TEC_ID as CTM_ID from T_CO_ITEM_GROUP  T6"+
        " left join T_CO_ITEM_CONNECT t7 "+
        " on t7.CIG_SN=t6.CIG_SN"+
        " where t6.CIG_TYPE=? and t6.CIG_PROCESS_FACE=? and t7.CIC_ITEM_CODE=?";
         list = modelService.listDataSql(sql, new Object[]{"2",PM_PROCESS_FACE,PM_MODEL_CODE});
      */
      sql=" select CT_ID AS CTM_ID from T_CO_TECHNICS where CT_PROCESS_FACE=? and CT_PRODUCT_STEP=? and CT_DEFAULT_FLAG=? AND DATA_AUTH=? ";
           
      list = modelService.listDataSql(sql, new Object[]{PM_PROCESS_FACE,PROJECT_STEP,"Y",dataAuth});
    }
     if (null==list || list.size()==0)
    {
      //throw new BussException(FuncCode.MS100_0001_002 + CommMethod.getText("线别生产阶别与生产阶别不同"));
      return modelAction.alertParentInfo((modelAction.getText("未设置工艺")));
    }
    
   

    TableDataMapExt tdmap = new TableDataMapExt();
    CommMethod.addSysDefCol(tdmap.getColMap(), modelAction.getUser());
    Map map = tdmap.getColMap();
    map.put("PM_PROJECT_ID", PROJECT_ID);
    if (null!=list && list.size()>0)
    {
      map.put("PM_TECH_SN", list.get(0).get("CTM_ID"));
    }
    map.put("PM_MO_NUMBER", tail);
    map.put("PM_CUST_CODE", custCode);
    map.put("PM_SCHEDULE_DATE", DateUtil.parseDate(PM_SCHEDULE_DATE, "yyyy-MM-dd HH:mm:ss"));
    map.put("PM_DUE_DATE", DateUtil.parseDate(PM_DUE_DATE, "yyyy-MM-dd HH:mm:ss"));
    map.put("PM_TARGET_QTY", Integer.valueOf(PM_TARGET_QTY));
    map.put("PM_AREA_SN", PM_AREA_SN);
    map.put("PM_PROCESS_FACE", PM_PROCESS_FACE);
    map.put("PM_ISSUED_DATE", DateUtil.parseDate(PM_ISSUED_DATE, "yyyy-MM-dd HH:mm:ss"));
    map.put("PM_ISSUED_EMP", PM_ISSUED_EMP);
    map.put("PM_MEMO", PM_MEMO);
    map.put("PM_STATUS", 0);
    map.put("ID", StringUtils.getUUID());
    map.put("PM_MODEL_CODE", PM_MODEL_CODE);
    map.put("PM_MODEL_CODE_VER",PM_MODEL_CODE_VER);//机种版本号
    map.put("PM_PRODUCT_STEP", PROJECT_STEP);
    map.put("PM_UNIT_NUM",
      Integer.valueOf(String.valueOf(this.getSqlValue(dataList0, dataList, "CI_LINK_NUM", "CIG_LINK_NUM", "PM_UNIT_NUM"))));// 联板数
    map.put("PM_JIGSAW_NUM",
    		Integer.valueOf(String.valueOf(this.getSqlValue(dataList0, dataList, "CI_JIGSAW_NUM", "CIG_SN_NUM", "PM_JIGSAW_NUM"))));// 条码拼板数
    map.put("PM_SN_RULE",
      this.getSqlValue(dataList0, dataList, "CI_SN_RULE_B", "CIG_SN_RULE_B", "PM_SN_RULE"));// 产品条码规则
    map.put("PM_SUB_RULE",
      this.getSqlValue(dataList0, dataList, "CI_SN_RULE_S", "CIG_SN_RULE_S", "PM_SUB_RULE"));// 小板条码规则
    map.put("PM_REPAIR_MAX",
      Integer.valueOf(String.valueOf(this.getSqlValue(dataList0, dataList, "CI_REPAIR_MAX", "CIG_REPAIR_MAX", "PM_REPAIR_MAX"))));// 维修上限次数
    map.put("PM_ERROR_SCRAP",
      this.getSqlValue(dataList0, dataList, "CI_SCRAP_FLAG", "CIG_REJ_FLAG", "PM_ERROR_SCRAP"));// 不良报废
    map.put("PM_AUTO_FQC",
      this.getSqlValue(dataList0, dataList, "CI_AUTO_FQC", "CIG_AUTO_FQC", "PM_AUTO_FQC"));// FQC自动送检(Y/N)
    map.put("PM_FQC_NUM",
      Integer.valueOf(String.valueOf(this.getSqlValue(dataList0, dataList, "CI_FQC_QTY", "CIG_FQC_NUM", "PM_FQC_NUM"))));// 送检批量
    map.put("PM_CONTROL_TYPE",Integer.valueOf(String.valueOf( this.getSqlValue(dataList0, dataList, "CI_CONTRAL_TYPE",
    	      "CIG_CONTRAL_TYPE", "PM_CONTROL_TYPE"))));// 管控类型
    // map.put("PM_TRANSFER_RULE", transferRuleId);
    if (dataAuth != null && !dataAuth.equals(""))
    {
      map.put("DATA_AUTH", dataAuth);// 数据权限
    }

    sql = "select t.CBD_ITEM_CODE from T_PM_PROJECT_DETAIL t where t.project_id=? and t.cbd_item_type='1' AND T.DATA_AUTH=? ";
    List<Map> slist = modelService.listDataSql(sql, new Object[] {PROJECT_ID,dataAuth});
    if (slist != null && !slist.isEmpty())
    {
      map.put("PM_PCB_CODE", slist.get(0).get("CBD_ITEM_CODE"));// PCB料号
    }
    tdmap.setTableName("T_PM_MO_BASE");
    int res = modelService.save(tdmap);
    if (res < 1)
    {
      throw new BussException(FuncCode.MS100_0001_002 + CommMethod.getText("新增失败"));
    }
    String definedMsg = modelAction.getDefinedMsg();
    if (StringUtils.isNotBlank(definedMsg))
    {
      return modelAction.ajaxTablereloadParent(modelAction.getText(definedMsg));
    }
    else
    {
      return modelAction.ajaxTablereloadParent(modelAction.getText("保存成功"));
    }

  }

  // 校验 ：若是物料表没信息，取物料组的信息；若是物料组也没信息，则默认。
  public Object getSqlValue(List<Map> dataList0, List<Map> dataList, String str0, String str1,
                            String str2)
  {
    Object value = null;
    Map dataMap = new HashMap();
    if (dataList0 != null && !dataList0.isEmpty())
    {
      dataMap = dataList0.get(0);
      value = dataMap.get(str0);
      if ("".equals(value) || "null".equals(value) || value == null)
      {
        if (dataList != null && !dataList.isEmpty())
        {
          dataMap = dataList.get(0);
          value = dataMap.get(str1);
          if ("".equals(value) || "null".equals(value) || value == null)
          {
            value = this.setSqlValue(str2);
          }
        }
        else
        {
          value = this.setSqlValue(str2);
        }
      }

    }
    else
    {
      value = this.setSqlValue(str2);
    }
    return value;
  }

  public String setSqlValue(String str)
  {
    String value = null;
    if ("PM_UNIT_NUM".equals(str) || "PM_JIGSAW_NUM".equals(str) || "PM_CONTROL_TYPE".equals(str))
    {
      value = "1";
    }
    else if ("PM_REPAIR_MAX".equals(str) || "PM_FQC_NUM".equals(str))
    {
      value = "0";
    }
    else
    {
      value = "";
    }
    return value;
  }
}