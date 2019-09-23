package com.morelean.mcmes.basic.configCenter;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class ModuleCheck implements ValidateFuncService {

    private final Log log = LogFactory.getLog(this.getClass());

    /**    
     * @param formId
     *            表单ID
     * @param paraMap
     *            数据对象
     * @param modelService
     *            modelService
     * @return   
     */
    @SuppressWarnings("rawtypes")
    @Override
    public OperResult valJavaFun(String formId, Map paraMap,
             ModelService modelService,ModelAction modelAction,Object... objs) {
        String CSI_VALID_FLAG= (String)paraMap.get("ENABLE_FLAG");
        String CSI_DEFAULT_FLAG= (String)paraMap.get("DEFAULT_FLAG");
        String MODEL_NAME= (String)paraMap.get("MODEL_NAME");
        String dataid = modelAction.getDataId();
        String sql = "select ID from T_CO_BARCODEMODEL where MODEL_NAME=?";
        List subList = modelService.listDataSql(sql, new Object[] { MODEL_NAME});
        if (subList!=null&&subList.size() > 0) {
            if(!StringUtils.isEmpty(dataid)&&subList.size()==1){
               String id1=(String) ((Map)subList.get(0)).get("ID");
               if(!dataid.equals(id1)){
                   return new OperResult(false, modelAction.getText("模板名称已存在"));
               }
            }
            else{
                return new OperResult(false, modelAction.getText("模板名称已存在"));
            }
        } 
     
        if(!"Y".equals(CSI_DEFAULT_FLAG)) return new OperResult(true);
        if(!"Y".equals(CSI_VALID_FLAG)) return new OperResult(true);
        sql = "SELECT T.ID FROM T_CO_BARCODEMODEL T WHERE  T.ENABLE_FLAG='Y' AND T.DEFAULT_FLAG='Y' ";
        subList = modelService.listDataSql(sql);
        if (subList!=null&&subList.size() > 0) {
            if(!StringUtils.isEmpty(dataid)&&subList.size()==1){
               String id1=(String) ((Map)subList.get(0)).get("ID");
               if(!dataid.equals(id1)){
                   return new OperResult(false, modelAction.getText("默认标识有效的模板已经存在"));
               }
            }
            else{
                return new OperResult(false, modelAction.getText("默认标识有效的模板已经存在"));
            }
        }
        
       return new OperResult(true);
    }     
}
