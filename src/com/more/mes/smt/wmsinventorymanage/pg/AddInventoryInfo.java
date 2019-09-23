package com.more.mes.smt.wmsinventorymanage.pg;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.ConstantsMc;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.mes.smt.getsnhttp.service.GetSnService;

/**
 * 保存新增的盘点单信息
 * 
 * @author development
 */
public class AddInventoryInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	MsHTranMan hbtran = BussService.getHbTran();

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth = request.getParameter("_DATA_AUTH");
		String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
		if (!CommMethod.isRepeatSubmit(request)) {
			CommMethod.rmSessionMap(modelAction.getSession(), ConstantsMc.FORM_TOKEN);
		} else {
			// return ajaxTableAlertInfoClear("请不要重复提交表单！", "2");//ajaxTableAlertInfoClear
			return modelAction.alertParentInfo(modelAction.getText("请不要重复提交表单！"));
		}

		String formId = request.getParameter("formId");
		if (StringUtils.isBlank(formId)) {
			formId = request.getParameter("formIds");
		}
		String iframeId = request.getParameter("iframeId");
		try {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
			String WID_DOC_NUM = null;// 盘点单号
			String invDate = request.getParameter("paraMap1@0#T2#WID_INVENTORY_DATE");// 盘点日期
			String itemCode = request.getParameter("paraMap1@0#WII_ITEM_CODE");// 物料料号
			String custCode = request.getParameter("paraMap1@0#WID_CUST_CODE");// 客户
			String supCode = request.getParameter("paraMap1@0#WID_SUP_CODE");// 供应商
			String whCode = request.getParameter("paraMap1@0#WID_WH_CODE");// 仓库
			String districtCode = request.getParameter("paraMap1@0#WID_DISTRICT_CODE");// 库区
			String storageCode = request.getParameter("paraMap1@0#WID_STORAGE_CODE");// 库位
			String storeEmp = request.getParameter("paraMap1@0#WII_STORE_EMP");// 库管员
			String invenCount0 = request.getParameter("paraMap1@0#WII_INVENTORY_COUNT");// 当月盘点次数
			int invenCount = 0;
			if (invenCount0 != null && !invenCount0.equals("") && !invenCount0.equals("null")) {
				invenCount = Integer.valueOf(invenCount0);
			}
			// 新增盘点单物料信息
			String sqlWhere = "";
			String sqlWhere1 = "";// 有当月盘点次数 条件
			ArrayList<Object> list = new ArrayList<Object>();
			if (StringUtils.isNotBlank(itemCode)) {
				sqlWhere += " and t.WSI_ITEM_CODE =?";
				sqlWhere1 += " and b.wid_item_code =?";
				list.add(itemCode);
			}
			if (StringUtils.isNotBlank(custCode)) {
				sqlWhere += " and t.wsi_cust_code =?";
				sqlWhere1 += " and b.wid_cust_code =?";
				list.add(custCode);
			}
			if (StringUtils.isNotBlank(supCode)) {
				sqlWhere += " and t.wsi_sup_code =?";
				sqlWhere1 += " and b.wid_sup_code =?";
				list.add(supCode);
			}
			if (StringUtils.isNotBlank(whCode)) {
				sqlWhere += " and t.wsi_wh_code =?";
				sqlWhere1 += " and b.wid_wh_code =?";
				list.add(whCode);
			}
			if (StringUtils.isNotBlank(districtCode)) {
				sqlWhere += " and t.wsi_district_code =?";
				sqlWhere1 += " and b.wid_district_code =?";
				list.add(districtCode);
			}
			if (StringUtils.isNotBlank(storageCode)) {
				sqlWhere += " and t.wsi_storage_code =?";
				sqlWhere1 += " and b.wid_storage_code =?";
				list.add(storageCode);
			}
			if (StringUtils.isNotBlank(storeEmp)) {
				sqlWhere += " and  t8.WIC_CTRL_EMP=?";
				sqlWhere1 += " and t8.WIC_CTRL_EMP =?";
				list.add(storeEmp);
			}
			String sql = "select t.wsi_item_code,SUM(t.wsi_item_num) item_num " + "from T_WMS_STOCK_INFO t ";
			if (!storeEmp.equals("")) {
				sql += "LEFT JOIN T_WMS_ITEM_CONTRAL t8 ON t8.WIC_ITEM_CODE=t.wsi_item_code and t8.DATA_AUTH=?  ";
				list.add(dataAuth);
			}
			sql += "where 1=1 and NOT exists(select 1 from T_WMS_INVENTORY_DETAIL a where a.WID_ITEM_SN=t.WSI_ITEM_SN "
					+ " and a.DATA_AUTH=? ) and t.DATA_AUTH=? ";
			list.add(dataAuth);
			list.add(dataAuth);
			String groupSql = " GROUP BY t.wsi_item_code ";
			String querySql = null;
			if (invenCount > 0) {
				sql += " and t.WSI_ITEM_SN IN(SELECT B.WID_ITEM_SN FROM T_WMS_INVENTORY_DETAIL_L b "
						+ "WHERE b.wid_inventory_time>= date_trunc('month', CURRENT_DATE) and b.DATA_AUTH=? "
						+ "AND b.wid_inventory_time<date_trunc('month', CURRENT_DATE) + interval '1 month' " + sqlWhere1
						+ " GROUP BY B.WID_ITEM_SN HAVING COUNT(b.wid_item_sn) =? )";
				list.add(dataAuth);
				list.add(invenCount);
				querySql = " select * from(" + sql + groupSql + ")aa ";
			} else {
				querySql = " select * from(" + sql + sqlWhere + groupSql + ")aa ";
			}
			// 查询条件转object数组
			int liSize = list.size();
			Object[] iobj = new Object[liSize];
			for (int i = 0; i < liSize; i++) {
				iobj[i] = list.get(i);
			}
			Object[] obj = new Object[liSize + 4];
			List<Map> itemList = modelService.listDataSql(querySql, iobj);
			if (itemList != null && itemList.size() > 0) {
				// WID_DOC_NUM = getReceiveNo(dataAuth, "DJ17", "", modelService);
				GetSnService gss = new GetSnService();
				String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
				WID_DOC_NUM = gss.getSnForDocNum("DJ17", "", userId, dataAuth);
				if (WID_DOC_NUM.indexOf("NG") != -1) {
					return modelAction.alertParentInfo(WID_DOC_NUM);
				}
				obj[0] = CommMethod.getSessionUser().getId();
				obj[1] = DateUtil.getCurDate();
				obj[2] = WID_DOC_NUM;
				obj[3] = dataAuth;
				for (int i = 4; i < liSize + 4; i++) {
					obj[i] = list.get(i - 4);
				}
				TableDataMapExt invItem = new TableDataMapExt();
				invItem.setTableName("T_WMS_INVENTORY_ITEM");
				String inSql = "insert into T_WMS_INVENTORY_ITEM(ID,CREATE_USER,CREATE_TIME,WII_DOC_NUM,WII_ITEM_CODE,WII_STOCK_NUM,WII_INVENTORY_NUM,WII_PROFIT_NUM,DATA_AUTH)"
						+ "SELECT F_C_GETNEWID(),?,?,?,WSI_ITEM_CODE,ITEM_NUM,0,0,? FROM(" + querySql + ")bb ";
				modelService.execSql(inSql, obj);
			} else {
				hbtran.rollback();
				return modelAction.alertParentInfo(modelAction.getText("物料已盘点"));
			}

			// 新增盘点单明细信息
			// 先查询出物料汇总信息（新增用）
			String sql1 = "select t.* from t_wms_stock_info t ";
			if (!storeEmp.equals("")) {
				sql1 += "LEFT JOIN T_WMS_ITEM_CONTRAL t8 ON t8.WIC_ITEM_CODE=t.wsi_item_code and t8.DATA_AUTH=? ";
			}
			sql1 += "where 1=1 and NOT exists(select 1 from T_WMS_INVENTORY_DETAIL a where a.WID_ITEM_SN=t.WSI_ITEM_SN "
					+ " and a.DATA_AUTH=? ) and t.DATA_AUTH=? ";
			if (invenCount > 0) {
				sql1 += " and t.WSI_ITEM_SN IN(SELECT B.WID_ITEM_SN FROM T_WMS_INVENTORY_DETAIL_L b "
						+ "WHERE b.wid_inventory_time>= date_trunc('month', CURRENT_DATE) and b.DATA_AUTH=? "
						+ "b.wid_inventory_time<date_trunc('month', CURRENT_DATE) + interval '1 month' " + sqlWhere1
						+ " GROUP BY B.WID_ITEM_SN HAVING COUNT(b.wid_item_sn) = ? )";
			} else {
				sql1 = sql1 + sqlWhere;
			}
			// id（修改用）
			String sqlEdit = "select t.id from t_wms_stock_info t ";
			if (!storeEmp.equals("")) {
				sqlEdit += "LEFT JOIN T_WMS_ITEM_CONTRAL t8 ON t8.WIC_ITEM_CODE=t.wsi_item_code and t8.DATA_AUTH=? ";
			}
			sqlEdit += "where 1=1 and NOT exists(select 1 from T_WMS_INVENTORY_DETAIL a where a.WID_ITEM_SN=t.WSI_ITEM_SN "
					+ " and a.DATA_AUTH=? ) and t.DATA_AUTH=? ";
			if (invenCount > 0) {
				sqlEdit += " and t.WSI_ITEM_SN IN(SELECT B.WID_ITEM_SN FROM T_WMS_INVENTORY_DETAIL_L b "
						+ "WHERE b.wid_inventory_time>= date_trunc('month', CURRENT_DATE) and b.DATA_AUTH=? "
						+ "b.wid_inventory_time<date_trunc('month', CURRENT_DATE) + interval '1 month' " + sqlWhere1
						+ " GROUP BY B.WID_ITEM_SN HAVING COUNT(b.wid_item_sn) =? )";
			} else {
				sqlEdit = sqlEdit + sqlWhere;
			}
			Date sysTime = DateUtil.getCurDate();// 当前时间
			String user = CommMethod.getSessionUser().getId();// 登录人
			// 修改库存状态为盘点
			String editSql = "update t_wms_stock_info set WSI_STOCK_FLAG = '5',EDIT_USER = ?,EDIT_TIME = ?,DATA_AUTH = ? where id in  ("
					+ sqlEdit + ")";
			String insertSql = "INSERT INTO T_WMS_INVENTORY_DETAIL" + "(ID," + "dept_id ," + "create_user ,"
					+ "create_time ," + "data_auth ," + "wid_item_id ," + "wid_item_sn ," + "wid_doc_num  ,"
					+ "wid_item_code ," + "wid_stock_num ," + "wid_inventory_num ," + "wid_profit_num ,"
					+ "wid_sup_code ," + "wid_cust_code ," + "wid_wh_code ," + "wid_district_code ,"
					+ "wid_storage_code ," + "wid_item_status ," + "wid_storage_status)" + "SELECT F_C_GETNEWID(),"
					+ "?," + "?," + "now()," + "?,"
					+ "(select t.ID from T_WMS_INVENTORY_ITEM t where t.WII_DOC_NUM=? and t.WII_ITEM_CODE=WSI_ITEM_CODE),"
					+ "WSI_ITEM_SN," + "?," + "WSI_ITEM_CODE," + "WSI_ITEM_NUM," + "0," + "0," + "WSI_SUP_CODE,"
					+ "WSI_CUST_CODE," + "WSI_WH_CODE," + "WSI_DISTRICT_CODE," + "WSI_STORAGE_CODE," + "'1',"
					+ "WSI_STOCK_FLAG" + "  FROM (" + sql1 + ")bb ";
			Object[] obj1 = new Object[liSize + 3];// 两个固定参数
			obj1[0] = user;
			obj1[1] = sysTime;
			obj1[2] = dataAuth;
			for (int i = 3; i < liSize + 3; i++) {
				obj1[i] = list.get(i - 3);
			}
			Object[] obj2 = new Object[liSize + 5];
			obj2[0] = dataAuth;
			obj2[1] = user;
			obj2[2] = dataAuth;
			obj2[3] = WID_DOC_NUM;
			obj2[4] = WID_DOC_NUM;
			for (int i = 5; i < liSize + 5; i++) {
				obj2[i] = list.get(i - 5);
			}
			modelService.execSql(insertSql, obj2);
			modelService.execSql(editSql, obj1);
			// 增加仓库单据信息表数据
			TableDataMapExt wms = new TableDataMapExt();
			wms.setTableName("T_WMS_DOC_INFO");
			CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
			wms.getColMap().put("ID", StringUtils.getUUID());
			wms.getColMap().put("WDI_DOC_NUM", WID_DOC_NUM);
			wms.getColMap().put("WDI_STATUS", "1");
			wms.getColMap().put("WDI_DOC_TYPE", "DJ17");
			wms.getColMap().put("WDI_CREATE_MAN", CommMethod.getSessionUser().getId());
			wms.getColMap().put("WDI_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
			if (dataAuth != null) {
				wms.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.save(wms);
			// 新增盘点单信息
			TableDataMapExt inv = new TableDataMapExt();
			inv.setTableName("T_WMS_INVENTORY_DOC");
			CommMethod.addSysDefCol(inv.getColMap(), modelAction.getUser());
			inv.getColMap().put("ID", StringUtils.getUUID());
			inv.getColMap().put("WID_DOC_NUM", WID_DOC_NUM);
			inv.getColMap().put("WID_DOC_TYPE", "DJ17");
			inv.getColMap().put("WID_STATUS", "1");
			if (!invDate.equals("")) {
				inv.getColMap().put("WID_INVENTORY_DATE", sdf2.parse(invDate));
			}
			inv.getColMap().put("WID_CREATE_MAN", CommMethod.getSessionUser().getId());
			inv.getColMap().put("WID_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
			if (dataAuth != null) {
				inv.getColMap().put("DATA_AUTH", dataAuth);
			}
			modelService.save(inv);
		} catch (Exception e) {
			hbtran.rollback();
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}
		hbtran.commit();
		return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

	@SuppressWarnings("unchecked")
	public String getReceiveNo(String dataAuth, String prefix, String dispatchSn, ModelService modelService) {
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = { 1, 2, 3 };
		int[] outplace = { 4, 5 };
		List<Object> list = new ArrayList<Object>();
		List<Object> outType = new ArrayList<Object>();
		list.add(dataAuth);
		list.add(prefix);
		list.add(dispatchSn);
		outType.add("String");
		outType.add("String");
		pf.setClassName("P_C_GET_DOC_NO");// 生成检验单号
		pf.setInPlace(inPlace);// 存储过程中in
		pf.setOutPlace(outplace); // 存储过程中out
		pf.setValArgs(list);// 存储过程中输入的参数
		pf.setTotalLen(list.size() + outType.size());// 总个数
		pf.setOutValType(outType);// 输出的参数
		List<Object> relist = modelService.procComm(pf);// 接收返回值
		String res = (String) relist.get(0); // 结果
		return res;
	}

}
