package com.more.mes.erpservice;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.json.Json;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

//import com.alibaba.fastjson.JSON;
import com.more.fw.core.common.exception.AppException;
import com.more.fw.core.common.method.BussService;
import com.more.fw.core.common.method.MsHTranMan;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.fw.http.service.HttpCoreService;

import net.sf.json.JSONObject;

/**
 * 金碟u8ERP
 * ERPservice公共方法 获取请求的参数信息
 * 
 * @author wxw
 * 
 */
public class ErpServiceMethod {
	 
	private static final Log log = LogFactory.getLog("com.more.mes.mes.ErpServiceMethod");
	 
	///appdata/mcweb1/webapps/N2/erplog
	///appdata/mcweb1/webapps/N2/erplog
	//E:/mo/soft/tomcat7_20180410_LAIFU/tomcat7_20180410/bin/logs/ERPLOG.log
	public final static String LOG_FILE="E:/Mes/mcweb8090/webapps/N2/erplog/"; 
	public final static String ROOT_FILE="E:/Mes/mcweb8090/webapps/N2"; 
	//接口返回失败标识
	public final static String NG="NG";
	//接口返回成功标识
	public final static String OK="OK"; 
	
	/**
	 * 根据账套返回组织机构ID,不存在返回顶级
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String,Object>  getDeptID(String sob){ 
		Map<String, Object> map = new HashMap<String, Object>();
        String sql="SELECT ID  FROM SY_DEPT T WHERE T.ERP_CODE = ? "; 
        List<Map<String, Object>> list=  ((ModelService)SpringContextUtil.getBean("modelService")).listDataSql(sql, new Object[] {sob});
        if(list!=null&&list.size()>0){
            map=list.get(0);
        }
        return map;
	}
	
	/**
	 * 返回ERP创建人的ID，不存在则返回admin
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String,Object>  getUserID(String user){ 
		Map<String, Object> map = new HashMap<String, Object>();
        String sql="SELECT ID  FROM SY_USER T WHERE T.LOGIN_NAME IN (?,'erp') ORDER BY CASE WHEN LOGIN_NAME='erp'  THEN 1 ELSE 0 END"; 
        List<Map<String, Object>> list= ((ModelService)SpringContextUtil.getBean("modelService")).listDataSql(sql, new Object[] {user});
        if(list!=null&&list.size()>0){
            map=list.get(0);
        }
        return map;
	}
	
	/**
	 * 返回ERP创建人的ID，不存在则返回admin
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String,Object>  getAreaCode(String WA_ERP_CODE,String DATA_AUTH){ 
		Map<String, Object> map = new HashMap<String, Object>();
        String sql="SELECT T.DATA_AUTH,T.WA_AREA_SN,T.WA_AREA_NAME,T.WA_ERP_CODE,T.ID FROM T_WMS_AREA T " +
        		"WHERE T.WA_AREA_TYPE='1'  AND T.WA_ERP_CODE IS NOT NULL AND DATA_AUTH=? AND WA_ERP_CODE=?"; 
        List<Map<String, Object>> list= ((ModelService)SpringContextUtil.getBean("modelService")).listDataSql(sql, new Object[] {DATA_AUTH,WA_ERP_CODE});
        if(list!=null&&list.size()>0){
            map=list.get(0);
        }
        return map;
	}
	
	
	
	/**
	 * 返回ERP创建人的ID，不存在则返回admin
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String,Object>  getUserByName(String user){ 
		Map<String, Object> map = null;
        String sql="SELECT ID  FROM SY_USER T WHERE T.LOGIN_NAME IN (?) "; 
        List<Map<String, Object>> list= ((ModelService)SpringContextUtil.getBean("modelService")).listDataSql(sql, new Object[] {user});
        if(list!=null&&list.size()>0){
        	map= new HashMap<String, Object>();
            map=list.get(0);
        }
        return map;
	}
	
	/**
	 * 返回物料信息
	 * @return
	 */
    @SuppressWarnings("unchecked")
	public static Map<String,Object> getItemCode(String CI_ITEM_CODE,String DATA_AUTH){
        Map<String, Object> map = null;
        String sql="select * from t_co_item t where CI_ITEM_CODE=? AND DATA_AUTH=?";
        List<Map<String, Object>> list= ((ModelService)SpringContextUtil.getBean("modelService")).listDataSql(sql, new Object[] {CI_ITEM_CODE,DATA_AUTH});
        if(list!=null&&list.size()>0){
        	map=new HashMap<String, Object>();
            map=list.get(0);
        }
        return map;
    }
	 
	
	/**
	 * 读取请求的json字符串
	 * @param service
	 * @return
	 */
	public static String getRequestJson(HttpCoreService service) {
		StringBuilder str = null;
		BufferedReader reader = null;
		try {
			reader = service.getHttpRequest().getReader();

			String line = null;
			str = new StringBuilder();
			while ((line = reader.readLine()) != null) {
				str.append(line);
			}
		} catch (Exception e) {
			throw new AppException(e);
		} finally {
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return str.toString();
	}

	/**
	 * 向文件末尾追加内容
	 * 
	 * @param fileName
	 * @param content
	 */
	public synchronized static void writeLog(String fileName, String content) {
	    String RealfileName=fileName.equals("")?LOG_FILE+getFileNameTime():fileName;
		BufferedWriter out = null;
		try {
			out = new BufferedWriter(new OutputStreamWriter(
					new FileOutputStream(RealfileName, true),"UTF-8"));
			out.newLine();
			out.write(content);
			out.flush(); 
		} catch (Exception e) {   
			e.printStackTrace();
			log.error(e);
		} finally {
			try {
				if(out!=null){
					out.close();
				}
			} catch (IOException e) { 
				e.printStackTrace();
				log.error(e);
			}
		}
	}
	
	/**
	 * ERP接口返回
	 * @return
	 */
	public static String getResult(String RS,String MSG,List<Map<String, String>> list){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("RESULT", RS);
		if(RS.equals(ErpServiceMethod.NG)){
			map.put("MSG", "MES提示："+MSG);
		}else{
			map.put("MSG", MSG);
		}
		
		if(list==null){
			list=new ArrayList<Map<String,String>>();
		}
		map.put("RESPONSE_DATA", list);
		//return JSON.toJSONString(map);
		JSONObject jsonObject = JSONObject.fromObject(map);
		return jsonObject.toString();
	}
	
	/**
	 * ERP接口返回
	 * @return
	 */
	public static String getResult(String RS,String MSG){
		return getResult(RS,MSG,null);
	}
	
	/**
	 * ERP接口返回
	 * @return
	 */
	public static String getResult(String RS){
		return getResult(RS,"",null);
	}
	
	/**
	 * 获取时间格式的文件名
	 * @return
	 */
	public static String getFileNameTime(){
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		String fileNameFormat=format.format(new java.util.Date());
		String fileName="ERPLOG"+fileNameFormat+".log";
		return fileName;
	} 
	
	public static void AddIFLog(String requestString,String responseString,int OBJECTTYPE,
			String OBJECTNAME,String TBRESULT,ModelService modelService ){
		AddIFLog("",requestString,responseString,OBJECTTYPE,OBJECTNAME,TBRESULT,modelService);
	}
	
	@SuppressWarnings("unchecked")
	public static void AddIFLog(String WRI_DOC_NUM,String requestString,String responseString,int OBJECTTYPE,
			String OBJECTNAME,String TBRESULT,ModelService modelService ){
		MsHTranMan tran = BussService.getHbTran();
		try{
			TableDataMapExt tdMap1 = new TableDataMapExt();
			tdMap1.setTableName("T_CO_IFLOG");// 设置表名
			tdMap1.getColMap().put("DOCNUM", WRI_DOC_NUM);//入库单号
			tdMap1.getColMap().put("REQUESTDATA", requestString);//请求信息
			tdMap1.getColMap().put("RESPONSEDATA", responseString);//结果信息
			tdMap1.getColMap().put("OBJECTTYPE", OBJECTTYPE);//请求类型 
			tdMap1.getColMap().put("OBJECTNAME", OBJECTNAME);//请求对象
			tdMap1.getColMap().put("RESULT", TBRESULT);
			modelService.save(tdMap1);
			tran.commit();
		}catch(Exception e){
			tran.rollback();
			log.error("保存erp接口日志信息失败:"+e.getMessage());
			e.printStackTrace();
		}
	}
	
	/**
	 * 生成单号
	 * @param dataAuth 组织机构ID
	 * @param prefix  单据类别
	 * @param WRD_DISPATCH_SN 收发类型
	 * @param modelService
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String getReceiveNo(String dataAuth,String M_DOC_TYPE,String WRD_DISPATCH_SN,ModelService modelService){
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = {1, 2, 3};
	    int[] outplace = {4, 5};
	    List<Object> list = new ArrayList<Object>();
	    List<Object> outType = new ArrayList<Object>();
	    list.add(dataAuth);
	    list.add(M_DOC_TYPE);
	    list.add(WRD_DISPATCH_SN);
	    outType.add("String");
	    outType.add("String");
	    pf.setClassName("P_C_GET_DOC_NO");//生成工单号
	    pf.setInPlace(inPlace);//存储过程中in 
	    pf.setOutPlace(outplace); //存储过程中out
	    pf.setValArgs(list);//存储过程中输入的参数
	    pf.setTotalLen(list.size()+outType.size());//总个数
	    pf.setOutValType(outType);//输出的参数
	    List<Object> relist = modelService.procComm(pf);//接收返回值
	    String res = (String) relist.get(0);  //结果
		return res;
	}

}
