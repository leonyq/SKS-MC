package com.more.mes.smt.msdmessage;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import java_cup.internal_error;

import javax.servlet.http.HttpServletRequest;


import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.ibatis.sqlmap.engine.mapping.sql.Sql;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * @Description bom管理查看--获取替代料信息
 * @ClassName GetReplace
 * @author WZY
 */
public class GetReplace implements FuncService
{

  @SuppressWarnings({"unchecked", "null"})
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    
    String bomId = request.getParameter("bomId");
    String itemCode = request.getParameter("itemCode");
    String cbItemCode = request.getParameter("cbItemCode");//机种
    String sql1="SELECT DATA_AUTH FROM T_CO_BOM_DETAIL WHERE CB_BOMID = ?";
    
    Map<String, String> map1 = modelService.queryForMap(sql1, new Object[]{bomId});
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String code[] = itemCode.split(",");
    String sql = "SELECT DISTINCT T.CR_MODEL_CODE, T.CR_ITEM_REPLACE,T.CR_ITEM_DESC,T.CR_ITEM_NAME,T.CR_TYPE,"
                 + " T.CR_ITEM_MIAN,T1.CI_ITEM_SPEC,T1.CI_ITEM_NAME FROM T_CO_ITEM_REPLACE T"
                 + "  LEFT JOIN T_CO_ITEM T1 ON T.CR_ITEM_MIAN= T1.CI_ITEM_CODE and t1.data_auth=t.data_auth "
                 + "  LEFT JOIN T_CO_BOM_DETAIL T2 ON T.CR_ITEM_MIAN= T2.CBD_ITEM_CODE and t2.data_auth=t.data_auth "
                 + " WHERE  T.CR_STATUS = 'Y' and T2.CB_BOMID=? and t.data_auth=? order by T.CR_TYPE,T.CR_ITEM_MIAN";
    	if(null!=map1 && map1.size()>0) {
    		if(StringUtils.isNotBlank(map1.get("DATA_AUTH"))) {
    			dataAuth=map1.get("DATA_AUTH");
    		}
    		
    	}
    List list = modelService.listDataSql(sql, new Object[] {bomId,dataAuth});

    List<Map> dataList = new ArrayList<Map>();
    if (null!=list && list.size() > 0)
    {
      int len =list.size() ;
      String crType;
      String crItemMian;//主料料号
      String crModelCode;//机种
      for (int i = 0; i <len; i++ )
      {
        Map map = (Map)list.get(i);
        
        crType = (String)map.get("CR_TYPE");
        
        if (crType.equals("1"))
        {
          crItemMian = (String)map.get("CR_ITEM_MIAN");
          crModelCode = (String)map.get("CR_MODEL_CODE");
          if (code.length>0)
          {
            int codeLength=code.length;
            for (int j = 0; j < codeLength; j++ )
            {
               if (code[j].equals(crItemMian) && cbItemCode.equals(crModelCode))
              {
                 dataList.add(map);
              }
            }
          }
          
        }else {
          dataList.add(map);
        }
        
       

      }
      modelAction.setAjaxList(dataList);
    }
    else
    {
      modelAction.setAjaxList(null);
      
    }

    return BaseActionSupport.AJAX;
  }

}
