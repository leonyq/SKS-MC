package com.morelean.mcmes.check;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.*;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * 新增生产投料-根据存货代码获取物料信息
 *
 * @author:phantomsaber
 * @version:2019/7/19 13:59
 * @email:phantomsaber@foxmail.com
 **/
public class FeedWorkOrderAddSaveImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

         HttpServletRequest request = modelAction.getRequest();
        String iframeId = request.getParameter("iframeId");

        String projectId = request.getParameter("projectId");

        String lotNumber = request.getParameter("lotNumber");
        String checkUser = request.getParameter("checkUser");
        String checkStauts = request.getParameter("checkStauts");
        String checkMon = request.getParameter("checkMon");



        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        if(StringUtils.isEmpty(dataAuth)){
            dataAuth = modelAction.getCurrUser().getData_auth();
        }

        if(StringUtils.isEmpty(projectId)){
            throw new BussException(modelAction.getText("工单号为空"),"");
        }else{
            String sql = "SELECT * FROM T_QM_SIMPLE_TEST A WHERE 1=1 AND A.QT_PROJECT_ID = ? ";
            int count = modelService.countSql(sql, new Object[]{projectId});
            if(count > 0 ){
                throw new BussException(modelAction.getText("该工单已存在质检明细"),"");
            }
        }
        if(StringUtils.isEmpty(checkStauts)){
           throw new BussException(modelAction.getText("质检未处理"),"");
        }else if("1".equals(checkStauts)){
          if(StringUtils.isEmpty(checkMon)){
           throw new BussException(modelAction.getText("请输入质检内容"),"");
         }
        }else if("0".equals(checkStauts)){
          checkMon="";
        }else{}


        String userId = modelAction.getCurrUser().getId();

        List list = new ArrayList();
        list.add(projectId);

        MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
        try {
            TableDataMapExt baseTable = new TableDataMapExt();

                baseTable.setTableName("T_QM_SIMPLE_TEST");

                baseTable.getColMap().put("ID", StringUtils.getUUID());
                baseTable.getColMap().put("DEPT_ID", modelAction.getCurrUser().getDeptId());

                baseTable.getColMap().put("CREATE_USER", modelAction.getCurrUser().getId());
                baseTable.getColMap().put("CREATE_TIME", DateUtil.getCurDate());


                baseTable.getColMap().put("DATA_AUTH",dataAuth);
                baseTable.getColMap().put("QT_PROJECT_ID",projectId);

                baseTable.getColMap().put("QT_MODEL_CODE", lotNumber);
                baseTable.getColMap().put("QT_CHECK_EMP", checkUser);
                baseTable.getColMap().put("QT_CHECK_RESULT", checkStauts);
                baseTable.getColMap().put("QT_CHECK_CONTENT", checkMon);
                CommMethod.addSysDefCol(baseTable, modelAction.getUser(), dataAuth);

            modelService.save(baseTable);

 			/**String relSql = "SELECT B.PROJECT_ID AS id FROM T_PM_PROJECT_REL B LEFT JOIN T_PM_PROJECT_BASE T ON T.PROJECT_ID = B.REL_PROJECT_ID where B.REL_PROJECT_ID=?";
            List relList =  modelService.listDataSql(relSql, new Object[]{projectId});
            if(relList != null || relList.size()>0){
            	String updateSql = "UPDATE T_PM_PROJECT_BASE A SET A.PROJECT_STATUS = '6',A.CHECK_USER=? WHERE 1=1 AND A.PROJECT_ID =(SELECT B.PROJECT_ID AS id FROM T_PM_PROJECT_REL B LEFT JOIN T_PM_PROJECT_BASE T ON T.PROJECT_ID = B.REL_PROJECT_ID where B.REL_PROJECT_ID=?) ";
                modelService.execSql(updateSql, new Object[]{checkStauts,projectId});

            }else{
               //throw new BussException(modelAction.getText("该工单无上级工单关联"),"");
            }**/


            String updateSql = "UPDATE T_PM_PROJECT_BASE A SET A.PM_CHECK_STUST=?,A.CHECK_USER=?,A.CHECK_MON=? WHERE 1=1 AND A.PROJECT_ID = ? ";
            modelService.execSql(updateSql, new Object[]{checkStauts,checkUser,checkMon,projectId});
        } catch (Exception e) {
            e.printStackTrace();
            hbtran.rollback();
            throw new BussException(modelAction.getText("质检失败,"+e.getMessage()),e.getMessage());
        }
        hbtran.commit();// 提交数据

        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("质检成功"), "0");
    }

}
