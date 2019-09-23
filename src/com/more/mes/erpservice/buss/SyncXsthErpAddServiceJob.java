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
 * 同步销售退货信息接口
 * 核心业务说明：
 * 
 */
public class SyncXsthErpAddServiceJob extends InterfaceLog implements IhttpServiceJosn {
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
        String WRD_DOC_NUM=""; //关联单号
        if(RS.equals(ErpServiceMethod.OK)){
        	try{
                String REQUEST_DATA=jsonObject.getString("REQUEST_DATA");//请求详细信息
                JSONObject jsonData = JSONObject.fromObject(REQUEST_DATA);//转为json对象

                String WRI_CONNECT_DOC=jsonData.getString("WRI_CONNECT_DOC");//关联单号
                WRD_DOC_NUM=jsonData.getString("WRD_DOC_NUM");//单据号
                String WRD_CONNECT_DOC=WRD_DOC_NUM;
                String WRD_CUST_CODE=jsonData.getString("WRD_CUST_CODE");//客户编码
                String WRD_CREATE_MAN=jsonData.getString("WRD_CREATE_MAN");//制单人
                String WRD_CREATE_TIME=jsonData.getString("WRD_CREATE_TIME");//制单时间
                String WRD_SOB=jsonData.getString("WRD_SOB");//账套
                String WRD_MEMO=jsonData.getString("MEMO");//备注
                
                String DATAS=jsonData.getString("DATAS");//其他入库单明细JSON
                //String WRI_WH_CODE=jsonData.getString("WRI_WH_CODE");//仓库代码

                Date time=null; //验证时间格式
                String DATA_AUTH=null;//获取组织机构
                String CREATE_USER=null;//创建人ID
                
                try{
                	if(StringUtils.isBlank(WRD_SOB)){
                    	 RS=ErpServiceMethod.NG;
                         MSG.append("账套为空;");
                    }else{
                        Map<String, Object> map_SOB= ErpServiceMethod.getDeptID(WRD_SOB);    //this.getDept(WPI_SOB);
                        if(map_SOB!=null&&map_SOB.size()>0){
                            DATA_AUTH=map_SOB.get("ID").toString();
                        }else{
                            RS=ErpServiceMethod.NG;
                            MSG.append("账套信息不存在，请维护对应的组织机构;");
                        }
                    }
                	if(StringUtils.isBlank(WRD_DOC_NUM)){
                		RS=ErpServiceMethod.NG;
                        MSG.append("销售退货单据号为空;");
                	}
                	 
//                    if(StringUtils.isBlank(WRI_CONNECT_DOC)){
//                        RS=ErpServiceMethod.NG;
//                        MSG.append("销售发货单据号为空;");
//                    }else{
//                    	if(this.getCountNum(WRI_CONNECT_DOC)>0){
//                    	}else{
//                    		RS=ErpServiceMethod.NG;
//                            MSG.append("销售发货单据号不存在销售发货单据表中;");
//                    	}
//                    }
                    if(StringUtils.isBlank(WRD_CUST_CODE)){
                    	RS=ErpServiceMethod.NG;
                        MSG.append("客户编码为空;");
                    }else{
                    	if(this.getCountCus(WRD_CUST_CODE, WRD_SOB)>0){
                    	}else{
                    		RS=ErpServiceMethod.NG;
                            MSG.append("客户编码在客户表中不存在;");
                    	}
                    }
                    
                    if(StringUtils.isNotBlank(WRD_SOB)&&StringUtils.isNotBlank(WRD_DOC_NUM)){
                    	Map<String,Object> POINFO=null;
                    	WRD_DOC_NUM=WRD_DOC_NUM +"-"+WRD_SOB;
                    	POINFO = getInfo(WRD_DOC_NUM);
                         if(POINFO!=null&&POINFO.size()>0){
                             RS=ErpServiceMethod.NG;
                             MSG.append("销售退货单已经存在;");
                         }
                    }

                    if(StringUtils.isBlank(WRD_CREATE_MAN)){
                        RS=ErpServiceMethod.NG;
                        MSG.append("制单人为空;");
                    }else{
                        Map<String, Object> map_User=ErpServiceMethod.getUserID(WRD_CREATE_MAN);  //this.getUser(ERP_DRAWER);
                        if(map_User!=null&&StringUtils.isBlank(map_User)){
                            RS=ErpServiceMethod.NG;
                            MSG.append("制单人不存在;");
                        }else{
                            CREATE_USER=map_User.get("ID").toString();
                        }
                    }

                    if(StringUtils.isBlank(WRD_CREATE_TIME)){
                        RS=ErpServiceMethod.NG;
                        MSG.append("制单时间为空;");
                    }else{
                        try{
                            time= format2.parse(WRD_CREATE_TIME);
                        }catch(Exception e){
                            RS=ErpServiceMethod.NG;
                            MSG.append("制单时间格式不对;");
                        }
                    }
                    

                    JSONArray jsonArray = JSONArray.fromObject(DATAS);//采购订单明细JSON
                    Set<String> CKCODE_SEQ = new HashSet<String>(); //验证物料+项目不能重复
                    int size = jsonArray.size();
                    if(size==0){
                        RS=ErpServiceMethod.NG;
                        MSG.append("销售退货单没有明细;");
                    }
                    List<Map<String ,Object>> list_detail=new ArrayList<Map<String ,Object>>();
                    for (int i = 0; i < size; i++){
                        Map<String,Object> temp_data=new HashMap<String,Object>();

                        JSONObject temp_json = jsonArray.getJSONObject(i);
                        String WRI_ITEM_CODE=temp_json.getString("WRI_ITEM_CODE");//物料料号
                        String WRI_WH_CODE=temp_json.getString("WRI_WH_CODE");//ERP仓库编码
                        
                        int WRI_ITEM_SEQ=temp_json.getInt("WRI_ITEM_SEQ");
                        String WRI_PLAN_NUM=temp_json.getString("WRI_PLAN_NUM");

                        if(StringUtils.isBlank(WRI_ITEM_CODE)){
                            RS=ErpServiceMethod.NG;
                            MSG.append("物料料号不能为空;");
                        }else{
                            Map<String, Object> map_ITEM_CODE=ErpServiceMethod.getItemCode(WRI_ITEM_CODE,DATA_AUTH);  //this.getCOItem(WPD_ITEM_CODE);
                            if(StringUtils.isBlank(map_ITEM_CODE)){
                                RS=ErpServiceMethod.NG;
                                MSG.append("物料料号("+WRI_ITEM_CODE+")在物料表中不存在;");
                            }
                        }
                        
    					if (StringUtils.isBlank(WRI_WH_CODE)) {
    						RS = ErpServiceMethod.NG;
    						MSG.append("仓库代码为空;");
    					} else {
    						Map<String, Object> temp = getArea(WRI_WH_CODE, DATA_AUTH);
    						if (temp != null && StringUtils.isNotBlank(temp.get("WA_AREA_SN"))) {
    							WRI_WH_CODE = temp.get("WA_AREA_SN").toString();
    						} else {
    							RS = ErpServiceMethod.NG;
    							MSG.append("ERP仓库代码(" + WRI_WH_CODE + ")找不到对应的MES仓库代码;");
    						}
                       }
                        //再次判断关联的单号在销售发货表里面
//                        if(this.getCountNum(WRI_CONNECT_DOC, WRI_ITEM_CODE)==0){
//                        	RS=ErpServiceMethod.NG;
//                            MSG.append("物料料号("+WRI_ITEM_CODE+")不存在销售发货单里面;");
//                            continue;
//                        }
                        boolean ck=CKCODE_SEQ.add(WRI_ITEM_CODE+"_"+WRI_ITEM_SEQ);
                        if(!ck){ 
                            RS=ErpServiceMethod.NG;
                            MSG.append("物料料号("+WRI_ITEM_CODE+")、项次("+WRI_ITEM_SEQ+")信息重复;");
                        }
                        temp_data.put("WRI_ITEM_CODE", WRI_ITEM_CODE);
                        temp_data.put("WRI_ITEM_SEQ", WRI_ITEM_SEQ);
                        temp_data.put("WRI_PLAN_NUM", WRI_PLAN_NUM);
                        temp_data.put("WRI_WH_CODE", WRI_WH_CODE);
                        list_detail.add(temp_data);
                    }
                    //验证通过，将相关数据保存
                    if(RS.equals("OK")){
                    	String WRD_DOC_TYPE="DJ04";
                    	String WRD_STATUS="1";//状态 开立
                    	String WRD_URGENT_FLAG="N";//紧急标志
                    	String SFLX="KTRK";
                    	//String WRD_DOC_NUM=ErpServiceMethod.getReceiveNo(DATA_AUTH, WRD_DOC_TYPE, "", modelService);//
                    	MsHTranMan tran=  BussService.getHbTran();
                        try{
                        	//增加仓库单据信息表数据
                			TableDataMapExt wms = new TableDataMapExt();
                		 	wms.setTableName("T_WMS_DOC_INFO");
                		 	wms.getColMap().put("ID", StringUtils.getUUID());
                		 	wms.getColMap().put("WDI_DOC_NUM", WRD_DOC_NUM);
                		 	wms.getColMap().put("WDI_STATUS", WRD_STATUS);
                		 	wms.getColMap().put("WDI_URGENT_FLAG", WRD_URGENT_FLAG);//紧急标志
                		 	wms.getColMap().put("WDI_DOC_TYPE", WRD_DOC_TYPE);
                		 	wms.getColMap().put("WDI_DISPATCH_TYPE", SFLX);//收发类型
                		 	wms.getColMap().put("WDI_CREATE_MAN", CREATE_USER);
                		 	wms.getColMap().put("WDI_CREATE_TIME", time);
                		 	wms.getColMap().put("WDI_MEMO", WRD_MEMO);
                			wms.getColMap().put("DATA_AUTH", DATA_AUTH);
                			wms.getColMap().put("DEPT_ID", DATA_AUTH);
                			wms.getColMap().put("CREATE_USER", CREATE_USER);
                			wms.getColMap().put("CREATE_TIME", time);
                			wms.getColMap().put("T_WMS_DOC_INFO", "Y");//ERP同步标志
                			modelService.save(wms);
                		 	
                            //添加销售退货单
                            TableDataMapExt object = new TableDataMapExt();
                            object.setTableName("T_WMS_RECEIVE_DOC");
                            object.getColMap().put("ID", StringUtils.getUUID());
                            object.getColMap().put("DEPT_ID", DATA_AUTH);//部门
                            object.getColMap().put("CREATE_USER", CREATE_USER);//创建人
                            object.getColMap().put("CREATE_TIME", new Date());
                            object.getColMap().put("DATA_AUTH",DATA_AUTH);
                            object.getColMap().put("WPD_DELIVERY_DATE",new Date());//交货时间
                            object.getColMap().put("WRD_MEMO",WRD_MEMO);//备注
                            object.getColMap().put("WRD_URGENT_FLAG",WRD_URGENT_FLAG);
                            object.getColMap().put("WRD_CUST_CODE",WRD_CUST_CODE);//客户编码
                            
                            
                            object.getColMap().put("WRD_DOC_NUM",WRD_DOC_NUM);//单据号
                            object.getColMap().put("WRD_DOC_TYPE",WRD_DOC_TYPE);//单据类别
                            object.getColMap().put("WRD_STATUS",WRD_STATUS);//状态 开立
                            object.getColMap().put("WRD_CREATE_MAN",CREATE_USER);//制单人
                            object.getColMap().put("WRD_CREATE_TIME", time);//制单时间
                            object.getColMap().put("WPI_SOB",WRD_SOB);//账套
                            object.getColMap().put("WRD_DISPATCH_SN", SFLX); //收发类型 可退入库
                            object.getColMap().put("WRD_ERP_FLAG", "Y");//ERP同步标志
                            object.getColMap().put("WRD_ERP_CREATE_MAN", WRD_CREATE_MAN);//ERP制单人
                            object.getColMap().put("WRD_CONNECT_DOC", WRD_CONNECT_DOC);//ERP退货单号
                            
                            modelService.save(object);
                            TableDataMapExt object_detail = new TableDataMapExt();
                            object_detail.setTableName("T_WMS_RECEIVE_ITEM");
                            //其他入库单明细
                            for(int i=0;i<size;i++){
                                Map<String,Object> temp_data=list_detail.get(i);
                                object_detail.clear();
                                object_detail.getColMap().put("ID", StringUtils.getUUID());
                                object_detail.getColMap().put("DEPT_ID",  DATA_AUTH);//部门
                                object_detail.getColMap().put("CREATE_USER", CREATE_USER);//创建人
                                object_detail.getColMap().put("CREATE_TIME", new Date());//创建时间
                                object_detail.getColMap().put("DATA_AUTH",DATA_AUTH);//机构
                                object_detail.getColMap().put("WRI_WH_CODE",temp_data.get("WRI_WH_CODE").toString());//仓库代码
                                
                                object_detail.getColMap().put("WRI_DOC_NUM",WRD_DOC_NUM);//其他入库单号
                                object_detail.getColMap().put("WRI_STATUS", "1");
                                object_detail.getColMap().put("WRI_ITEM_CODE",temp_data.get("WRI_ITEM_CODE").toString());
                                object_detail.getColMap().put("WRI_ITEM_SEQ", temp_data.get("WRI_ITEM_SEQ").toString());
                                object_detail.getColMap().put("WRI_PLAN_NUM", temp_data.get("WRI_PLAN_NUM").toString());
                                object_detail.getColMap().put("WRI_PACK_NUM", 0);//标志包装数量
                                object_detail.getColMap().put("WRI_GIFT_NUM", 0);//赠品数量
                                object_detail.getColMap().put("WRI_CONNECT_DOC",WRI_CONNECT_DOC);//关联单号
                                
                                modelService.save(object_detail);
                            }
                            tran.commit();
                            MSG.append("处理成功");
                        }catch(Exception e){
                        	tran.rollback();
                            ErpServiceMethod.writeLog("","添加销售退货单接口错误："+e.getMessage());
                            RS=ErpServiceMethod.NG;
                            MSG.append("添加销售退货单接口处理失败："+e.getMessage());
                            e.printStackTrace();
                            log.error(e);
                        }
                    } 
                }catch(Exception e){
                    ErpServiceMethod.writeLog("","添加销售退货单接口错误2："+e.getMessage());
                    RS=ErpServiceMethod.NG;
                    MSG.append("添加销售退货单接口处理失败2："+e.getMessage());
                    e.printStackTrace();
                    log.error(e);
                } 
            }catch(Exception e){
            	ErpServiceMethod.writeLog("","添加销售退货单接口错误3："+e.getMessage());
                RS=ErpServiceMethod.NG;
                MSG.append("添加销售退货单接口处理失败3："+e.getMessage());
                e.printStackTrace();
                log.error(e);
            }
        }
        
