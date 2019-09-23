package com.more.mes.smt.production.bommgr.oracle;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
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
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
/**
 * 
 * @Title <新增bom信息>
 * @Description <新增bom信息> 
 * @ClassName BomSaveService
 * @see BomSaveService
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class BomSaveService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // 获取封装的数据
    HttpServletRequest request = modelAction.getRequest();
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try {
    	String cbItemCode = request.getParameter("paraMap0@0#CB_ITEM_CODE");
        String cbVer = request.getParameter("paraMap0@0#CB_VER");
        String cbDefault = request.getParameter("paraMap0@0#CB_DEFAULT");
        String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");// 是否关闭窗口

        String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
        Map map = modelService.getAddComm(request, modelAction.getCurrUser(), modelAction);
        //String sql="SELECT * FROM(SELECT ROW_NUMBER () OVER (ORDER BY ID ASC) AS ROWNUM,ID	FROM t_co_bom WHERE	 CB_ITEM_CODE= ? AND CB_VER= ?) AS rrr WHERE	ROWNUM = 1";
        String sql = "select id from t_co_bom where rownum=1 and CB_ITEM_CODE=? AND CB_VER=? AND DATA_AUTH=? ";
        List list = modelService.listDataSql(sql, new Object[] {cbItemCode, cbVer,dataAuth});
        if (null!=list &&  list.size() > 0)
        {
          // return
          // modelAction.alertParentInfo((modelAction.getText("机种料号"+cbItemCode+"对应版本"+cbVer+"已经存在！")));
          return modelAction.alertParentInfo((modelAction.getText("该机种料号已存在对应版本")));
        }
        String sql_s = "select * from t_co_bom where CB_ITEM_CODE=? AND CB_DEFAULT=? AND DATA_AUTH=? ";
        if ("Y".equals(cbDefault))
        {
          List lists = modelService.listDataSql(sql_s, new Object[] {cbItemCode, "Y",dataAuth});
          if (null!=list &&  lists.size() > 0)
          {
            return modelAction.alertParentInfo((modelAction.getText("该机种料号已存在默认标志")));
          }
        }
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
               return modelAction.alertParentInfo(modelAction
                                    .getText("机种料号")+cbItemCode+modelAction.getText("和")+modelAction.getText("物料料号")+tempCode+modelAction.getText("不能相同"));
                // return
                // modelAction.alertParentInfo(modelAction.getTexts("机种料号%s和物料号%s不能相同",cbItemCode,tempCode));
              }
              for (int j = i + 1; j < array.size(); j++ )
              {
                tempCode1 = array.getJSONObject(j).get("CBD_ITEM_CODE").toString();
                if (tempCode1.equals(tempCode))
                {
                  // return
                  // modelAction.alertParentInfo(modelAction.getTexts("物料号%s和物料号%s不能相同",tempCode1,tempCode));
                  return modelAction.alertParentInfo(modelAction.getText("物料号重复:") + tempCode1);
                }
              }
            }

          }
        }
        modelService.addComm(request, modelAction.getCurrUser(), modelAction);
        //获取bomid
        String sql1 = "select id from t_co_bom t where t.CB_ITEM_CODE=? and t.CB_VER=? and t.CB_DEFAULT=? ";
        if (!"Y".equals(cbDefault)) {
        	cbDefault = "N";
        }
        //获取文件解析点位信息
        Map<String, List<FileItem>> upfiles = (Map<String, List<FileItem>>)request.getAttribute("_COMM_UPLOAD_FILES_ATTR_KEY");
        if(null!=upfiles&&upfiles.size()>0){
    		Iterator<Entry<String, List<FileItem>>> ite = upfiles.entrySet().iterator();
    		while(ite.hasNext()){
    			Entry<String, List<FileItem>> ent = ite.next();
    			String fileKey = ent.getKey();
    			if(fileKey.equals("paraMap0@0#CB_DRAW_REAL_NAME")){
    				List<FileItem> fileItemLs = ent.getValue();
    				if(null!=fileItemLs &&fileItemLs.size()>0){
    					//插入坐标文件
    					TableDataMapExt coord = new TableDataMapExt();
    					coord.setTableName("T_XA_COORDINATE_CONTENT");
        				for(FileItem fileItem : fileItemLs){
        					InputStream in = fileItem.getInputStream();	
        			        ByteArrayOutputStream outSteam = new ByteArrayOutputStream(); 
        			        byte[] bt = new byte[1024];
        			        int len = 0;
        			        while ((len = in.read(bt)) > 0)
        			        {
        			          outSteam.write(bt, 0, len);
        			        }
        			        String content = outSteam.toString();
    			    	    if(content.indexOf("$PART_SECTION_BEGIN$")!=-1&&content.indexOf("$PART_SECTION_END$")!=-1){
    			    	    	String aa = content.substring(content.indexOf("$PART_SECTION_BEGIN$"), content.indexOf("$PART_SECTION_END$"));
    			    	    	String[] bb = aa.split("\r\n");
    			                int num1 = bb.length;
    			                List<Map<String, Object>> list1 = modelService.listDataSql(sql1, new Object[]{cbItemCode,cbVer,cbDefault});
    			                for(int i=1;i<num1;i++){  //取出一行  bb[i]
    			                	String [] a=bb[i].split(" +"); //取出单个
    			                	//for(int j=0;j<a.length-1;j++){
    			                		coord.getColMap().clear();
    			                		CommMethod.addSysDefCol(coord.getColMap(), modelAction.getUser());
    			                		coord.getColMap().put("TCC_BOM_ID", list1.get(0).get("ID"));
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
    	}
        return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), isCloseWin);
        /*
         * if (StringUtils.isBlank(isCloseWin)) { return
         * modelAction.alertInfoClear(modelAction.getText("新增成功"), "2"); } else { return
         * modelAction.commAjaxFunClassLoadParent(formId, iframeId, Constants.SUCCESS,
         * Constants.OPERATE_TYPE_ADD); // return
         * modelAction.reloadParent(modelAction.getText("新增成功")); }
         */
	} catch (Exception e) {
		throw new BussException(modelAction.getText("保存失败"), e);
	}
  }
}
