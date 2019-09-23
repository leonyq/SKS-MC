package com.more.mes.smt.handitem;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存解除关联的点位信息
 * @author Administrator
 *
 */
public class SaveRemovePointInfo implements FuncService{

	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		String proSn = request.getParameter("whlSn");//产品SN
		String points = request.getParameter("point");
		String[] point = points.split(",");
		int num = point.length;
		Map<String, Object> map = new HashMap<String, Object>();
		String sql = "select id from T_WIP_HAND_ITEM_LOG where WHL_SN=? and WHL_POINT like '%'||?||'%' ";
		int flag = 0;
		for(int i=0;i<num;i++){
			int count = modelService.countSql(sql, new Object[]{proSn,point[i]});
			if(count<1){//若有点位没有关联
				String sql1 = "select id from T_WIP_HANDSTICK_LOG where WHL_SN=? and WHL_POINT like '%'||?||'%' ";
				int count1 = modelService.countSql(sql1, new Object[]{proSn,point[i]});
				if(count1<1){//若有点位没有关联
					flag=1;
					map.put("res", "点位"+point[i]+"未找到记录");
					break;
				}
			}
			map.put("count", count);
		}
		if(flag==0){//输入的信息正常
			String sql2 = "select id from T_WIP_HAND_ITEM_LOG where WHL_SN=? and WHL_POINT like '%'||?||'%' ";
			int count = modelService.countSql(sql2, new Object[]{proSn,points});
			if(count>0){
				String upSql = "update T_WIP_HAND_ITEM_LOG set WHL_POINT=replace(WHL_POINT,?,''),WHL_POINT_NUM=WHL_POINT_NUM-? " +
						"where WHL_SN=? and WHL_POINT like '%'||?||'%' ";
				String pointStr = points;
				if(num>1){
					pointStr = "," + points;
				}
				modelService.execSql(upSql, new Object[]{pointStr,num,proSn,points});
				String sql3 = "delete from T_WIP_HAND_ITEM_LOG where WHL_SN=? and WHL_POINT_NUM=0 ";
				modelService.execSql(sql3, new Object[]{proSn});
			}else{
				String upSql = "update T_WIP_HANDSTICK_LOG set WHL_POINT=replace(WHL_POINT,?,''),WHL_POINT_NUM=WHL_POINT_NUM-? " +
						"where WHL_SN=? and WHL_POINT like '%'||?||'%' ";
				String pointStr = points;
				if(num>1){
					pointStr = "," + points;
				}
				modelService.execSql(upSql, new Object[]{pointStr,num,proSn,points});
				String sql3 = "delete from T_WIP_HANDSTICK_LOG where WHL_SN=? and WHL_POINT_NUM=0 ";
				modelService.execSql(sql3, new Object[]{proSn});
			}
			map.put("res", "succ");
			map.put("count", count);
		}
		modelAction.setAjaxMap(map);
		return BaseActionSupport.AJAX;
	}

}
