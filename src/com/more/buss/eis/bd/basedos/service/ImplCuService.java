//test1
package com.more.buss.eis.bd.basedos.service;

import java.util.List;
import java.util.Map;

import com.more.buss.eis.comm.file.ExcelOpt;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.AppException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class ImplCuService implements FuncService{

	@Override
	public String exeFunc(ModelAction modelaction, ModelService modelservice) {
		List<Map<String,String>> test;
		List list_cu,list_cugroup;
		String sql= "select cust_code,customer,customer_grade,cust_abbreviation,cust_address,cust_group,status from T_CO_CUSTOMER where 1=1";
		String sql2 = "select id,cg_name from T_CO_CUSTOMER_GROUP where 1=1";
		list_cu = modelservice.listSql(sql, null, null, null, null,null);
		list_cugroup = modelservice.listSql(sql2, null, null, null, null,null);
		int i = 1;//提示错误所在条数
		ExcelOpt excelopt = new ExcelOpt();
 		test = excelopt.readExcel(modelaction, modelservice);
 		for(Map map:test){
			String cust_code = map.get("cust_code").toString();//取客户编号
			String customer = map.get("customer").toString();//取客户名称
			String customer_grade = map.get("customer_grade").toString();//取客户等级
			String cust_abbreviation = map.get("cust_abbreviation").toString();//取客户简称
			String cust_address = map.get("cust_address").toString();//取客户地址
			String cust_group = map.get("cust_group").toString();//取客户组
			String status = map.get("status").toString();//取客户状态
			String cg_id = "";
			String id = StringUtils.getUUID();
			
			for(int j=0;j<list_cugroup.size();j++){
				Map m = (Map)list_cugroup.get(j);
				String base =StringUtils.toString(m.get("CG_NAME"));
				if(cust_group.equals(base)){
					cg_id = StringUtils.toString(m.get("ID"));
				}
			}
			
			 this.validate(cust_code, 50, "客户编号", list_cu, i,"CUST_CODE");
			 this.validate(customer, 100, "客户名称", list_cu, i,"CUSTOMER");
			 this.validate2(customer_grade, 50,"客户等级", list_cu, i,"CUSTOMER_GRADE");
			 this.validate(cust_abbreviation, 50, "客户简称", list_cu, i,"CUST_ABBREVIATION");
			 this.validate(cust_address, 100, "客户地址", list_cu, i,"CUST_ADDRESS");
			 this.validate2(cust_group, 50,"客户组", list_cu, i,"CUST_GROUP");
			 this.validate2(status, 50,"客户状态", list_cu, i,"STATUS");
			//插入数据
			  TableDataMapExt caltd = new TableDataMapExt();
		      caltd.setTableName("T_CO_CUSTOMER");
		      caltd.getColMap().put("ID", id);
		      caltd.getColMap().put("CUST_CODE", cust_code);
		      caltd.getColMap().put("CUSTOMER", customer);
		      caltd.getColMap().put("CUSTOMER_GRADE", customer_grade);
		      caltd.getColMap().put("CUST_ABBREVIATION", cust_abbreviation);
		      caltd.getColMap().put("CUST_ADDRESS", cust_address);
		      caltd.getColMap().put("CUST_GROUP", cg_id);
		      caltd.getColMap().put("STATUS", status);
		      modelservice.save(caltd);
			 
			i++;
		}
		return modelaction.reloadParent(modelaction.getText("上传成功！共导入"+(i-1)+"条数据"));
	}
  
	 //验证数据是否合法方法
		public void validate(String col_value,int length,String col_text,List sqllist,int i,String base_text){
			   if(col_value!=null && col_value!="null"){
				if(col_value.length()>length){
					throw new AppException("第"+i+"条"+col_text+"长度超出规定的范围！！");
				}else{
						//查重
						for(int j=0;j<sqllist.size();j++){
							Map m = (Map)sqllist.get(j);
							String base =StringUtils.toString(m.get(base_text));
							if(col_value.equals(base)){
								throw new AppException("第"+i+"条"+col_text+"已存在！！");
							}
						}
				}
				
			}else{
				throw new AppException("第"+i+"条"+col_text+"内容为空！");
			}
			
			}
		
		public void validate2(String col_value,int length,String col_text,List sqllist,int i,String base_text){
			   if(col_value!=null && col_value!="null"){
				if(col_value.length()>length){
					throw new AppException("第"+i+"条"+col_text+"长度超出规定的范围！！");
				}else{
						if(col_text.equals("客户等级")){
							if(!col_value.equals("1") && !col_value.equals("2")){
								throw new AppException("第"+i+"条"+col_text+"在数据库中不存在！！");
							}
						}
						if(col_text.equals("客户状态")){
							if(!col_value.equals("0") && !col_value.equals("1")){
								throw new AppException("第"+i+"条"+col_text+"在数据库中不存在！！");
							}
						}
				}
				
			}else{
				throw new AppException("第"+i+"条"+col_text+"内容为空！");
			}
			
			}
}
