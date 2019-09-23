package com.more.mes.smt.visual;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.more.fw.core.base.core.action.BaseActionSupport;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class ExitFile implements FuncService
{
	/**
	 * Description:码制类生成视图
	 * Company: morelean
	 * @author hzp
	 * @date 2018年5月18日
	 * @version 1.0
	 */  
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
	  String fileUrl=modelAction.getRequest().getParameter("fileUrl");
	  //获取项目路径存放临时图片
	  fileUrl=Constants.getWEB_ROOT_PATH()+Constants.SEPARATOR+"up_load"+Constants.SEPARATOR+"comm"+Constants.SEPARATOR+"esop"+Constants.SEPARATOR+fileUrl;
	//获取项目路径存放临时图片相对位置
	   File file = new File(fileUrl);
	   Map<String, Object> result=new HashMap<String, Object>();
	  if(file.exists()){
		  result.put("result", "exists");
	  }else{
		  result.put("result", "noExists"); 
	  }
	  modelAction.setAjaxMap(result);
	/*  if(modelAction.getRequest().getParameter("codeValue")!=null&&!"".equals(modelAction.getRequest().getParameter("codeValue"))){
		  String codeValue = modelAction.getRequest().getParameter("codeValue");//获取解析数据
		  JSONArray jsonArray = JSONArray.fromObject(codeValue);   
		  Map<String, Object> result=  generateCode(jsonArray,codeImgUrl,relativeUrl);//解析数据
		  modelAction.setAjaxMap(result);
	  }*/
	return BaseActionSupport.AJAX;
  
  }
  /**
   * 生成条形码方法
   * @param jsonArray
   * @return
   */
  
  
}
