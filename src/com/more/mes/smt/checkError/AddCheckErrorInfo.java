package com.more.mes.smt.checkError;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
 * 保存新增的检验不良处理信息
 * 
 * @author development
 */
public class AddCheckErrorInfo implements FuncService
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
    String tempStr="";
    String tempStr2="";
    tempStr2=dataAuth;
    try
    {
      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String qieSn = request.getParameter("paraMap1@0#QIE_SN");// 物料/产品SN
      String sql1 = "select t.QIE_SN from T_QM_INSEPCT_ERROR_INFO t where t.QIE_SN=? and t.data_auth =?";
      List tempList = modelService.listDataSql(sql1, new Object[] {qieSn,dataAuth});
      if (!tempList.isEmpty() && tempList != null)
      {
        return modelAction.alertParentInfo(modelAction.getText("该SN已处理"));
      }
      String inspectSn = request.getParameter("INSPECT_SN");// 检验单号
      String testStep = request.getParameter("TEST_STEP");// 检测阶别
      String itemCode = request.getParameter("ITEM_CODE");// 物料料号
      String handleType = request.getParameter("HANDLE_TYPE");// 处理方式
      String docNum = request.getParameter("DOC_NUM");// 关联单号
      String qieMemo = request.getParameter("paraMap1@0#QIE_MEMO");// 维修内容
      String[] errorCodes = request.getParameterValues("ERROR_CODE");// 不良代码
      String[] errorNames = request.getParameterValues("ERROR_NAME");// 不良名称
      String[] errorGrades = request.getParameterValues("ERROR_GRADE");// 缺陷等级
      String qieReplaceSn = null;// 替换SN
      if (handleType.equals("2"))
      { // 处理方式为替换
        qieReplaceSn = request.getParameter("paraMap1@0#QIE_REPLACE_SN").trim();// 替换SN
        tempStr=qieReplaceSn;
        if (qieReplaceSn.equals(qieSn))
        {
          return modelAction.alertParentInfo(modelAction.getText("不允许输入相同的SN进行替换"));
        }
        // 判断sn是否存在
        List tempList2 = null;
        List tempList3 = null;
        String querySql = "select t.* from T_WMS_STOCK_INFO t WHERE t.wsi_item_sn=?  and t.data_auth =? ";
        String querySql1 = "select t.* from t_wip_tracking t WHERE t.WT_SN=?   and t.data_auth =? ";
        if(!"1".equals(testStep)){
          tempList2 = modelService.listDataSql(querySql, new Object[] {qieReplaceSn,dataAuth});
          if ((tempList2 != null && !tempList2.isEmpty()))
          {
            return modelAction.alertParentInfo(modelAction.getText("输入的SN存在在库存表中"));
          }
        }else{
          tempList3 = modelService.listDataSql(querySql1, new Object[] {qieReplaceSn,dataAuth});
          // if (quCount == 0 && quCount1 == 0)
          if ((tempList3 == null || tempList3.isEmpty()))
          {
            return modelAction.alertParentInfo(modelAction.getText("输入的SN不存在在产品在制信息表中"));
          }
        }
        
        // 判断对应的物料料号是否正确
        if (tempList2 != null && !tempList2.isEmpty())
        {
          List<Map> qList = modelService.listDataSql(querySql, new Object[] {qieReplaceSn,dataAuth});
          if (qList != null && !qList.isEmpty()
              && !qList.get(0).get("WSI_ITEM_CODE").equals(itemCode))
          {
            return modelAction.alertParentInfo(modelAction.getText("替换SN对应的物料不正确"));
          }
        }
        else if (tempList3 != null && !tempList3.isEmpty())
        {
          List<Map> qList = modelService.listDataSql(querySql1, new Object[] {qieReplaceSn});
          if (qList != null && !qList.isEmpty()
              && !qList.get(0).get("WT_MODEL_CODE").equals(itemCode))
          {
            return modelAction.alertParentInfo(modelAction.getText("替换SN对应的物料不正确"));
          }
        }
        // 判断替换SN是否被抽样
        List tempList4 = null;
        String checkSql = "select t.qip_sn from T_QM_INSEPCT_PARENT_INFO t "
                          + "where t.qip_sn=? and t.data_auth =? ";
        tempList4 = modelService.listDataSql(checkSql, new Object[] {qieReplaceSn,dataAuth});
        if (tempList4 != null && !tempList4.isEmpty())
        {
          return modelAction.alertParentInfo(modelAction.getText("替换SN已抽样"));
        }
        // 判断替换SN是否为良品（先判断库存表，若不存在于库存表，则判断tracking表）
        List tempList5 = null;
        String checkSql1 = "SELECT t.wsi_item_sn FROM T_WMS_STOCK_INFO t "
                           + "WHERE t.wsi_item_sn=? AND t.wsi_item_flag='N'   and t.data_auth =?";
        tempList5 = modelService.listDataSql(checkSql1, new Object[] {qieReplaceSn,dataAuth});
        if (tempList5 != null && !tempList5.isEmpty())
        {
          List tempList6 = null;
          String checkSql2 = "SELECT t.WT_SN FROM t_wip_tracking t "
                             + "WHERE t.WT_SN=? AND t.WT_ERROR_FLAG!='0'  and t.data_auth =?";
          tempList6 = modelService.listDataSql(checkSql2, new Object[] {qieReplaceSn,dataAuth});
          if (tempList6 != null && !tempList6.isEmpty())
          {
            return modelAction.alertParentInfo(modelAction.getText("替换SN不是良品"));
          }
        }
      }
      // 修改母本信息表状态
      ArrayList<Object> paraList = new ArrayList<Object>();
      String sql = "SELECT t.id FROM T_QM_INSEPCT_PARENT_INFO t WHERE t.qip_inspect_sn=? AND t.qip_sn=?  and t.data_auth =?";
      List<Map> sList = modelService.listDataSql(sql, new Object[] {inspectSn, qieSn,dataAuth});
      TableDataMapExt inspect = new TableDataMapExt();
      inspect.setTableName("T_QM_INSEPCT_PARENT_INFO");
      CommMethod.editSysDefCol(inspect.getColMap(), modelAction.getUser());
      if (handleType.equals("1"))
      { // 处理方式为维修 修改sn状态为ok
        // inspect.setSqlWhere(" and id= '" + sList.get(0).get("ID") + "'");
        inspect.setSqlWhere(" and id= ? ");
        paraList.add(sList.get(0).get("ID"));
        inspect.setSqlWhereArgs(paraList);
        inspect.getColMap().put("QIP_TEST_RESULT", "1");
        if (dataAuth != null)
        {
          inspect.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.edit(inspect);
      }
      else if (handleType.equals("2"))
      { // 处理方式为替换
        // inspect.setSqlWhere(" and id= '" + sList.get(0).get("ID") + "'");
        inspect.setSqlWhere(" and id= ? ");
        paraList.add(sList.get(0).get("ID"));
        inspect.setSqlWhereArgs(paraList);
        inspect.getColMap().put("QIP_SN", qieReplaceSn);
        inspect.getColMap().put("QIP_TEST_RESULT", "1");
        if (dataAuth != null)
        {
          inspect.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.edit(inspect);
      }
      ArrayList<Object> paraList2 = new ArrayList<Object>();
      // 修改库存表状态 先判断关联的单据是否交接
      String querySql = "SELECT t.wdt_handover_flag FROM t_wms_doc_type t "
                        + "LEFT JOIN t_wms_doc_info a ON a.wdi_doc_type=t.wdt_type_sn "
                        + "LEFT JOIN t_wms_stock_info b ON b.wsi_doc_num=a.wdi_doc_num "
                        + "WHERE b.wsi_doc_num=?  and t.data_auth =?  and a.data_auth =?  and b.data_auth =?";
      List<Map> dList = modelService.listDataSql(querySql, new Object[] {docNum,dataAuth,dataAuth,dataAuth});
      if (dList != null && !dList.isEmpty() && dList.get(0).get("WDT_HANDOVER_FLAG") != null)
      {
        TableDataMapExt stock = new TableDataMapExt();
        stock.setTableName("T_WMS_STOCK_INFO");
        CommMethod.editSysDefCol(stock.getColMap(), modelAction.getUser());
        if (dList != null && !dList.isEmpty() && dList.get(0).get("WDT_HANDOVER_FLAG").equals("Y"))
        { // 交接 修改品质
          // stock.setSqlWhere(" and WSI_DOC_NUM= '" + DOC_NUM + "'");
          stock.setSqlWhere(" and WSI_DOC_NUM= ? AND DATA_AUTH=? ");
          paraList2.add(docNum);
          paraList2.add(dataAuth);
          stock.setSqlWhereArgs(paraList2);
          stock.getColMap().put("WSI_ITEM_FLAG", "1");
        }
        else if (dList != null && !dList.isEmpty()
                 && dList.get(0).get("WDT_HANDOVER_FLAG").equals("N"))
        { // 不交接 修改品质跟物料状态
          // stock.setSqlWhere(" and WSI_DOC_NUM= '" + DOC_NUM + "'");
          stock.setSqlWhere(" and WSI_DOC_NUM= ? AND DATA_AUTH=?");
          paraList2.add(docNum);
          paraList2.add(dataAuth);
          stock.setSqlWhereArgs(paraList2);
          stock.getColMap().put("WSI_ITEM_FLAG", "1");
          stock.getColMap().put("WSI_STOCK_FLAG", "2");
        }
        modelService.edit(stock);
      }
      // 修改库存信息表 旧sn为新sn
      ArrayList<Object> paraList3 = new ArrayList<Object>();
      TableDataMapExt stock2 = new TableDataMapExt();
      stock2.setTableName("T_WMS_STOCK_INFO");
      CommMethod.editSysDefCol(stock2.getColMap(), modelAction.getUser());
      stock2.setSqlWhere(" and WSI_ITEM_SN= ? AND DATA_AUTH=?");
      paraList3.add(qieSn);
      paraList3.add(dataAuth);
      stock2.setSqlWhereArgs(paraList3);
      stock2.getColMap().put("WSI_ITEM_SN", qieReplaceSn);
      modelService.edit(stock2);
      
      // 增加不良处理信息表数据
      TableDataMapExt error = new TableDataMapExt();
      error.setTableName("T_QM_INSEPCT_ERROR_INFO");
      int len = errorCodes.length;
      for (int i = 0; i < len; i++ )
      {
        CommMethod.addSysDefCol(error.getColMap(), modelAction.getUser());
        error.getColMap().put("ID", StringUtils.getUUID());
        error.getColMap().put("QIE_INSPECT_SN", inspectSn);
        error.getColMap().put("QIE_SN", qieSn);
        error.getColMap().put("QIE_HANDLE_TYPE", handleType);
        error.getColMap().put("QIE_REPLACE_SN", qieReplaceSn);
        error.getColMap().put("QIE_DOC_NUM", docNum);
        error.getColMap().put("QIE_ITEM_CODE", itemCode);
        error.getColMap().put("QIE_ERROR_CODE", errorCodes[i]);
        error.getColMap().put("QIE_EC_NAME", errorNames[i]);
        error.getColMap().put("QIE_EC_GRADE", errorGrades[i]);
        error.getColMap().put("QIE_MEMO", qieMemo);
        error.getColMap().put("QIE_TEST_STEP", testStep);
        if (dataAuth != null)
        {
          error.getColMap().put("DATA_AUTH", dataAuth);
        }
        error.getColMap().put("QIE_HANDLE_EMP", CommMethod.getSessionUser().getId());
        error.getColMap().put("QIE_HANDLE_TIME", sdf1.parse(sdf1.format(new Date())));
        modelService.save(error);
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("不良处理失败"), e);//+StringUtils.toString(e)
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("不良处理成功"), isCloseWin);
  }
}
