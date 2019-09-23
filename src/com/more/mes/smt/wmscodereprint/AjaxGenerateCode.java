package com.more.mes.smt.wmscodereprint;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.mes.common.method.JbarcodeUtil;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Description:码制类生成视图 Company: morelean
 * 
 * @author hzp
 * @date 2018年5月18日
 * @version 1.0
 */
public class AjaxGenerateCode implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		// 获取项目路径存放临时图片
		String codeImgUrl = Constants.getWEB_ROOT_PATH() + Constants.SEPARATOR + "buss" + Constants.SEPARATOR
				+ "codeImg";
		// 获取项目路径存放临时图片相对位置
		String relativeUrl = "buss" + Constants.SEPARATOR + "codeImg";
		File file = new File(relativeUrl);
		if (!file.exists()) {
			file.mkdir();
		}
		if (modelAction.getRequest().getParameter("codeValue") != null
				&& !"".equals(modelAction.getRequest().getParameter("codeValue"))) {
			String codeValue = modelAction.getRequest().getParameter("codeValue");// 获取解析数据
			JSONArray jsonArray = JSONArray.fromObject(codeValue);
			Map<String, Object> result = generateCode(jsonArray, codeImgUrl, relativeUrl);// 解析数据
			modelAction.setAjaxMap(result);
		}
		return BaseActionSupport.AJAX;

	}

	/**
	 * 生成条形码方法
	 * 
	 * @param jsonArray
	 * @return
	 */
	public Map<String, Object> generateCode(JSONArray jsonArray, String codeImgUrl, String relativeUrl) {
		File file = new File(codeImgUrl);
		if (!file.exists()) {
			file.mkdir();
		}
		Date day = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		codeImgUrl = codeImgUrl + Constants.SEPARATOR + df.format(day);
		relativeUrl = relativeUrl + Constants.SEPARATOR + df.format(day);
		File codeImg = new File(codeImgUrl);
		if (!codeImg.exists()) {
			codeImg.mkdir();
		}
		List<Map<String, Object>> codeList = new ArrayList<Map<String, Object>>();
		int jsonArrayLength = jsonArray.size();
		/**
		 * 解析当前数据
		 */
		for (int i = 0; i < jsonArrayLength; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			JSONObject entity = jsonArray.optJSONObject(i);
			if (entity.get("codeId") != null) {
				map.put("codeId", entity.get("codeId").toString());
			} else {
				map.put("codeId", 0);
			}

			if (entity.get("value") != null) {
				map.put("value", entity.get("value").toString());
			} else {
				map.put("value", 0);
			}

			if (entity.get("codeType") != null) {
				map.put("codeType", entity.get("codeType").toString());
			} else {
				map.put("codeType", "qrcode");
			}

			if (entity.get("width") != null) {
				map.put("width", entity.get("width").toString());
			} else {
				map.put("width", 100);
			}

			if (entity.get("height") != null) {
				map.put("height", entity.get("height").toString());
			} else {
				map.put("height", 100);
			}
			codeList.add(map);
		}
		// 获取返回结果
		Map<String, Object> result = JbarcodeUtil.createBarcodeValue(codeList, codeImgUrl + Constants.SEPARATOR,
				relativeUrl + Constants.SEPARATOR);
		return result;

	}

}
