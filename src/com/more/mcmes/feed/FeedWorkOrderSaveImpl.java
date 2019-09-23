package com.more.mcmes.feed;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 生产投料保存
 *
 * @author:phantomsaber
 * @version:2019/7/10 5:08
 * @email:phantomsaber@foxmail.com
 **/
public class FeedWorkOrderSaveImpl implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        // 获取封装的数据
        HttpServletRequest request = modelAction.getRequest();
        // 是否关闭窗口
        String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
        String formId = request.getParameter("formId");
        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        if (StringUtils.isBlank(formId)) {
            formId = request.getParameter("formIds");
        }
        String iframeId = request.getParameter("iframeId");
        String projectId = request.getParameter("paraMap0@0#PROJECT_ID");

/*
        String[] itemCodeArr = request.getParameterValues("paraMap1@ITEM_CODE");
        String[] itemNumArr = request.getParameterValues("paraMap1@ITEM_NUM");
        String[] feedNumArr = request.getParameterValues("paraMap1@FEED_NUM");
        String[] processOrderArr = request.getParameterValues("paraMap1@PROCESS_ORDER");
*/

        String itemCodes = request.getParameter("itemCodeArr");
        String itemNums = request.getParameter("itemNumArr");
        String feedNums = request.getParameter("feedCountArr");
        String processOrders = request.getParameter("processOrderArr");

        String[] itemCodeArr = itemCodes.split(",");
        String[] itemNumArr = itemNums.split(",");
        String[] feedNumArr = feedNums.split(",");
        String[] processOrderArr = processOrders.split(",");

        String weightEmp = request.getParameter("paraMap0@0#WEIGHT_EMP");
        String weightMonitor = request.getParameter("paraMap0@0#WEIGHT_MONITOR");
        String craftsEmp = request.getParameter("paraMap0@0#CRAFTS_EMP");
        String adminEmp = request.getParameter("paraMap0@0#ADMIN_EMP");

        String order = null;
        String tempCode = null;
        String tempCode1 = null;
        int flags = 0;

        String sql = "select id from T_PM_PROJECT_FEED_BASE where PROJECT_ID =? AND DATA_AUTH=? ";
        List list = modelService.listDataSql(sql, new Object[]{projectId, dataAuth});
        if (list != null && list.size() > 0) {
            return modelAction.alertParentInfo((modelAction.getText("该工单已存在投料记录")));
        }

        if (null == itemCodeArr || itemCodeArr.length == 0) {
            return modelAction.alertParentInfo((modelAction.getText("请新增投料明细物料编码！")));
        }

        boolean flag = false;

        String userId = modelAction.getCurrUser().getId();
        String deptId = modelAction.getCurrUser().getDeptId();
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date sysDate = DateUtil.parseDate(sdf1.format(new Date()), "yyyy-MM-dd HH:mm:ss");

        TableDataMapExt tdmap = new TableDataMapExt();
        tdmap.setTableName("T_PM_PROJECT_FEED_BASE");
        CommMethod.addSysDefCol(tdmap.getColMap(), modelAction.getUser());
        Map map2 = tdmap.getColMap();
        map2.put("ID", StringUtils.getUUID());
        map2.put("DEPT_ID", deptId);
        map2.put("CREATE_USER", userId);
        map2.put("CREATE_TIME", sysDate);
        map2.put("EDIT_USER", "");
        map2.put("EDIT_TIME", "");
        if (StringUtils.isNotBlank(dataAuth)) {
            map2.put("DATA_AUTH", dataAuth);
        }
        map2.put("PROJECT_ID", projectId);
        map2.put("MODEL_CODE", "");
        map2.put("WEIGHT_EMP", weightEmp);
        map2.put("WEIGHT_MONITOR", weightMonitor);
        if (StringUtils.isNotBlank(craftsEmp)) {
            map2.put("CRAFTS_EMP", craftsEmp);
        }
        if (StringUtils.isNotBlank(adminEmp)) {
            map2.put("ADMIN_EMP", adminEmp);
        }

        int res = modelService.save(tdmap);
        if (res < 0) {
            flag = false;
            return modelAction.alertParentInfo("新增失败");
        }

        TableDataMapExt maps = new TableDataMapExt();
        maps.setTableName("T_PM_PROJECT_FEED_DETAIL");

        for (int i = 0; i < itemCodeArr.length; i++) {
            String curItemCode = StringUtils.toString(itemCodeArr[i]);
            String curItemNum = StringUtils.toString(itemNumArr[i]);
            String curFeedNum = StringUtils.toString(feedNumArr[i]);
            String curProcessOrder = StringUtils.toString(processOrderArr[i]);

            maps.getColMap().clear();
            CommMethod.addSysDefCol(maps.getColMap(), modelAction.getUser());
            maps.getColMap().put("CREATE_USER", userId);
            maps.getColMap().put("CREATE_TIME", sysDate);
            maps.getColMap().put("DATA_AUTH", dataAuth);
            maps.getColMap().put("PROJECT_ID", projectId);
            maps.getColMap().put("MODEL_CODE", "");

            maps.getColMap().put("ITEM_CODE", formatStr(curItemCode));
            maps.getColMap().put("ITEM_NUM", formatInt(curItemNum));
            maps.getColMap().put("FEED_NUM", formatInt(curFeedNum));
            maps.getColMap().put("PROCESS_ORDER", formatStr(curProcessOrder));

            int res1 = modelService.save(maps);

            if (res1 < 0) {
                flag = false;
                return modelAction.alertParentInfo("新增失败");
            }else{
                flag = true;
            }
        }

        if (flag == true) {
            return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
        } else {
            return modelAction.alertParentInfo("新增失败");
        }
    }

    /**
     * 参数类型转换校验处理 int
     *
     * @param inStr
     * @return
     */
    public int formatInt(String inStr) {
        int ret = 0;

        try {
            if (!StringUtils.isEmpty(inStr)) {
                if (StringUtils.isNotBlank(inStr)) {
                    ret = Integer.parseInt(inStr);
                }
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            throw new BussException("整型参数异常");
        }
        return ret;
    }

    /**
     * 参数类型转换校验处理 String
     *
     * @param inObj
     * @return
     */
    public String formatStr(Object inObj) {
        String ret = "";
        try {
            if (!StringUtils.isEmpty(inObj)) {
                ret = StringUtils.toString(inObj);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new BussException("对象参数异常");
        }
        return ret;
    }
}
