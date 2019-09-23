package com.morelean.mcmes.production.bommgr.oracle;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.common.method.StringUtils;       
import com.more.fw.core.common.method.Constants;   


public class BomSaveService implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @SuppressWarnings("unchecked")
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        // 获取封装的数据
        HttpServletRequest request = modelAction.getRequest();
        String formId = request.getParameter("formId");
        if(StringUtils.isBlank(formId)){
          formId = request.getParameter("formIds");
        }
        String iframeId = request.getParameter("iframeId");
        String cbItemCode = request.getParameter("paraMap0@0#CB_ITEM_CODE");
        String cbVer = request.getParameter("paraMap0@0#CB_VER");
        String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");//是否关闭窗口
        Map map = modelService.getAddComm(request, modelAction.getCurrUser(),
                modelAction);
       // String sql="SELECT * FROM(SELECT ROW_NUMBER () OVER (ORDER BY ID ASC) AS ROWNUM,ID	FROM t_co_bom WHERE	 CB_ITEM_CODE= ? AND CB_VER= ?) AS rrr WHERE	ROWNUM = 1";
        String sql="select id from t_co_bom where rownum=1 and CB_ITEM_CODE=? AND CB_VER=?";
        List list = modelService.listDataSql(sql, new Object[] {cbItemCode,cbVer});
        if(list.size()>0){
            //return modelAction.alertParentInfo((modelAction.getText("机种料号"+cbItemCode+"对应版本"+cbVer+"已经存在！")));
            return modelAction.alertParentInfo((modelAction.getText("该机种料号已存在此版本")));
        }
        //String sqls="select * from (select ROW_NUMBER() OVER (ORDER BY id ASC) AS ROWNUM,id from  t_co_bom where  CB_ITEM_CODE=? AND CB_DEFAULT='Y') as rrrr where ROWNUM = 1";
        String sqls="select id from t_co_bom where rownum=1 and CB_ITEM_CODE=? AND CB_DEFAULT='Y'";
        List lists = modelService.listDataSql(sqls, new Object[] {cbItemCode});
        if(lists.size()>0){
            return modelAction.alertParentInfo((modelAction.getText("该机种料号已存在默认标识")));
        }
        for (Object key : map.keySet()) {
            String tempCode = null;
            String tempCode1 = null;
            if (key.toString().equals("b9f80468a9fe4b74ada4fceff23db738")) {
                JSONArray array = JSONArray.fromObject(map.get(key));
                for (int i = 0; i < array.size(); i++) {
                    tempCode = array.getJSONObject(i).get("CBD_ITEM_CODE")
                            .toString();
                    if (cbItemCode.equals(tempCode)) {
                        return modelAction.alertParentInfo(modelAction
                                .getText("机种料号")+cbItemCode+modelAction.getText("和")+modelAction.getText("物料料号")+tempCode+modelAction.getText("不能相同"));
                    }
                    for (int j = i + 1; j < array.size(); j++) {
                        tempCode1 = array.getJSONObject(j).get("CBD_ITEM_CODE")
                                .toString();
                        if (tempCode1.equals(tempCode)) {
                            return modelAction.alertParentInfo((modelAction
                                    .getText("物料料号不能相同")));
                        }
                    }
                }

            }
        }
        modelService.addComm(request, modelAction.getCurrUser(), modelAction);
        
        
        if(StringUtils.isBlank(isCloseWin)){
                return modelAction.alertInfoClear(modelAction.getText("新增成功"), "2");       
            }else{      
                 return modelAction.commAjaxFunClassLoadParent(formId,iframeId,Constants.SUCCESS,Constants.OPERATE_TYPE_ADD);
                //return modelAction.reloadParent(modelAction.getText("新增成功"));  
            }
    }

}

