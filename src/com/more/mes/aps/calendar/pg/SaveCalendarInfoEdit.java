package com.more.mes.aps.calendar.pg;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.dto.Smap;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.mes.other.common.method.CommonMethod;
import com.more.mes.other.common.method.CommonMethod.Enums;

import edu.emory.mathcs.backport.java.util.Arrays;

/**
 * 产能日历信息保存操作类
 * 
 * @author Chaos
 * 
 */
public class SaveCalendarInfoEdit implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());
	private final String parentFormId = "cc3ac92f89ad485caee993047912a29a";// 主表单ID
	private final String childFormId = "8e3691f22e2f4d818b3b29cd5972c6e6";// 子表单ID
	
	private final CommonMethod cm=new CommonMethod();

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
        
		try{
			// 获取Request对象
			HttpServletRequest request = modelAction.getRequest();
		 String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
			String iframeId=request.getParameter("iframeId");
            //获取修改界面的数据集合
			Smap smapTemp = modelAction.getParaMapObj();
		    smapTemp.initParam();
			Map dataMap = modelService.getEditComm(request,
					modelAction.getCurrUser(),smapTemp, modelAction);
			// 进行数据处理
			if (!dealData(dataMap)) {
				return modelAction.alertParentInfo((modelAction
						.getText("保存失败，数据校正异常")));
			}
			// 校验主表数据
			CommonMethod.Validate validate = cm.new Validate(
					parentFormId, dataMap,modelAction);
			// 组织机构&线体&阶别 数据唯一性
			if (!validate.isUnique(
					Arrays.asList(new Object[] { "DATA_AUTH", "PPC_AREA_SN",
							"PPC_PRODUCT_STEP" }), true)) {
				return validate.pushErrorMessage("已存在相同数据(组织机构、线别、生产阶别)");
			}
			// 校验子表单数据（主表单已在页面js中进行校验）
			Boolean validateResult = true;
			String validateMsg = null;
			validate = cm.new Validate(childFormId, dataMap,modelAction);
			// --空值校验
			String resultStr = validate.isEmpty(Arrays.asList(new Object[] {
					"PPE_AREA_SN", "PPE_BEGIN_TIME", "PPE_END_TIME",
					"PPE_DURATION", "PPE_EXECPTION_TYPE", }));
			if (!StringUtils.isEmpty(resultStr)) {
				validateResult = false;
				resultStr = resultStr.replace("PPE_AREA_SN", "线别")
						.replace("PPE_BEGIN_TIME", "开始时间")
						.replace("PPE_END_TIME", "结束时间")
						.replace("PPE_DURATION", "例外时长")
						.replace("PPE_EXECPTION_TYPE", "例外类型");
				return validate.pushErrorMessage("明细列表[%s]不能为空！", resultStr);
			}
			// --开始时间 & 结束时间校验
			if (!validate.timeSize("PPE_END_TIME", "PPE_BEGIN_TIME", false)) {
				return validate.pushErrorMessage("明细列表开始时间要小于结束时间！");
			}
			//判定是否有子表单数据，若不存在子表单数据，则清空对应子表单数据（应急，后期进行处理方法的优化）
			List<Map> childMap=(List)dataMap.get(childFormId);
			if(childMap.size()<=0){
				Map parentMap=(Map)dataMap.get(parentFormId);
				if(null!=parentMap && parentMap.size()>0){
					Object parentId=parentMap.get("ID");
					String strSql="DELETE FROM T_PM_PLAN_EXECPTION WHERE PPC_ID=? AND DATA_AUTH=? ";
					modelService.execSql(strSql,new Object[]{parentId,dataAuth});
				}
			}
			// 保存数据
			CommonMethod.DbOperation.Reference.updateByChildInsert(parentFormId, childFormId,
					dataMap, modelAction, modelService,new ArrayList(){{add("PPC_ID");}},Enums.dataBaseType.pg);

			return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
		}
		catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}

	/**
	 * 校验or保存前修改必要的数据
	 * 
	 * @param dataMap
	 * @return
	 */
	private Boolean dealData(Map dataMap) {
		try {
			// 获取主表单数据
			Map parentMap = (Map) dataMap.get(parentFormId);
			// 获取主表线别
			String areasn = parentMap.get("PPC_AREA_SN").toString();
			// 获取子表单数据
			List<Map> chlidMaps = (List<Map>) dataMap.get(childFormId);

			// 1、循环替换子表单中的线别
			// 2、修改开始时间和结束时间，精确到小时
			Date startDate = null;
			Date endDate = null;
			for (Map map : chlidMaps) {
				map.put("PPE_AREA_SN", areasn);

				Object begin = map.get("PPE_BEGIN_TIME");
				if (begin != null && !StringUtils.isEmpty(begin.toString())) {
					startDate = CommonMethod.Common.convertJsonToDate(begin);
					startDate.setMinutes(0);
					startDate.setSeconds(0);
				}
				Object end = map.get("PPE_END_TIME");
				if (end != null && !StringUtils.isEmpty(end.toString())) {
					endDate = CommonMethod.Common.convertJsonToDate(end);
					endDate.setMinutes(0);
					endDate.setSeconds(0);
				}
			}

			return true;
		} catch (Exception ex) {
			log.error("dealData:" + ex.toString());
			return false;
		}
	}
}
