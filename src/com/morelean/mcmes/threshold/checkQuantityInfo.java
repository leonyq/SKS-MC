package com.morelean.mcmes.threshold;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;

/**
 * 新增生产投料-获取校验
 *
 * @author:hly
 * @version:2019/7/31 10:59
 * @email:
 **/
public class checkQuantityInfo implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {

        HttpServletRequest request = modelAction.getRequest();

        String checkback = "0";

        try {
            String[] levelLowArr = request.getParameter("LEVEL_LOW").split(",",-1);
            String[] levelHightArr = request.getParameter("LEVEL_HIGHT").split(",",-1);

            for(int i=0; i<levelLowArr.length; i++){
                double levelLow = Double.parseDouble(levelLowArr[i]);
                double levelHight = Double.parseDouble(levelHightArr[i]);
                if(levelLow>=levelHight){
                    checkback = "量级Low必须小于且不能等于量级Hight";
                }

                for(int j=i+1; j<levelLowArr.length; j++){
                    double checkLow = Double.parseDouble(levelLowArr[j]);
                    double checkHeight = Double.parseDouble(levelHightArr[j]);
                    if(checkLow>=checkHeight){
                        checkback = "量级Low必须小于且不能等于量级Hight";
                    }
                    if(checkHeight<=levelLow || checkLow>=levelHight){

                    }else{
                        checkback = "量级区间已存在";
                    }
                }
            }
        } catch (Exception e) {
            log.error(e.getMessage());
            e.printStackTrace();
            throw new BussException(modelAction.getText(e.getMessage()),e);
        }
        modelAction.setAjaxString(checkback);
        return BaseActionSupport.AJAX;
    }

}
