package com.more.mes.smt.materielonline;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 在线料表删除
 * @author development
 *
 */
public class DelMaterialOnline implements FuncService {
	
	private final Log log = LogFactory.getLog(this.getClass());

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String dataAuth=request.getSession().getAttribute("mcDataAuth").toString();
		try {
			List<Object> sqlList = null;
			String delId = request.getParameter("delId");//需要删除的id
			if(delId!=null && !delId.equals("")) {
				String[] strArray = delId.split(",");
				//删除在线料表信息
				TableDataMapExt delmat = new TableDataMapExt();
				delmat.setTableName("T_CO_MATERIAL_ONLINE");
				for(int i=0;i<strArray.length;i++){
					sqlList = new ArrayList<Object>();
					sqlList.add(strArray[i]);
					delmat.setSqlWhere(" and ID=? ");
					delmat.setSqlWhereArgs(sqlList);
				 	modelService.del(delmat);
				}
				//删除该设备的所有明细时，删除 T_PM_DEVICE_ONLINE 表中该设备SN的记录
				String sql = "DELETE FROM T_PM_DEVICE_ONLINE WHERE pdo_device_sn IN(" +
						"select t.pdo_device_sn from T_PM_DEVICE_ONLINE t WHERE NOT EXISTS" +
						"(SELECT 1 FROM T_CO_MATERIAL_ONLINE a WHERE a.cmo_area_sn=t.pdo_area_sn AND a.cmo_device_seq=t.pdo_device_seq))"
						+ " AND DATA_AUTH=? ";
			    modelService.execSql(sql,new Object[] {dataAuth});
			}else {
				return modelAction.alertParentInfo(modelAction.getText("需要删除的id为空"));
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("删除失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("删除成功"));
	}

}
