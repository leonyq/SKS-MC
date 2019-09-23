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
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存修改的8D报告单
 * @author development
 *
 */
public class SaveEditProblemReport implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
		 String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	String dataId = request.getParameter("dataId");
	    	String CPR_NAME = request.getParameter("paraMapObj.CPR_NAME");//报告名称
	    	String CPR_HAPPEN_ADDRESS = request.getParameter("paraMapObj.CPR_HAPPEN_ADDRESS");//发生地点
			String CPR_HAPPEN_PROBLEM = request.getParameter("paraMapObj.CPR_HAPPEN_PROBLEM");//问题描述
			String CPR_HAPPEN_INFLUENCE = request.getParameter("paraMapObj.CPR_HAPPEN_INFLUENCE");//造成影响
			String CPR_GROUP_EMP = request.getParameter("paraMapObj.CPR_GROUP_EMP");//小组成员
			String sql = "select CPR_NAME from T_CO_PROBLEM_REPORT where CPR_NAME=? and id !=? AND DATA_AUTH=? ";
			List count = modelService.listDataSql(sql,new Object[] {CPR_NAME,dataId,dataAuth});
			if(count.size()!=0){
				return modelAction.alertParentInfo(modelAction.getText("报告名称已存在"));
			}
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
		    		file1.mkdir();
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
		 	pro.getColMap().put("CPR_NAME", CPR_NAME);
		 	pro.getColMap().put("CPR_HAPPEN_ADDRESS", CPR_HAPPEN_ADDRESS);
		 	pro.getColMap().put("CPR_HAPPEN_PROBLEM", CPR_HAPPEN_PROBLEM);
		 	pro.getColMap().put("CPR_HAPPEN_INFLUENCE", CPR_HAPPEN_INFLUENCE);
		 	pro.getColMap().put("CPR_GROUP_EMP", CPR_GROUP_EMP);
		 	if(dataAuth!=null){
		 		pro.getColMap().put("DATA_AUTH", dataAuth);
		    }
		 	if(realName != null){
		 		pro.getColMap().put("CPR_HAPPEN_FILE", realName);
		 		pro.getColMap().put("CPR_HAPPEN_FILESAVENAME", fileName);
		 		pro.getColMap().put("CPR_HAPPEN_FILEPATH", fileAddress);
		 		pro.getColMap().put("CPR_HAPPEN_FILESIZE", fileSize);
		    }
		 	modelService.edit(pro);
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("修改失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}
}
