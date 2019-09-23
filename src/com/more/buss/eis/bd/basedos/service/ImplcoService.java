//test1
package com.more.buss.eis.bd.basedos.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lowagie.text.pdf.hyphenation.TernaryTree.Iterator;
import com.more.buss.eis.comm.file.ExcelOpt;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.AppException;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class ImplcoService implements FuncService {
	

	public String exeFunc(ModelAction modelaction, ModelService modelservice) {
		List<Map<String,String>> test;
		List list_sql1;
		   String sql1= "select CONTAINER_SN,CONTAINER_TYPE,CONTAINER_SPEC,CONTAINER_CAPACITY,STATE_FLAG,ENABLE_FLAG from T_CO_CONTAINER where 1=1";
		list_sql1 = modelservice.listSql(sql1, null, null, null, null,null);
		int i = 1;//提示错误所在条数
 		ExcelOpt excelopt = new ExcelOpt();
 		test = excelopt.readExcel(modelaction, modelservice);
		for(Map map:test){
			String container_sn = map.get("container_sn").toString();//取容器SN
			String container_type = map.get("container_type").toString();//取容器类型
			String container_spec = map.get("container_spec").toString();//取容器规格
		  String container_capacity = map.get("container_capacity").toString();//取容量
			String state_flag = map.get("state_flag").toString();//取容器状态
      String enable_flag = map.get("enable_flag").toString();//取有效标志

			
			String id = StringUtils.getUUID();//取主键ID
	
	//进行验证		
			 this.validate(container_sn, 50, "容器SN", list_sql1, i,"CONTAINER_SN");
			 this.validate(container_type, 10, "容器类型", list_sql1, i,"CONTAINER_TYPE");
			 this.validate(container_spec, 10, "容器规格", list_sql1, i,"CONTAINER_SPEC");
			 this.validate(container_capacity, 50, "容器SN", list_sql1, i,"CONTAINER_CAPACITY");//number类型
			 //this.validate(state_flag, 1, "容器状态", list_sql1, i,"STATE_FLAG");//flag 另写验证方法
			 //this.validate(enable_flag, 1, "有效标志", list_sql1, i,"ENABLE_FLAG");//flag 另写验证方法

			//插入数据
			  TableDataMapExt caltd = new TableDataMapExt();
		      caltd.setTableName("T_CO_CONTAINER");
		      caltd.getColMap().put("ID", id);
		      caltd.getColMap().put("CONTAINER_SN", container_sn);
		      caltd.getColMap().put("CONTAINER_TYPE", container_type);
		      caltd.getColMap().put("CONTAINER_SPEC", container_spec);
		      caltd.getColMap().put("CONTAINER_CAPACITY", container_capacity);
		      caltd.getColMap().put("STATE_FLAG", state_flag);
		      caltd.getColMap().put("ENABLE_FLAG", enable_flag);
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
   
}
