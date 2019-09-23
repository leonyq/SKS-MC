
package com.morelean.mcmes.test;

import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.exception.BussException;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 要根据对应的视图模型/基础信息：视图公用类的名称来替换继承类SuperServer
 */
/**
 * testPage
 * @author:phantomsaber
 * @version:2019/7/4 18:18
 * @email:phantomsaber@foxmail.com
 **/
public class RapidOnLineDevicesTest implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        try {
          	HttpServletRequest req = modelAction.getRequest();
              	String name_id = req.getParameter("name_id");
          		String name = req.getParameter("name");
              	List<Map<String, Object>> thisList = null;
                //加载当前名字
                String moSql = "SELECT name,num FROM P_TEST_PIE WHERE 1=1";
    			if(null != name_id){
                  moSql += " AND id=?";
    			  thisList = modelService.listDataSql(moSql,new Object[]{name_id});               
                }else if(null != name){
                  moSql += "AND name=?";
                  thisList = modelService.listDataSql(moSql,new Object[]{name});   
                }else{
                  thisList = modelService.listDataSql(moSql);
                }
                System.out.println(thisList);
              	CommMethod.listToEscapeJs(thisList);
                modelAction.setAjaxList(thisList);
		
        } catch (Exception e) {
            log.error(e);
            throw new BussException(modelAction.getText("有个错误"));
        }
        return BaseActionSupport.AJAX;

    }
}
