package com.more.mes.smt.storeitemmanager;

import java.util.List;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * @Description 物料管控信息显示人员信息
 * @ClassName GetCntralMessage
 * @author WZY
 * 
 */
public class GetCntralMessage implements FuncService
{

	@SuppressWarnings("rawtypes")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) 
	{
		// TODO Auto-generated method stub
		
// 		String sql="select distinct t.WIC_CTRL_EMP AS LOGIN_NAME,c.NAME as names,b.NAME from "+
//       "T_WMS_ITEM_CONTRAL t left join SY_USER b on t.WIC_CTRL_EMP=b.LOGIN_NAME"+
//       " left join sy_dept c on c.id=t.DATA_AUTH";
      
       /*
       String sql=  "SELECT T1.ID,T1.LOGIN_NAME ,T1.NAME,T4.NAME AS NAMES "+
        "FROM SY_USER T1,SY_DEPT T4 " +
        "WHERE T1.LOGIN_NAME IN "+
        "(SELECT WIC_CTRL_EMP FROM T_WMS_ITEM_CONTRAL T2 "+
        "WHERE T1.LOGIN_NAME = T2.WIC_CTRL_EMP "+
        "AND T2.WIC_ITEM_CODE IN "+
        "(SELECT CI_ITEM_CODE "+
        "FROM T_CO_ITEM T3 "+
        "WHERE T2.WIC_ITEM_CODE = T3.CI_ITEM_CODE)) "+
        "AND T4.ID IN (SELECT DISTINCT T2.DATA_AUTH  FROM T_WMS_ITEM_CONTRAL T2" 
        +"  WHERE T1.LOGIN_NAME  =  T2.WIC_CTRL_EMP) ";
        */
        
        String sql=  "SELECT T1.ID as ID ,T1.LOGIN_NAME ,T1.NAME,T4.NAME AS NAMES,T1.DATA_AUTH AS DATA_AUTH2 "+
        "FROM SY_USER T1 " +
        " LEFT JOIN SY_DEPT T4 ON T4.ID=T1.DATA_AUTH "+
        "WHERE T1.LOGIN_NAME IN "+
        "(SELECT WIC_CTRL_EMP FROM T_WMS_ITEM_CONTRAL T2 "+
        "WHERE T1.LOGIN_NAME = T2.WIC_CTRL_EMP "+
        "AND T2.WIC_ITEM_CODE IN "+
        "(SELECT CI_ITEM_CODE "+
        "FROM T_CO_ITEM T3 "+
        "WHERE T2.WIC_ITEM_CODE = T3.CI_ITEM_CODE)) "+
        "AND T4.ID IN (SELECT DISTINCT T2.DATA_AUTH  FROM T_WMS_ITEM_CONTRAL T2" 
        +"  WHERE T1.LOGIN_NAME  =  T2.WIC_CTRL_EMP) ";
        
      
      
    //String sql1="select * from ("+sql+")";
    List list = modelService.listSql(sql, modelAction.getPage(), null, null, null, null);
		
		modelAction.setAjaxPage(modelAction.getPage());
		//modelAction.setDataList(list);
		CommMethod.listToEscapeJs(list);
		modelAction.getAjaxPage().setDataList(list);
		return BaseActionSupport.AJAX;
	}

}
