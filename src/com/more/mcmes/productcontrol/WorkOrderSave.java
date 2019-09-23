package com.more.mcmes.productcontrol;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import com.more.mes.smt.getsnhttp.service.GetSnService;

import java.util.ArrayList;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.FuncCode;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.morelean.mes.smt.indicator.service.IndicatorTableService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
/**
 * @Title
 * @description 工单新增-保存
 * @ClassName WorkOrderSave
 * @version 1.0 developer
 * @see WorkOrderSave
 */
public class WorkOrderSave implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // 获取封装的数据
    HttpServletRequest request = modelAction.getRequest();
    String cbItemCode = request.getParameter("paraMap0@0#PRODUCT_MATERIAL");// 机种
    String modelCodeVer = request.getParameter("paraMap0@0#PRODUCT_MATERIAL_VER");//机种版本号
    String custCode = request.getParameter("paraMap0@0#CUST_CODE");// 客户
    String pro = request.getParameter("paraMap0@0#PROJECT_ID");
    String pmPcb = "";
    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    String projectId = request.getParameter("paraMap0@0#PROJECT_ID");
    String areaSnId = request.getParameter("paraMap0@0#PRODUCT_LINE");// 线别id
    String PROLEPSIS_START_DATE = request.getParameter("paraMap0@0#PROLEPSIS_START_DATE");
    String PROLEPSIS_END_DATE = request.getParameter("paraMap0@0#PROLEPSIS_END_DATE");
    String pmOnOneselef = request.getParameter("ckval");// 获取是否自动新增制令单的标志
    String proStep = request.getParameter("paraMap0@0#PROJECT_STEP"); // 生产阶别
    String projectFlag = request.getParameter("flag"); //号段标志  
    String productConfigure = request.getParameter("paraMap0@0#PRODUCT_CONFIGURE");
    String productSnPrefix = request.getParameter("paraMap0@0#PRODUCT_SN_PREFIX");// 号段前缀
    //String productSnStart = request.getParameter("paraMap0@0#PRODUCT_SN_START"); // 号段起始
   // String productSnEnd = request.getParameter("paraMap0@0#PRODUCT_SN_END"); // 号段结束
    
    String[] CBD_SEQUENCE = request.getParameterValues("paraMap1@CBD_SEQUENCE");
    String[] CBD_ITEM_CODE = request.getParameterValues("paraMap1@CBD_ITEM_CODE");
    String[] CBD_UNITS = request.getParameterValues("paraMap1@CBD_UNITS");
    String[] CBD_POINT = request.getParameterValues("paraMap1@CBD_POINT");
    String[] CBD_ITEM_NUM = request.getParameterValues("paraMap1@CBD_ITEM_NUM");
    String[] CBD_ITEM_TYPE = request.getParameterValues("paraMap1@CBD_ITEM_TYPE");
    String tempType = null;
    String tempCode = null;
    String tempCode1 = null;
    int flags = 0;
    String PROJECT_OFONESELF;// 自动新增制令单
    // String a = pt.addPm();
    // System.out.println(a);
    
    if ("Y".equals(projectFlag))
    {
      projectFlag = "Y";
    }
    else
    {
      projectFlag = "N";
    }
    
    if (PROLEPSIS_START_DATE != null && PROLEPSIS_START_DATE.compareTo(PROLEPSIS_END_DATE) > 0)
    {
      return modelAction.alertInfoAddPic((modelAction.getText("预计开工日期不能大于预计完工日期")), "1");
    }

    String sql = "select id from T_PM_PROJECT_BASE where PROJECT_ID =? AND DATA_AUTH=? ";
    List list = modelService.listDataSql(sql, new Object[] {pro,dataAuth});
    if (list != null && list.size() > 0)
    {
      return modelAction.alertParentInfo((modelAction.getText("工单号已经存在")));
    }
    
    if ( null==CBD_ITEM_NUM ||CBD_ITEM_NUM.length==0 )
    {
      return modelAction.alertParentInfo((modelAction.getText("请新增工单BOM！")));
    }
    
    if ("Y".equals(pmOnOneselef))
    {
      for (int i = 0; i < CBD_ITEM_NUM.length; i++ )
      {
        tempType = CBD_ITEM_TYPE[i];
        if ("1".equals(tempType))
        {
          flags++ ;
          if (flags > 1)
          {
            return modelAction.alertInfoAddPic((modelAction.getText("类型为PCB的记录只能有一个")), "3");
          }
          else if (flags == 1)
          {
            pmPcb = CBD_ITEM_CODE[i];// 获取PCB
          }
        }
      }
    }
    for (int i = 0; i < CBD_ITEM_NUM.length; i++ )
    {
      tempCode = CBD_ITEM_CODE[i];
      if (cbItemCode.equals(tempCode))
      {
        return modelAction.alertParentInfo(modelAction.getText("机种料号" + cbItemCode + "和物料号"
                                                               + tempCode + "不能相同！"));
      }
      for (int j = i + 1; j < CBD_ITEM_NUM.length; j++ )
      {
        tempCode1 = CBD_ITEM_CODE[j];
        if (tempCode1.equals(tempCode))
        {
          return modelAction.alertParentInfo((modelAction.getText("工单BOM物料号不能相同！")));
        }
      }
    }
    if ("Y".equals(pmOnOneselef))
    {
      PROJECT_OFONESELF = "Y";
    }
    else
    {
      PROJECT_OFONESELF = "N";
    }
    boolean flag = false;
    //OperResult operResult = modelService.addComm(request, modelAction.getCurrUser(), modelAction);
    String CUST_CODE = request.getParameter("paraMap0@0#CUST_CODE");
    String PRODUCT_MATERIAL = request.getParameter("paraMap0@0#PRODUCT_MATERIAL");    
    String PROJECT_TYPE = request.getParameter("paraMap0@0#PROJECT_TYPE");
    //String proStep = request.getParameter("paraMap0@0#PROJECT_STEP"); // 生产阶别    
    String PRODUCT_COUNT = request.getParameter("paraMap0@0#PRODUCT_COUNT");
    String DESTROY_NO = request.getParameter("paraMap0@0#DESTROY_NO");
    String FAI_NUM = request.getParameter("paraMap0@0#FAI_NUM");
    //String PROLEPSIS_START_DATE = request.getParameter("paraMap0@0#PROLEPSIS_START_DATE");
    //String PROLEPSIS_END_DATE = request.getParameter("paraMap0@0#PROLEPSIS_END_DATE");
    String PRODUCT_PACK_SEQ = request.getParameter("paraMap1@0#PRODUCT_PACK_SEQ");
    //String PROJECT_FLAG = request.getParameter("paraMap0@0#PROJECT_FLAG");
    String PM_MEMO = request.getParameter("paraMap0@0#PM_MEMO");
    String ACTUAL_END_DATE = request.getParameter("paraMap0@0#ACTUAL_END_DATE");
    String ACTUAL_START_DATE = request.getParameter("paraMap0@0#ACTUAL_START_DATE");
    String TPPB_PLAN_DELIVERY_DATE = request.getParameter("paraMap0@0#TPPB_PLAN_DELIVERY_DATE");
    String PRODUCT_NAME = request.getParameter("paraMap0@0#PRODUCT_NAME");
    String PRODUCT_STANDARD = request.getParameter("paraMap0@0#PRODUCT_STANDARD");
    if ("Y".equals(PRODUCT_PACK_SEQ))
    {
      PRODUCT_PACK_SEQ = "Y";
    }
    else
    {
      PRODUCT_PACK_SEQ = "N";
    }
    if(!StringUtils.isBlank(productConfigure)){
      sql="SELECT CCD_ITEM_LEN FROM T_CO_SN_CONFIGURE_DETAIL WHERE CCD_CODE_SEGMENT=? AND CCD_CONFIGURE_ID=? AND data_Auth=?";
      //Map<String,String> map6 = 
      //  modelService.queryForMap(sql, new Object[] {"4",productSnPrefix,dataAuth});\
      List<Map> dataProList = modelService.listDataSql(sql, new Object[] {"4",productConfigure,dataAuth});
      //int b =PRODUCT_COUNT.length();
      String ccd_item_len = null;
      if(null!=dataProList && dataProList.size()>0) {
       ccd_item_len=dataProList.get(0).get("CCD_ITEM_LEN").toString();
      }
      int ccdItemLen =Integer.parseInt(ccd_item_len);
     
      if(ccdItemLen<PRODUCT_COUNT.length()){
        return modelAction.alertParentInfo((modelAction.getText("计划数量数量大于条码流水号长度")));
      }
      GetSnService gss= new GetSnService();
      String num = gss.getSnForWordOrder(dataAuth,productConfigure, productSnPrefix, PRODUCT_COUNT);
      
      String[] productSnS = num.split(",");
      int productSn=productSnS.length;
      TableDataMapExt dmap = new TableDataMapExt();
      dmap.setTableName("T_PM_PROJECT_SN");
      
      for (int i = 0; i < productSn; i++ )
      {
        dmap.getColMap().clear();
        CommMethod.addSysDefCol(dmap.getColMap(), modelAction.getUser());
        dmap.getColMap().put("PRODUCT_SN", productSnS[i]);
        dmap.getColMap().put("PROJECT_ID",projectId);
        modelService.save(dmap);
      }
    }
    
    
    
    TableDataMapExt tdmap = new TableDataMapExt();
    tdmap.setTableName("T_PM_PROJECT_BASE");
    CommMethod.addSysDefCol(tdmap.getColMap(), modelAction.getUser());
    Map map2 = tdmap.getColMap();
    map2.put("PROJECT_ID", projectId);
    map2.put("PRODUCT_LINE", areaSnId); 
    map2.put("CUST_CODE", CUST_CODE);
    map2.put("PRODUCT_MATERIAL", PRODUCT_MATERIAL);
    map2.put("PRODUCT_MATERIAL_VER", modelCodeVer);
    map2.put("PROJECT_TYPE", PROJECT_TYPE);
    map2.put("PROJECT_STEP", proStep);
    map2.put("PRODUCT_COUNT", Integer.valueOf(PRODUCT_COUNT));
    map2.put("DESTROY_NO", DESTROY_NO);
    map2.put("PROJECT_FLAG", projectFlag);
    if (StringUtils.isNotBlank(FAI_NUM))
    {
      map2.put("FAI_NUM", Integer.parseInt(FAI_NUM));   
    }
    
    map2.put("PROJECT_OFONESELF", pmOnOneselef);   
    map2.put("PRODUCT_NAME", PRODUCT_NAME);    
    map2.put("PRODUCT_STANDARD", PRODUCT_STANDARD);   
    map2.put("PROJECT_STATUS", "0");  
    map2.put("PROLEPSIS_START_DATE", DateUtil.parseDate(PROLEPSIS_START_DATE, "yyyy-MM-dd HH:mm:ss"));
    map2.put("PROLEPSIS_END_DATE", DateUtil.parseDate(PROLEPSIS_END_DATE, "yyyy-MM-dd HH:mm:ss"));   
    if (StringUtils.isNotBlank(TPPB_PLAN_DELIVERY_DATE))
    {
      map2.put("TPPB_PLAN_DELIVERY_DATE", DateUtil.parseDate(TPPB_PLAN_DELIVERY_DATE, "yyyy-MM-dd HH:mm:ss"));
    }
    
    map2.put("PRODUCT_PACK_SEQ", PRODUCT_PACK_SEQ);
    //map2.put("PROJECT_FLAG", PROJECT_FLAG);
    map2.put("PM_MEMO", PM_MEMO);
    if (StringUtils.isNotBlank(ACTUAL_END_DATE))
    {
      map2.put("ACTUAL_END_DATE", DateUtil.parseDate(ACTUAL_END_DATE, "yyyy-MM-dd HH:mm:ss"));
    }
    if (StringUtils.isNotBlank(ACTUAL_START_DATE))
    {
      map2.put("ACTUAL_START_DATE", DateUtil.parseDate(ACTUAL_START_DATE, "yyyy-MM-dd HH:mm:ss"));
    }
   
    map2.put("PRODUCT_CONFIGURE", productConfigure);
    map2.put("PRODUCT_SN_PREFIX", productSnPrefix);
  //  map2.put("PRODUCT_SN_END", productSnEnd);       
    if (StringUtils.isNotBlank(dataAuth))
    {
      map2.put("DATA_AUTH", dataAuth);
    }
    int res = modelService.save(tdmap);
 
  
    
    
    TableDataMapExt maps = new TableDataMapExt();
    maps.setTableName("T_PM_PROJECT_DETAIL");
   
    for (int i = 0; i < CBD_ITEM_TYPE.length; i++ )
    {
      maps.getColMap().clear();
      CommMethod.addSysDefCol(maps.getColMap(), modelAction.getUser());
      maps.getColMap().put("CBD_SEQUENCE", Integer.parseInt(CBD_SEQUENCE[i]));
      maps.getColMap().put("CBD_ITEM_CODE", CBD_ITEM_CODE[i]);
      maps.getColMap().put("CBD_UNITS", CBD_UNITS[i]);
      maps.getColMap().put("CBD_POINT", CBD_POINT[i]);
      maps.getColMap().put("CBD_ITEM_NUM", Integer.parseInt(CBD_ITEM_NUM[i]));
      maps.getColMap().put("CBD_ITEM_TYPE", CBD_ITEM_TYPE[i]);
      maps.getColMap().put("PROJECT_ID",projectId);
      modelService.save(maps);
    }
   
    
    if (!StringUtils.isBlank(productConfigure)) {
             
            } else {
              String sql0 = "DELETE FROM T_PM_PROJECT_SN WHERE PROJECT_ID=(SELECT PROJECT_ID FROM T_PM_PROJECT_BASE WHERE ID=? AND DATA_AUTH=? ) AND DATA_AUTH=? ";
              modelService.execSql(sql0, new Object[] { projectId,dataAuth,dataAuth });
            }  
    
    
    if (res<0)
    {
      return modelAction.alertParentInfo("新增失败");
    }else
    {
      flag = true;
      if ("Y".equals(pmOnOneselef))
      {
        // 20180531 工单自动下达校验生产指示单
        IndicatorTableService idService = new IndicatorTableService();
        String mes = idService.checkMoNum(dataAuth,modelAction, modelService, pro, proStep);
        if (!"OK".equals(mes))
        {
          int len = mes.length();
          mes = mes.substring(0, len - 5) + "请手动下达";
          return modelAction.alertParentInfo((modelAction.getText(mes)));
        }
        else
        {
          flag = true;
        }
      }
      // return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
    }
    int count;
    if ("Y".equals(pmOnOneselef))
    {
      if (!proStep.equals("1"))
      {

        setadd(request, modelAction, modelService, cbItemCode, pro, custCode, pmPcb, dataAuth, "0");
      }
      else
      {

        String sqlFace = "select t.CM_PROCESS_FACE FROM T_CO_MATERIAL_TABLE t where t.CM_MODEL_CODE=? and t.CM_STAUS=? AND T.DATA_AUTH=? ";
        // Map map4 = modelService.queryForMap(sqlFace, new Object[]{cbItemCode});

        List<Map> arrList = modelService.listDataSql(sqlFace, new Object[] {cbItemCode, "Y",dataAuth});

        String face = null;
        String pmFace;
        int single = 0;// 单面
        int just = 0;// 正反面
        int shade = 0;// 阴阳面
        if (null != arrList && arrList.size() > 0)
        {
          int listSize = arrList.size();
          for (int i = 0; i < listSize; i++ )
          {
            if (StringUtils.isBlank(arrList.get(i).get("CM_PROCESS_FACE")))
            {
              face = "";
            }
            else
            {
              face = arrList.get(i).get("CM_PROCESS_FACE").toString();
            }
            if (face.equals("1") || face.equals("2"))
            {
              just++ ;
            }
            if (face.equals("0"))
            {
              single++ ;
            }
            if (face.equals("3"))
            {
              shade++ ;
            }
          }
        }

        if (just > 0)
        {
          pmFace = "1";
          setadd(request, modelAction, modelService, cbItemCode, pro, custCode, pmPcb, dataAuth,
            pmFace);
          pmFace = "2";
          setadd(request, modelAction, modelService, cbItemCode, pro, custCode, pmPcb, dataAuth,
            pmFace);
        }
        else if (shade > 0)
        {
          pmFace = "3";
          setadd(request, modelAction, modelService, cbItemCode, pro, custCode, pmPcb, dataAuth,
            pmFace);
        }
        else
        {
          pmFace = "0";
          setadd(request, modelAction, modelService, cbItemCode, pro, custCode, pmPcb, dataAuth,
            pmFace);
        }

        /*
         * if (face.equals("0")) { pmFace="0"; setadd(request, modelAction, modelService,
         * cbItemCode, pro, custCode, pmPcb, dataAuth,pmFace); }else if (face.equals("3")){
         * pmFace="3"; setadd(request, modelAction, modelService, cbItemCode, pro, custCode, pmPcb,
         * dataAuth,pmFace); }else { pmFace=""; setadd(request, modelAction, modelService,
         * cbItemCode, pro, custCode, pmPcb, dataAuth,pmFace); }
         */
      }

    }
    // request.setAttribute("isDataAuth",modelAction.getIsDataAuth());
     
     
    
    
     
      
    if (flag == true)
    {
      return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
    }
    else
    {
      return modelAction.alertParentInfo("新增失败");
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

  @SuppressWarnings({"unchecked", "rawtypes"})
  public void setadd(ServletRequest request, ModelAction modelAction, ModelService modelService,
                     String cbItemCode, String pro, String custCode, String pmPcb,
                     String dataAuth, String pmFace)
  {

    // 勾选自动下达制令单(勿删！)
    String modelCodeVer = request.getParameter("paraMap0@0#PRODUCT_MATERIAL_VER");//机种版本号
    String pmScheduleDate = request.getParameter("paraMap0@0#PROLEPSIS_START_DATE");// 预计开工时间
    String pmDueDate = request.getParameter("paraMap0@0#PROLEPSIS_END_DATE");// 预计关结时间
    String targetQty = request.getParameter("paraMap0@0#PRODUCT_COUNT").equals("")?"0":request.getParameter("paraMap0@0#PRODUCT_COUNT");// 计划数量
    String areaSnId = request.getParameter("paraMap0@0#PRODUCT_LINE");// 线别id
    String pmMemo = request.getParameter("paraMap0@0#PM_MEMO");// 备注
    String proStep = request.getParameter("paraMap0@0#PROJECT_STEP"); // 生产阶别
    //String productSnPrefix = request.getParameter("paraMap0@0#PRODUCT_CONFIGURE"); // 生产阶别
    //String productSnStart = request.getParameter("paraMap0@0#PRODUCT_SN_START"); // 生产阶别
    //String productSnEnd = request.getParameter("paraMap0@0#PRODUCT_SN_END"); // 生产阶别

    String sql = " select * from T_CO_AREA where  CA_ID =? and CA_TYPE=? and CA_PROJECT_STEP=? AND DATA_AUTH=? ";
    
    int count = modelService.countSql(sql, new Object[]{areaSnId,"1",proStep,dataAuth});
    
    if (count<1)
    {
     throw new BussException(CommMethod.getText("线别生产阶别与生产阶别不同"));
     // return modelAction.alertParentInfo((modelAction.getText("线别生产阶别与生产阶别不同")));
    }
    
    // if(areaSnId!=null && !"".equals(areaSnId)){
    // String sqlArea = "select ca_id from t_co_area where id = ?";
    // Map<Object,Object> areaMap = modelService.queryForMap(sqlArea, new Object[]{areaSnId});
    // areaSn = (String)areaMap.get("CA_ID");
    // }

    String sqlProId = "select a.pm_project_id from t_pm_mo_base a where a.pm_project_id = ? AND A.DATA_AUTH=? ";
    List<Map> dataProList = modelService.listDataSql(sqlProId, new Object[] {pro,dataAuth});
    String no = "01";
    if (dataProList == null || dataProList.size() > 0)
    {
      int k = dataProList.size() + 1;
      if (k < 10) no = "0" + k;
    }

    String nos;

    if (pmFace.equals("2"))
    {
      // var step = "-0"+obj.value+"-";
      nos = "2";

    }
    else
    {
      nos = "1";
    }
    String pmMoNumber = pro + "-0" + proStep + nos + "-" + no;// 生成制令单号
    String sqlItem = "select t.* from T_CO_ITEM t where t.ci_item_code = ? AND T.DATA_AUTH=? ";
    String sqlMoBase = "select t.*,t1.cic_item_code from T_CO_ITEM_GROUP t "
                        + "left join T_CO_ITEM_CONNECT t1 on t1.CIG_SN = t.CIG_SN "
                        + "where t1.cic_item_code = ? AND T.DATA_AUTH=? AND T1.DATA_AUTH=? ";
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
    
    sql=" select CTM_ID from T_CO_TECH_MODEL where CTM_PROCESS_FACE=? and CTM_PRODUCT_STEP=? and CTM_MODEL_CODE=? AND DATA_AUTH=? ";
    
    
    List<Map> list = modelService.listDataSql(sql, new Object[]{pmFace,proStep,cbItemCode,dataAuth});
    
    if (null==list || list.size()==0)
    {
      /*
      sql = "select t6.CIG_TEC_ID as CTM_ID from T_CO_ITEM_GROUP  T6"+
        " left join T_CO_ITEM_CONNECT t7 "+
        " on t7.CIG_SN=t6.CIG_SN"+
        " where t6.CIG_TYPE=? and t6.CIG_PROCESS_FACE=? and t7.CIC_ITEM_CODE=?";
         list = modelService.listDataSql(sql, new Object[]{"2",PM_PROCESS_FACE,PM_MODEL_CODE});
      */
      sql=" select CT_ID as CTM_ID from T_CO_TECHNICS where CT_PROCESS_FACE=? and CT_PRODUCT_STEP=? and CT_DEFAULT_FLAG=? AND DATA_AUTH=? ";
           
      list = modelService.listDataSql(sql, new Object[]{pmFace,proStep,"Y",dataAuth});
    }
    if (null==list || list.size()==0)
    {
      //throw new BussException(FuncCode.MS100_0001_002 + CommMethod.getText("线别生产阶别与生产阶别不同"));
      throw new BussException(CommMethod.getText("未设置工艺"));
     
    }
    
    /*
     sql = "select t6.CIG_TEC_ID from T_CO_ITEM_GROUP  T6"+
           " left join T_CO_ITEM_CONNECT t7 "+
           " on t7.CIG_SN=t6.CIG_SN"+
           " where t6.CIG_TYPE=? and t6.CIG_PROCESS_FACE=? and t7.CIC_ITEM_CODE=?";
    
     list = modelService.listDataSql(sql, new Object[]{"2",pmFace,cbItemCode});
    */
    
    
    
    
    List<Map> dataList0 = modelService.listDataSql(sqlItem, new Object[] {cbItemCode,dataAuth});
    List<Map> dataList = modelService.listDataSql(sqlMoBase, new Object[] {cbItemCode,dataAuth,dataAuth});
    TableDataMapExt tdmap = new TableDataMapExt();
    CommMethod.addSysDefCol(tdmap.getColMap(), modelAction.getUser());
    Map map2 = tdmap.getColMap();
    map2.put("PM_PROJECT_ID", pro);
    map2.put("PM_MO_NUMBER", pmMoNumber);
    if (null!=list && list.size()>0)
    {
      map2.put("PM_TECH_SN", list.get(0).get("CTM_ID"));
    }
    map2.put("PM_CUST_CODE", custCode);
    map2.put("PM_SCHEDULE_DATE", DateUtil.parseDate(pmScheduleDate, "yyyy-MM-dd HH:mm:ss"));
    map2.put("PM_DUE_DATE", DateUtil.parseDate(pmDueDate, "yyyy-MM-dd HH:mm:ss"));
    map2.put("PM_TARGET_QTY", Integer.parseInt(targetQty));
    map2.put("PM_AREA_SN", areaSnId);
    map2.put("PM_PROCESS_FACE", "");
    map2.put("PM_ISSUED_DATE", DateUtil.parseDate(DateUtil.getCurDateStr(), "yyyy-MM-dd HH:mm:ss"));
    map2.put("PM_ISSUED_EMP", CommMethod.getSessionUser().getId());
    map2.put("PM_MEMO", pmMemo);
    map2.put("PM_STATUS", 0);
    map2.put("ID", StringUtils.getUUID());
    map2.put("PM_MODEL_CODE", cbItemCode);
    map2.put("PM_MODEL_CODE_VER", modelCodeVer);
    map2.put("PM_PRODUCT_STEP", proStep);
    map2.put("PM_PCB_CODE", pmPcb);// PM_PCB_CODE
    map2.put("PM_PROCESS_FACE", pmFace);// 面别   
    // this.getSqlValue(dataList0, dataList, "CI_SN_RULE_B", "CIG_SN_RULE_B", "PM_SN_RULE");
    map2.put("PM_UNIT_NUM",
      Integer.valueOf(String.valueOf(this.getSqlValue(dataList0, dataList, "CI_LINK_NUM", "CIG_LINK_NUM", "PM_UNIT_NUM"))));// 联板数
    map2.put("PM_JIGSAW_NUM",
      Integer.valueOf(String.valueOf(this.getSqlValue(dataList0, dataList, "CI_JIGSAW_NUM", "CIG_SN_NUM", "PM_JIGSAW_NUM"))));// 条码拼板数
    // map2.put("PM_SN_RULE", this.getSqlValue(dataList0, dataList, "CI_SN_RULE_B",
    // "CIG_SN_RULE_B", "PM_SN_RULE"));//产品条码规则
    // map2.put("PM_SUB_RULE", this.getSqlValue(dataList0, dataList, "CI_SN_RULE_S",
    // "CIG_SN_RULE_S", "PM_SUB_RULE"));//小板条码规则
    map2.put("PM_REPAIR_MAX",
      Integer.valueOf(String.valueOf(this.getSqlValue(dataList0, dataList, "CI_REPAIR_MAX", "CIG_REPAIR_MAX", "PM_REPAIR_MAX"))));// 维修上限次数
    map2.put("PM_ERROR_SCRAP",
      this.getSqlValue(dataList0, dataList, "CI_SCRAP_FLAG", "CIG_REJ_FLAG", "PM_ERROR_SCRAP"));// 不良报废
    map2.put("PM_AUTO_FQC",
      this.getSqlValue(dataList0, dataList, "CI_AUTO_FQC", "CIG_AUTO_FQC", "PM_AUTO_FQC"));// FQC自动送检(Y/N)
    map2.put("PM_FQC_NUM",
      Integer.valueOf(String.valueOf(this.getSqlValue(dataList0, dataList, "CI_FQC_QTY", "CIG_FQC_NUM", "PM_FQC_NUM"))));// 送检批量
    map2.put("PM_CONTROL_TYPE", String.valueOf(this.getSqlValue(dataList0, dataList, "CI_CONTRAL_TYPE",
      "CIG_CONTRAL_TYPE", "PM_CONTROL_TYPE")).equals("")?null:Integer.valueOf(String.valueOf(this.getSqlValue(dataList0, dataList, "CI_CONTRAL_TYPE",
      "CIG_CONTRAL_TYPE", "PM_CONTROL_TYPE"))));// 管控类型
    // map2.put("PM_TRANSFER_RULE", transferRuleId);
    if (dataAuth != null && !dataAuth.equals(""))
    {
      map2.put("DATA_AUTH", dataAuth);
    }

    tdmap.setTableName("T_PM_MO_BASE");
    int res = modelService.save(tdmap);
    if (res < 1)
    {
      throw new BussException(FuncCode.MS100_0001_002 + CommMethod.getText("自动下达失败"));
    }
     
    
      
     
  }
  
  
    //生成工单号段
  @SuppressWarnings("unchecked")
  public String SaveProductSn(String dataAuth,ModelService modelService, String project_id, String mo_number, String sn_start,
                              String sn_end, String sn_prefix, String user_id) {
      ProFuncDto pf = new ProFuncDto();
      int[] inPlace = {1, 2, 3, 4, 5, 6,7};
      int[] outplace = {8};
      List<Object> list = new ArrayList<Object>();
      List<Object> outType = new ArrayList<Object>();
      list.add(dataAuth);
      list.add(project_id);
      list.add(mo_number);
      list.add(sn_start);
      list.add(sn_end);
      list.add(sn_prefix);
      list.add(user_id);
      outType.add("String");
      pf.setClassName("P_MES_SAVE_PRODUCT_SN");
      pf.setInPlace(inPlace);// 存储过程中in
      pf.setOutPlace(outplace); // 存储过程中out
      pf.setTotalLen(8);// 总个数
      pf.setValArgs(list);// 存储过程中输入的参数
      pf.setOutValType(outType);// 输出的参数
      List<Object> relist = modelService.procComm(pf);// 接收返回值
      String res = (String) relist.get(0); // 结果
      return res;
  }
}
