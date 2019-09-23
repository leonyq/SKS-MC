package com.more.mes.smt.exemption.service;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
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
 * 新增免检管理信息
 * @author development
 *
 */
public class SaveExemptionService implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String dataAuth = request.getParameter("_DATA_AUTH");
	    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
	    String formId = request.getParameter("formId");
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	String itemCode = request.getParameter("paraMap1@0#QEI_ITEM_CODE"); // 物料料号
	        String supCode = request.getParameter("paraMap1@0#QEI_SUP_CODE"); // 供应商
	        String startTime = request.getParameter("paraMap1@0#QEI_START_TIME"); // 起始时间
	        String endTime = request.getParameter("paraMap1@0#QEI_END_TIME"); // 结束时间
	        String applyReason = request.getParameter("paraMap1@0#QEI_APPLY_REASON"); // 申请原因
	        String applyBasis = request.getParameter("paraMap1@0#QEI_APPLY_BASIS"); // 申请依据
	        String reviewOpinion = request.getParameter("paraMap1@0#QEI_REVIEW_OPINION"); // 评审意见
	       // Date nowDate = DateUtil.getCurDate();
	        String sql = "select 1 from T_QM_EXEMPTION_INFO ";
	        sql += " where 1=1 and QEI_ITEM_CODE = ? ";
	        sql += " and QEI_SUP_CODE = ? ";
	        sql += " and QEI_VALID_FLAG = 'Y'";
	        sql += " and QEI_START_TIME < to_date(?,'yyyy-mm-dd hh24:mi:ss')";
	        sql += " and QEI_END_TIME > to_date(?,'yyyy-mm-dd hh24:mi:ss')";
	        sql += " and DATA_AUTH = ? ";
	        List eList = modelService.listDataSql(sql, new Object[]{itemCode,supCode,endTime,startTime,dataAuth});
	        if(eList!=null&&eList.size()>0){
	        	return modelAction.alertParentInfo(modelAction.getText("当前物料已存在有效记录"));
	        }

	        String fileName = null;
    		String realName = null;    //文件原有名称
    	    String fileAddress = null;
    	    float fileSize = 0;
    	    FileInputStream fis = null;
    	    FileOutputStream fos = null;
    	    String separator = File.separator; 
    	    if (modelAction.getUpFile() != null){
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
		    CommMethod.addSysDefCol(exemption.getColMap(), modelAction.getUser());
		    exemption.getColMap().put("QEI_ITEM_CODE", itemCode);
		    exemption.getColMap().put("QEI_SUP_CODE", supCode);
		    exemption.getColMap().put("QEI_VALID_FLAG", "Y");
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
		    modelService.save(exemption);
    	    
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("新增失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

}
