package com.more.mcmes.productionPrepare;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.*;

/**
 * 多选框数据处理
 *
 * @author:phantomsaber
 * @version:2019/7/3 4:38
 * @email:phantomsaber@foxmail.com
 **/
public class  WorkOrderChildItem implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());
    

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        // 获取封装的数据
        HttpServletRequest request = modelAction.getRequest();
      
        String curIds = request.getParameter("projectIds");
        String[] split = curIds.split(",");
        String dataAuth = modelAction.getCurrUser().getData_auth();
        String userId = modelAction.getCurrUser().getId();
        /*List list = new ArrayList();
      
        for(int i=0;i<split.length;i++){
          String curId = split[i];
          if (!StringUtils.isEmpty(curId)) {
             String sql = "select b.ID,b.REL_PROJECT_ID,t.PROJECT_STATUS,t.LOT_NUMBER,t.PRODUCT_MATERIAL,t.PRODUCT_NAME,t.PRODUCT_COUNT,t.PROJECT_SORT,s.name as CREATE_USER,b.CREATE_TIME,"+
               " d.name as EDIT_USER,b.EDIT_TIME  from T_PM_PROJECT_REL b left join T_PM_PROJECT_BASE t on b.project_id=t.project_id left join SY_USER s on s.id = b.create_user "+
               " left join sy_user d on d.id = b.edit_user where 1=1  AND t.id in (?)";
             list.add(modelService.listDataSql(sql,new Object[]{curId}));
          }
        }
         Map ajaxMap = new HashMap();    
         if (list.size() > 0) {
          ajaxMap.put("modelList", list);
          CommMethod.mapToEscapeJs(ajaxMap);
          modelAction.setAjaxMap(ajaxMap);

        }*/
      
       String ids = "(";
       for(int j = 0;j<split.length;j++){
          ids += "'"+split[j]+"',";
       }
        ids = ids.substring(0,ids.lastIndexOf(","));
        ids = ids + ")";
        if (!StringUtils.isEmpty(ids)) {
             String sql1 = "select b.ID,b.REL_PROJECT_ID,t.PROJECT_STATUS,t.LOT_NUMBER,t.PRODUCT_MATERIAL,t.PRODUCT_NAME,t.PRODUCT_COUNT,t.PROJECT_SORT,s.name as CREATE_USER,b.CREATE_TIME,"+
               " d.name as EDIT_USER,b.EDIT_TIME  from T_PM_PROJECT_REL b left join T_PM_PROJECT_BASE t on b.project_id=t.project_id left join SY_USER s on s.id = b.create_user "+
               " left join sy_user d on d.id = b.edit_user where 1=1  AND t.id in " + ids;
             List list1 = modelService.listDataSql(sql1);
        if (list1.size() > 0) {
          CommMethod.listToEscapeJs(list1);
          modelAction.setAjaxList(list1);
       }
          }

       return  BaseActionSupport.AJAX;
    }

  
}
