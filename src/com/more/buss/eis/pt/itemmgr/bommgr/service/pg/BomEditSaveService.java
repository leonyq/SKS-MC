package com.more.buss.eis.pt.itemmgr.bommgr.service.pg;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.Smap;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class BomEditSaveService implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// 获取封装的数据
		HttpServletRequest request = modelAction.getRequest();

		String cbItemCode = request.getParameter("paraMapObj.CB_ITEM_CODE");
		String cbVer = request.getParameter("paraMapObj.CB_VER");
	String sql="SELECT * FROM (SELECT ROW_NUMBER () OVER (ORDER BY ID ASC) AS ROWNUM,ID	FROM t_co_bom WHERE	 CB_ITEM_CODE= ? AND CB_VER= ?) AS FOO  WHERE	ROWNUM = 1";
	//	String sql="select id from t_co_bom where rownum=1 and CB_ITEM_CODE=? AND CB_VER=?";
		List list = modelService.listDataSql(sql, new Object[] {cbItemCode,cbVer});
		if(list.size()>0){
			Map map=(Map)list.get(0);
			if(!StringUtils.toString(map.get("ID")).equals(modelAction.getDataId())){
			return modelAction.alertParentInfo((modelAction
					.getText("机种料号"+cbItemCode+"对应版本"+cbVer+"已经存在！")));
			}
		}
		Smap smapTemp=modelAction.getParaMapObj();
		smapTemp.initParam();
		Map map = modelService.getEditComm(request, modelAction.getCurrUser(),smapTemp,
				modelAction);
		for (Object key : map.keySet()) {
			String tempCode = null;
			String tempCode1 = null;
			if (key.toString().equals("b9f80468a9fe4b74ada4fceff23db738")) {
				JSONArray array = JSONArray.fromObject(map.get(key));
				for (int i = 0; i < array.size(); i++) {
					tempCode = array.getJSONObject(i).get("CBD_ITEM_CODE")
							.toString();
					if (cbItemCode.equals(tempCode)) {
						return modelAction.alertParentInfo(modelAction
								.getText("机种料号"+cbItemCode+"和物料号"+tempCode+"不能相同！"));
					}
					for (int j = i + 1; j < array.size(); j++) {
						tempCode1 = array.getJSONObject(j).get("CBD_ITEM_CODE")
								.toString();
						if (tempCode1.equals(tempCode)) {
							return modelAction.alertParentInfo((modelAction
									.getText("物料号不能相同！")));
						}
					}
				}

			}
		}
		smapTemp.remove("tableName");
		smapTemp.remove("_FLAG");
		modelService.editComm(request, modelAction.getCurrUser(),smapTemp,
				modelAction);
		return modelAction.reloadParent(modelAction.getText("修改成功！"));
	}

}
