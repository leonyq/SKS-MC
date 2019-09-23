package com.morelean.mcmes.esop;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;

public class EsopCheck implements ValidateFuncService {

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
    @Override
    public OperResult valJavaFun(String formId, Map paraMap,
             ModelService modelService,ModelAction modelAction,Object... objs) {
                 HttpServletRequest request = modelAction.getRequest();
        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        //String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
        String CSI_SN= (String)paraMap.get("CSI_SN"); 
        String CSI_MODEL_CODE= (String)paraMap.get("CSI_MODEL_CODE"); 
        String CSI_PRODUCT_STEP= (String)paraMap.get("CSI_PRODUCT_STEP");
        String CSI_PROCESS_FACE= (String)paraMap.get("CSI_PROCESS_FACE");
        String CSI_GROUP= (String)paraMap.get("CSI_GROUP");
        String CSI_VALID_FLAG= (String)paraMap.get("CSI_VALID_FLAG");
        String CSI_DEFAULT_FLAG= (String)paraMap.get("CSI_DEFAULT_FLAG");
        String dataid = modelAction.getDataId();
       
       // String dataAuth = modelAction.getParaMap2().get("dataAuth");//获取页面组织机构
        //String DATA_AUTH= (String)paraMap.get("DATA_AUTH");
        String sql = "select ID from T_CO_ESOP_INFO where CSI_SN=?  AND DATA_AUTH=? ";
        List subList = modelService.listDataSql(sql, new Object[] {CSI_SN,dataAuth});
        if (subList!=null&&subList.size() > 0) {
            if(!StringUtils.isEmpty(dataid)&&subList.size()==1){
               String id1=(String) ((Map)subList.get(0)).get("ID");
               if(!dataid.equals(id1)){
                   return new OperResult(false, modelAction.getText("文件编号已存在"));
               }
            }
            else{
                return new OperResult(false, modelAction.getText("文件编号已存在"));
            }
        } 
        if(!"Y".equals(CSI_DEFAULT_FLAG)) return new OperResult(true);
     //   if(!"Y".equals(CSI_VALID_FLAG)) return new OperResult(true);
        //AND T.CSI_VALID_FLAG='Y'  默认上传都为有效标志
        sql = "SELECT T.ID FROM T_CO_ESOP_INFO T WHERE T.CSI_MODEL_CODE=? AND T.CSI_PRODUCT_STEP=? AND T.CSI_PROCESS_FACE=? AND T.CSI_GROUP=? AND T.CSI_DEFAULT_FLAG='Y' AND  T.DATA_AUTH=?    ";
        subList = modelService.listDataSql(sql, new Object[] { CSI_MODEL_CODE,CSI_PRODUCT_STEP,CSI_PROCESS_FACE,CSI_GROUP,dataAuth});
        if (subList!=null&&subList.size() > 0) {
            if(!StringUtils.isEmpty(dataid)&&subList.size()==1){
               String id1=(String) ((Map)subList.get(0)).get("ID");
               if(!dataid.equals(id1)){
                   return new OperResult(false, modelAction.getText("同一个机种,生产阶别，加工面别，工序只能存在一个默认标志为是的文件"));
               }
            }
            else{
                return new OperResult(false, modelAction.getText("同一个机种,生产阶别，加工面别，工序只能存在一个默认标志为是的文件"));
            }
        }
        
       return new OperResult(true);
    }     
}
