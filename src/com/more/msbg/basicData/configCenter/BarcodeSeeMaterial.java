package com.more.msbg.basicData.configCenter;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 条码规则-修改
 * 
 * @author tpdg
 */
public class BarcodeSeeMaterial implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
		String dataId = modelAction.getDataId();
		String formId = modelAction.getFormId();
		Map dataMap = CommMethod.getDateMapById(formId, dataId);
		String sql="select * from T_CO_BARCODE_EXPLAIN s where s.tbr_id= ? ";
		List paramList = modelService.listDataSql(sql, new Object[] { dataId });
		
		modelAction.setParamList(paramList);
		modelAction.setDataMap(dataMap);
		return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面
		//return modelAction.ActionForward("/buss/msbg/basicData/barcodeEdit.jsp");
	}
}