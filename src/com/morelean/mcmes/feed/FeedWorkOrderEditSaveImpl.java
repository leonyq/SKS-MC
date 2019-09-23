package com.morelean.mcmes.feed;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 新增生产投料-根据存货代码获取物料信息
 *
 * @author:phantomsaber
 * @version:2019/8/06 13:59
 * @email:phantomsaber@foxmail.com
 **/
public class FeedWorkOrderEditSaveImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();

        String iframeId = request.getParameter("iframeId");

        String projectId = request.getParameter("PROJECT_ID");
        String receiveCount = request.getParameter("paraMapObj.RECEIVE_COUNT");

        String itemCodeStr = request.getParameter("ITEM_CODE");
        String stockCodeStr = request.getParameter("STOCK_CODE");
        String itemNumStr = request.getParameter("ITEM_NUM");
        String feedNumStr = request.getParameter("FEED_NUM");
        String rawLotStr = request.getParameter("RAW_LOTNUMBER");
        String processOrderStr = request.getParameter("PROCESS_ORDER");

        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        if(StringUtils.isEmpty(dataAuth)){
            dataAuth = modelAction.getCurrUser().getData_auth();
        }

        if(StringUtils.isEmpty(projectId)){
            throw new BussException(modelAction.getText("工单号为空"),"");
        }

        String userId = modelAction.getCurrUser().getId();

        List list = new ArrayList();
        list.add(projectId);

        String[] itemCodes = itemCodeStr.split(",",-1);
        String[] stockCodes = stockCodeStr.split(",",-1);

        String[] itemNums = itemNumStr.split(",",-1);
        String[] feedNums = feedNumStr.split(",",-1);
        String[] rawLots = rawLotStr.split(",",-1);
        String[] processOrders = processOrderStr.split(",",-1);

        MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
        try {
        	TableDataMapExt baseTable = new TableDataMapExt();
        	
        	String updateSql = " UPDATE T_PM_PROJECT_feed_BASE A " + 
        			"   SET A.RECEIVE_COUNT= ?, " + 
        			"   A.EDIT_USER= ? " + 
        			" WHERE 1 = 1 " + 
        			"   AND A.PROJECT_ID = ? ";
        	
        	modelService.execSql(updateSql, new Object[]{receiveCount, userId, projectId});
        	
        	
        	String deleteSql = "DELETE T_PM_PROJECT_FEED_DETAIL WHERE PROJECT_ID=?";
        	modelService.execSql(deleteSql, new Object[]{projectId});
        	
        	TableDataMapExt detailTable = new TableDataMapExt();
        	for (int i=0;i<itemCodes.length;i++) {
                detailTable.setTableName("T_PM_PROJECT_FEED_DETAIL");

                detailTable.getColMap().put("ID", StringUtils.getUUID());
                detailTable.getColMap().put("DEPT_ID", modelAction.getCurrUser().getDeptId());

                detailTable.getColMap().put("CREATE_USER", userId);
                detailTable.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
              
                detailTable.getColMap().put("EDIT_USER", userId);
                detailTable.getColMap().put("EDIT_TIME", DateUtil.getCurDate());

                detailTable.getColMap().put("DATA_AUTH", dataAuth);
                detailTable.getColMap().put("PROJECT_ID", projectId);

                detailTable.getColMap().put("ITEM_CODE", StringUtils.toString(itemCodes[i]));
                detailTable.getColMap().put("STOCK_CODE", (stockCodes[i]));
                detailTable.getColMap().put("ITEM_NUM", (itemNums[i]));
                detailTable.getColMap().put("FEED_NUM", (feedNums[i]));
                detailTable.getColMap().put("RAW_LOTNUMBER", (rawLots[i]));
                detailTable.getColMap().put("PROCESS_ORDER", (processOrders[i]));

                CommMethod.addSysDefCol(detailTable, modelAction.getUser(), dataAuth);
                modelService.save(detailTable);
            }
        	
            hbtran.commit();
        } catch (Exception e) {
            e.printStackTrace();
            hbtran.rollback();
            throw new BussException(modelAction.getText("投料修改失败,"+e.getMessage()),e.getMessage());
        }

        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("投料修改成功"), "0");
    }

}
