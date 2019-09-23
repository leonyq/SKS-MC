package com.morelean.aisino.common;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

/**
 * @ClassName:RuleFactory
 * @Description:   配制映射规则
 * 					根据DAO操作类的类名获得映射规则Map
 *          获得方法：
 *          RuleFactory.getRuleFactory.getRule("类名");
 * @author:mmz
 * @version:1.0
 * @see 
 * @since 2018年4月21日上午11:00:56
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class RuleFactory {
	private RuleFactory() {
		createRuleMap();
	}
	private static RuleFactory ruleFactory ;
	private static Map<String,RulMapHanddle> ruleMap; 
	
	public static RuleFactory getRuleFactory(){
		 if(null!=ruleFactory)
			 return ruleFactory;
		 ruleFactory = new RuleFactory();
		 return ruleFactory; 
	}
	
	public  RulMapHanddle getRuLe(String className){

		return ruleMap.get(className);
	}
	private void createRuleMap(){
	  ruleMap = new HashMap<String,RulMapHanddle> ();//Map<String,Map<String,String>>
	  ruleMap.put("SyncProductMaterialInfo", new SyncProductMaterialInfo() );//只会被New一次
	  ruleMap.put("SyncBomInfo", new SyncBomInfo() );//只会被New一次
	  
	}
	
	
	
	
	/** 
	 * 规则配制方法：
	 *   例：{ 'dto_id':{ 'key':'pojo_id',type:'date'
	 *                   ,'dtype':'yyyyMMdd hhmmss','nullable':'n'
	 *                   ,'vaild':' select pojo_id from t_wms_msd_control_rule where pojo_id = ? '
	 *                   ,'emsg':'FALSE:错误提示'
	 *                   ,'ref':'select id,grade from t_wms_msd_control_rule where poo_id = ? ', 'ref_cb':'id|grape'}
	 *   			,'dto_name':{'key':'pojo_name',type='String','nullable':'n'}
	 *   		}
	 *  说明:{'参数':{  'key':'参数对应的数据库字段'
	 *                    ,'type':'数据类型'
	 *  								  ,'dtype':'数据类型为时间时，时
	 *  间的格式'
	 *  									,'nullable':'n|others n:不为空|others:可空'
	 *  									,'vaild':'传入数据的和法验证(sql语句)  判断对应表中是否存在参数对应的值 ' 
	 *  									,'emsg':'验证末通过时抛出的消息'
	 *  									,'ref':'映射关系 '
	 *  									,'ref_cb':'映射关系的回传字段'
	 *  							}
	 *  			'参数2'{ 'key':''}
	 *       }
	 *   注：key为必填项，其他的根据须要添加
	 *   
	 */				
	public interface RulMapHanddle {
		Map<String,Map<String,String>>  getRuleMap()throws Exception;
	}
	
	
  public class SyncProductMaterialInfo implements RulMapHanddle{

	/** 
	 * @Description:  SyncProductMaterialInfo类的参数处理规则  
	 * 								关联表：T_PM_PROJECT_DETAIL
	 * 								需添加DEPART_NO  ref ：  根据depart_no 查询 dept_id , data_auth 
	 * 											CBD_ITEM_CODE vaild : 必须查询到对应的数据 
	 * 								      PROJECT_ID vaild ： 必须查询到对应的数据 
	 * @return
	 * @author: mmz
	 * @Company:morelean     
	 */ 
	public Map<String,Map<String,String>>  getRuleMap()throws Exception{
		//对应关系
		String json = "{"//*注意*：加\\'  可存入 '  
				+ " 'PROJECT_ID':{'key':'PROJECT_ID','nb':'n','vailds':["
				+ " {'vaild':' select id from t_pm_project_base where project_id = ? ', 'emsg':'该条工单信息不存在'}"
				+ ",{'vaild':' select PROJECT_ID from T_PM_PROJECT_BASE where PROJECT_ID  = ? and PROJECT_STATUS =\\'0\\' ', 'emsg':'该条工单正在操作，或者已经关结'}"
				+ "]}"
		 		+ ",'CBD_ITEM_CODE':{'key':'CBD_ITEM_CODE','nb':'n','vaild':' select id from T_CO_ITEM where CI_ITEM_CODE = ? ', 'emsg':'该机种不存在物料信息主表中，请先添加'}"
		 		+ ",'CBD_ITEM_NUM':{'key':'CBD_ITEM_NUM','type':'number','nb':'n'}"
		 		+ ",'CBD_UNITS':{'key':'CBD_UNITS','nb':'n'}"
		 		+ ",'WORKCENTER_SEQ':{'key':'WORKCENTER_SEQ','nb':'n'}"
		 		+ ",'WORKCENTER_NO':{'key':'WORKCENTER_NO','nb':'n'}"
		 		+ ",'WORKCENTER':{'key':'WORKCENTER','nb':'n'}"
		 		+ ",'MEMO':{'key':'MEMO'}"
		 		+ ",'DEPART_NO':{'key':'DEP_SN','nb':'n','ref':' select ID DEPT_ID , ID DATA_AUTH from sy_dept where ERP_CODE =? and rownum = 1 ','ref_cb':'DEPT_ID|DATA_AUTH','refmsg':'未找到对应的组织机构信息'}"
		 		+ ",'OUTPUT_RATE':{'key':'OUTPUT_RATE','type':'number'}"
		 		+ ",'DATA_STATUS':{'key':'DATA_STATUS','nb':'n'}"
		 		+ ",'reqMap':{'PROJECT_ID':'PROJECT_ID','CBD_ITEM_CODE':'CBD_ITEM_CODE','CBD_ITEM_NUM':'CBD_ITEM_NUM','CBD_UNITS':'CBD_UNITS'"
		 		+            ",'WORKCENTER_SEQ':'WORKCENTER_SEQ','WORKCENTER_NO':'WORKCENTER_NO','WORKCENTER':'WORKCENTER','DATA_AUTH':'DEPART_NO'"
		 		+            ",'DATA_STATUS':'DATA_STATUS'"
		 		+ 					"}"
		 		+ "}";
		return jsonToMap(json);
	}
	
	}
	
  
  class SyncBomInfo implements RulMapHanddle{
  	
  	/** 
  	 * @Description:  SyncBomInfo类的参数处理规则  
  	 * 								关联表：T_CO_BOM
  	 * 								需添加DEPART_NO  ref ：  根据depart_no 查询 dept_id , data_auth 
  	 * @return
  	 * @author: mmz
  	 * @Company:morelean     
  	 */ 
  	public Map<String,Map<String,String>>  getRuleMap()throws Exception{
  		//对应关系
  		String json = "{"//*注意*：加\\'  可存入 '     取默认标识为CB_DEFAULT= ‘Y’ 的 如果没有取第一个 
  				+ " 'CB_ITEM_CODE':{'key':'CB_BOMID','nb':'n','ref':' select ID CB_BOMID from T_CO_BOM where CB_ITEM_CODE = ? order by  CB_DEFAULT desc ', 'ref_cb':'CB_BOMID','refmsg':'未找到对应的BOM信息'}"
  				+ ",'CBD_ITEM_CODE':{'key':'CBD_ITEM_CODE','nb':'n','vaild':' select id from T_CO_ITEM where CI_ITEM_CODE = ? ', 'emsg':'该机种不存在物料信息主表中，请先添加'}"
  				+ ",'CBD_ITEM_SECTION':{'key':'CBD_ITEM_SECTION','nb':'n'}"
  				+ ",'CBD_ITEM_NUM':{'key':'CBD_ITEM_NUM','type':'number','nb':'n'}"
  				+ ",'CBD_UNITS':{'key':'CBD_UNITS','nb':'n'}"
  				+ ",'CBD_POINT':{'key':'CBD_POINT','nb':'n'}"
  				+ ",'WORKCENTER_SEQ':{'key':'WORKCENTER_SEQ','nb':'n'}"
  				+ ",'WORKCENTER_NO':{'key':'WORKCENTER_NO','nb':'n'}"
  				+ ",'WORKCENTER':{'key':'WORKCENTER','nb':'n'}"
  				+ ",'CBD_MEMO':{'key':'CBD_MEMO'}"
  				+ ",'DEPART_NO':{'key':'DEP_SN','nb':'n','ref':' select ID DEPT_ID , ID DATA_AUTH from sy_dept where ERP_CODE =? and rownum = 1 ','ref_cb':'DEPT_ID|DATA_AUTH','refmsg':'未找到对应的组织机构信息'}"
  				+ ",'OUTPUT_RATE':{'key':'OUTPUT_RATE','type':'number'}"
  				+ ",'DRAWING_VER':{'key':'DRAWING_VER'}"
  				+ ",'ECO':{'key':'ECO'}"
  				+ ",'SAMPLE_CODE':{'key':'SAMPLE_CODE'}"
  				+ ",'DATA_STATUS':{'key':'DATA_STATUS','nb':'n'}"
  				+ ",'CR_ITEM_REPLACE':{'key':'CR_ITEM_REPLACE','nb':'n'}"
  				+ ",'CR_ITEM_NUM':{'key':'CR_ITEM_NUM','nb':'n'}"
  				+ ",'CR_ITEM_UNITS':{'key':'CR_ITEM_UNITS','nb':'n'}"
  				+ ",'reqMap':{'CB_BOMID':'CB_ITEM_CODE','CBD_ITEM_CODE':'CBD_ITEM_CODE','CBD_ITEM_SECTION':'CBD_ITEM_SECTION','CBD_ITEM_NUM':'CBD_ITEM_NUM'"
  										+ ",'CBD_UNITS':'CBD_UNITS','CBD_POINT':'CBD_POINT','WORKCENTER_SEQ':'WORKCENTER_SEQ','WORKCENTER_NO':'WORKCENTER_NO','WORKCENTER':'WORKCENTER'"
  										+ ",'DEPT_ID':'DEPART_NO','DATA_STATUS':'DATA_STATUS'"
  										+ "}"
  				+ ",'reqmap':{'CR_ITEM_REPLACE':'CR_ITEM_REPLACE','CR_ITEM_NUM':'CR_ITEM_NUM','CR_ITEM_UNITS':'CR_ITEM_UNITS'}"
  				+ "}";
  		return jsonToMap(json);
  	}
  	
  }
  
	@SuppressWarnings("unchecked")
	private Map<String, Map<String, String>> jsonToMap(Object jsonObj) {
		JSONObject jsonObject = JSONObject.fromObject(jsonObj);
		Map<String, Map<String, String>> map = (Map<String, Map<String, String>>)jsonObject;
		return map;
	}
	
	
}
