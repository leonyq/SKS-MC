package com.more.mes.smt.exemption.service;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.greenpineyu.fel.common.Null;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存修改的免检管理信息
 * @author development
 *
 */
public class EditExemptionService implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
	    String formId = request.getParameter("formId");
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	String id = request.getParameter("dataId");
	    	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	String itemCode = request.getParameter("paraMapObj.QEI_ITEM_CODE"); // 物料料号
	        String supCode = request.getParameter("paraMapObj.QEI_SUP_CODE"); // 供应商
	        String startTime = request.getParameter("paraMapObj.QEI_START_TIME"); // 起始时间
	        String endTime = request.getParameter("paraMapObj.QEI_END_TIME"); // 结束时间
	        String applyReason = request.getParameter("paraMapObj.QEI_APPLY_REASON"); // 申请原因
	        String applyBasis = request.getParameter("paraMapObj.QEI_APPLY_BASIS"); // 申请依据
	        String reviewOpinion = request.getParameter("paraMapObj.QEI_REVIEW_OPINION"); // 评审意见
	       // Date nowDate = DateUtil.getCurDate();
	        String sql1 = "select 1 from T_QM_EXEMPTION_INFO ";
	        sql1 += " where 1=1 and QEI_ITEM_CODE = ?";
	        sql1 += " and QEI_SUP_CODE = ? ";
	        sql1 += " and QEI_VALID_FLAG = 'Y'";
	        sql1 += " and ID != ?";
	        sql1 += " and QEI_START_TIME < to_date(?,'yyyy-mm-dd hh24:mi:ss')";
	        sql1 += " and QEI_END_TIME > to_date(?,'yyyy-mm-dd hh24:mi:ss')";
	        sql1 += " and DATA_AUTH = ? ";
	        List eList = modelService.listDataSql(sql1, new Object[]{itemCode,supCode,id,endTime,startTime,dataAuth});
	        if(eList.size()>0){
	        	return modelAction.alertParentInfo(modelAction.getText("当前物料已存在有效记录"));
	        }
	        
	        String sql = "select QEI_SAVEFILE_NAME from T_QM_EXEMPTION_INFO where id = ?";
			List<Map> sList = modelService.listDataSql(sql, new Object[] { id });
			if(sList==null||sList.size()<1){
				return modelAction.alertParentInfo(modelAction.getText("此物料无对应记录"));
			}
		    String myFileName = (String) sList.get(0).get("QEI_SAVEFILE_NAME");
		    
		    String fileName = null;
    		String realName = null;    //文件原有名称
    	    String fileAddress = null;
    	    float fileSize = 0;
    	    FileInputStream fis = null;
    	    FileOutputStream fos = null;
    	    String separator = File.separator; 
			if (modelAction.getUpFile() != null){
				//先删除原有文件
				String str = modelAction.getRequest().getSession().getServletContext().getRealPath(
    	    			"up_load"+separator+"comm"+separator+"exemption"+separator+myFileName);
				File myFile = new File(str);
				if(myFile.exists()){
				    myFile.delete();
				}
				realName = modelAction.getUpFileFileName(); // 文件名称
    	    	fileName = realName.substring(realName.lastIndexOf(".") + 1);
    	    	fileName = StringUtils.getUUID() + "." + fileName;  //文件存放名称
    	    	fileAddress = "exemption";   //文件存放路径
    	    	String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath(
    	    			"up_load"+separator+"comm"+separator+"exemption");
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
    	    			"up_load"+separator+"comm"+separator+"exemption"+separator + fileName);
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
			
			// 插入免检管理信息
			TableDataMapExt exemption = new TableDataMapExt();
			exemption.setTableName("T_QM_EXEMPTION_INFO");
		    CommMethod.editSysDefCol(exemption.getColMap(), modelAction.getUser());
		    exemption.setSqlWhere(" and ID=? ");
		    ArrayList delList = new ArrayList();
	        delList.add(id);
	        exemption.setSqlWhereArgs(delList);
		    exemption.getColMap().put("QEI_ITEM_CODE", itemCode);
		    exemption.getColMap().put("QEI_SUP_CODE", supCode);
		    exemption.getColMap().put("QEI_START_TIME", sdf1.parse(startTime));
		    exemption.getColMap().put("QEI_END_TIME", sdf1.parse(endTime));
		    exemption.getColMap().put("QEI_APPLY_REASON", applyReason);
		    exemption.getColMap().put("QEI_APPLY_BASIS", applyBasis);
		    exemption.getColMap().put("QEI_REVIEW_OPINION", reviewOpinion);
		    
		    if(dataAuth!=null){
		    	exemption.getColMap().put("DATA_AUTH", dataAuth);
		    }
		    if(realName != null){
		    	exemption.getColMap().put("QEI_FILE_NAME", realName);
		    	exemption.getColMap().put("QEI_SAVEFILE_NAME", fileName);
		    	exemption.getColMap().put("QEI_FILE_PATH", fileAddress);
		    	exemption.getColMap().put("QEI_FILE_SIZE", fileSize);
		    }
		    modelService.edit(exemption);
	        
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("修改失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
	}

}
