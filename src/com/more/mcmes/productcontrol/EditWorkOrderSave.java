package com.more.mcmes.productcontrol;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.mes.smt.getsnhttp.service.GetSnService;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.exception.OperResult;
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
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import java.text.DecimalFormat;
/**
 * 制令单位信息修改-初始化数据
 * 
 * @author hjw
 */
public class EditWorkOrderSave implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
        MsHTranMan hbtran = BussService.getHbTran();
    // 获取封装的数据
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String proId = request.getParameter("paraMapObj.PROJECT_ID");
    String cbItemCode = request.getParameter("paraMapObj.PRODUCT_MATERIAL");
    String PROLEPSIS_START_DATE = request.getParameter("paraMapObj.PROLEPSIS_START_DATE");
    String PROLEPSIS_END_DATE = request.getParameter("paraMapObj.PROLEPSIS_END_DATE");
    String TPPB_PLAN_DELIVERY_DATE = request.getParameter("paraMapObj.TPPB_PLAN_DELIVERY_DATE");
    String PRODUCT_LINE = request.getParameter("paraMapObj.PRODUCT_LINE");
    String PROJECT_STEP = request.getParameter("paraMapObj.PROJECT_STEP");
    String count = request.getParameter("count");
    String iframeId = request.getParameter("iframeId");
     String productFlag = request.getParameter("flag");
    String productConfigure = request.getParameter("paraMapObj.PRODUCT_CONFIGURE");
    String pack_Seq = request.getParameter("paraMapObj.PRODUCT_PACK_SEQ");
    String product_count = request.getParameter("paraMapObj.PRODUCT_COUNT");
    String productSnPrefix = request.getParameter("paraMapObj.PRODUCT_SN_PREFIX");
    if (PROLEPSIS_START_DATE != null && PROLEPSIS_START_DATE.compareTo(PROLEPSIS_END_DATE) > 0)
    {
      return modelAction.alertParentInfo((modelAction.getText("预计开工日期不能大于预计完工日期")));
    }
    
    if (StringUtils.isNotBlank(PRODUCT_LINE) && StringUtils.isNotBlank(PROJECT_STEP))
      {
        String sql = " select * from T_CO_AREA where  CA_ID =? and CA_TYPE=? and CA_PROJECT_STEP=? AND DATA_AUTH=? ";
    
        int counts = modelService.countSql(sql, new Object[]{PRODUCT_LINE,"1",PROJECT_STEP,dataAuth});
        
        if (counts<1)
        {
          //throw new BussException(FuncCode.MS100_0001_002 + CommMethod.getText("线别生产阶别与生产阶别不同"));
          return modelAction.alertParentInfo((modelAction.getText("线别生产阶别与生产阶别不同")));
        }
      }
    if ("Y".equals(productFlag))
    {
      productFlag = "Y";
    }
    else
    {
      productFlag = "N";
    }
    if ("Y".equals(pack_Seq))
    {
      pack_Seq = "Y";
    }
    else
    {
      pack_Seq = "N";
    }
    
    
    Smap smapTemp = modelAction.getParaMapObj();
    smapTemp.initParam();
    Map map = modelService.getEditComm(request, modelAction.getCurrUser(), smapTemp, modelAction);
    try {
		for (Object key : map.keySet())
		{
			//fbe85506ea9d4a32b0cf78996898c620 detail表
			//d34c8f48bead40d88c24a153c731de82 base表
		  String tempCode = null;
		  String tempCode1 = null;
		  String tempType = null;

		  int flag = 0;
		  if (key.toString().equals("fbe85506ea9d4a32b0cf78996898c620"))
		  {
		    JSONArray array = JSONArray.fromObject(map.get(key));
		    if (array.size() == 0)
		    {
		      return modelAction.alertParentInfo((modelAction.getText("请新增工单BOM！")));
		    }

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
		          return modelAction.alertParentInfo((modelAction.getText("工单BOM物料号不能相同")));
		        }
		      }
		    }
		    
		    
		    if(!StringUtils.isBlank(productConfigure)){
		      
		      String  sql="select * from T_PM_PROJECT_SN where PROJECT_ID=? AND data_Auth=? ";
		      
		      List<Map> list = modelService.listDataSql(sql, new Object[] {proId,dataAuth});
		      
		      if(null!=list && list.size()>0){
		        

            
            
            
            
            sql="SELECT CCD_ITEM_LEN FROM T_CO_SN_CONFIGURE_DETAIL WHERE CCD_CODE_SEGMENT=? AND CCD_CONFIGURE_ID=? AND data_Auth=?";
            
            List<Map> dataProList = modelService.listDataSql(sql, new Object[] {"4",productConfigure,dataAuth});
            //int b =PRODUCT_COUNT.length();
            String ccd_item_len=dataProList.get(0).get("CCD_ITEM_LEN").toString();
            int ccdItemLen =Integer.parseInt(ccd_item_len);
           
            if(ccdItemLen<product_count.length()){
              return modelAction.alertParentInfo((modelAction.getText("计划数量数量大于条码流水号长度")));
            }
            int counts =Integer.parseInt(product_count)- Integer.parseInt(count);
            if(counts>0){
              GetSnService gss= new GetSnService();
              String num = gss.getSnForWordOrder(dataAuth,productConfigure, productSnPrefix, counts+"");
              
              String[] productSnS = num.split(",");
              int productSn=productSnS.length;
              TableDataMapExt dmap = new TableDataMapExt();
              dmap.setTableName("T_PM_PROJECT_SN");
              
              for (int i = 0; i < productSn; i++ )
              {
                dmap.getColMap().clear();
                CommMethod.addSysDefCol(dmap.getColMap(), modelAction.getUser());
                dmap.getColMap().put("PRODUCT_SN", productSnS[i]);
                dmap.getColMap().put("PROJECT_ID",proId);
                modelService.save(dmap);
              }
            }
          
		        
		        
		      }else{
		         sql="SELECT CCD_ITEM_LEN FROM T_CO_SN_CONFIGURE_DETAIL WHERE CCD_CODE_SEGMENT=? AND CCD_CONFIGURE_ID=? AND data_Auth=?";
            
            List<Map> dataProList = modelService.listDataSql(sql, new Object[] {"4",productConfigure,dataAuth});
            //int b =PRODUCT_COUNT.length();
            String ccd_item_len = null;
            if(null!=dataProList && dataProList.size()>0) {
             ccd_item_len=dataProList.get(0).get("CCD_ITEM_LEN").toString();
            }
            int ccdItemLen =Integer.parseInt(ccd_item_len);
           
            if(ccdItemLen<product_count.length()){
              return modelAction.alertParentInfo((modelAction.getText("计划数量数量大于条码流水号长度")));
            }
            
            sql="select PRODUCT_COUNT from T_PM_PROJECT_BASE where PROJECT_ID=? AND data_Auth=? ";
              GetSnService gss= new GetSnService();
              String num = gss.getSnForWordOrder(dataAuth,productConfigure, productSnPrefix, product_count);
              
              String[] productSnS = num.split(",");
              int productSn=productSnS.length;
              TableDataMapExt dmap = new TableDataMapExt();
              dmap.setTableName("T_PM_PROJECT_SN");
              
              for (int i = 0; i < productSn; i++ )
              {
                dmap.getColMap().clear();
                CommMethod.addSysDefCol(dmap.getColMap(), modelAction.getUser());
                dmap.getColMap().put("PRODUCT_SN", productSnS[i]);
                dmap.getColMap().put("PROJECT_ID",proId);
                modelService.save(dmap);
              }
            
		      }
		    }else {
            String sql = "DELETE FROM T_PM_PROJECT_SN WHERE PROJECT_ID=(SELECT PROJECT_ID FROM T_PM_PROJECT_BASE WHERE ID=? AND DATA_AUTH=? ) AND DATA_AUTH=? ";
            modelService.execSql(sql, new Object[] { proId,dataAuth,dataAuth });
		    }
		    
		    
		    //修改detail
		    //del
		  TableDataMapExt delTable = new TableDataMapExt();
		  delTable.setTableName("T_PM_PROJECT_DETAIL");
		  delTable.setSqlWhere(" AND PROJECT_ID = ? AND DATA_AUTH=? ");
		  List<Object> wList = new ArrayList<Object>();
		  wList.add(proId);
		  wList.add(dataAuth);
		  delTable.setSqlWhereArgs(wList);
		  int res1 =  modelService.del(delTable);
		  if(res1<0){
			  hbtran.rollback();
			  log.error("删除明细表失败");
			  throw new BussException("删除明细表失败");
		  }
		  //save
		  List<Map> parList = new ArrayList<Map>();
		  Map<String,Object> parMap = new HashMap<String,Object>();
		  parList = (List)map.get(key);
		  for(int i=0;i<parList.size();i++){
			  parMap = parList.get(i);
			  TableDataMapExt saveDTable= new TableDataMapExt();
			  saveDTable.setTableName("T_PM_PROJECT_DETAIL");
			  saveDTable.getColMap().put("ID", StringUtils.getUUID());
			  saveDTable.getColMap().put("DEPT_ID", parMap.get("DEPT_ID"));
			  saveDTable.getColMap().put("CBD_ITEM_TYPE", parMap.get("CBD_ITEM_TYPE"));
			  saveDTable.getColMap().put("CREATE_TIME", parMap.get("CREATE_TIME"));
			  saveDTable.getColMap().put("CBD_ITEM_NUM",(int)Double.parseDouble(String.valueOf(parMap.get("CBD_ITEM_NUM"))));
			  saveDTable.getColMap().put("CBD_ITEM_CODE", parMap.get("CBD_ITEM_CODE"));
			  saveDTable.getColMap().put("CBD_UNITS", parMap.get("CBD_UNITS"));
			  saveDTable.getColMap().put("CREATE_USER", parMap.get("CREATE_USER"));
			  saveDTable.getColMap().put("PROJECT_ID", parMap.get("PROJECT_ID"));
			  saveDTable.getColMap().put("CBD_POINT", parMap.get("CBD_POINT"));
			  saveDTable.getColMap().put("CBD_SEQUENCE", (int)Double.parseDouble(String.valueOf(parMap.get("CBD_SEQUENCE"))));
			  saveDTable.getColMap().put("DATA_AUTH", parMap.get("DATA_AUTH"));
			  int res2 = modelService.save(saveDTable);
		      if(res2<1){
		    	  hbtran.rollback();
		    	  log.error("修改明细表失败");
		    	  throw new BussException("修改明细表失败");
		      }    	  
		  }
		  }
		  if(key.toString().equals("d34c8f48bead40d88c24a153c731de82")){
			  //修改base
			  List<Object> sqlList = new ArrayList<Object>();
			  Map<String,Object> parMap2 = new HashMap<String,Object>();
			  parMap2 = (Map)map.get(key);
			  TableDataMapExt editTable = new TableDataMapExt();
			  editTable.setTableName("T_PM_PROJECT_BASE");
			  editTable.setSqlWhere(" AND ID = ?");
			  sqlList.add(parMap2.get("ID"));
			  editTable.setSqlWhereArgs(sqlList);
			  editTable.getColMap().put("EDIT_TIME", DateUtil.getCurDate());
			  editTable.getColMap().put("EDIT_USER", CommMethod.getSessionUser().getId());
			  editTable.getColMap().put("CUST_CODE", parMap2.get("CUST_CODE"));
			  editTable.getColMap().put("DESTROY_NO", parMap2.get("DESTROY_NO"));
			   editTable.getColMap().put("PROJECT_FLAG", productFlag);
			  String faiNum = String.valueOf(parMap2.get("FAI_NUM"));
			  if(faiNum.equals("null")){
				  editTable.getColMap().put("FAI_NUM", null);
			  }else{
				  editTable.getColMap().put("FAI_NUM", (int)Double.parseDouble(faiNum));  
			  }
			  
			  editTable.getColMap().put("PM_MEMO", parMap2.get("PM_MEMO"));
			  editTable.getColMap().put("PRODUCT_COUNT",(int)Double.parseDouble(String.valueOf(parMap2.get("PRODUCT_COUNT"))));
			  editTable.getColMap().put("PRODUCT_LINE", parMap2.get("PRODUCT_LINE"));
			  editTable.getColMap().put("PROJECT_STATUS", parMap2.get("PROJECT_STATUS"));
			  editTable.getColMap().put("PROJECT_STEP", parMap2.get("PROJECT_STEP"));
			  editTable.getColMap().put("PROJECT_TYPE", parMap2.get("PROJECT_TYPE"));
			  editTable.getColMap().put("PROLEPSIS_END_DATE", parMap2.get("PROLEPSIS_END_DATE"));
			  editTable.getColMap().put("PROLEPSIS_START_DATE", parMap2.get("PROLEPSIS_START_DATE"));
			  editTable.getColMap().put("TPPB_PLAN_DELIVERY_DATE", parMap2.get("TPPB_PLAN_DELIVERY_DATE"));
              editTable.getColMap().put("PRODUCT_CONFIGURE", parMap2.get("PRODUCT_CONFIGURE"));
              editTable.getColMap().put("PRODUCT_PACK_SEQ", pack_Seq);
         editTable.getColMap().put("PRODUCT_SN_PREFIX", productSnPrefix);
              
			  int res1 = modelService.edit(editTable);
		      if(res1<1){
		    	  hbtran.rollback();
		    	  log.error("修改工单主表失败");
		    	  throw new BussException("修改工单主表失败");
		      }    	  
			}
			
		}
	} catch (NumberFormatException e) {
  	  hbtran.rollback();
  	  log.error(e);
  	  throw new BussException("修改失败");
	}
	
    
