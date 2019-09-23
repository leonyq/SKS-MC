package com.more.mes.smt.wmsstoragetactics.pg;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 删除仓库存储策略信息
 * @author development
 *
 */
public class DelStorageTactics implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		try {
			String delId = request.getParameter("delId");//需要删除的id
			String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
			if(delId!=null&& !delId.equals("")) {
				String[] strArray = delId.split(",");
				//判断删除的是否存在于子级区域
				String sql = "SELECT t.* FROM T_WMS_STORAGE_TACTICS t WHERE t.id=? ";
				//String querySql = "select * from T_WMS_AREA t start with t.wa_area_sn=? " +
				//		"connect by prior t.wa_area_sn=t.wa_superior_sn";
				String querySql =" WITH RECURSIVE T  AS ( "+
				                 "  SELECT * "+
				                 " FROM T_WMS_AREA "+
				                 " WHERE wa_area_sn =? and data_auth = ? "+                                    
				                 " UNION ALL "+
				                 " SELECT  d.* "+
				                 " FROM T_WMS_AREA D   "+
				                 " JOIN T ON D.wa_superior_sn = T.wa_area_sn and D.data_auth = ? "+
				                 " ) "+
				                 " SELECT * FROM T ";
				
				String checkSql = "SELECT t.* FROM T_WMS_STORAGE_TACTICS t WHERE t.wst_area_sn=? and t.data_auth=? ";
				boolean flag = false;
				for(int i=0;i<strArray.length;i++){
					List<Map> pList = modelService.listDataSql(sql, new Object[] { CommMethod.escapeJs(strArray[i])});
					String whCode = "";
					String ctrlType = "";
					String ctrlVal = "";
					if(pList!=null && !pList.isEmpty()) {
						whCode = (String) pList.get(0).get("WST_AREA_SN");
						ctrlType = (String) pList.get(0).get("WST_CONTRAL_TYPE");
						ctrlVal = (String) pList.get(0).get("WST_CONTRAL_VALUE");
					}
					//取出所选择的仓库下的子区域
					List<Map> sList = modelService.listDataSql(querySql, new Object[] { whCode,dataAuth,dataAuth });
					if(ctrlType.equals("1")){//如果要删除的物料类型为物料类型，则还需要判断子区域是否有该物料类别的物料代码管控
						//取出子级的存储策略
	    				for(int s=1;s<sList.size();s++){
	    					//取出子级的存储策略
	    					List<Map> cList = modelService.listDataSql(checkSql, new Object[] { sList.get(s).get("WA_AREA_SN"),dataAuth });
	    					String type = null;
	    					String ctrl = null;
	    				    for(int c=0;c<cList.size();c++){
	    				        type = (String) cList.get(c).get("WST_CONTRAL_TYPE");
	    						ctrl = (String) cList.get(c).get("WST_CONTRAL_VALUE");
	    						if(type.equals("2")){
	    						    //取出该子级的物料类别
	    						    String sqlC = "SELECT CI_ITEM_GENRE FROM T_CO_ITEM WHERE ci_item_code = ? AND data_auth = ?";
	    						    List<Map> listC = modelService.listDataSql(sqlC , new Object[]{ctrl , dataAuth});
	    						    if(listC!=null && !listC.isEmpty()) {
		    						    ctrl = String.valueOf(listC.get(0).get("CI_ITEM_GENRE"));
		    						    if(ctrl.equals(ctrlVal)){
		    						        flag = true;
		    						        break;
		    						    }
	    						    }
	    						}
	    				    }
	    				}
	    				if(flag){
							return modelAction.alertParentInfo(modelAction.getText("子级包含所选存储策略"));
						}
					}
					for(int s=1;s<sList.size();s++){
						//取出子级的存储策略
						List<Map> cList = modelService.listDataSql(checkSql, new Object[] { sList.get(s).get("WA_AREA_SN"),dataAuth });
						String type = null;
						String ctrl = null;
						//库区、仓库判断
						for(int c=0;c<cList.size();c++){
							type = (String) cList.get(c).get("WST_CONTRAL_TYPE");
							ctrl = (String) cList.get(c).get("WST_CONTRAL_VALUE");
							if(type.equals(ctrlType)&&ctrl.equals(ctrlVal)){//如果子级有则不允许删除
								flag = true;
								break;
							}
						}
						if(flag){
							return modelAction.alertParentInfo(modelAction.getText("子级包含所选存储策略"));
						}
					}
				}
				//验证通过则删除
				TableDataMapExt delwms1 = new TableDataMapExt();
				List list = new ArrayList();
				delwms1.setTableName("T_WMS_STORAGE_TACTICS");
				StringBuffer sqlWhere = new StringBuffer(" AND ID IN(");
				for(int i=0;i<strArray.length;i++){
					list.add(strArray[i]);
					if(i == strArray.length-1) {
						sqlWhere.append("?)");
						break;
					}
					sqlWhere.append("?,");
				}
				delwms1.setSqlWhere(sqlWhere.toString());
				delwms1.setSqlWhereArgs(list);
				modelService.del(delwms1);
			}
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("删除失败"), e);
		}
		return modelAction.reloadParent(modelAction.getText("删除成功"));
	}

}
