package com.more.buss.feeder.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

//保存保养维修选择的feeder
public class SaveMTFeederService implements FuncService
{
  private  final  Log log = LogFactory.getLog(this.getClass());
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String selectSN=request.getParameter("SELECTED_SN");
    System.out.println(selectSN);
    return null;
  }

}
