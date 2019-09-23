package com.more.mes.erpservice.writeback;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.mes.erpservice.writeback.util.WsServiceUtil;

import net.sf.json.JSONObject;
/**
 * 金碟u8ERP
 * 工单手动关结回写
 * 
 * @author Administrator
 *
 */
public class WbPlanErpServiceJob implements IJobx {
	private ModelService modelService = (ModelService) SpringContextUtil.getBean("modelService");
	/**
	 */
	@Override
	public void exec(Args args) throws Exception {
		planerp(null);
	}
	public String planerp(String docnum){
		String result = "";
		List<Map<String, String>> list = this.getList(docnum);
		if (list != null && list.size() > 0) {
			result = deal(list);
		}else{
			result="没有回写数据";
		}
		return result;
	}
	
    @SuppressWarnings("unchecked")
	private String deal(List<Map<String, String>> list) {
    	StringBuilder result = new StringBuilder();
		int size = list.size();
		for (int i = 0; i < size; i++) {
			Map<String, String> temp = list.get(i);
			Map<String, String> jsonMap = new HashMap<String, String>();
			jsonMap.put("MoCode", temp.get("MOCODE"));// 生产订单编号
			jsonMap.put("MoDID", temp.get("MODID"));// 产品代码
			jsonMap.put("cacc", temp.get("CACC"));// 账套号
		
			String ID = temp.get("ID");//
			String PROJECT_ID=temp.get("PROJECT_ID");
			String json = JSONObject.fromObject(jsonMap).toString();
			String MethodName = "U8ProductionStatic";
			MsHTranMan tran = BussService.getHbTran();
			try {
				Map<String, String> map = WsServiceUtil.postService(MethodName, json, "工单手动关结回写", 41,PROJECT_ID, ID);
				if (map.get("errcode").equals(WsServiceUtil.RESULTCODE_SUCCESS)) {
					TableDataMapExt detail = new TableDataMapExt();
					detail.setTableName("T_PM_PROJECT_BASE");
					detail.setSqlWhere(" AND ID='" + ID + "'");
					detail.getColMap().put("PM_UPLOAD_FLAG", "Y");
					detail.getColMap().put("PM_UPLOAD_TIME", new Date());
					modelService.edit(detail);
				} else {
					result.append("工单号：" + PROJECT_ID + "、生产订单:" + temp.get("MOCODE") + "，产品代码:" + temp.get("MODID") + "回写失败;");
				}
				tran.commit();
			} catch (Exception e) {
				tran.rollback();
			}
		}
		return result.toString();
	}
	/**
	 * 获取手动关结未回写的工单数据集合
	 * @param WRD_DOC_NUM
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, String>> getList(String PROJECT_ID){
		String sql="SELECT T.PROJECT_ID,T2.PPE_PLAN_ORDER MoCode,T2.PPE_ITEM_CODE MoDID,T2.PPE_SOB Cacc,T.ID FROM  T_PM_PROJECT_BASE T "+
				"INNER JOIN T_PM_PLAN_ERP T2 ON T.ERP_PROJECT_ID=T2.PPE_RELATION "+
				"WHERE T.PROJECT_STATUS='4' AND T.PM_UPLOAD_FLAG='N'";
		if(StringUtils.isNotBlank(PROJECT_ID)){
			sql+=" AND T.PROJECT_ID='"+PROJECT_ID+"'";
		}
		List<Map<String, String>> list =modelService.listDataSql(sql);
		return list;
	}
}
