package com.more.mes.smt.problemreport;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.ibm.pkcs11.o;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 保存8D报告单    永久改善措施
 * @author development
 *
 */
public class SavePermanentImprove implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String iframeId = request.getParameter("iframeId");
    try {
      String dataId = request.getParameter("dataId");
      String cprPermanentImproveMeasure = request.getParameter("paraMapObj.CPR_PERMANENT_IMPROVE_MEASURE");//改善措施
      String sql="select CPR_STATUS from T_CO_PROBLEM_REPORT where id=? and data_auth=? ";
      List<Map> list = modelService.listDataSql(sql, new Object[]{dataId,dataAuth});
      
      Map<String, Object> map = new HashMap<>();
      if(list!=null&&list.size()>0){
    	  map = list.get(0);
      }
      String state = null;
      if(StringUtils.isNotBlank(map.get("CPR_STATUS"))){
    	  state = map.get("CPR_STATUS").toString();
      }
     
      
      int cprStatus=4;
      String cprState = null;
      if (StringUtils.isNotBlank(state))
      {
        int status = Integer.parseInt(state);
        if (cprStatus<status)
        {
          cprState=status+"";
        }else {
          cprState=cprStatus+"";
        }
      }
      
      //修改8D报告单信息
    List<Object> sqlW = new ArrayList<Object>();
    sqlW.add(dataId);   
    sqlW.add(dataAuth); 
    TableDataMapExt pro = new TableDataMapExt(); 
    pro.setTableName("T_CO_PROBLEM_REPORT");
    CommMethod.editSysDefCol(pro.getColMap(), modelAction.getUser());
    pro.setSqlWhere("and id =? and data_auth=? ");
    pro.setSqlWhereArgs(sqlW);
    pro.getColMap().put("CPR_STATUS", cprState);
    pro.getColMap().put("CPR_PERMANENT_IMPROVE_MEASURE", cprPermanentImproveMeasure);
    pro.getColMap().put("CPR_PERMANENT_IMPROVE_EMP", CommMethod.getSessionUser().getId());
    pro.getColMap().put("CPR_PERMANENT_IMPROVE_DATE", DateUtil.getCurDate());
    if(dataAuth!=null){
      pro.getColMap().put("DATA_AUTH", dataAuth);
      }
    modelService.edit(pro);
  } catch (Exception e) {
    log.error(e);
      throw new BussException(modelAction.getText("保存失败"), e);
  }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), "0");
  }

}
