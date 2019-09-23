package com.more.mes.smt.production.bommgr;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.Smap;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 
 * @Title <修改bom信息>
 * @Description <新增bom信息> 
 * @ClassName BomSaveService
 * @see BomSaveService
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class BomEditSaveService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // 获取封装的数据
    HttpServletRequest request = modelAction.getRequest();
    String formId =CommMethod.escapeJs(request.getParameter("formId")) ;
    //String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    
    String iframeId = request.getParameter("iframeId");
    String cbItemCode = request.getParameter("paraMapObj.CB_ITEM_CODE");
    String cbVer = request.getParameter("paraMapObj.CB_VER");
    String cbDefault = request.getParameter("paraMapObj.CB_DEFAULT");
    if(StringUtils.isEmpty(cbDefault)){
        cbDefault = "N";
    }

    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String sql = "select id from t_co_bom where CB_ITEM_CODE=? AND CB_VER=? AND DATA_AUTH =? ";
    List list = modelService.listDataSql(sql, new Object[] {cbItemCode, cbVer,dataAuth});
    if (null!=list && list.size() > 0)
    {
      Map map = (Map)list.get(0);
      if (!StringUtils.toString(map.get("ID")).equals(modelAction.getDataId()))
      {
        return modelAction.alertParentInfo((modelAction.getText("机种料号" + cbItemCode + "对应版本"
                                                                + cbVer + "已经存在")));
      }
    }
    /*
     * String sqls = "select id from t_co_bom where CB_ITEM_CODE=? AND CB_DEFAULT=?"; List lists =
     * modelService.listDataSql(sql, new Object[] {cbItemCode, "Y"}); if (lists.size() > 0) { Map
     * map = (Map)list.get(0); if
     * (!StringUtils.toString(map.get("ID")).equals(modelAction.getDataId())) { return
     * modelAction.alertParentInfo((modelAction.getText("该机种料号已存在默认标识"))); } }
     */
    String infoId = modelAction.getDataId();
    String sql_s = "select * from t_co_bom where CB_ITEM_CODE=? AND CB_DEFAULT=? AND DATA_AUTH=? AND ID != ?";
    if ("Y".equals(cbDefault))
    {
      List lists = modelService.listDataSql(sql_s, new Object[] {cbItemCode, "Y",dataAuth, infoId});
      if ( null!=list && lists.size() > 0)
      {
        return modelAction.alertParentInfo((modelAction.getText("该机种料号已存在默认标志")));
      }
    }

    Smap smapTemp = modelAction.getParaMapObj();
    smapTemp.initParam();
    Map map = modelService.getEditComm(request, modelAction.getCurrUser(), smapTemp, modelAction);
    for (Object key : map.keySet())
    {
      String tempCode = null;
      String tempCode1 = null;
      if (key.toString().equals("b9f80468a9fe4b74ada4fceff23db738"))
      {
        JSONArray array = JSONArray.fromObject(map.get(key));
        for (int i = 0; i < array.size(); i++ )
        {
          tempCode = array.getJSONObject(i).get("CBD_ITEM_CODE").toString();
          if (cbItemCode.equals(tempCode))
          {
            return modelAction.alertParentInfo(modelAction.getText("机种料号" + cbItemCode + "和物料号"
                                                                   + tempCode + "不能相同"));
          }
          for (int j = i + 1; j < array.size(); j++ )
          {
            tempCode1 = array.getJSONObject(j).get("CBD_ITEM_CODE").toString();
            if (tempCode1.equals(tempCode))
            {
              return modelAction.alertParentInfo((modelAction.getText("物料号不能相同")));
            }
          }
        }

      }
    }
    boolean flag = true;
    MsHTranMan hbtran = BussService.getHbTran();
    List<Object> whereList = new ArrayList<Object>();//条件List
    try {
		for (Object key : map.keySet())
		{
		    if (key.toString().equals("881411561f8f4940ac22575c4b8f02ef"))
		    {
		    	Map<String, List<FileItem>> upfiles = (Map<String, List<FileItem>>)request.getAttribute("_COMM_UPLOAD_FILES_ATTR_KEY");
		    	
		    	Map<String,Object> headMap = new HashMap<String, Object>();
		    	headMap = (Map)map.get(key);
		    	whereList.clear();
		    	whereList.add(headMap.get("ID"));
		        //修改主表
		        TableDataMapExt headTable = new TableDataMapExt();
		        headTable.setTableName("T_CO_BOM");
		        headTable.setSqlWhere(" AND ID = ?");
		        headTable.setSqlWhereArgs(whereList);
		        headTable.getColMap().put("EDIT_USER", CommMethod.getSessionUser().getId());
		        headTable.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
		        headTable.getColMap().put("CB_VER", headMap.get("CB_VER"));
		        headTable.getColMap().put("CB_DEFAULT", headMap.get("CB_DEFAULT"));
		        headTable.getColMap().put("CB_REMARK", headMap.get("CB_REMARK"));
		        String fileName = null;
				String realName = null;    //文件原有名称
			    String fileAddress = null;
			    InputStream in = null;
			    FileOutputStream fos = null;
		        if(null!=upfiles&&upfiles.size()>0){
		    		Iterator<Entry<String, List<FileItem>>> ite = upfiles.entrySet().iterator();
		    		while(ite.hasNext()){
		    			Entry<String, List<FileItem>> ent = ite.next();
		    			String fileKey = ent.getKey();
		    			List<FileItem> fileItemLs = ent.getValue();
	    				if(null!=fileItemLs &&fileItemLs.size()>0){
	    					ByteArrayOutputStream outSteam = null;
	    					for(FileItem fileItem : fileItemLs){
	    						String name = fileItem.getName();
	    						realName = name; // 文件名称
	    				    	fileName = realName.substring(realName.lastIndexOf(".") + 1);
	    				    	fileName = StringUtils.getUUID() + "." + fileName;  //文件存放名称
	    				    	fileAddress = "up_load"+Constants.SEPARATOR+"comm";   //文件存放路径
	    				    	String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath(
	    				    			"up_load"+Constants.SEPARATOR+"comm");
		    					in = fileItem.getInputStream();
		    					//上传文件到服务器
		    			    	File file1 = new File(realPath);
		    			    	if(!file1.exists() && !file1.isDirectory()){   //判断文件夹是否存在，不存在则创建
		    			    		file1.mkdir();
		    			    	}
		    			    	//上传文件
		    			    	String realPath1 = modelAction.getRequest().getSession().getServletContext().getRealPath(
		    			    			"up_load"+Constants.SEPARATOR+"comm"+Constants.SEPARATOR + fileName);
		    			    	File outFile = new File(realPath1);
		    			    	if(!outFile.exists()){   //判断文件夹是否存在，不存在则创建
		    			    		outFile.createNewFile();
		    			    	}
		    			        fos = new FileOutputStream(outFile);
		    			        outSteam = new ByteArrayOutputStream(); 
		    			        byte[] bt = new byte[1024];
		    			        int len = 0;
		    			        while ((len = in.read(bt)) > 0)
		    			        {
		    			          fos.write(bt, 0, len);
		    			          outSteam.write(bt, 0, len);  
		    			          fos.flush();
		    			        }
	    					}
	    					if(fileKey.equals("paraMapObj.CB_TOP_REAL_NAME")){
			    				headTable.getColMap().put("CB_TOP_REAL_NAME", realName);
			    				headTable.getColMap().put("CB_TOP_FILE_NAME", fileName);
	    			        	headTable.getColMap().put("CB_TOP_ADDRESS", fileAddress);
			    			}
			    			if(fileKey.equals("paraMapObj.CB_BOTTOM_REAL_NAME")){
			    				headTable.getColMap().put("CB_BOTTOM_REAL_NAME", realName);
			    				headTable.getColMap().put("CB_BOTTOM_FILE_NAME", fileName);
			    				headTable.getColMap().put("CB_BOTTOM_ADDRESS", fileAddress);
			    			}
			    			if(fileKey.equals("paraMapObj.CB_DRAW_REAL_NAME")){
			    				headTable.getColMap().put("CB_DRAW_REAL_NAME", realName);
			    				headTable.getColMap().put("CB_DRAW_FILE_NAME", fileName);
			    				headTable.getColMap().put("CB_DRAW_ADDRESS", fileAddress);
			    				//先删除点位信息
			    				String delSql = "delete from T_XA_COORDINATE_CONTENT t where t.TCC_BOM_ID=? ";
			    				modelService.execSql(delSql, new Object[] {infoId});
			    				//插入坐标文件
		    					TableDataMapExt coord = new TableDataMapExt();
		    					coord.setTableName("T_XA_COORDINATE_CONTENT");
		    					String content = outSteam.toString();
	    			    	    if(content.indexOf("$PART_SECTION_BEGIN$")!=-1&&content.indexOf("$PART_SECTION_END$")!=-1){
	    			    	    	String aa = content.substring(content.indexOf("$PART_SECTION_BEGIN$"), content.indexOf("$PART_SECTION_END$"));
	    			    	    	String[] bb = aa.split("\r\n");
	    			                int num1 = bb.length;
	    			                for(int i=1;i<num1;i++){  //取出一行  bb[i]
	    			                	String [] a=bb[i].split(" +"); //取出单个
	    			                	//for(int j=0;j<a.length-1;j++){
	    			                		coord.getColMap().clear();
	    			                		CommMethod.addSysDefCol(coord.getColMap(), modelAction.getUser());
	    			                		coord.getColMap().put("TCC_BOM_ID", infoId);
	    			                		coord.getColMap().put("TCC_POINT", a[0]);
	    			                		coord.getColMap().put("TCC_PACK", a[1]);
	    			                		coord.getColMap().put("TCC_ROTATION", a[2]);
	    			                		coord.getColMap().put("TCC_XAXIS", a[3]);
	    			                		coord.getColMap().put("TCC_YAXIS", a[4]);
	    			                		coord.getColMap().put("TCC_FACE", a[5]);
	    			                		modelService.save(coord);
	    			                	//}
	    			                }
	    			    	    }
			    			}
	    				}
		    		}
		    	}
		        
		        int res = modelService.edit(headTable);
		        if(res<1){
		        	flag = false;
		        }
		    }
		    if (key.toString().equals("b9f80468a9fe4b74ada4fceff23db738"))
		    {
		    	List<Map> bodyList = new ArrayList<Map>();
		    	bodyList = (List)map.get(key);
		    	if(bodyList.size()==0) {
		    		return modelAction.alertParentInfo((modelAction.getText("请添加BOM明细记录")));
		    	}
	    		Map<String,Object> bodyMap = new HashMap<String,Object>();
	    		bodyMap = bodyList.get(0);
	    		whereList.clear();
	    		whereList.add(bodyMap.get("CB_BOMID"));
	    		whereList.add(dataAuth);
	    		//修改明细表
	    		//删除
	    		TableDataMapExt bodyTable = new TableDataMapExt();
	    		bodyTable.setTableName("T_CO_BOM_DETAIL");
	    		bodyTable.setSqlWhere(" AND CB_BOMID = ? AND DATA_AUTH = ? ");
	    		bodyTable.setSqlWhereArgs(whereList);
	    		int res = modelService.del(bodyTable);		    	
		    	for(int i=0;i<bodyList.size();i++){
			        //if(res<1){
			        //	flag = false;
			        //}
		    		//新增
		    		bodyMap = new HashMap<String,Object>();
		    		bodyMap = bodyList.get(i);
		    		TableDataMapExt bodyTable2 = new TableDataMapExt();
		    		bodyTable2.setTableName("T_CO_BOM_DETAIL");
		    		bodyTable2.getColMap().put("ID", StringUtils.getUUID());
		    		bodyTable2.getColMap().put("DEPT_ID", CommMethod.getSessionUser().getDeptId());
		    		bodyTable2.getColMap().put("CREATE_USER", CommMethod.getSessionUser().getId());
		    		bodyTable2.getColMap().put("CREATE_TIME", DateUtil.getCurDate());
		    		bodyTable2.getColMap().put("CB_BOMID", bodyMap.get("CB_BOMID"));
		    		bodyTable2.getColMap().put("CBD_ITEM_CODE", bodyMap.get("CBD_ITEM_CODE"));
		    		bodyTable2.getColMap().put("CBD_ITEM_NUM", bodyMap.get("CBD_ITEM_NUM"));
		    		bodyTable2.getColMap().put("CBD_POINT", bodyMap.get("CBD_POINT"));
		    		bodyTable2.getColMap().put("CBD_UNITS", bodyMap.get("CBD_UNITS"));
		    		bodyTable2.getColMap().put("CBD_ITEM_SECTION", bodyMap.get("CBD_ITEM_SECTION"));
		    		bodyTable2.getColMap().put("CBD_ITEM_TYPE", bodyMap.get("CBD_ITEM_TYPE"));
		    		bodyTable2.getColMap().put("CBD_TOP_NUM", bodyMap.get("CBD_TOP_NUM"));
		    		bodyTable2.getColMap().put("CBD_TOP_POINT", bodyMap.get("CBD_TOP_POINT"));
		    		bodyTable2.getColMap().put("CBD_BOTTOM_NUM", bodyMap.get("CBD_BOTTOM_NUM"));
		    		bodyTable2.getColMap().put("CBD_BOTTOM_POINT", bodyMap.get("CBD_BOTTOM_POINT"));
		    		bodyTable2.getColMap().put("DATA_AUTH", dataAuth);
		    		int res2 = modelService.save(bodyTable2);
			        if(res2<1){
			        	flag = false;
			        }
		    	} 
		    }
		}
	} catch (Exception e) {
		hbtran.rollback();
	    return modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.FAIL,
	    	      Constants.OPERATE_TYPE_EDIT);
	}
    smapTemp.remove("tableName");
    smapTemp.remove("_FLAG");
    //modelService.editComm(request, modelAction.getCurrUser(), smapTemp, modelAction);


    
    
    if(flag==true){
    	hbtran.commit();
        return modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.SUCCESS,
        	      Constants.OPERATE_TYPE_EDIT);   	
    }else{
		hbtran.rollback();
	    return modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.FAIL,
	    	      Constants.OPERATE_TYPE_EDIT);    	
    }

    // return modelAction.reloadParent(modelAction.getText("修改成功"));
  }

}
