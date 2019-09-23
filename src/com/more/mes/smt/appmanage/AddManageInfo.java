package com.more.mes.smt.appmanage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.bd.service.BussModelService;
import com.more.fw.core.bd.service.impl.oracle.BussModelServiceImpl;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 新增app功能配置信息
 * 
 * @author Administrator
 *
 */
public class AddManageInfo extends BussModelServiceImpl implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings({ "unchecked", "rawtypes", "unused" })
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		Map<String, String> map = new HashMap<String, String>();
		try {
			String[] manageId = request.getParameterValues("selectName");// id

			String[] menuId = request.getParameterValues("menuId");// 导航菜单
			String[] moudleId = request.getParameterValues("moudleId");// 功能模块
			String[] showType = request.getParameterValues("showType");// 显示类型
			// String[] funName1 = request.getParameter("funName_1");//导航菜单v
			String[] funName = request.getParameterValues("funName_1");// 功能细项
			String[] dataType = request.getParameterValues("dataType");// paraArgs
			String[] paraArgs = request.getParameterValues("paraArgs");// dataComment
			String[] dataComment = request.getParameterValues("dataComment");// classCode
			String[] classCode = request.getParameterValues("classCode");// codeType
			String[] codeType = request.getParameterValues("codeType");// commSql
			String[] className = request.getParameterValues("className");// commSql
			String[] commSql = request.getParameterValues("commSql");// sqlserverSql
			String[] sqlserverSql = request.getParameterValues("sqlserverSql");// oracleSql
			String[] oracleSql = request.getParameterValues("oracleSql");// mysqlSql
			String[] mysqlSql = request.getParameterValues("mysqlSql");// pgSql
			String[] pgSql = request.getParameterValues("pgSql");// picId
			String[] picId = request.getParameterValues("picId");// isDefault
			// String[] isDefault = request.getParameterValues("isDefault");//showSeq
			String[] showSeq = request.getParameterValues("showSeq");// isStatus
			String[] functionLink = request.getParameterValues("functionLink");
			String[] picUrl = request.getParameterValues("picUrl");

			int count = manageId.length;
			if (count == 1 && manageId[0].equals("")) {
				String sql2 = " SELECT TAS_FUN_NAME from T_APP_SHOWMANAGE WHERE TAS_MENU_ID =?  AND TAS_MOUDLE_ID =? AND TAS_FUN_NAME =? ";
				int count2 = modelService.countSql(sql2, new Object[] { menuId[0], moudleId[0], funName[0] });
				if (count2 != 0) {
					return modelAction.alertParentInfo(modelAction.getText("当前导航菜单下此功能细项名称已存在,请更改"));
				}
				for (int i = 0; i < count; i++) {
					String sql3 = " SELECT TAS_FUN_NAME from T_APP_SHOWMANAGE WHERE TAS_MENU_ID =?  AND TAS_MOUDLE_ID =? AND TAS_SEQ =? ";
					int count3 = modelService.countSql(sql3,
							new Object[] { menuId[i], moudleId[i], Integer.parseInt(showSeq[i]) });
					if (count3 != 0) {
						return modelAction.alertParentInfo(modelAction.getText("当前导航菜单下此功能细项显示顺序重复,请更改"));
					}
				}
			} else {
				String sql2 = " SELECT TAS_FUN_NAME from T_APP_SHOWMANAGE WHERE TAS_MENU_ID =?  AND TAS_MOUDLE_ID =? AND TAS_FUN_NAME =? and id not in(?)";
				int count2 = modelService.countSql(sql2,
						new Object[] { menuId[0], moudleId[0], funName[0], manageId[0] });
				if (count2 != 0) {
					return modelAction.alertParentInfo(modelAction.getText("当前导航菜单下此功能细项名称已存在,请更改"));
				}
				for (int i = 0; i < count; i++) {
					String sql3 = " SELECT TAS_FUN_NAME from T_APP_SHOWMANAGE WHERE TAS_MENU_ID =?  AND TAS_MOUDLE_ID =? AND TAS_SEQ =? and id not in(?)";
					int count3 = modelService.countSql(sql3,
							new Object[] { menuId[i], moudleId[i], Integer.parseInt(showSeq[i]), manageId[i] });
					if (count3 != 0) {
						return modelAction.alertParentInfo(modelAction.getText("当前导航菜单下此功能细项显示顺序重复,请更改"));
					}
				}
			}

			TableDataMapExt appUser = new TableDataMapExt();
			appUser.setTableName("T_APP_SHOWMANAGE");
			String sql = "select id from T_APP_SHOWMANAGE where id=? ";
			String classSql = "select * from MS_CLASS_CODE where id=? ";
			String sql2 = " select PIC_NAME from SY_ADMIN_TARGET_PIC where id=? ";
			List<Map> aList = null;
			for (int i = 0; i < count; i++) {
				aList = modelService.listDataSql(sql, new Object[] { manageId[i] });
				Map<String, String> map2 = modelService.queryForMap(sql2, new Object[] { picId[i] });
				if (aList != null && aList.size() > 0) { // 存在数据则修改
					appUser.getColMap().clear();
					CommMethod.editSysDefCol(appUser.getColMap(), modelAction.getUser());
					appUser.setSqlWhere(" and id=? ");
					List<Object> wList = new ArrayList<Object>();
					wList.add(aList.get(0).get("ID"));
					appUser.setSqlWhereArgs(wList);
					appUser.getColMap().put("TAS_MENU_ID", menuId[i]);
					appUser.getColMap().put("TAS_MOUDLE_ID", moudleId[i]);
					appUser.getColMap().put("TAS_SHOW_TYPE", showType[i]);
					appUser.getColMap().put("TAS_FUN_NAME", funName[i]);
					// appUser.getColMap().put("TAS_IS_DEFAULT", isDefault[i]);
					if (StringUtils.isNotBlank(showSeq[i])) {
						appUser.getColMap().put("TAS_SEQ", Integer.parseInt(showSeq[i]));
					}
					// appUser.getColMap().put("TAS_STATUS", isStatus[i]);
					appUser.getColMap().put("TAS_DATA_TYPE", dataType[i]);
					String dataComm = getSqlJson(commSql[i], oracleSql[i], sqlserverSql[i], mysqlSql[i], pgSql[i]);
					appUser.getColMap().put("TAS_DATA_CONTENT", dataComm);
					if (StringUtils.isNotBlank(picId[i])) {
						appUser.getColMap().put("TAS_PIC_ID", picId[i]);
					}
					// appUser.getColMap().put("TAS_DISPLAY_MODE", displayMode[i]);
					appUser.getColMap().put("TAS_FUNCTION_LINK", functionLink[i]);
					if (null != map2 && map2.size() > 0) {
						appUser.getColMap().put("TAS_PIC_PATH", map2.get("PIC_NAME"));
					}
					// appUser.getColMap().put("TAS_PIC_PATH", pictureName);
					modelService.edit(appUser);
				} else { // 不存在数据则新增
					appUser.getColMap().clear();
					CommMethod.addSysDefCol(appUser.getColMap(), modelAction.getUser());
					appUser.getColMap().put("TAS_MENU_ID", menuId[i]);
					appUser.getColMap().put("TAS_MOUDLE_ID", moudleId[i]);
					appUser.getColMap().put("TAS_SHOW_TYPE", showType[i]);
					appUser.getColMap().put("TAS_FUN_NAME", funName[i]);
					// appUser.getColMap().put("TAS_IS_DEFAULT", isDefault[i]);
					if (StringUtils.isNotBlank(showSeq[i])) {
						appUser.getColMap().put("TAS_SEQ", Integer.parseInt(showSeq[i]));
					}
					// appUser.getColMap().put("TAS_STATUS", isStatus[i]);
					appUser.getColMap().put("TAS_DATA_TYPE", dataType[i]);
					String dataComm = getSqlJson(commSql[i], oracleSql[i], sqlserverSql[i], mysqlSql[i], pgSql[i]);
					appUser.getColMap().put("TAS_DATA_CONTENT", dataComm);
					// if(picId.length!=1&&!picId[0].equals("null")){
					appUser.getColMap().put("TAS_PIC_ID", picId[i]);
					// }

					// appUser.getColMap().put("TAS_DISPLAY_MODE", displayMode[i]);
					appUser.getColMap().put("TAS_FUNCTION_LINK", functionLink[i]);
					if (null != map2 && map2.size() > 0) {
						appUser.getColMap().put("TAS_PIC_PATH", map2.get("PIC_NAME"));
					}
					// appUser.getColMap().put("TAS_PIC_PATH", pictureName);
					// appUser.getColMap().put("TAS_UNIT", unit[i]);

					modelService.save(appUser);
				}
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("保存失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("保存成功"));
	}

	// 提交类
	public void changeEditClass(ModelAction modelAction, ModelService modelService, String codeType, String className,
			String dataComment, Map<String, Object> map) {
		String version = null;
		switch (codeType) {
		case "CODE_BASE":
			if (map.get("MC_ID_BASE") != null) {
				version = map.get("MC_ID_BASE").toString();
			}
			break;
		case "CODE_ORACLE":
			if (map.get("MC_ID_ORACLE") != null) {
				version = map.get("MC_ID_ORACLE").toString();
			}
			break;
		case "CODE_SQLSERVER":
			if (map.get("MC_ID_SQLSERVER") != null) {
				version = map.get("MC_ID_SQLSERVER").toString();
			}
			break;
		case "CODE_MYSQL":
			if (map.get("MC_ID_MYSQL") != null) {
				version = map.get("MC_ID_MYSQL").toString();
			}
			break;
		case "CODE_PG":
			if (map.get("MC_ID_PG") != null) {
				version = map.get("MC_ID_PG").toString();
			}
			break;
		default:
			break;
		}
		if (version == null) {
			throw new BussException(modelAction.getText("页面中类版本不存在请核实!"));
		}
		String id = map.get("ID").toString();
		boolean flag = CommMethod.judgeVersion(id, "MS_CLASS_CODE", version, codeType);
		if (!flag) {
			throw new BussException(modelAction.getText("修改失败，已有其他人优先你提交!"));
		}

		String sql = "insert into MS_CLASS_CODE_HISTORY select * from MS_CLASS_CODE where id=?";
		modelService.execSql(sql, new Object[] { id });// 保存历史记录
		Map<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("CLASS_NAME", className);
		dataMap.put("codeType", codeType);
		dataMap.put("clsCode", dataComment);
		dataMap.put("tableName", "T_APP_SHOWMANAGE");
		dataMap.put("colName", "TAS_CLASS_CODE_ID");
		dataMap.put("CODE_ID", id);
		BussModelService busModel = new BussModelServiceImpl();
		busModel.commEditClsCode(dataMap, CommMethod.getSessionUser());
	}

	/**
	 * sql语句转json字符串
	 * 
	 * @return
	 */
	public String getSqlJson(String commSql, String oracleSql, String sqlserverSql, String mysqlSql, String pgSql) {
		Map<String, String> jsonMap = new HashMap<String, String>();

		jsonMap.put(Constants.DB_DIALECT_COMMSQL, commSql.replaceAll(";", ""));
		jsonMap.put(Constants.DB_DIALECT_ORACLE, oracleSql.replaceAll(";", ""));
		jsonMap.put(Constants.DB_DIALECT_SQLSERVER, sqlserverSql.replaceAll(";", ""));
		jsonMap.put(Constants.DB_DIALECT_MYSQL, mysqlSql.replaceAll(";", ""));
		jsonMap.put(Constants.DB_DIALECT_PG, pgSql.replaceAll(";", ""));
		return CommMethod.toJson(jsonMap);
	}

}
