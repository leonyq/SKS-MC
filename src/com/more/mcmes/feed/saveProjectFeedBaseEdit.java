package com.more.mcmes.feed;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.htmlparser.parserapplications.filterbuilder.layouts.NullLayoutManager;

import org.springframework.orm.hibernate3.HibernateTemplate;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.sql.SQLException;
import java.util.*;

/**
 * 修改数据
 *
 * @author:leon
 * @version:2019/7/16
 * 
 **/
public class saveProjectFeedBaseEdit implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        // 获取封装的数据
        HttpServletRequest request = modelAction.getRequest();
        // 是否关闭窗口
        String isCloseWin = modelAction.getRequest().getParameter("");
        String formId = request.getParameter("formId");
        
        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        if (StringUtils.isBlank(formId)) {
            formId = request.getParameter("formIds");
        }
      
        //String iframeId = request.getParameter("iframeId");
       
        String projectId = request.getParameter("PROJECT_ID");
        String lotNumber = request.getParameter("LOT_NUMBER");
        String adminEmp = request.getParameter("ADMIN_EMP");
        String modelCode = request.getParameter("MODEL_CODE");
        String t5ProductCount = request.getParameter("PRODUCT_COUNT");
        String t2PrepareCount = request.getParameter("PREPARE_COUNT");
        String receiveCount = request.getParameter("RECEIVE_COUNT");
        String t3FeedCOunt = request.getParameter("FEED_COUNT");
        String t4FeedNum = request.getParameter("FEED_NUM");
                
        String itemCodes = request.getParameter("ITEM_CODE");
        String stockCode = request.getParameter("STOCK_CODE");
        String itemNum = request.getParameter("ITEM_NUM");
        String feedNum = request.getParameter("FEED_NUM");
        String rawLotNumber = request.getParameter("RAW_LOTNUMBER");
        String processOrder = request.getParameter("PROCESS_ORDER");
      	
      	String[] itemCodeArr = itemCodes.split(",");
        /*
        String[] itemCodeArr = itemCodes.split(",");
        String[] stockCodeArr = stockCodes.split(",");
        String[] itemNumArr = itemNums.split(",");
        String[] feedNumArr = feedNums.split(",");
      	String[] rawLotNumberArr = rawLotNumbers.split(",");
        String[] processOrderArr = processOrders.split(",");
		*/
      	String itemCode = "";
      	for (int i = 0; i < itemCodeArr.length; i++) {
         	itemCode = StringUtils.toString(itemCodeArr[i]);
            
        }
        return modelAction.alertParentInfo("PROJECT_ID:"+projectId+"itemCode:"+itemCode+"stockCode:"+stockCode+"itemNum:"+itemNum+"feedNum:"+feedNum+"rawLotNumber:"+rawLotNumber);
      
           
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

