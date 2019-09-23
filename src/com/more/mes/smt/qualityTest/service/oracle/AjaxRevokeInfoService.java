package com.more.mes.smt.qualityTest.service.oracle;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取物料/产品信息
 * 
 * @author development
 */
public class AjaxRevokeInfoService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String tempStr="";
    String dataAuth = CommMethodMc.getDataAuthBySession(request);
    try
    {
        String dataId = request.getParameter("dataId");
        String[] dataIds = dataId.split(",", -1);
        String inspectSn = request.getParameter("inspectSn");
        String[] inspectSns = inspectSn.split(",", -1);
        int idLengt = dataIds.length - 1;
        
        String sql0 = "select T1.QII_INSPECT_SN from T_QM_INSPECT_INFO T1 "+
        "where T1.QII_INSPECT_SN IN (SELECT WRD_TEST_DOC FROM T_WMS_RECHECK_DOC) AND T1.id = ? ";
        //List<Map> dataList0= new List<Map>();
        List<Map> dataList0 =  modelService.listDataSql(sql0,new Object[]{dataIds[0]});
        if(dataList0!=null && dataList0.size()>0){//检验单号有在复检单中
          String qii = String.valueOf(dataList0.get(0).get("QII_INSPECT_SN"));
          String snSql = "SELECT T.QIP_SN FROM T_QM_INSEPCT_PARENT_INFO T "+
                           " LEFT JOIN T_QM_INSPECT_INFO T1"+
                           " ON T.QIP_INSPECT_SN = T1.QII_INSPECT_SN and t1.DATA_AUTH=?"+ 
                           " where QIP_INSPECT_SN = ? and t.DATA_AUTH=?";
          List<Map> dataList00 =  modelService.listDataSql(snSql,new Object[]{dataAuth,qii,dataAuth});
          for(int i=0;i<dataList00.size();i++){
              ArrayList<Object> paraList2 = new ArrayList<Object>();
              TableDataMapExt infoMap = new TableDataMapExt();
              infoMap.setTableName("T_WMS_STOCK_INFO");
              //infoMap.setSqlWhere(" and WSI_ITEM_SN='" + String.valueOf(dataList00.get(i).get("QIP_SN")) + "'");
              infoMap.setSqlWhere(" and WSI_ITEM_SN=? and DATA_AUTH=? ");
              paraList2.add(String.valueOf(dataList00.get(i).get("QIP_SN")));
              paraList2.add(dataAuth);
              infoMap.setSqlWhereArgs(paraList2);
              infoMap.getColMap().put("WSI_STOCK_FLAG","2");
              modelService.edit(infoMap);
          }
        }
        for (int i = 0; i < idLengt; i++ )
      {
        ArrayList<Object> paraList = new ArrayList<Object>();
        TableDataMapExt examineMap = new TableDataMapExt();
        examineMap.setTableName("T_QM_INSPECT_INFO");

        // examineMap.setSqlWhere("and ID='" + dataIds[i] + "'");
        examineMap.setSqlWhere(" and ID= ? and DATA_AUTH=? ");
        paraList.add(dataIds[i]);
        paraList.add(dataAuth);
        examineMap.setSqlWhereArgs(paraList);
        
        examineMap.getColMap().put("QII_LIST_FLAG", "5");// 状态(1-待检 ，2-检验中，3-检验完成 ，4-已审核， 5-撤销)
        examineMap.getColMap().put("QII_CANCEL_TIME", DateUtil.getCurDate());// 撤销时间
        examineMap.getColMap().put("QII_CANCEL_EMP", CommMethod.getSessionUser().getId());// 撤销人

        modelService.edit(examineMap);

        ArrayList<Object> paraList2 = new ArrayList<Object>();
        TableDataMapExt revokeMap = new TableDataMapExt();
        revokeMap.setTableName("T_QM_INSEPCT_PARENT_INFO");

        revokeMap.setSqlWhere(" and QIP_INSPECT_SN= ? and DATA_AUTH=? ");
        paraList2.add(inspectSns[i]);
        paraList2.add(dataAuth);
        revokeMap.setSqlWhereArgs(paraList2);
        
        revokeMap.getColMap().put("QIP_TEST_FLAG", "3");// 检验状态(1-已检验，2-未检验，3-已撤销)

        modelService.edit(revokeMap);
      }
        
        
    }
    catch (Exception e)
    {
      log.error(e);
      tempStr=StringUtils.toString(e);
      throw new BussException(modelAction.getText("保存失败"), e);
      
    }
    modelAction.setAjaxString(tempStr);
    return BaseActionSupport.AJAX;
  }

}