//    smapTemp.remove("tableName");
//    smapTemp.remove("_FLAG");
//    smapTemp.put("PROLEPSIS_START_DATE", PROLEPSIS_START_DATE);
//    smapTemp.put("PROLEPSIS_END_DATE", PROLEPSIS_END_DATE);
//    smapTemp.put("TPPB_PLAN_DELIVERY_DATE", TPPB_PLAN_DELIVERY_DATE);
    
    hbtran.commit();
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), "0");
  }
  
   //生成工单号段
  @SuppressWarnings("unchecked")
  public String SaveProductSn(String dataAuth,ModelService modelService, String project_id, String mo_number, String sn_start,
                              String sn_end, String sn_prefix, String user_id) {
      ProFuncDto pf = new ProFuncDto();
      int[] inPlace = {1, 2, 3, 4, 5, 6,7};
      int[] outplace = {8};
      List<Object> list = new ArrayList<Object>();
      List<Object> outType = new ArrayList<Object>();
      list.add(dataAuth);
      list.add(project_id);
      list.add(mo_number);
      list.add(sn_start);
      list.add(sn_end);
      list.add(sn_prefix);
      list.add(user_id);
      outType.add("String");
      pf.setClassName("P_MES_SAVE_PRODUCT_SN");
      pf.setInPlace(inPlace);// 存储过程中in
      pf.setOutPlace(outplace); // 存储过程中out
      pf.setTotalLen(8);// 总个数
      pf.setValArgs(list);// 存储过程中输入的参数
      pf.setOutValType(outType);// 输出的参数
      List<Object> relist = modelService.procComm(pf);// 接收返回值
      String res = (String) relist.get(0); // 结果
      return res;
  }

  


}
