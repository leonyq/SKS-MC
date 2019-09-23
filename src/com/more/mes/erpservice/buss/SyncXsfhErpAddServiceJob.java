package com.more.mes.erpservice.buss;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;
import com.more.mes.erpservice.ErpServiceMethod;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 金碟u8ERP
 *同步销售发货单信息接口
 *核心业务说明：
 *1、销售发货单号不能存在
 */
public class SyncXsfhErpAddServiceJob extends InterfaceLog implements IhttpServiceJosn {
	private final Log log = LogFactory.getLog(this.getClass());
	private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

	@Override
	public String exeFunc(HttpCoreService service) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        SimpleDateFormat format2 = new SimpleDateFormat("yyyyMMdd");
        String beginTime=format.format(new java.util.Date());//接口请求开始时间
        //返回结果
        Map<String, Object> map = new HashMap<String, Object>();
        //验证默认正确
        String RS=ErpServiceMethod.OK;
        StringBuffer MSG=new StringBuffer();
        String jsonStr=null;
        //获取请求数据
        String requestString=ErpServiceMethod.getRequestJson(service);
        JSONObject jsonObject = null;
		try{
			jsonObject=JSONObject.fromObject(requestString);
		}catch(Exception e){
			RS=ErpServiceMethod.NG;
			MSG.append("请求报文JSON格式错误");
		}
        String WOD_DOC_NUM=""; //关联单号
        if(RS.equals(ErpServiceMethod.OK)){
        	try{
                String REQUEST_DATA=jsonObject.getString("REQUEST_DATA");//请求详细信息
                JSONObject jsonData = JSONObject.fromObject(REQUEST_DATA);//转为json对象

                WOD_DOC_NUM=jsonData.getString("WOD_DOC_NUM");//销售发货单号
                String WOD_CONNECT_DOC=jsonData.getString("WOD_DOC_NUM");//存档使用
                String WOD_CREATE_MAN=jsonData.getString("WOD_CREATE_MAN");//制单人
                String WOD_CREATE_TIME=jsonData.getString("WOD_CREATE_TIME");//制单时间
                String WOD_CUST_CODE=jsonData.getString("WOD_CUST_CODE");//客户编码
                String WOD_MEMO=jsonData.getString("WOD_MEMO");//备注
                String WOD_SOB=jsonData.getString("WOD_SOB");//账套
                
                String DATAS=jsonData.getString("DATAS");//其他入库单明细JSON

                Date time=null; //验证时间格式
                String DATA_AUTH=null;//获取组织机构
                String CREATE_USER=null;//创建人ID
                try{
                	if(StringUtils.isBlank(WOD_SOB)){
                   	 RS=ErpServiceMethod.NG;
                        MSG.append("账套为空;");
                   }else{
                       Map<String, Object> map_SOB= ErpServiceMethod.getDeptID(WOD_SOB);    //this.getDept(WPI_SOB);
                       if(map_SOB!=null&&map_SOB.size()>0){
                           DATA_AUTH=map_SOB.get("ID").toString();
                       }else{
                           RS=ErpServiceMethod.NG;
                           MSG.append("账套信息不存在，请维护对应的组织机构;");
                       }
                   }
               	 
                   if(StringUtils.isBlank(WOD_DOC_NUM)){
                       RS=ErpServiceMethod.NG;
                       MSG.append("单据号为空;");
                   }
                   
                   if(StringUtils.isNotBlank(WOD_SOB)&&StringUtils.isNotBlank(WOD_DOC_NUM)){
    		           	Map<String,Object> POINFO=null;
    		           	WOD_DOC_NUM=WOD_DOC_NUM +"-"+WOD_SOB;
    		           	POINFO = getRECInfo(WOD_DOC_NUM);
    		            if(POINFO!=null&&POINFO.size()>0){
    		                RS=ErpServiceMethod.NG;
    		                MSG.append("销售发货单号已经存在;");
    		            }
                   }

                   if(StringUtils.isBlank(WOD_CREATE_MAN)){
                       RS=ErpServiceMethod.NG;
                       MSG.append("制单人为空;");
                   }else{
                       Map<String, Object> map_User=ErpServiceMethod.getUserID(WOD_CREATE_MAN);  //this.getUser(ERP_DRAWER);
                       if(map_User!=null&&StringUtils.isBlank(map_User)){
                           RS=ErpServiceMethod.NG;
                           MSG.append("制单人不存在;");
                       }else{
                           CREATE_USER=map_User.get("ID").toString();
                       }
                   }

                   if(StringUtils.isBlank(WOD_CREATE_TIME)){
                       RS=ErpServiceMethod.NG;
                       MSG.append("制单时间为空;");
                   }else{
                       try{
                           time= format2.parse(WOD_CREATE_TIME);
                       }catch(Exception e){
                           RS=ErpServiceMethod.NG;
                           MSG.append("制单时间格式不对;");
                       }
                   }
                   if(StringUtils.isNotBlank(WOD_CUST_CODE)){
                	   Map<String,Object> temp=getCUSInfo(WOD_CUST_CODE,DATA_AUTH);
                	   if(temp==null){
                		   RS=ErpServiceMethod.NG;
                           MSG.append("该账套下不存在客户编码;");
                	   }
                   }else{
                	   RS=ErpServiceMethod.NG;
                       MSG.append("客户编码不能为空;");
                   }
                   JSONArray jsonArray = JSONArray.fromObject(DATAS);//采购订单明细JSON
                   int size = jsonArray.size();
                   if(size==0){
                       RS=ErpServiceMethod.NG;
                       MSG.append("销售发货单号没有明细;");
                   }
                   
                   List<Map<String ,Object>> list_detail=new ArrayList<Map<String ,Object>>();
                   Set<String> CKCODE_SEQ = new HashSet<String>(); //验证物料+项目不能重复
                   for (int i = 0; i < size; i++){
                	   Map<String,Object> temp_data=new HashMap<String,Object>();

                       JSONObject temp_json = jsonArray.getJSONObject(i);
                       String WOI_ITEM_CODE=temp_json.getString("WOI_ITEM_CODE");//物料料号
                       int WOI_ITEM_SEQ=temp_json.getInt("WOI_ITEM_SEQ");
                       String WOI_PLAN_NUM=temp_json.getString("WOI_PLAN_NUM");
                       String WOI_WH_CODE=temp_json.getString("WOI_WH_CODE");//仓库代码

                       if(StringUtils.isBlank(WOI_ITEM_CODE)){
                           RS=ErpServiceMethod.NG;
                           MSG.append("物料料号不能为空;");
                       }else{
                           Map<String, Object> map_ITEM_CODE=ErpServiceMethod.getItemCode(WOI_ITEM_CODE,DATA_AUTH);  //this.getCOItem(WPD_ITEM_CODE);
                           if(StringUtils.isBlank(map_ITEM_CODE)){
                               RS=ErpServiceMethod.NG;
                               MSG.append("物料料号("+WOI_ITEM_CODE+")在物料表中不存在;");
                           }
                       }
                       boolean ck=CKCODE_SEQ.add(WOI_ITEM_CODE+"_"+WOI_ITEM_SEQ);
                       if(!ck){ 
                           RS=ErpServiceMethod.NG;
                           MSG.append("物料料号("+WOI_ITEM_CODE+")、项次("+WOI_ITEM_SEQ+")信息重复;");
                       }
                       if(StringUtils.isBlank(WOI_WH_CODE)){
                      	 RS=ErpServiceMethod.NG;
                           MSG.append("仓库代码为空;");
                      }else{
                      	Map<String,Object> temp=getArea(WOI_WH_CODE,DATA_AUTH);
                      	if(temp!=null&&StringUtils.isNotBlank(temp.get("WA_AREA_SN"))){
                      		WOI_WH_CODE=temp.get("WA_AREA_SN").toString();//转为自己的仓库代码
                      	}else{
                      		RS=ErpServiceMethod.NG;
                              MSG.append("ERP仓库代码("+WOI_WH_CODE+")找不到对应的MES仓库代码;");
                      	}
                      }
                       temp_data.put("WOI_ITEM_CODE", WOI_ITEM_CODE);
                       temp_data.put("WOI_ITEM_SEQ", WOI_ITEM_SEQ);
                       temp_data.put("WOI_PLAN_NUM", WOI_PLAN_NUM);
                       temp_data.put("WOI_WH_CODE", WOI_WH_CODE);
                       list_detail.add(temp_data);
                   }
                   //验证通过，将相关数据保存
                   if(RS.equals("OK")){
                	   String WOD_DOC_TYPE="DJ11";//单据类型
                	   String WOD_DISPATCH_SN="XSFH";//收发类型
                	   String WOD_STATUS="1";//单据状态开立
                	   String WOD_URGENT_FLAG="N";//紧急标志
                	   String WOD_ERP_FLAG="Y";//ERP同步标志
                	   //String WOD_DOC_NUM=ErpServiceMethod.getReceiveNo(DATA_AUTH, WOD_DOC_TYPE, WOD_DISPATCH_SN, modelService);//
                	   MsHTranMan tran=  BussService.getHbTran();
                	   try{
                		   //增加仓库单据信息表数据
    	           			TableDataMapExt wms = new TableDataMapExt();
    	           		 	wms.setTableName("T_WMS_DOC_INFO");
    	           		 	wms.getColMap().put("ID", StringUtils.getUUID());
    	           		 	wms.getColMap().put("WDI_DOC_NUM", WOD_DOC_NUM);
    	           		 	wms.getColMap().put("WDI_STATUS", WOD_STATUS);
    	           		 	wms.getColMap().put("WDI_URGENT_FLAG", WOD_URGENT_FLAG);//紧急标志
    	           		 	wms.getColMap().put("WDI_DOC_TYPE", WOD_DOC_TYPE);
    	           		 	wms.getColMap().put("WDI_DISPATCH_TYPE", WOD_DISPATCH_SN);//收发类型
    	           		 	wms.getColMap().put("WDI_CREATE_MAN", CREATE_USER);
    	           		 	wms.getColMap().put("WDI_CREATE_TIME", time);
    	           		 	wms.getColMap().put("WDI_MEMO", WOD_MEMO);
    	           			wms.getColMap().put("DATA_AUTH", DATA_AUTH);
    	           			wms.getColMap().put("DEPT_ID", DATA_AUTH);
    	           			wms.getColMap().put("CREATE_USER", CREATE_USER);
    	           			wms.getColMap().put("CREATE_TIME", time);
    	           			wms.getColMap().put("T_WMS_DOC_INFO", WOD_ERP_FLAG);//ERP同步标志
    	           			modelService.save(wms);
    	           			
    	           			//添加销售发货单
                            TableDataMapExt object = new TableDataMapExt();
                            object.setTableName("T_WMS_OUTSTOCK_DOC");
                            object.getColMap().put("WOD_DOC_NUM", WOD_DOC_NUM);
                            object.getColMap().put("WOD_DOC_TYPE", WOD_DOC_TYPE);
                            object.getColMap().put("WOD_DISPATCH_SN", WOD_DISPATCH_SN);
                            object.getColMap().put("WOD_STATUS", WOD_STATUS);
                            object.getColMap().put("WOD_OUTSTOCK_DATE", new Date());
                            object.getColMap().put("WOD_CREATE_MAN", CREATE_USER);
                            object.getColMap().put("WOD_CREATE_TIME", new Date());
                            object.getColMap().put("WOD_URGENT_FLAG", WOD_URGENT_FLAG);
                            object.getColMap().put("ID", StringUtils.getUUID());
                            object.getColMap().put("DEPT_ID", DATA_AUTH);
                            object.getColMap().put("CREATE_USER", CREATE_USER);
                            object.getColMap().put("CREATE_TIME", new Date());
                            object.getColMap().put("DATA_AUTH", DATA_AUTH);
                            object.getColMap().put("WOD_ERP_FLAG", WOD_ERP_FLAG);
                            object.getColMap().put("WOD_ERP_SYN_TIMES", "0");//同步次数
                            object.getColMap().put("WOD_MEMO", WOD_MEMO);
                            object.getColMap().put("WOD_ERP_CREATE_MAN", WOD_CREATE_MAN);//制单人
                            object.getColMap().put("WOD_CONNECT_DOC", WOD_CONNECT_DOC);//保存erp的发货单号
                            object.getColMap().put("WOD_CUST_CODE", WOD_CUST_CODE);//客户编码
                            modelService.save(object);
                            TableDataMapExt object_detail = new TableDataMapExt();
                            object_detail.setTableName("T_WMS_OUTSTOCK_ITEM");
                            //其他入库单明细
                            for(int i=0;i<size;i++){
                            	 Map<String,Object> temp_data=list_detail.get(i);
                                 object_detail.clear();
                                 object_detail.getColMap().put("ID", StringUtils.getUUID());
                                 object_detail.getColMap().put("WOI_DOC_NUM", WOD_DOC_NUM);
                                 object_detail.getColMap().put("WOI_ITEM_SEQ", temp_data.get("WOI_ITEM_SEQ"));
                                 object_detail.getColMap().put("WOI_ITEM_CODE", temp_data.get("WOI_ITEM_CODE"));
                                 object_detail.getColMap().put("WOI_PLAN_NUM", temp_data.get("WOI_PLAN_NUM"));
                                 object_detail.getColMap().put("WOI_OUT_NUM", 0);//出库数量
                                 object_detail.getColMap().put("WOI_WH_CODE", temp_data.get("WOI_WH_CODE"));
                                 object_detail.getColMap().put("DEPT_ID", DATA_AUTH);
                                 object_detail.getColMap().put("CREATE_USER", CREATE_USER);
                                 object_detail.getColMap().put("CREATE_TIME", new Date());
                                 object_detail.getColMap().put("DATA_AUTH", DATA_AUTH);
                                 object_detail.getColMap().put("WOI_STATUS", WOD_STATUS);
                                 object_detail.getColMap().put("WOI_PACK_NUM", 1);
                                 object_detail.getColMap().put("WOI_REQUEST_NUM", temp_data.get("WOI_PLAN_NUM"));
                                 object_detail.getColMap().put("WOI_CONNECT_DOC", WOD_CONNECT_DOC);
                                 object_detail.getColMap().put("WOI_MEMO", WOD_MEMO);
                                 modelService.save(object_detail);
                            }
                            tran.commit();
                	   }catch(Exception e){
                		   	tran.rollback();
                       		ErpServiceMethod.writeLog("","添加销售发货单接口错误："+e.getMessage());
                       		RS=ErpServiceMethod.NG;
                       		MSG.append("添加销售发货单接口处理失败："+e.getMessage());
                       		e.printStackTrace();
                       		log.error(e);
                    }
                   }
                }catch(Exception e){
                    ErpServiceMethod.writeLog("","添加销售发货单接口错误2："+e.getMessage());
                    RS=ErpServiceMethod.NG;
                    MSG.append("添加销售发货单接口处理失败2："+e.getMessage());
                    e.printStackTrace();
                    log.error(e);
                } 
            }catch(Exception e){
            	ErpServiceMethod.writeLog("","添加销售发货单接口错误3："+e.getMessage());
                RS=ErpServiceMethod.NG;
                MSG.append("添加销售发货单接口处理失败3："+e.getMessage());
                e.printStackTrace();
                log.error(e);
            }
        }
        
