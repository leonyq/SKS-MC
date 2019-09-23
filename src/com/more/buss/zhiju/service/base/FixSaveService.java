package com.more.buss.zhiju.service.base;

import java.util.ArrayList;
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
 * 制具保养 保养保存
 * @author development
 *
 */
public class FixSaveService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings({"unchecked", "unused"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String cfmType = request.getParameter("paraMap1@0#CFM_TYPE");
    String cfmReporter = request.getParameter("paraMap1@0#CFM_REPORTER");
    String cfmMtMan = request.getParameter("paraMap1@0#CFM_MT_MAN");
    String cfmAudit = request.getParameter("paraMap1@0#CFM_AUDIT");
    String cfmDefectRemark = request.getParameter("paraMap1@0#CFM_DEFECT_REMARK");
    String cfmEcCode = request.getParameter("paraMap1@0#CFM_EC_CODE");
    //String CFM_DESC = request.getParameter("CFM_DESC");

    String dataAuth = request.getParameter("_DATA_AUTH");// 组织机构

    /*
     * String zjSn=request.getParameter("zj_sn"); String zjType=request.getParameter("zj_type");
     * String cfmId=request.getParameter("cfmId");
     */
    String[] idsArray=null;
    String[] snsArray=null;
    String[] codesArray=null;
    String[] namesArray=null;
    String[] typesArray=null;
    String ids = request.getParameter("ids");
    if(ids!=null && !ids.equals("")) {
    	idsArray = ids.split(",");
    }
    String sns = request.getParameter("sns");
    if(sns!=null && !sns.equals("")) {
    	snsArray = sns.split(",");
    }
    String codes = request.getParameter("codes");
    if(codes!=null && !codes.equals("")) {
    	codesArray = codes.split(",");
    }
    String names = request.getParameter("names");
    if(names!=null && !names.equals("")) {
    	namesArray = names.split(",");
    }
    String types = request.getParameter("types");
    if(types!=null && !types.equals("")) {
    	typesArray = types.split(",");
    }

    TableDataMapExt fixMain = new TableDataMapExt();
    // CommMethod.addSysDefCol(fixMain.getColMap(), modelAction.getUser());
    fixMain.setTableName("T_CO_FIX_MAINTENANCE");// 制具保养维护信息表

    TableDataMapExt fixInfo = new TableDataMapExt();
    fixInfo.setTableName("T_CO_FIXTURE_INFO");// 制具保养维护信息表

    String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm:ss");
	if(idsArray!=null&& idsArray.length>0) {
		for (int i = 0; i < idsArray.length; i++ )
	    {

	      fixMain.getSqlWhereArgs().clear();
	      Map<String, Object> calMap = fixMain.getColMap();
	      calMap.clear();
	      CommMethod.addSysDefCol(fixMain.getColMap(), modelAction.getUser());
	      String sqlType = "select sdv.code code from sy_dict_val sdv"
	                       + " where  sdv.dict_code = 'ASSISTANTTOOL_TYPE' " + " and sdv.value= ? ";
	      List<Map<String, String>> fisType = modelService.listDataSql(sqlType,new Object[]{typesArray[i]});
	      String sql ="select info.CFI_LEFT_TOP,info.CFI_LEFT_LOWER,info.CFI_RIGHT_TOP,info.CFI_RIGHT_LOWER, "+
	                  " info.CFI_MIDDLE,info.CFI_STRAIN_DIS,info.CFI_TINCKNESS,info.CFI_FLATNESS"+
	                  " from T_CO_FIXTURE_INFO info"+
	                  " where info.CFI_FIX_SN= ? ";
	      List<Map<String, String>> fisSns = modelService.listDataSql(sql,new Object[]{snsArray[i]});
	      // calMap.put("ID", StringUtils.getUUID());
	      //calMap.put("CFM_DESC", CFM_DESC);
	      calMap.put("CFM_EC_CODE", cfmEcCode);
	      calMap.put("CFM_AUDIT", cfmAudit);
	      calMap.put("CFM_DEFECT_REMARK", cfmDefectRemark);
	      calMap.put("CFM_FIX_SN", snsArray[i]);
	      calMap.put("CFM_ITEM_CODE", codesArray[i]);
	      if(namesArray.length>0){
	       calMap.put("CFM_ITEM_NAME", namesArray[i]);
	      }
	      calMap.put("CFM_ITEM_TYPE", fisType.get(0).get("code"));
	      calMap.put("CFM_MT_MAN", cfmMtMan);
	      calMap.put("CFM_MT_TIME", DateUtil.parseDate(nowDate, "yyyy-MM-dd HH:mm:ss"));
	      calMap.put("CFM_REPORTER", cfmReporter);
	      calMap.put("CFM_TYPE", cfmType);      
	      calMap.put("CFM_LEFT_LOWER",  fisSns.get(0).get("CFI_LEFT_LOWER"));
	      calMap.put("CFM_LEFT_TOP",  fisSns.get(0).get("CFI_LEFT_TOP"));
	      calMap.put("CFM_RIGHT_LOWER",  fisSns.get(0).get("CFI_RIGHT_LOWER"));
	      calMap.put("CFM_RIGHT_TOP",  fisSns.get(0).get("CFI_RIGHT_TOP"));
	      calMap.put("CFM_MIDDLE",  fisSns.get(0).get("CFI_MIDDLE"));
	      calMap.put("CFM_STRAIN_DIS",  fisSns.get(0).get("CFI_STRAIN_DIS"));
	      calMap.put("CFM_TINCKNESS",  fisSns.get(0).get("CFI_TINCKNESS"));
	      calMap.put("CFM_FLATNESS",  fisSns.get(0).get("CFI_FLATNESS"));

	      if (dataAuth != null)
	      {
	        calMap.put("DATA_AUTH", dataAuth);
	      }
	      List<Object> sqlList = new ArrayList<Object>();
	      sqlList.add(snsArray[i]);
	      fixInfo.setSqlWhere("and CFI_FIX_SN=? ");
	      fixInfo.setSqlWhereArgs(sqlList);
	      Map<String, Object> infoMap = fixInfo.getColMap();
	      infoMap.put("CFI_NOW_USAGE", 0);
	      infoMap.put("CFI_MT_DATE", DateUtil.parseDate(nowDate, "yyyy-MM-dd HH:mm:ss"));
	      try
	      {
	        modelService.save(fixMain);
	        modelService.edit(fixInfo);
	      }
	      catch (Exception e)
	      {
	        log.error(e);
	        throw new BussException(modelAction.getText("保养维修失败"), e);
	      }
	    }
	}
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), isCloseWin);
    // return
    // modelAction.commAjaxFunClassLoadParent(formId,iframeId,Constants.SUCCESS,Constants.OPERATE_TYPE_ADD);

    // return modelAction.reloadParent(modelAction.getText("保养维修成功"));

  }

}
