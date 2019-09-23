package com.more.mes.configcenter.oracle;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.Smap;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 条码规则-保存
 * 
 * @author tpdg
 */
public class BarcodeSave implements FuncService {
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings({ "unused", "unchecked" })
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {

		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		String formIds = request.getParameter("formIds");
		List<Smap<String, Object>> paramList = modelAction.getParamList();
		String id = StringUtils.getUUID();
		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");

		Map<String, Object> map = modelService.getAddComm(request, modelAction.getUser(), modelAction);
		// List list=(List)parmap.get(formIds);
		Map<String, Object> parmap1 = (Map) map.get(formIds);
		Object beType = parmap1.get("TBR_ANALYTIC_TYPE");
		String TBR_STATUS = (String) parmap1.get("TBR_STATUS");
		String TBR_ANALYTIC_TYPE = (String) parmap1.get("TBR_ANALYTIC_TYPE");

		// parmap1.put("TBR_STATUS", "Y");

		String TBR_DEFAULT = (String) parmap1.get("TBR_DEFAULT");
		if (TBR_DEFAULT == null) {
			parmap1.put("TBR_DEFAULT", "N");
		}
		List list = new ArrayList<List>();
		String sql = "select ID from T_CO_BARCODE_ROUL t where t.TBR_NAME =? and t.data_auth = ? ";
		list = modelService.listDataSql(sql, new Object[] { parmap1.get("TBR_NAME"), dataAuth });
		if (list != null && list.size() > 0) {
			return modelAction.alertParentInfo(modelAction.getText("规则名称已经存在"));
		}
		if ("Y".equals(request.getParameter("paraMap1@0#TBR_DEFAULT"))) {
			String sqlCount = "select t.id from T_CO_BARCODE_ROUL t where t.TBR_TYPE = ? and t.data_auth = ? and t.TBR_DEFAULT = 'Y'";
			int count = modelService.execSql(sqlCount, new Object[] { parmap1.get("TBR_TYPE"), dataAuth });
			if (count > 0) {
				return modelAction.alertParentInfo(modelAction.getText("该条码类型下已经存在默认标识"));
			}
		}
		/*
		 * if ("Y".equals(TBR_STATUS) && "Y".equals(TBR_DEFAULT)) { sql =
		 * "select ID from T_CO_BARCODE_ROUL t where t.tbr_status='Y' and t.tbr_default='Y' and t.data_auth = ? "
		 * ; list = modelService.listDataSql(sql, new Object[] { dataAuth }); if (list
		 * != null && list.size() > 1) { return
		 * modelAction.alertParentInfo(modelAction.getText("默认标识有效的记录已经存在")); } }
		 */
		// parmap1.remove("BE_TYPE");
		parmap1.remove("tableName");
		TableDataMapExt tdmapTop = new TableDataMapExt();
		// CommMethod.addSysDefCol(parmap, modelAction.getUser());
		tdmapTop.getColMap().putAll(parmap1);
		tdmapTop.setTableName("T_CO_BARCODE_ROUL");
		tdmapTop.getColMap().put("DATA_AUTH", dataAuth);
		tdmapTop.getColMap().put("ID", id);
		modelService.save(tdmapTop);
		int detaiNum = 0;
		if (!"2".equals(TBR_ANALYTIC_TYPE)) {

			for (int i = 0; i < paramList.size(); i++) {
				Smap<String, Object> smap = paramList.get(i);
				Object source = smap.get("BE_SOURCE");
				Object bePro = smap.get("BE_PRO");
				if (source == null || "".equals(source)) {
					if(bePro==null || "".equals(bePro)){
						detaiNum++;
					}
					
					// continue;
				} else if ("1".equals(beType)) {// 解析类型是数据库
					int hang = i + 1;
					if (smap.get("BE_VALUE") == null || "".equals(smap.get("BE_VALUE"))) {
						throw new BussException(CommMethod.getText("第%s行对应列名数据请填写完整", hang));
					}
					if (smap.get("BE_SELECT") == null || "".equals(smap.get("BE_SELECT"))) {
						throw new BussException(CommMethod.getText("第%s行对应过滤字段请填写完整", hang));
					}
					/*
					 * if (smap.get("BE_PRO") == null || "".equals(smap.get("BE_PRO"))) { throw new
					 * BussException(modelAction.getText("第" + hang + "行对应解析方法名请填写完整")); }
					 */
					sql = "select s.table_name from user_all_tables s where table_name=?  ";
					List subList = modelService.listDataSql(sql,
							new Object[] { source.toString().toUpperCase() });
					if (subList == null || subList.size() == 0) {
						throw new BussException(CommMethod.getText("第%s行数据源对象不存在", hang));
					}
					sql = "select * from user_tab_columns a where a.TABLE_NAME=? and a.COLUMN_NAME= ?  ";
					subList = modelService.listDataSql(sql, new Object[] { source.toString().toUpperCase(),
							smap.get("BE_VALUE").toString().toUpperCase() }); 
					if (subList == null || subList.size() == 0) {
						throw new BussException(CommMethod.getText("第%s行对应列名字段不存在", hang));
					}
					subList = modelService.listDataSql(sql, new Object[] { source.toString().toUpperCase(),
							smap.get("BE_SELECT").toString().toUpperCase() });
					if (subList == null || subList.size() == 0) {
						throw new BussException(CommMethod.getText("第%s行对应过滤字段不存在", hang));
					}

				} else if ("0".equals(beType)) {
					int hang = i + 1;

					/*
					 * if (smap.get("BE_PRO") == null || "".equals(smap.get("BE_PRO"))) { throw new
					 * BussException(modelAction.getText("第" + hang + "行对应解析方法名请填写完整")); }
					 */

				}
				TableDataMapExt detail = new TableDataMapExt();
				String wtid = StringUtils.getUUID();
				detail.setTableName("T_CO_BARCODE_EXPLAIN");
				CommMethod.addSysDefCol(smap, modelAction.getUser());
				detail.getColMap().putAll(smap);
				detail.getColMap().put("ID", wtid);
				detail.getColMap().put("TBR_ID", id);
				modelService.save(detail);
			}
		}
		if (("0".equals(beType) || "1".equals(beType)) && paramList.size() == detaiNum) {
			throw new BussException(modelAction.getText("请填写条码规则解析内容！"));
		}
		if (StringUtils.isBlank(isCloseWin)) {
			return modelAction.alertInfoClear(modelAction.getText("新增成功"), "2");
		} else {

			return modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.SUCCESS,
					Constants.OPERATE_TYPE_ADD);
			// return modelAction.reloadParent(modelAction.getText("新增成功"));
		}
	}
}