        jsonStr=ErpServiceMethod.getResult(RS, MSG.toString());
        map.put("json", jsonStr);
        //保存日志信息 
      	ErpServiceMethod.AddIFLog(WRD_DOC_NUM,requestString, jsonStr, 13, "同步销售退货单信息接口", RS, modelService);
      		
        String endTime=format.format(new java.util.Date());//接口请求结束时间
        ErpServiceMethod.writeLog("",  beginTime+"添加销售退货单接口请求信息:"+requestString);
        ErpServiceMethod.writeLog("", endTime+ "添加销售退货单接口返回信息:"+jsonStr);
        service.setResult(map);
        service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
        service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
        service.getResponse().setHeader("Access-Control-Allow-Headers", "*");

        return null;
	}
	
	/**
     * 查询单据号是否存在
     * @param WPI_PO
     * @return
     */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getInfo(String WRD_DOC_NUM) {
		Map<String, Object> map = null;
		String sql = "SELECT t.* FROM t_wms_receive_doc t where t.wrd_doc_num=?";
		List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] { WRD_DOC_NUM });
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
	
	/**
	 * 获取销售发货单号 /物料编码 对应的数量
	 * @param woi_connect_doc
	 * @return
	 */
	public int getCountNum(String WOD_DOC_NUM,String WRI_ITEM_CODE){
		String sql="SELECT t.ID FROM t_wms_outstock_doc t inner join t_wms_outstock_item t2 on t.wod_doc_num=t2.woi_doc_num "+
						"WHERE t.WOD_DOC_NUM=? and t.wod_doc_type='DJ11'";
		int count=0;
		if(StringUtils.isNotBlank(WRI_ITEM_CODE)){
			sql+=" AND T2.WOI_ITEM_CODE=?";
			count=modelService.countSql(sql, new Object[]{WOD_DOC_NUM,WRI_ITEM_CODE});
		}else{
			count=modelService.countSql(sql, new Object[]{WOD_DOC_NUM});
		}
		
		return count;
	}
	public int getCountNum(String WOD_DOC_NUM){
		return getCountNum(WOD_DOC_NUM,null);
	}
	
	/**
	 * 根据客户编号获取客户信息
	 * @param CUST_CODE
	 * @return
	 */
	public int getCountCus(String CUST_CODE,String SOB){
		int count=0;
		String sql="select * from t_co_customer where CUST_CODE=? AND SOB=?";
		count=modelService.countSql(sql, new Object[]{CUST_CODE,SOB});
		return count;
	}

}
