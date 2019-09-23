package com.more.mes.erpservice;

import java.sql.Timestamp;
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
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.fw.http.service.HttpCoreService;
import com.more.fw.http.service.IhttpServiceJosn;
import com.more.fw.interf.InterfaceLog;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 金碟u8ERP
 *同步erp采购信息接口（service）
 *核心业务说明：
 *1、目前只支持单条添加
 *2、采购订单必须唯一(不允许重复)
 *3、采购单存在明细
 *4、Set<String> 物料+项目 不能重复
 *5、添加完采购单 生成对应的采购入库单
 */
public class SyncPoAddServiceJob extends InterfaceLog implements IhttpServiceJosn {

    private final Log log = LogFactory.getLog(this.getClass());
    private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

    @SuppressWarnings("unchecked")
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
			jsonObject= JSONObject.fromObject(requestString);
		}catch(Exception e){
			RS=ErpServiceMethod.NG;
			MSG.append("请求报文JSON格式错误");
		}
        String WPI_PO="";
        if(RS.equals(ErpServiceMethod.OK)){
        	try{
                String REQUEST_DATA=jsonObject.getString("REQUEST_DATA");//请求详细信息
                JSONObject jsonData = JSONObject.fromObject(REQUEST_DATA);//转为json对象

                WPI_PO=jsonData.getString("WPI_PO");//采购订单
                String WPI_SUP_CODE=jsonData.getString("WPI_SUP_CODE");//供应商编码
                String ERP_DRAWER=jsonData.getString("ERP_DRAWER");//制单人
                String WPI_CREATE_TIME=jsonData.getString("WPI_CREATE_TIME");//制单时间
                String WPI_SOB=jsonData.getString("WPI_SOB");//账套
                String WRI_WH_CODE=jsonData.getString("WRI_WH_CODE");//ERP仓库编码
                String DATAS=jsonData.getString("DATAS");//采购订单明细JSON

                Date time=null; //验证时间格式
                String DATA_AUTH=null;//获取组织机构
                String CREATE_USER=null;//创建人ID
                //boolean exitsPO=false;//验证采购单号是否存在
                //boolean CKNEGATIVE=true;//验证联系负数
                Map<String,Object> POINFO=null;
                try{
                    if(StringUtils.isBlank(WPI_PO)){
                        RS=ErpServiceMethod.NG;
                        MSG.append("采购订单为空;");
                    }else{
                        POINFO = getPOInfo(WPI_PO +"-"+WPI_SOB);
                        if(POINFO!=null&&POINFO.size()>0){
                            //exitsPO=true;
                            RS=ErpServiceMethod.NG;
                            MSG.append("采购订单已经存在;");
                        }
                    }

                    
                    if(StringUtils.isBlank(ERP_DRAWER)){
                        RS=ErpServiceMethod.NG;
                        MSG.append("制单人为空;");
                    }else{
                        Map<String, Object> map_User=ErpServiceMethod.getUserID(ERP_DRAWER);  //this.getUser(ERP_DRAWER);
                        if(map_User!=null&&StringUtils.isBlank(map_User)){
                            RS=ErpServiceMethod.NG;
                            MSG.append("制单人不存在;");
                        }else{
                            CREATE_USER=map_User.get("ID").toString();
                        }
                    }

                    if(StringUtils.isBlank(WPI_CREATE_TIME)){
                        RS=ErpServiceMethod.NG;
                        MSG.append("制单时间为空;");
                    }else{
                        try{
                            time= format2.parse(WPI_CREATE_TIME);
                        }catch(Exception e){
                            RS=ErpServiceMethod.NG;
                            MSG.append("制单时间格式不对;");
                        }
                    }

                    if(StringUtils.isBlank(WPI_SOB)){
                        RS=ErpServiceMethod.NG;
                        MSG.append("账套为空;");
                    }else{
                        Map<String, Object> map_SOB= ErpServiceMethod.getDeptID(WPI_SOB);    //this.getDept(WPI_SOB);
                        if(map_SOB!=null&&map_SOB.size()>0){
                            DATA_AUTH=map_SOB.get("ID").toString();
                        }else{
                            RS=ErpServiceMethod.NG;
                            MSG.append("账套信息不存在，请维护对应的组织机构;");
                        }
                    }
                    
                    if(StringUtils.isBlank(WPI_SUP_CODE)){
                        RS=ErpServiceMethod.NG;
                        MSG.append("供应商编码为空;");
                    }else{
                    	if(getSupCount(WPI_SUP_CODE,DATA_AUTH)>0){}
                    	else{
                    		RS=ErpServiceMethod.NG;
                            MSG.append("系统中不存在供应商信息;");
                    	}
                    }
                    
                    if(StringUtils.isBlank(WRI_WH_CODE)){
                    	RS=ErpServiceMethod.NG;
                        MSG.append("仓库为空;");
                    }else{
                    	 Map<String, Object> mapArea= ErpServiceMethod.getAreaCode(WRI_WH_CODE,DATA_AUTH);
                    	 if(mapArea!=null&&mapArea.size()>0){
                    		 WRI_WH_CODE=mapArea.get("WA_AREA_SN").toString();
                    	 }else{
                    		 RS=ErpServiceMethod.NG;
                             MSG.append("MES中不存在该账套的仓库信息("+WRI_WH_CODE+");");
                    	 }
                    }

                    JSONArray jsonArray = JSONArray.fromObject(DATAS);//采购订单明细JSON
                    Set<String> CKCODE_SEQ = new HashSet<String>(); //验证物料+项目不能重复
                    int size = jsonArray.size();
                    if(size==0){
                        RS=ErpServiceMethod.NG;
                        MSG.append("该采购单没有明细;");
                    }
                    List<Map<String ,Object>> list_detail=new ArrayList<Map<String ,Object>>();
                    for (int i = 0; i < size; i++){
                        Map<String,Object> temp_data=new HashMap<String,Object>();

                        JSONObject temp_json = jsonArray.getJSONObject(i);
                        String WPD_ITEM_CODE=temp_json.getString("WPD_ITEM_CODE");//物料料号
                        int WPD_ITEM_SEQ= temp_json.getInt("WPD_ITEM_SEQ");
                        String WPD_PLAN_NUM=temp_json.getString("WPD_PLAN_NUM");
                        //判断是否为负数
                        //			if(WPD_PLAN_NUM<0){
                        //				if(exitsPO){
                        //					WPD_PLAN_NUM=-WPD_PLAN_NUM;//转为整数
                        //				}else{
                        //					RS=ErpServiceMethod.NG;
                        //					MSG.append("采购单号不存在，数量不能为负数;");
                        //					break;
                        //				}
                        //			}else{
                        //				if(exitsPO){
                        //					RS=ErpServiceMethod.NG;
                        //					MSG.append("采购单号已存在，数量不能为整数数;");
                        //					break;
                        //				}
                        //			}

                        if(StringUtils.isBlank(WPD_ITEM_CODE)){
                            RS=ErpServiceMethod.NG;
                            MSG.append("物料料号不能为空;");
                        }else{
                            Map<String, Object> map_ITEM_CODE=ErpServiceMethod.getItemCode(WPD_ITEM_CODE,DATA_AUTH);  //this.getCOItem(WPD_ITEM_CODE);
                            if(StringUtils.isBlank(map_ITEM_CODE)){
                                RS=ErpServiceMethod.NG;
                                MSG.append("物料料号("+WPD_ITEM_CODE+")在物料表中不存在;");
                            }
                        }
                        boolean ck=CKCODE_SEQ.add(WPD_ITEM_CODE+"_"+WPD_ITEM_SEQ);
                        if(!ck){ 
                            RS=ErpServiceMethod.NG;
                            MSG.append("物料料号("+WPD_ITEM_CODE+")、项次("+WPD_ITEM_SEQ+")信息重复;");
                        }
                        temp_data.put("WPD_ITEM_CODE", WPD_ITEM_CODE);
                        temp_data.put("WPD_ITEM_SEQ", WPD_ITEM_SEQ);
                        temp_data.put("WPD_PLAN_NUM", WPD_PLAN_NUM);
                        list_detail.add(temp_data);
                    } 
                    //验证通过，将相关数据保存
                    if(RS.equals("OK")){
                    	MsHTranMan tran=  BussService.getHbTran();
                        try{
                            //String WRD_MEMO="添加采购单和采购入库单";//采购入库单备注
                            //if(!exitsPO){
                            //添加采购单
                            TableDataMapExt object = new TableDataMapExt();
                            object.setTableName("T_WMS_PO_INFO");
                            object.getColMap().put("ID", StringUtils.getUUID());
                            object.getColMap().put("DEPT_ID", DATA_AUTH);//部门
                            object.getColMap().put("CREATE_USER", CREATE_USER);//创建人
                            object.getColMap().put("CREATE_TIME", new Date());
                            object.getColMap().put("DATA_AUTH",DATA_AUTH);
                            
//                            String no = getNO(DATA_AUTH, "DJ02", "CGRK", WPI_PO);
//                            object.getColMap().put("WPI_PO",no);
                            String WPI_PO_MES=WPI_PO +"-"+WPI_SOB;
                            object.getColMap().put("WPI_PO",WPI_PO_MES);//采购单号
                            
                            object.getColMap().put("WPI_ERP_NO",WPI_PO);
                            
                            object.getColMap().put("WPI_STATUS","1");
                            object.getColMap().put("WPI_SUP_CODE",WPI_SUP_CODE);
                            object.getColMap().put("WPI_CREATE_MAN",CREATE_USER);//制单人
                            object.getColMap().put("WPI_CREATE_TIME", time);//制单时间
                            object.getColMap().put("WPI_CUST","N");//是否客户提供 默认N
                            object.getColMap().put("WPI_SOB",WPI_SOB);//账套
                            
                            modelService.save(object);

                           // Date date = new Date();  
                            //Timestamp timeStamp = new Timestamp(date.getTime()); 
                            
                            //添加采购明细
                            for(int i=0;i<size;i++){
                                Map<String,Object> temp_data=list_detail.get(i);
                                TableDataMapExt object_detail = new TableDataMapExt();
                                object_detail.clear();
                                object_detail.setTableName("T_WMS_PO_DETAIL");
                                object_detail.getColMap().put("ID", StringUtils.getUUID());
                                object_detail.getColMap().put("DEPT_ID",  DATA_AUTH);//部门
                                object_detail.getColMap().put("CREATE_USER", CREATE_USER);//创建人
                                object_detail.getColMap().put("CREATE_TIME", new Date());//创建时间
                                object_detail.getColMap().put("DATA_AUTH",DATA_AUTH);//机构
                                
                   
                                
//                                String no1 = getNO1(DATA_AUTH, "DJ02", "CGRK", WPI_PO,timeStamp,i);
//                                BigDecimal num = BigDecimal.valueOf(i+1, 3);
//                                String numStr = String.valueOf(num).replace("0.", "-");
//                                object_detail.getColMap().put("WPD_PO",no1+numStr);//系统生成采购单号
                                
                               // String no1 = getNO(DATA_AUTH, "DJ02", "CGRK", WPI_PO,timeStamp,i);
                                object_detail.getColMap().put("WPD_PO",WPI_PO_MES);//系统生成采购单号
                                
                                object_detail.getColMap().put("WPD_ERP_NO",WPI_PO);//ERP采购单号

                                object_detail.getColMap().put("WPD_ITEM_SEQ",temp_data.get("WPD_ITEM_SEQ").toString());

                                object_detail.getColMap().put("WPD_ITEM_CODE",temp_data.get("WPD_ITEM_CODE").toString());
                                object_detail.getColMap().put("WPD_RECEIVE_NUM","0");//接收数量默认为0
                                object_detail.getColMap().put("WPD_PLAN_NUM",temp_data.get("WPD_PLAN_NUM").toString());//计划数量
                                object_detail.getColMap().put("WPD_SOB",WPI_SOB);//账套
                                object_detail.getColMap().put("WPD_WH_CODE",WRI_WH_CODE);//仓库
                                
                                modelService.save(object_detail);
                            }
                            //add(DATA_AUTH,WPI_SUP_CODE,CREATE_USER,WRD_MEMO,list_detail, WPI_PO,WPI_SOB,ERP_DRAWER,WPI_PO_MES,WRI_WH_CODE);
                            //添加对应的采购单和采购明细
                            //				}else{
                            //					WRD_MEMO="添加采购入库单，不添加采购单";
                            //					//添加对应的采购单和采购明细
                            //					add(DATA_AUTH,WPI_SUP_CODE,CREATE_USER,WRD_MEMO,list_detail, WPI_PO);
                            //				}

                            tran.commit();
                            MSG.append("处理成功");
                        }catch(Exception e){
                        	tran.rollback();
                            ErpServiceMethod.writeLog("","添加采购订单接口错误："+e.getMessage());
                            RS=ErpServiceMethod.NG;
                            MSG.append("添加采购订单接口处理失败："+e.getMessage());
                            e.printStackTrace();
                            log.error(e);
                        }

                        //jsonStr=ErpServiceMethod.getResult(RS,MSG.toString() );
                    } 
                }catch(Exception e){
                    ErpServiceMethod.writeLog("","添加采购订单接口错误2："+e.getMessage());
                    RS=ErpServiceMethod.NG;
                    MSG.append("添加采购订单接口处理失败2："+e.getMessage());
                    e.printStackTrace();
                    log.error(e);
                } 
            }catch(Exception e){
            	ErpServiceMethod.writeLog("","添加采购订单接口错误3："+e.getMessage());
                RS=ErpServiceMethod.NG;
                MSG.append("添加采购订单接口处理失败3："+e.getMessage());
                e.printStackTrace();
                log.error(e);
            }
            
        }
        
       
        jsonStr=ErpServiceMethod.getResult(RS, MSG.toString());
        map.put("json", jsonStr);
        //保存日志信息 
      	ErpServiceMethod.AddIFLog(WPI_PO,requestString, jsonStr, 5, "添加采购订单接口", RS, modelService);
      		
        String endTime=format.format(new java.util.Date());//接口请求结束时间
        ErpServiceMethod.writeLog("",  beginTime+"添加采购订单接口请求信息:"+requestString);
        ErpServiceMethod.writeLog("", endTime+ "添加采购订单接口返回信息:"+jsonStr);
        service.setResult(map);
        service.getResponse().setHeader("Access-Control-Allow-Origin", "*");
        service.getResponse().setHeader("Access-Control-Allow-Methods", "POST");
        service.getResponse().setHeader("Access-Control-Allow-Headers", "*");

        return null;
    }

