package com.more.mes.smt.problemreport;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存8D报告单    效果确认
 * @author development
 *
 */
public class SaveEffectConfirm implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());
    //1
	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		 String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	String dataId = request.getParameter("dataId");
	    	String CPR_CONFIRM_RESULT = request.getParameter("paraMapObj.CPR_CONFIRM_RESULT");//确认结果
	    	String CPR_EFFECT_CONFIRM = request.getParameter("paraMapObj.CPR_EFFECT_CONFIRM");//效果确认
	    	String CPR_STANDARDIZE = request.getParameter("paraMapObj.CPR_STANDARDIZE");//标准化
	    	//String CPR_CONGRATULATE = request.getParameter("paraMapObj.CPR_CONGRATULATE");//恭贺团队
	    	String fileName = null;
			String realName = null;    //文件原有名称
		    String fileAddress = null;            
		    float fileSize = 0; 
		    FileInputStream fis = null; 
		    FileOutputStream fos = null;
		              
		    if (modelAction.getUpFile() != null){
		    	realName = modelAction.getUpFileFileName(); // 文件名称
		    	fileName = realName.substring(realName.lastIndexOf(".") + 1);
		    	fileName = StringUtils.getUUID() + "." + fileName;  //文件存放名称
		    	fileAddress = "problemReport";   //文件存放路径
		    	String separator = File.separator;
		    	String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath(
		    			"up_load"+separator+"comm"+separator+"problemReport");
		    	fis = new FileInputStream(modelAction.getUpFile());
		    	fileSize = fis.available(); // 文件大小
		    	//上传文件到服务器
		    	File file = modelAction.getUpFile();
		    	File file1 = new File(realPath);
		    	if(!file1.exists() && !file1.isDirectory()){   //判断文件夹是否存在，不存在则创建
		    		file1.mkdirs();
		    	}
		    	//上传文件
		    	String realPath1 = modelAction.getRequest().getSession().getServletContext().getRealPath(
		    			"up_load"+separator+"comm"+separator+"problemReport"+separator + fileName);
		        fos = new FileOutputStream(realPath1);
		        BufferedInputStream bf = new BufferedInputStream(new FileInputStream(file));
		        byte[] bt = new byte[1024];
		        int n = bf.read(bt);
		        while (n != -1)
		        {
		          fos.write(bt, 0, n);
		          fos.flush();
		          n = bf.read(bt);
		        }
		    }
		  //修改8D报告单信息
		    List<Object> sqlW = new ArrayList<Object>();
		    sqlW.add(dataId);	
		    sqlW.add(dataAuth); 
			TableDataMapExt pro = new TableDataMapExt(); 
			pro.setTableName("T_CO_PROBLEM_REPORT");
		 	CommMethod.editSysDefCol(pro.getColMap(), modelAction.getUser());
		 	pro.setSqlWhere("and id =? and data_auth=? ");
		 	pro.setSqlWhereArgs(sqlW);
		 	pro.getColMap().put("CPR_STATUS", "6");
		 	pro.getColMap().put("CPR_CONFIRM_RESULT", CPR_CONFIRM_RESULT);
		 	pro.getColMap().put("CPR_EFFECT_CONFIRM", CPR_EFFECT_CONFIRM);
		 	pro.getColMap().put("CPR_STANDARDIZE", CPR_STANDARDIZE);
		 	//pro.getColMap().put("CPR_CONGRATULATE", CPR_CONGRATULATE);
		 	pro.getColMap().put("CPR_CONFIRM_EMP", CommMethod.getSessionUser().getId());
		 	pro.getColMap().put("CPR_CONFIRM_DATE", DateUtil.getCurDate());
		 	if(dataAuth!=null){
		 		pro.getColMap().put("DATA_AUTH", dataAuth);
		    }
		 	if(realName != null){
		 		pro.getColMap().put("CPR_STANDARDIZE_FILE", realName);
		 		pro.getColMap().put("CPR_STANDARDIZE_FILESAVENAME", fileName);
		 		pro.getColMap().put("CPR_STANDARDIZE_FILEPATH", fileAddress);
		 		pro.getColMap().put("CPR_STANDARDIZE_FILESIZE", fileSize);
		    }
		 	modelService.edit(pro);
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("保存失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), "0");
	}

}