        jsonStr=ErpServiceMethod.getResult(RS, MSG.toString());
        map.put("json", jsonStr);
        //保存日志信息 
      	ErpServiceMethod.AddIFLog(WOD_DOC_NUM,requestString, jsonStr, 12, "同步销售发货单信息接口", RS, modelService);
      		
        String endTime=format.format(new java.util.Date());//接口请求结束时间
        ErpServiceMethod.writeLog("",  beginTime+"添加销售发货单接口请求信息:"+requestString);
        ErpServiceMethod.writeLog("", endTime+ "添加销售发货单接口返回信息:"+jsonStr);
        service.setResult(map);
        service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
        service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
        service.getResponse().setHeader("Access-Control-Allow-Headers", "*");

        return null;
	}
	
	/**
     * 查询关联单号是否存在
     * @param WPI_PO
     * @return
     */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getRECInfo(String WOI_CONNECT_DOC) {
		Map<String, Object> map = null;
		String sql = "select * from t_wms_outstock_doc t where WOD_DOC_NUM=?";
		List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] { WOI_CONNECT_DOC });
		if (list != null && list.size() > 0) {
			map = new HashMap<String, Object>();
			map = list.get(0);
		}
		return map;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String,Object> getArea(String WA_ERP_CODE,String DATA_AUTH){
		Map<String, Object> map = null;
		String sql="select * from t_wms_area t where t .wa_superior_sn='-1' and t.wa_erp_code=? AND DATA_AUTH=?";
		List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] { WA_ERP_CODE,DATA_AUTH });
		if (list != null && list.size() > 0) {
			map = new HashMap<String, Object>();
			map = list.get(0);
		}
		return map;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getCUSInfo(String CUST_CODE,String DATA_AUTH) {
		Map<String, Object> map = null;
		String sql = "select * from t_co_customer t where CUST_CODE=? and DATA_AUTH=?";
		List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] { CUST_CODE,DATA_AUTH });
		if (list != null && list.size() > 0) {
			map = new HashMap<String, Object>();
			map = list.get(0);
		}
		return map;
	}

}