/*
    *//**
     * 获取用户信息
     * @param LOGIN_NAME
     * @return
     *//*
    @SuppressWarnings("unchecked")
    public Map<String,Object> getUser(String LOGIN_NAME){
        Map<String, Object> map = new HashMap<String, Object>();
        String sql="SELECT * FROM SY_USER WHERE LOGIN_NAME=?";
        //map = modelService.queryForMap(sql, new Object[] {LOGIN_NAME});
        List<Map<String, Object>> list= modelService.listDataSql(sql, new Object[] {LOGIN_NAME});
        if(list!=null&&list.size()>0){
            map=list.get(0);
        }
        return map;
    }

    *//**
     * 根据账套获取部门ID
     * @param DEP_SOB
     * @return
     *//*
    @SuppressWarnings("unchecked")
    public Map<String,Object> getDept(String DEP_SOB){
        Map<String, Object> map = new HashMap<String, Object>();
        String sql="select * from sy_dept t where DEP_SOB=?";
        //map = modelService.queryForMap(sql, new Object[] {DEP_SOB});
        List<Map<String, Object>> list= modelService.listDataSql(sql, new Object[] {DEP_SOB});
        if(list!=null&&list.size()>0){
            map=list.get(0);
        }
        return map;
    }
    *//**
     * 根据物料料号判断存在
     * @param CI_ITEM_CODE
     * @return
     *//*
    @SuppressWarnings("unchecked")
    public Map<String,Object> getCOItem(String CI_ITEM_CODE){
        Map<String, Object> map = new HashMap<String, Object>();
        String sql="select * from t_co_item t where CI_ITEM_CODE=?";
        //map = modelService.queryForMap(sql, new Object[] {CI_ITEM_CODE});
        List<Map<String, Object>> list= modelService.listDataSql(sql, new Object[] {CI_ITEM_CODE});
        if(list!=null&&list.size()>0){
            map=list.get(0);
        }
        return map;
    }*/

    /**
     * 查询采购单信息
     * @param WPI_PO
     * @return
     */
    @SuppressWarnings("unchecked")
    public Map<String,Object> getPOInfo(String WPI_PO){
        Map<String, Object> map = null;
        String sql="select * from T_WMS_PO_INFO t where WPI_PO=?";
        //map = modelService.queryForMap(sql, new Object[] {WPI_PO});
        List<Map<String, Object>> list= modelService.listDataSql(sql, new Object[] {WPI_PO});
        if(list!=null&&list.size()>0){
            map = new HashMap<String, Object>();
            map=list.get(0);
        }
        return map;
    }


    /**
     *
     * @param DATA_AUTH 机构
     * @param WRD_SUP_CODE 供应商编号
     */
    @SuppressWarnings("unchecked")
    public void add(String DATA_AUTH,String WRD_SUP_CODE,String CREATE_USER,String WRD_MEMO
            ,List<Map<String ,Object>> list_detail,String WPI_PO,String WPI_SOB,String WRD_ERP_CREATE_MAN,String WPI_PO_MES,String WRI_WH_CODE){
        String WRD_DISPATCH_SN = "CGRK";//收发类型
        //String WRD_DOC_NUM = getReceiveNo(DATA_AUTH,"DJ02",WRD_DISPATCH_SN,modelService);//入库单号
        //设置采购入库单号
        String sql="SELECT f_c_generate_sn('"+WPI_PO_MES+"',2) AS WRD_DOC_NUM FROM   dual";
		Map<String,String> mapSql= modelService.queryForMap(sql);
		String WRD_DOC_NUM=mapSql.get("WRD_DOC_NUM");
		
        String WRD_URGENT_FLAG = "N";//紧急标志
        //增加仓库单据信息表数据
        TableDataMapExt wms = new TableDataMapExt();
        wms.setTableName("T_WMS_DOC_INFO");
        wms.getColMap().put("ID", StringUtils.getUUID());
        wms.getColMap().put("WDI_DOC_NUM", WRD_DOC_NUM);//入库单号
        wms.getColMap().put("WDI_STATUS", "1");//状态开立
        wms.getColMap().put("WDI_URGENT_FLAG", WRD_URGENT_FLAG);//紧急标志
        wms.getColMap().put("WDI_SUP_CODE", WRD_SUP_CODE); //供应商编号
        wms.getColMap().put("WDI_DOC_TYPE", "DJ02");//单据类型
        wms.getColMap().put("WDI_DISPATCH_TYPE", WRD_DISPATCH_SN);//收发类型
        wms.getColMap().put("WDI_CREATE_MAN", CREATE_USER);
        wms.getColMap().put("WDI_CREATE_TIME", new Date());
        wms.getColMap().put("WDI_MEMO", WRD_MEMO);//备注
        wms.getColMap().put("DATA_AUTH", DATA_AUTH);
        wms.getColMap().put("T_WMS_DOC_INFO", "Y");//ERP同步标志
        modelService.save(wms);
        //插入入库单信息
        TableDataMapExt receive = new TableDataMapExt();
        receive.setTableName("T_WMS_RECEIVE_DOC");

        receive.getColMap().put("ID", StringUtils.getUUID());
        receive.getColMap().put("DEPT_ID", DATA_AUTH);//部门
        receive.getColMap().put("CREATE_USER", CREATE_USER);//创建人
        receive.getColMap().put("CREATE_TIME", new Date());//创建时间
        receive.getColMap().put("DATA_AUTH",DATA_AUTH);//机构
        receive.getColMap().put("WRD_DOC_NUM", WRD_DOC_NUM);
        receive.getColMap().put("WRD_DOC_TYPE", "DJ02");
        receive.getColMap().put("WRD_STATUS", "1");
        receive.getColMap().put("WRD_SUP_CODE", WRD_SUP_CODE);
//	 	if(!WPD_DELIVERY_DATE.equals("")){
//	 		receive.getColMap().put("WPD_DELIVERY_DATE", sdf2.parse(WPD_DELIVERY_DATE));
//	 	}
        receive.getColMap().put("WRD_URGENT_FLAG", WRD_URGENT_FLAG);
        receive.getColMap().put("WRD_DISPATCH_SN", WRD_DISPATCH_SN);
        receive.getColMap().put("WRD_MEMO", WRD_MEMO);
        receive.getColMap().put("WRD_CREATE_MAN", CREATE_USER);
        receive.getColMap().put("WRD_CREATE_TIME", new Date());
        receive.getColMap().put("DATA_AUTH", DATA_AUTH);
        receive.getColMap().put("WPI_SOB", WPI_SOB);//账套
        receive.getColMap().put("WRD_ERP_FLAG", "Y");//ERP同步标志
        receive.getColMap().put("WRD_ERP_CREATE_MAN", WRD_ERP_CREATE_MAN);//ERP制单人
        
        modelService.save(receive);

        //插入入库单物料信息
        TableDataMapExt receive1 = new TableDataMapExt();
        receive1.setTableName("T_WMS_RECEIVE_ITEM");
        for(int i=0;i<list_detail.size();i++){
            Map<String ,Object> temp=list_detail.get(i);
            receive1.getColMap().clear();

            receive1.getColMap().put("ID", StringUtils.getUUID());
            receive1.getColMap().put("WRI_DOC_NUM", WRD_DOC_NUM);
            receive1.getColMap().put("WRI_STATUS", "1"); //状态开立
            receive1.getColMap().put("DEPT_ID", DATA_AUTH);//部门
            receive1.getColMap().put("CREATE_USER", CREATE_USER);//创建人
            receive1.getColMap().put("CREATE_TIME", new Date());//创建时间
            receive1.getColMap().put("DATA_AUTH",DATA_AUTH);//机构
            receive1.getColMap().put("WRI_ITEM_CODE", temp.get("WPD_ITEM_CODE").toString());//料号
            receive1.getColMap().put("WRI_ITEM_SEQ", temp.get("WPD_ITEM_SEQ").toString());//项次
            //receive1.getColMap().put("WRD_SEQ", temp.get("WPD_ITEM_SEQ").toString());//采购项次

            receive1.getColMap().put("WRI_PLAN_NUM", temp.get("WPD_PLAN_NUM").toString());//计划数量
            receive1.getColMap().put("WRI_PACK_NUM", 0);//最小包装数量
            receive1.getColMap().put("WRI_GIFT_NUM", 0); //赠品数量
            receive1.getColMap().put("WRI_CONNECT_DOC", WPI_PO_MES ); //关联单号 采购单号

            receive1.getColMap().put("DATA_AUTH", DATA_AUTH);
            receive1.getColMap().put("WRI_WH_CODE", WRI_WH_CODE);//仓库代码
            
            modelService.save(receive1);
        }
    }

    /**
     * 根据机构、单据类型（前缀）、收发类型
     * 调用存储过程 生产采购单号
     * @param dataAuth
     * @param prefix
     * @param dispatchSn
     * @param modelService
     * @return
     */
    @SuppressWarnings("unchecked")
    public String getReceiveNo(String dataAuth,String prefix,String dispatchSn,ModelService modelService){
        ProFuncDto pf = new ProFuncDto();
        int[] inPlace = {1, 2, 3};
        int[] outplace = {4, 5};
        List<Object> list = new ArrayList<Object>();
        List<Object> outType = new ArrayList<Object>();
        list.add(dataAuth);
        list.add(prefix);
        list.add(dispatchSn);
        outType.add("String");
        outType.add("String");
        pf.setClassName("P_C_GET_DOC_NO");//生成检验单号
        pf.setInPlace(inPlace);//存储过程中in
        pf.setOutPlace(outplace); //存储过程中out
        pf.setValArgs(list);//存储过程中输入的参数
        pf.setTotalLen(list.size()+outType.size());//总个数
        pf.setOutValType(outType);//输出的参数
        List<Object> relist = modelService.procComm(pf);//接收返回值
        String res = (String) relist.get(0);  //结果
        return res;
    }

    /**
     * 订单号生成 根据套账累加
     * @author:wzx
     * @version:2018-9-11 14:52
     * @email:phantomsaber@foxmail.com
     **/
    public String getNO(String dataAuth,String prefix,String dispatchSn,String WPI_PO,Timestamp timeStamp,int i){
        StringBuilder sb = new StringBuilder();
        
        sb.append(" SELECT (SELECT DEP_SN FROM (SELECT T.* FROM SY_DEPT T START WITH T.ID = ? CONNECT BY PRIOR T.UP_ID = T.ID) WHERE IS_AUTH = '1' AND ROWNUM = 1) ") ;
        sb.append(" ||'-'||T.WDO_DISPATCH_PREFIX");
        sb.append(" ||'-'||TO_CHAR( ? , 'YYYYMMDD')");
        sb.append(" ||'-'||TRIM(TO_CHAR((select count(1)+1 from T_WMS_PO_DETAIL a where a.WPD_SOB = (SELECT DEP_SN FROM (SELECT T.* FROM SY_DEPT T START WITH T.ID = ? CONNECT BY PRIOR T.UP_ID = T.ID) WHERE IS_AUTH = '1' AND ROWNUM = 1)),'000'))");
        sb.append(" FROM T_WMS_DISPATCH_TYPE T,T_MID_DOC_SEQUENCE TT");
        sb.append(" WHERE T.WDT_TYPE_SN = 'DJ02'");
        sb.append(" AND T.WDO_DISPATCH_SN = 'CGRK' ");
        sb.append(" AND ROWNUM = 1 ");
        
        String s = modelService.findObjSql(sb.toString(), new Object[]{dataAuth,timeStamp,dataAuth}, String.class).toString();
        
        log.info(" --- getNO: >>> "+s);
        return s;
    }
    
    /**
     * 订单号生成 根据单次传输量(精确到秒)
     * @author:wzx
     * @version:2018-9-11 14:52
     * @email:phantomsaber@foxmail.com
     **/
    public String getNO1(String dataAuth,String prefix,String dispatchSn,String WPI_PO,Timestamp timeStamp){
        StringBuilder sb = new StringBuilder();
        sb.append(" SELECT (SELECT DEP_SN FROM (SELECT T.* FROM SY_DEPT T START WITH T.ID = ? CONNECT BY PRIOR T.UP_ID = T.ID) WHERE IS_AUTH = '1' AND ROWNUM = 1) ") ;
        sb.append(" ||'-'||T.WDO_DISPATCH_PREFIX");
        sb.append(" ||'-'||TO_CHAR( ? , 'YYYYMMDD')");
        sb.append(" FROM T_WMS_DISPATCH_TYPE T");
        sb.append(" WHERE T.WDT_TYPE_SN = 'DJ02'");
        sb.append(" AND T.WDO_DISPATCH_SN = 'CGRK'");

        String s = modelService.findObjSql(sb.toString(), new Object[]{dataAuth,timeStamp}, String.class).toString();
        
        log.info(" --- getNO: >>> "+s);
        return s;
    }
    
    /**
	 * 根供应商编码账套获取条数
	 * @param CUST_CODE
	 * @return
	 */
	public static int getSupCount(String SUPPLIER_CODE,String DATA_AUTH){
		int result=0;
		String sql="";
		Object[] param=new Object[2];
	
		sql="select * from t_co_supplier where SUPPLIER_CODE=? and DATA_AUTH=?  ";
		param[0]=SUPPLIER_CODE;
		param[1]=DATA_AUTH;
		
		result=CommMethod.getBaseService().countSql(sql, param);
		return result;
	}
}
