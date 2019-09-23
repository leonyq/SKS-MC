package com.more.mes.smt.programInfo;

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
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存新增的软体信息
 * @author development
 *
 */
public class AddProgramInfo implements FuncService {

	private final Log log = LogFactory.getLog(this.getClass());
	
	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
        String isCloseWin = request.getParameter("isCloseWin");//是否关闭窗口
        String formId = request.getParameter("formId");
    	if(StringUtils.isBlank(formId)){
      		formId = request.getParameter("formIds");
   		 }
    	String iframeId = request.getParameter("iframeId");   
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	try {
			//获取新增的软体信息
    		//String dataAuth = request.getSession().getAttribute("mcDataAuth").toString();
    		String programSn =request.getParameter("paraMap1@0#CPI_SN");//软体编号
    		String programName =request.getParameter("paraMap1@0#CPI_NAME");//软体名称
    		String productStep =request.getParameter("paraMap1@0#CPI_PRODUCT_STEP");//生产阶别
    		String processFace =request.getParameter("paraMap1@0#CPI_PROCESS_FACE");//加工面别
    		String groupCode =request.getParameter("paraMap1@0#CPI_GROUP");//工序代码
    		String modelCode =request.getParameter("paraMap1@0#CPI_MODEL_CODE");//机种料号
    		String version =request.getParameter("paraMap1@0#CPI_VERSION");//版本
    		String flag =request.getParameter("paraMap1@0#CPI_DEFAULT_FLAG");//默认标志
    		String memo =request.getParameter("paraMap1@0#CPI_MEMO");//备注
    		String dataid = modelAction.getDataId();
    		String dataAuth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
    		if (flag == null || flag == "" || flag.equals("")){
    			flag = "N";
    	    }
    		
    		String fileName = null;
    		String realName = null;    //文件原有名称
    	    String fileAddress = null;
    	    float fileSize = 0;
    	    FileInputStream fis = null;
    	    FileOutputStream fos = null;
    	     int  count = 0;
    	     int  count2 = 0;
    	     int  count3 = 0;
    	    
    	    String sql="select * from T_CO_PROGRAM_INFO where CPI_SN=? AND DATA_AUTH=?  ";
        
            count= modelService.countSql(sql, new Object[]{programSn,dataAuth});
            
            if(count>=1){
                return modelAction.alertParentInfo(modelAction.getText("软体编号已存在"));
            }
            
            
             String sql2 = "select * from T_CO_PROGRAM_INFO where CPI_MODEL_CODE=? and CPI_PRODUCT_STEP=?  " +
        		"and CPI_PROCESS_FACE=? and CPI_GROUP=? and CPI_DEFAULT_FLAG=? and DATA_AUTH=? ";
        		
        		count2= modelService.countSql(sql2, new Object[]{modelCode,productStep,processFace,groupCode,flag,dataAuth});
        		
        		if(count2>=1&&flag.equals("Y")){
                return modelAction.alertParentInfo(modelAction.getText("同个机种、生成阶别、面别、工序只允许存在一条默认标志为Y的数据"));
            }
            
           String  sql3 = "select * from T_CO_PROGRAM_INFO where CPI_MODEL_CODE=? and CPI_PRODUCT_STEP=? " +
        		"and CPI_PROCESS_FACE=? and CPI_GROUP=? and CPI_VERSION=? and DATA_AUTH=?";
       
       count3= modelService.countSql(sql3, new Object[]{modelCode,productStep,processFace,groupCode,version,dataAuth});
       
       	if(count3>=1){
                return modelAction.alertParentInfo(modelAction.getText("同个机种、生成阶别、面别、工序、版本只允许存在一条数据"));
            }
       
    	    if (modelAction.getUpFile() != null){
    	    	realName = modelAction.getUpFileFileName(); // 文件名称
    	    	fileName = realName.substring(realName.lastIndexOf(".") + 1);
    	    	fileName = StringUtils.getUUID() + "." + fileName;  //文件存放名称
    	    	fileAddress = "program";   //文件存放路径
    	    	String separator = File.separator;
    	    	String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath(
    	    			"up_load"+separator+"comm"+separator+"program"+separator);
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
    	    	  "up_load"+separator+"comm"+separator+"program"+separator + fileName);
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
    	    //插入新增的软体信息
    	    TableDataMapExt program = new TableDataMapExt();
    	    program.setTableName("T_CO_PROGRAM_INFO");
    	    CommMethod.addSysDefCol(program.getColMap(), modelAction.getUser());
    	    program.getColMap().put("ID", StringUtils.getUUID());
    	    program.getColMap().put("CPI_SN", programSn);
    	    program.getColMap().put("CPI_NAME", programName);
    	    program.getColMap().put("CPI_PRODUCT_STEP", productStep);
    	    program.getColMap().put("CPI_PROCESS_FACE", processFace);
    	    program.getColMap().put("CPI_GROUP", groupCode);
    	    program.getColMap().put("CPI_MODEL_CODE", modelCode);
    	    program.getColMap().put("CPI_VERSION", version);
    	    program.getColMap().put("CPI_DEFAULT_FLAG", flag);
    	    program.getColMap().put("CPI_MEMO", memo);
    	    program.getColMap().put("CPI_CREATE_EMP", CommMethod.getSessionUser().getId());
    	    program.getColMap().put("CPI_CREATE_TIEM", sdf.parse(sdf.format(new Date())));
    	    if(dataAuth!=null && !dataAuth.equals("")){
                program.getColMap().put("DATA_AUTH", dataAuth);
            }
    	    
    	    if (realName != null){
    	    	program.getColMap().put("CPI_SYS_NAME", realName);
    	    	program.getColMap().put("CPI_REAL_NAME", fileName);
    	    	program.getColMap().put("CPI_ADDRESS", fileAddress);
    	    	program.getColMap().put("CPI_SIZE", fileSize); 
    	    }
    	    modelService.save(program);
		} catch (Exception e) {
			log.error(e);
			throw new BussException(modelAction.getText("新增失败"), e);
		}
    	return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"),isCloseWin);
	}

}
