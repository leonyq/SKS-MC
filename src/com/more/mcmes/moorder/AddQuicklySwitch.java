package com.more.mcmes.moorder;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * @Title 制令单-快速转产-保存
 * @Description 〈功能详细描述〉
 * @ClassName AddQuicklySwitch
 * @author Administrator
 * @version 1.0 developer 2017-8-2 created
 * @see AddQuicklySwitch
 * @since 2017-8-2
 * @Copyright: Copyright (c) 2017
 * @Company: morelean
 */
public class AddQuicklySwitch implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());
  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    
    try
    {
      HttpServletRequest req = modelAction.getRequest();
      String pdoAreaSn = req.getParameter("PDO_AREA_SN");
      String pdoDeviceSn = req.getParameter("PDO_DEVICE_SN");
      String pdoNumber = req.getParameter("PDO_NUMBER");
      String pdoModelCode = req.getParameter("PDO_MODEL_CODE");
      String pdoProcessFace = req.getParameter("PDO_PROCESS_FACE");
      String pdoNumber_s = req.getParameter("PDO_NUMBER_S");
      String pdoModelCode_s = req.getParameter("PDO_MODEL_CODE_S");
      String pdoProcessFace_s = req.getParameter("PDO_PROCESS_FACE_S");
      String userId = CommMethod.getSessionUser().getLoginName();
      String formId = req.getParameter("formId");
      String dataAuth = CommMethod.getSessionUser().getDeptId();
      if (StringUtils.isBlank(formId))
      {
        formId = req.getParameter("formIds");
      }
      String iframeId = req.getParameter("iframeId");

      ProFuncDto pf = new ProFuncDto();
      int[] inPlace = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
      int[] outplace = {11};
      List<Object> list = new ArrayList<Object>();
      List outType = new ArrayList<Object>();
      list.add(pdoAreaSn);
      list.add(pdoDeviceSn);
      list.add(pdoNumber);
      list.add(pdoModelCode);
      list.add(pdoProcessFace);
      list.add(pdoNumber_s);
      list.add(pdoModelCode_s);
      list.add(pdoProcessFace_s);
      list.add(userId);
      list.add(dataAuth);
      outType.add("String");
      pf.setClassName("P_SMT_ZC_SAVE_INFO");// 存储过程的名字
      pf.setInPlace(inPlace);// 存储过程中in
      pf.setOutPlace(outplace); // 存储过程中out
      pf.setValArgs(list);// 存储过程中输入的参数
      pf.setTotalLen(list.size() + outType.size());// 总个数
      pf.setOutValType(outType);// 输出的参数
      List<Object> relist = modelService.procComm(pf);
      if (relist.get(0).equals("OK"))
      {
          return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
          
      }
      else
      {
        return modelAction.alertParentInfo((String)relist.get(0));
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("执行存储过程错误"), e);
    }
    


  }

}
