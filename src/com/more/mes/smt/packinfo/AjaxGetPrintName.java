package com.more.mes.smt.packinfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.DocFlavor;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.attribute.HashPrintServiceAttributeSet;
import javax.print.attribute.PrintServiceAttributeSet;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取本机打印机名称
 * 
 * @author development
 *
 */
public class AjaxGetPrintName implements FuncService {

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		PrintServiceAttributeSet pras = new HashPrintServiceAttributeSet();
		DocFlavor flavor = DocFlavor.BYTE_ARRAY.PNG;
		// 可用的打印机列表(字符串数组)
		PrintService printService[] = PrintServiceLookup.lookupPrintServices(flavor, pras);
		List<Map<String, Object>> pList = new ArrayList<Map<String, Object>>();
		int num = printService.length;
		for (int i = 0; i < num; i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("printName", printService[i].getName());
			pList.add(map);
		}
		modelAction.setAjaxList(pList);
		return BaseActionSupport.AJAX;
	}

}
