package com.more.mcmes.projectBasePrepare;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.*;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

/**
 * 产品包装-保存
 *
 * @author:phantomsaber
 * @version:2019/7/3 4:38
 * @email:phantomsaber@foxmail.com
 **/
public class PackNumSaveImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());
    private String ok = "OK";

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        // 获取封装的数据
        HttpServletRequest request = modelAction.getRequest();
		
        String dataId = request.getParameter("dataId");
        String packNum = request.getParameter("paraMapObj.FINISH_COUNT");
        String userId = modelAction.getCurrUser().getId();
		String productCount = request.getParameter("paraMapObj.PRODUCT_COUNT");
        MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
        try {
            TableDataMapExt tableDataMapExt = new TableDataMapExt();

            tableDataMapExt.setTableName("T_PM_PROJECT_BASE");
            CommMethod.editSysDefCol(tableDataMapExt.getColMap(), modelAction.getUser());

            tableDataMapExt.getColMap().put("EDIT_USER", userId);
            tableDataMapExt.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
            tableDataMapExt.getColMap().put("PROJECT_STATUS", "5");
            tableDataMapExt.getColMap().put("FINISH_COUNT", packNum);
            tableDataMapExt.setSqlWhere(" AND ID = ? ");
            List list = new ArrayList();
            list.add(dataId);
            tableDataMapExt.setSqlWhereArgs(list);
            modelService.edit(tableDataMapExt);
          	
          	String querySql="SELECT A.PROJECT_STATUS,A.FINISH_COUNT FROM T_PM_PROJECT_BASE A WHERE A.ID = ?";
          	Map<String,String> map = modelService.queryForMap(querySql,new Object[]{dataId});
			String projectStatus = map.get("PROJECT_STATUS");
         	String finishCount = map.get("FINISH_COUNT");
          	
            Integer pc=null;
          	if(productCount!=null){
          		pc = Integer.valueOf(productCount);
            }
          	
            Integer fc=null;
            if(finishCount!=null){
          		pc = Integer.valueOf(finishCount);
            }
          	
            if(fc >= pc){
            String updateSql = "UPDATE T_PM_PROJECT_BASE A " +
                    "SET A.EDIT_TIME = SYSDATE, A.PROJECT_STATUS = '5', A.FINISH_COUNT= ? " +
                    "WHERE 1 = 1 " +
                    "AND A.PROJECT_ID IN (SELECT B.REL_PROJECT_ID FROM T_PM_PROJECT_REL B INNER JOIN T_PM_PROJECT_BASE C ON B.PROJECT_ID = C.PROJECT_ID " +
                    "WHERE 1 = 1 AND C.ID = ? )";
           		modelService.execSql(updateSql, new Object[]{packNum,dataId});          
            	hbtran.commit();
          	}
            
        } catch (BussException e) {
            e.printStackTrace();
            hbtran.rollback();// 错误时，回滚数据
            throw new BussException(modelAction.getText("产品包装异常," + e.getMessage()), e.getMessage());
        }

        String iframeId = modelAction.getRequest().getParameter("iframeId");
        if (iframeId == null) {
            iframeId = "iframe2";
        }
        String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("产品包装成功"), "0");
    }
}
