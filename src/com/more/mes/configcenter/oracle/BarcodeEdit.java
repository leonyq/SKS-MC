package com.more.mes.configcenter.oracle;

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
public class BarcodeEdit implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
		String dataId = modelAction.getDataId();
		String formId = modelAction.getFormId();
		Map dataMap = CommMethod.getDateMapById(formId, dataId);
		String sql="select ID,BE_CONTENT,\r\n" + 
				"       DECODE(BE_CONTENT,'A','料号','B','数量','C','批号','D','供应商代码','E','追溯码','G','生产日期','流水号') BE_CONTENT2,\r\n" + 
				"       BE_SOURCE,\r\n" + 
				"       BE_BEG,\r\n" + 
				"       BE_LEN,\r\n" + 
				"       BE_PRO,\r\n" + 
				"       BE_MEMO,\r\n" + 
				"       DATA_AUTH,\r\n" + 
				"       TBR_ID,\r\n" + 
				"       BE_SELECT,\r\n" + 
				"       BE_VALUE,\r\n" + 
				"       BE_REFERENCE_BEG,\r\n" + 
				"       BE_REFERENCE_END,\r\n" + 
				"       BE_ORDER\r\n" + 
				"  from T_CO_BARCODE_EXPLAIN \r\n" + 
				" where tbr_id = ? order by BE_BEG \r\n" + 
				"";
		List paramList = modelService.listDataSql(sql, new Object[] { dataId });
		
		modelAction.setParamList(paramList);
		modelAction.setDataMap(dataMap);
		return modelAction.ActionForwardExeid(modelAction.getExeid());// 转向原来视图页面
		//return modelAction.ActionForward("/buss/msbg/basicData/barcodeEdit.jsp");
	}
}