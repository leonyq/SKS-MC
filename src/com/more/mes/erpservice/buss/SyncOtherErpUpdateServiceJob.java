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
 * 变更其他入库单信息接口
  核心业务说明
  1、item的表的关联单号(账套+单据号)必须存在
 */
public class SyncOtherErpUpdateServiceJob extends InterfaceLog implements IhttpServiceJosn {
	
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
        String WRI_CONNECT_DOC=""; //关联单号
        String WRD_DOC_NUM="";//其他入库单
        if(RS.equals(ErpServiceMethod.OK)){
        	try{
                String REQUEST_DATA=jsonObject.getString("REQUEST_DATA");//请求详细信息
                JSONObject jsonData = JSONObject.fromObject(REQUEST_DATA);//转为json对象

                WRI_CONNECT_DOC=jsonData.getString("WRD_DOC_NUM");//单据号
                //String WPI_SUP_CODE=jsonData.getString("WPI_SUP_CODE");//供应商编码
                String WRD_CREATE_MAN=jsonData.getString("WRD_CREATE_MAN");//制单人
                String WRD_CREATE_TIME=jsonData.getString("WRD_CREATE_TIME");//制单时间
                String WRD_SOB=jsonData.getString("WRD_SOB");//账套
                String WRD_MEMO=jsonData.getString("MEMO");//备注
                String DATAS=jsonData.getString("DATAS");//其他入库单明细JSON
                String WRI_WH_CODE=jsonData.getString("WRI_WH_CODE");//仓库代码

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
                	 
                    if(StringUtils.isBlank(WRI_CONNECT_DOC)){
                        RS=ErpServiceMethod.NG;
                        MSG.append("单据号为空;");
                    }
                    
                    if(StringUtils.isNotBlank(WRD_SOB)&&StringUtils.isNotBlank(WRI_CONNECT_DOC)){
                    	
                    	WRI_CONNECT_DOC=WRD_SOB +"-"+WRI_CONNECT_DOC;
                    	Map<String,Object> POINFO= getRECInfo(WRI_CONNECT_DOC);
                         if(POINFO!=null&&StringUtils.isNotBlank(POINFO.get("WRD_STATUS")) ){
                        	 String WRD_STATUS=POINFO.get("WRD_STATUS").toString();
                        	 if(!WRD_STATUS.equals("1")){
                        		 RS=ErpServiceMethod.NG;
                                 MSG.append("其他入库单号的状态不是开立;");
                        	 }
                        	 WRD_DOC_NUM=POINFO.get("WRI_DOC_NUM").toString();
                         }else{
                        	 RS=ErpServiceMethod.NG;
                             MSG.append("其他入库单号不存在;");
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
                    if(StringUtils.isBlank(WRI_WH_CODE)){
                    	 RS=ErpServiceMethod.NG;
                         MSG.append("仓库代码为空;");
                    }else{
                    	Map<String,Object> temp=getArea(WRI_WH_CODE,DATA_AUTH);
                    	if(temp!=null&&StringUtils.isNotBlank(temp.get("WA_AREA_SN"))){
                    		WRI_WH_CODE=temp.get("WA_AREA_SN").toString();
                    	}else{
                    		RS=ErpServiceMethod.NG;
                            MSG.append("ERP仓库代码("+WRI_WH_CODE+")找不到对应的MES仓库代码;");
                    	}
                    }

                    JSONArray jsonArray = JSONArray.fromObject(DATAS);//采购订单明细JSON
                    Set<String> CKCODE_SEQ = new HashSet<String>(); //验证物料+项目不能重复
                    int size = jsonArray.size();
                    if(size==0){
                        RS=ErpServiceMethod.NG;
                        MSG.append("其他入库单没有明细;");
                    }
                    List<Map<String ,Object>> list_detail=new ArrayList<Map<String ,Object>>();
                    for (int i = 0; i < size; i++){
                    	String FLAG="2";//默认变更 1 变更 2添加
                        Map<String,Object> temp_data=new HashMap<String,Object>();

                        JSONObject temp_json = jsonArray.getJSONObject(i);
                        String WRI_ITEM_CODE=temp_json.getString("WRI_ITEM_CODE");//物料料号
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
                        boolean ck=CKCODE_SEQ.add(WRI_ITEM_CODE+"_"+WRI_ITEM_SEQ);
                        if(!ck){ 
                            RS=ErpServiceMethod.NG;
                            MSG.append("物料料号("+WRI_ITEM_CODE+")、项次("+WRI_ITEM_SEQ+")信息重复;");
                        }
                        //根据料号和项次判断是否存在，存在则更新，不存在则添加
                        Map<String, Object> temp= getItemInfo(WRI_CONNECT_DOC,WRI_ITEM_CODE,WRI_ITEM_SEQ);
                        if(temp!=null&&StringUtils.isNotBlank(temp.get("ID"))){
                        	FLAG="1";
                        }
                        temp_data.put("WRI_ITEM_CODE", WRI_ITEM_CODE);
                        temp_data.put("WRI_ITEM_SEQ", WRI_ITEM_SEQ);
                        temp_data.put("WRI_PLAN_NUM", WRI_PLAN_NUM);
                        temp_data.put("FLAG", FLAG);
                        list_detail.add(temp_data);
                    }
                    //验证通过，将相关数据保存
                    if(RS.equals("OK")){
                    	MsHTranMan tran=  BussService.getHbTran();
                        try{
                            //更新其他入库单
                            TableDataMapExt object = new TableDataMapExt();
                            object.setTableName("T_WMS_RECEIVE_DOC");
                            object.setSqlWhere(" AND WRD_DOC_NUM='"+WRD_DOC_NUM+"'");
                            object.getColMap().put("EDIT_USER", CREATE_USER);//编辑人
                            object.getColMap().put("EDIT_TIME", new Date());//编辑时间
                            object.getColMap().put("WRD_MEMO",WRD_MEMO);//备注
                            object.getColMap().put("WRD_ERP_CREATE_MAN", WRD_CREATE_MAN);//ERP制单人
                            modelService.edit(object);
                            
                            TableDataMapExt object_detail = new TableDataMapExt();
                            object_detail.setTableName("T_WMS_RECEIVE_ITEM");
                            //其他入库单明细
                            for(int i=0;i<size;i++){
                                Map<String,Object> temp_data=list_detail.get(i);
                                object_detail.clear();
                                if(temp_data.get("FLAG").toString().equals("2")){
                                	object_detail.getColMap().put("ID", StringUtils.getUUID());
                                    object_detail.getColMap().put("DEPT_ID",  DATA_AUTH);//部门
                                    object_detail.getColMap().put("CREATE_USER", CREATE_USER);//创建人
                                    object_detail.getColMap().put("CREATE_TIME", new Date());//创建时间
                                    object_detail.getColMap().put("DATA_AUTH",DATA_AUTH);//机构
                                    object_detail.getColMap().put("WRI_WH_CODE",WRI_WH_CODE);//仓库代码
                                    
                                    object_detail.getColMap().put("WRI_DOC_NUM",WRD_DOC_NUM);//其他入库单号
                                    object_detail.getColMap().put("WRI_STATUS", "1");
                                    object_detail.getColMap().put("WRI_ITEM_CODE",temp_data.get("WRI_ITEM_CODE").toString());
                                    object_detail.getColMap().put("WRI_ITEM_SEQ", temp_data.get("WRI_ITEM_SEQ").toString());
                                    object_detail.getColMap().put("WRI_PLAN_NUM", temp_data.get("WRI_PLAN_NUM").toString());
                                    object_detail.getColMap().put("WRI_PACK_NUM", 0);//标志包装数量
                                    object_detail.getColMap().put("WRI_GIFT_NUM", 0);//赠品数量
                                    object_detail.getColMap().put("WRI_CONNECT_DOC",WRI_CONNECT_DOC);//关联单号
                                    
                                    modelService.save(object_detail);
                                }else{
                                	object_detail.setSqlWhere(" AND WRI_CONNECT_DOC='"+WRI_CONNECT_DOC+"' AND WRI_ITEM_CODE='"+temp_data.get("WRI_ITEM_CODE").toString()+"'"+
                                								"AND WRI_ITEM_SEQ='"+temp_data.get("WRI_ITEM_SEQ").toString()+"'");
                                	object_detail.getColMap().put("WRI_PLAN_NUM", temp_data.get("WRI_PLAN_NUM").toString());
                                	object_detail.getColMap().put("EDIT_USER", CREATE_USER);//编辑人
                                    object_detail.getColMap().put("EDIT_TIME", new Date());//编辑时间
                                    object_detail.getColMap().put("WRI_IS_ADD", "U");//更新标识 云标签重新上传
                                    modelService.edit(object_detail);
                                }
                            }
                            tran.commit();
                            MSG.append("处理成功");
                        }catch(Exception e){
                        	tran.rollback();
                            ErpServiceMethod.writeLog("","更新其他入库单接口错误："+e.getMessage());
                            RS=ErpServiceMethod.NG;
                            MSG.append("更新采购订单接口处理失败："+e.getMessage());
                            e.printStackTrace();
                            log.error(e);
                        }
                    } 
                }catch(Exception e){
                    ErpServiceMethod.writeLog("","更新其他入库单接口错误2："+e.getMessage());
                    RS=ErpServiceMethod.NG;
                    MSG.append("更新其他入库单接口处理失败2："+e.getMessage());
                    e.printStackTrace();
                    log.error(e);
                } 
            }catch(Exception e){
            	ErpServiceMethod.writeLog("","更新其他入库单接口错误3："+e.getMessage());
                RS=ErpServiceMethod.NG;
                MSG.append("更新其他入库单接口处理失败3："+e.getMessage());
                e.printStackTrace();
                log.error(e);
            }
        }
        
        jsonStr=ErpServiceMethod.getResult(RS, MSG.toString());
        map.put("json", jsonStr);
        //保存日志信息 
      	ErpServiceMethod.AddIFLog(WRI_CONNECT_DOC,requestString, jsonStr, 11, "同步其他入库单信息接口", RS, modelService);
      		
        String endTime=format.format(new java.util.Date());//接口请求结束时间
        ErpServiceMethod.writeLog("",  beginTime+"更新其他入库单接口请求信息:"+requestString);
        ErpServiceMethod.writeLog("", endTime+ "更新其他入库单接口返回信息:"+jsonStr);
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
	public Map<String, Object> getRECInfo(String WRI_CONNECT_DOC) {
		Map<String, Object> map = null;
		String sql = "select t.*,t2.WRD_STATUS from t_wms_receive_item t inner join t_wms_receive_doc t2 on t.wri_doc_num=t2.wrd_doc_num "+
					"where t2.wrd_doc_type='DJ06' AND t.WRI_CONNECT_DOC=?";
		List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] { WRI_CONNECT_DOC });
		if (list != null && list.size() > 0) {
			map = new HashMap<String, Object>();
			map = list.get(0);
		}
		return map;
	}
	
	/**
	 * 判断其他入库单的明细是否存在
	 * @param WRI_CONNECT_DOC
	 * @param WRI_ITEM_CODE
	 * @param WRI_ITEM_SEQ
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getItemInfo(String WRI_CONNECT_DOC,String WRI_ITEM_CODE,int WRI_ITEM_SEQ) {
		Map<String, Object> map = null;
		String sql = "select t.* from t_wms_receive_item t inner join t_wms_receive_doc t2 on t.wri_doc_num=t2.wrd_doc_num "+
					"where t2.wrd_doc_type='DJ06' AND t.WRI_CONNECT_DOC=? and t.WRI_ITEM_CODE=? AND T.WRI_ITEM_SEQ=?";
		List<Map<String, Object>> list = modelService.listDataSql(sql, new Object[] { WRI_CONNECT_DOC,WRI_ITEM_CODE,WRI_ITEM_SEQ });
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

}
