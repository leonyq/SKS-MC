package com.more.mes.smt.problemreport;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

/**
 * 保存8D报告单    原因分析
 * @author development
 *
 */
public class SaveProblemCause implements FuncService{
  
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
      String iframeId = request.getParameter("iframeId");
      try {
        String dataId = request.getParameter("dataId");
        String docNum = request.getParameter("docNum");
        String[] causeTypes = request.getParameterValues("causeTypeSelect");//原因类型
        String[] causeAnalysiss = request.getParameterValues("CPC_CAUSE_ANALYSIS");//原因分析
        
        String sql="select CPR_STATUS from T_CO_PROBLEM_REPORT where id=? and data_auth=? ";
        List<Map> list = modelService.listDataSql(sql, new Object[]{dataId,dataAuth});
        
        
        CommMethod.listToEscapeJs(list);
        Map<String, Object> map = new HashMap<>();
        if(list!=null&&list.size()>0){
          map = list.get(0);
        }
        String state = null;
        if (StringUtils.isNotBlank(map.get("CPR_STATUS"))) {
			state = map.get("CPR_STATUS").toString();
		}
      
        int cprStatus=3;
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
      TableDataMapExt pro = new TableDataMapExt(); 
      List listParam=new ArrayList();
      pro.setTableName("T_CO_PROBLEM_REPORT");
      CommMethod.editSysDefCol(pro.getColMap(), modelAction.getUser());
      pro.setSqlWhere("and id =? and data_auth=? ");
      listParam.add(dataId);
      listParam.add(dataAuth);
      pro.setSqlWhereArgs(listParam);
      pro.getColMap().put("CPR_STATUS", cprState);
      if(dataAuth!=null){
        pro.getColMap().put("DATA_AUTH", dataAuth);
        }
      modelService.edit(pro);
      //先删除对应的原因分析信息
      List<Object> sqlW = new ArrayList<Object>();
      sqlW.add(docNum);
      sqlW.add(dataAuth);
      TableDataMapExt delprc = new TableDataMapExt(); 
      delprc.setTableName("T_CO_PROBLEM_CAUSE");
      delprc.setSqlWhere(" and CPC_SN =? and data_auth=? ");
      delprc.setSqlWhereArgs(sqlW);
      modelService.del(delprc);
      //新增8D报告单  原因分析信息
      TableDataMapExt prc = new TableDataMapExt(); 
      prc.setTableName("T_CO_PROBLEM_CAUSE");
      int num = causeTypes.length;
      for(int i=0;i<num;i++){
        prc.getColMap().clear();
        CommMethod.addSysDefCol(prc.getColMap(), modelAction.getUser());
        prc.getColMap().put("CPC_SN", docNum);
        prc.getColMap().put("CPC_CAUSE_TYPE", causeTypes[i]);
        prc.getColMap().put("CPC_CAUSE_ANALYSIS", causeAnalysiss[i]);
        prc.getColMap().put("CPC_CAUSE_EMP", CommMethod.getSessionUser().getId());
        prc.getColMap().put("CPC_CAUSE_TIME", DateUtil.getCurDate());
        if(dataAuth!=null){
          prc.getColMap().put("DATA_AUTH", dataAuth);
          }
        modelService.save(prc);
      }
    } catch (Exception e) {
      log.error(e);
        throw new BussException(modelAction.getText("保存失败"), e);
    }
      return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), "0");
  }

}
