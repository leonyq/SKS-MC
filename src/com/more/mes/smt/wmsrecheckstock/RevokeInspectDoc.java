package com.more.mes.smt.wmsrecheckstock;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 库存复检-撤销
 * 
 * @author development
 *
 */
public class RevokeInspectDoc implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String auth = request.getSession().getAttribute("mcDataAuth").toString();
		try {
			String delId = request.getParameter("delId");// 需要撤销的id
			String[] strArray = delId.split(",");
			// 取出对应的检验单号与所对应的产品sn
			String sql = "SELECT t.wrd_test_doc,t.wrd_doc_num FROM T_WMS_RECHECK_DOC t " + "where t.id=?";
			List<Map> pList = null;
			TableDataMapExt ins = new TableDataMapExt();
			ins.setTableName("T_QM_INSPECT_INFO");

			TableDataMapExt ins1 = new TableDataMapExt();
			ins1.setTableName("T_QM_INSEPCT_PARENT_INFO");
			int num = strArray.length;
			for (int i = 0; i < num; i++) {
				pList = modelService.listDataSql(sql, new Object[] { strArray[i] });
				ins.setSqlWhere(" and QII_INSPECT_SN=? and DATA_AUTH=? ");
				List<Object> wList = new ArrayList<Object>();
				wList.add(pList.get(0).get("WRD_TEST_DOC"));
				wList.add(auth);
				ins.setSqlWhereArgs(wList);
				ins.getColMap().put("QII_LIST_FLAG", "5");// 状态(1-待检 ，2-检验中，3-检验完成 ，4-已审核， 5-撤销)
				ins.getColMap().put("QII_CANCEL_TIME", DateUtil.getCurDate());// 撤销时间
				ins.getColMap().put("QII_CANCEL_EMP", CommMethod.getSessionUser().getId());// 撤销人
				modelService.edit(ins);

				ins1.setSqlWhere(" and QIP_INSPECT_SN=? and DATA_AUTH=? ");
				ins1.setSqlWhereArgs(wList);
				ins1.getColMap().put("QIP_TEST_FLAG", "3");// 检验状态(1-已检验，2-未检验，3-已撤销)
				modelService.edit(ins1);

				// 修改库存表物料sn状态
				String upSql = "UPDATE T_WMS_STOCK_INFO T SET WSI_STOCK_FLAG='2' " + "WHERE T.WSI_ITEM_SN IN ("
						+ "SELECT A.WRD_ITEM_SN FROM T_WMS_RECHECK_DETAIL A WHERE A.WRD_DOC_NUM=?"
						+ "and A.DATA_AUTH=? )" + " and t.DATA_AUTH=?  ";
				modelService.execSql(upSql, new Object[] { pList.get(0).get("WRD_DOC_NUM"), auth, auth });
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("撤销失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("撤销成功"));
	}

}
