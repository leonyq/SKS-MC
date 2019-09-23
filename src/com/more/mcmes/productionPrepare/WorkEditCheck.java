package com.more.mcmes.productionPrepare;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.base.core.action.BaseActionSupport;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;
/**
 * 处理检测结果
 * @author Administrator
 *
 */
public class WorkEditCheck implements FuncService{
	private final Log log = LogFactory.getLog(this.getClass());
	
	@SuppressWarnings("unchecked")
    @Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		// 是否关闭窗口
        String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
        String formId = request.getParameter("formId");
        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        if (StringUtils.isBlank(formId)) {
            formId = request.getParameter("formIds");
        }
        String iframeId = request.getParameter("iframeId");
        String projectId = request.getParameter("projectId");
        String pmCheckStust = request.getParameter("pmCheckStust");
        String pmMemo = request.getParameter("pmMemo");
        String sql = "select id from T_PM_PROJECT_FEED_BASE where PROJECT_ID =? AND DATA_AUTH=? ";
        List list = modelService.listDataSql(sql, new Object[]{projectId, dataAuth});
        if (list == null && list.size() == 0) {
             modelAction.setAjaxString("该工单不存在");
            return BaseActionSupport.AJAX;
            //return modelAction.alertParentInfo((modelAction.getText("该工单不存在")));
        }
        if (null == pmCheckStust ) {
            modelAction.setAjaxString("请处理检测结果!");
            return BaseActionSupport.AJAX;
            //return modelAction.alertParentInfo((modelAction.getText("请处理检测结果！"+pmCheckStust)));
        }
        boolean flag = false;

        String userId = modelAction.getCurrUser().getId();
        String deptId = modelAction.getCurrUser().getDeptId();
        
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date sysDate = DateUtil.parseDate(sdf1.format(new Date()), "yyyy-MM-dd HH:mm:ss");

        TableDataMapExt tdmap = new TableDataMapExt();
        tdmap.setTableName("T_PM_PROJECT_BASE");
        CommMethod.addSysDefCol(tdmap.getColMap(), modelAction.getUser());
        Map map = tdmap.getColMap();
        map.put("ID", StringUtils.getUUID());
        map.put("DEPT_ID", deptId);
        map.put("CREATE_USER", userId);
        map.put("CREATE_TIME", sysDate);
        map.put("EDIT_USER", "");
        map.put("EDIT_TIME", "");
        if (StringUtils.isNotBlank(dataAuth)) {
            map.put("DATA_AUTH", dataAuth);
        }
        map.put("PROJECT_ID", projectId);
        map.put("PM_CHECK_STUST", pmCheckStust);
        map.put("PM_MEMO", pmMemo);
        List<Object> sqlWlist = new ArrayList<Object>();
        sqlWlist.add(projectId);
        tdmap.setSqlWhere(" and PROJECT_ID= ?");
        tdmap.setSqlWhereArgs(sqlWlist);
        int res = modelService.edit(tdmap);
        if (res < 0) {
            flag = false;
            modelAction.setAjaxString("检测结果提交失败");
            return BaseActionSupport.AJAX;
           // return modelAction.alertParentInfo("检测结果提交失败");
        }else{
            flag = true;
        }
        if (flag == true) {
            isCloseWin = "0";
             modelAction.setAjaxString("ok");
            return BaseActionSupport.AJAX;
            //return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), isCloseWin);
          } else {
               modelAction.setAjaxString("检测结果提交失败");
               return BaseActionSupport.AJAX;
              //return modelAction.alertParentInfo("修改失败");
          }
	}

}
