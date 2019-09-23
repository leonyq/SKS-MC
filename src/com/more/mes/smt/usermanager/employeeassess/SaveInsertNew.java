package com.more.mes.smt.usermanager.employeeassess;


import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import com.more.fw.core.base.login.model.UserDto;
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
 * 保存新增的考核信息
 * 
 * @author development
 */
public class SaveInsertNew implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    
         
    //String dataAuth = request.getParameter("_DATA_AUTH");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String assessCode = request.getParameter("paraMap1@0#ASSESS_CODE");//paraMap1@0#ASSESS_CODE获取考核编号
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    
    //判断考核编号存在否
    String sql = "SELECT T.ASSESS_CODE "  
                    + " FROM T_USER_ASSESS T where T.ASSESS_CODE=? and T.DATA_AUTH=?";
    List list = modelService.listDataSql(sql, new Object[] {assessCode,dataAuth});
    
    if (list != null && !list.isEmpty())
    {
      return modelAction.alertParentInfo((modelAction.getText("考核编号已存在！")));
    }
    
     if (StringUtils.isBlank(formId))
     {
       formId = request.getParameter("formIds");
     }
     String iframeId = request.getParameter("iframeId");
     
    try
    {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

      String assessDate = request.getParameter("paraMap1@0#ASSESS_DATE");// 考核日期
      String assessUserId = request.getParameter("paraMap1@0#ASSESS_USER_ID");// 记录人
      
      String assessLevelBefore = request.getParameter("paraMap1@0#ASSESS_LEVEL_B");// 考核前等级
      String assessLevelafter = request.getParameter("paraMap1@0#ASSESS_LEVEL_A");// 考核后等级
      
      String assessContent = request.getParameter("paraMap1@0#ASSESS_CONTENT");//考核意见
      String remark = request.getParameter("paraMap1@0#REMARK");//备注
      
      String assessResult=request.getParameter("paraMap1@0#ASSESS_RESULT");//考核结果
      String assessFile=request.getParameter("paraMap1@0#ASSESS_FILE");//考核文件
      
      String userIds = request.getParameter("ids");//考核员工ID
      //String[] ids = userIds.split(",");
      String[] ids = null;
      int assessCount =0; //考核员工数
      if (userIds != null && userIds != "") {
    	  ids = userIds.split(",");

			assessCount = ids.length;// 考核员工数

		}
      TableDataMapExt itemMap = new TableDataMapExt();
      
      //保存考核信息到T_USER_ASSESS表
      itemMap.setTableName("T_USER_ASSESS");
      
      CommMethod.addSysDefCol(itemMap.getColMap(), modelAction.getUser());
      itemMap.getColMap().put("ASSESS_CODE", assessCode);
      itemMap.getColMap().put("ASSESS_DATE", sdf.parse(assessDate));
      itemMap.getColMap().put("ASSESS_USER_ID", assessUserId);
      itemMap.getColMap().put("ASSESS_LEVEL_B", assessLevelBefore);
      itemMap.getColMap().put("ASSESS_LEVEL_A", assessLevelafter);
      itemMap.getColMap().put("ASSESS_CONTENT", assessContent);
      itemMap.getColMap().put("REMARK", remark);
      itemMap.getColMap().put("ASSESS_RESULT",assessResult);
     // itemMap.getColMap().put("ASSESS_FILE",assessFile);
     itemMap.getColMap().put("ASSESS_COUNT", assessCount);
     
     
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
    	fileAddress = "assessFile";   //文件存放路径
    	String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath("up_load"+Constants.SEPARATOR+"comm"+Constants.SEPARATOR+"assessFile");
    	fis = new FileInputStream(modelAction.getUpFile());
    	fileSize = fis.available(); // 文件大小
    	//上传文件到服务器
    	File file = modelAction.getUpFile();
    	File file1 = new File(realPath);
    	if(!file1.exists() && !file1.isDirectory()){   //判断文件夹是否存在，不存在则创建
    		file1.mkdir();
    	}
    	//上传文件
    	String realPath1 = modelAction.getRequest().getSession().getServletContext().getRealPath("up_load"+Constants.SEPARATOR+"comm"+Constants.SEPARATOR+"assessFile"+Constants.SEPARATOR + fileName);
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
        fos.close();//关闭流
        fis.close();
	}
	
//	if (dataAuth != null) {
//		itemMap.getColMap().put("DATA_AUTH", dataAuth);
//	}
	if (realName != null) {
		itemMap.getColMap().put("ASSESS_FILE", realName);
		itemMap.getColMap().put("ASSESS_FILE_REAL_NAME", fileName);
		itemMap.getColMap().put("ASSESS_FILE_PATH", fileAddress);
		itemMap.getColMap().put("ASSESS_FILE_SIZE", fileSize);
	}

	modelService.save(itemMap);
      
      //查询考核ID
      String getIdSql = "SELECT T.ID  "
    		  			+ " FROM T_USER_ASSESS T WHERE T.ASSESS_CODE=? and T.DATA_AUTH=?";
      List<Map> list2 = modelService.listDataSql(getIdSql, new Object[] {assessCode,dataAuth});
      
          //保存考核员工信息到T_USER_ASSESS_USER表
        String  assessId= StringUtils.toString(list2.get(0).get("ID")); 
    itemMap = new TableDataMapExt();
      for (int i = 0; i < ids.length; i++) 
      {
    	 
    	  itemMap.getColMap().clear();
          itemMap.setTableName("T_USER_ASSESS_USER");
    	  CommMethod.addSysDefCol(itemMap.getColMap(), modelAction.getUser());
          itemMap.getColMap().put("ASSESS_ID", assessId);
          itemMap.getColMap().put("USER_ID", ids[i].substring(ids[i].lastIndexOf("_")+1));
          modelService.save(itemMap);
      }}
      
    catch (Exception e)
    {
           log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }
    
    
    
    
    
    
}
