package com.more.mcmes.check;

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
import com.more.fw.core.common.method.DateUtil;
import java.text.SimpleDateFormat;

/**
 * 一键质检提升
 *
 **/
public class ProjctOrderCheck implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());
    private String ok = "OK";

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        // 获取封装的数据
        HttpServletRequest request = modelAction.getRequest();
        String workOrders = request.getParameter("workOrderSn");
        String[] split = workOrders.split("\\|");
        String ajaxRes = null;

        Boolean splitFlag = null;

        if(workOrders.length() > 0){
            try {
                splitFlag = !StringUtils.isEmpty(split[1]);
            } catch (Exception e) {
                split = workOrders.split(",| ");
            }
            try {
                splitFlag = !StringUtils.isEmpty(split[1]);
            } catch (Exception e) {
                splitFlag = !StringUtils.isEmpty(split[0]);
            }
        }else{
            modelAction.setAjaxString("请选择至少一条数据");
            return BaseActionSupport.AJAX;
        }




        if(!splitFlag){
//            throw new BussException(modelAction.getText("备料失败,工单分隔符格式错误,请使用'|' ','与空格"));
            modelAction.setAjaxString("质检失败");
            return BaseActionSupport.AJAX;
        }

        String dataAuth = modelAction.getCurrUser().getData_auth();
        String userId = modelAction.getCurrUser().getId();
        String deptId = modelAction.getCurrUser().getDeptId();
        String Id  =  StringUtils.getUUID();
        String CREATE_USER = modelAction.getCurrUser().getId();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date checkDate = DateUtil.parseDate(sdf.format(new Date()),"yyyy-MM-dd HH:mm:ss");

        for (int i = 0; i < split.length; i++) {
            String res = "";
            String projectId = StringUtils.toString(split[i]);
          MsHTranMan hbtran = BussService.getHbTran();// 定义事务对象
        try {
                TableDataMapExt baseTable = new TableDataMapExt();
          
                baseTable.setTableName("T_QM_PROJECT_CHECK");

                baseTable.getColMap().put("ID", Id);
                baseTable.getColMap().put("DEPT_ID", deptId);

                baseTable.getColMap().put("CREATE_USER", CREATE_USER);
                baseTable.getColMap().put("CREATE_TIME", DateUtil.getCurDate());


                baseTable.getColMap().put("DATA_AUTH",dataAuth);
                baseTable.getColMap().put("PROJECT_ID",projectId);
                baseTable.getColMap().put("CHECK_USER", userId);
                baseTable.getColMap().put("CHECK_STATUS", "0");
                
                baseTable.getColMap().put("EDIT_TIME", checkDate);
                CommMethod.addSysDefCol(baseTable, modelAction.getUser(), dataAuth);
            
            modelService.save(baseTable);
        } catch (Exception e) {
            e.printStackTrace();
            hbtran.rollback();
            throw new BussException(modelAction.getText("质检失败,"+e.getMessage()),e.getMessage());
        }
        hbtran.commit();// 提交数据

            
    /*        if (!StringUtils.isEmpty(curWorkOrder)) {
                res = callProjectPrepare(modelService, Id,dataAuth,deptId, curWorkOrder,userId);
            }
            if (!ok.equals(res)) {
                modelAction.setAjaxString(curWorkOrder+"质检提审失败," + res);
                return BaseActionSupport.AJAX;

            }*/
        }

    /*    String iframeId = modelAction.getRequest().getParameter("iframeId");
        if (iframeId == null) {
            iframeId = "iframe9";
        }
        String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");*/

        modelAction.setAjaxString("质检提审成功");
        return BaseActionSupport.AJAX;

    }

    /**
     * 调用质检提审过程
     * @return
     */
  /*  public String callProjectPrepare(ModelService modelService, String Id,String dataAuth,String deptId, String relWorkerOrder,String userId) {
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = {1, 2, 3,4};
        int[] outplace = {5};
        List<Object> list = new ArrayList<Object>();
        List<Object> outType = new ArrayList<Object>();
        list.add(Id);
        list.add(dataAuth);
        list.add(deptId);
        list.add(relWorkerOrder);
        list.add(userId);
        outType.add("String");
        pf.setClassName("P_C_LEO_CHECK_PROJECT_SN");
        pf.setInPlace(inPlace);
        pf.setOutPlace(outplace);
        pf.setTotalLen(list.size() + outType.size());
        pf.setValArgs(list);
        pf.setOutValType(outType);
        List<Object> relist = modelService.procComm(pf);
        String res = (String) relist.get(0);
        return res;
    }*/
}
