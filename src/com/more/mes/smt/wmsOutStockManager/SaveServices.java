//test1
package com.more.mes.smt.wmsOutStockManager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;



import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class SaveServices implements FuncService {
  private final Log log = LogFactory.getLog(this.getClass());
  
  public String exeFunc(ModelAction modelaction, ModelService modelService) {
    HttpServletRequest request = modelaction.getRequest();
    String id = request.getParameter("ID");
    
    List l;
    List l2;
        //角色下的功能
        String delSql = "select t.TAS_FUN_ID,t1.TAS_FUN_NAME  from T_APP_ROLE t "+
                        " left join T_APP_SHOWMANAGE t1 on t1.ID = t.TAS_FUN_ID where TAR_ROLE_ID=?";
        l = modelService.listDataSql(delSql, new Object[]{id});
        //未配置的功能
        delSql ="select ID,TAS_FUN_NAME from T_APP_SHOWMANAGE " +
        		    " where ID not in(select TAS_FUN_ID from T_APP_ROLE where TAR_ROLE_ID=?)";
        l2=modelService.listDataSql(delSql, new Object[]{id});
        
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("userList", l);
        map.put("list", l2);
        modelaction.setAjaxMap(map);
        return BaseActionSupport.AJAX;
  }

}

