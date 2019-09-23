package com.more.mes.smt.ipqcdoc.oracle;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.login.model.UserDto;
import com.more.fw.core.bd.service.jobx.Args;
import com.more.fw.core.bd.service.jobx.IJobx;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * IPQC定时器
 * @author development
 *
 */
public class IpqcTimer implements IJobx{
	
	private final Log log = LogFactory.getLog(this.getClass());

	private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");

	@SuppressWarnings("unchecked")
	@Override
	public void exec(Args arg0) throws Exception {
		try {
			//获取巡检方案信息
			String insSql = "SELECT to_char(t1.qit_begin_time,'hh24:mi:ss') begin_time," +
					"to_char(t1.qit_end_time,'hh24:mi:ss') end_time FROM T_QC_INSPECTION_INFO T " +
					"LEFT JOIN T_QC_INSPECTION_TIME T1 ON T1.QI_ID = T.ID " +
					"WHERE T.QI_DEFAULT_FALG = 'Y' AND T.QI_MODEL = '1' " +
					"AND to_char(SYSDATE,'hh24:mi:ss') >= to_char(t1.qit_begin_time,'hh24:mi:ss') " +
					"AND to_char(SYSDATE,'hh24:mi:ss') <= to_char(t1.qit_end_time,'hh24:mi:ss') ";
			List<Map<String, Object>> insList = modelService.listDataSql(insSql);
			if(insList!=null&&insList.size()>0){
				String checkSql = "select t.QID_DOC_NUM from T_QM_IPQC_DOC t " +
						"where to_char(t.QID_RECORD_DATE,'hh24:mi:ss') >= ? " +
						"and to_char(t.QID_RECORD_DATE,'hh24:mi:ss') <= ? ";
				int count = modelService.execSql(checkSql, new Object[] {insList.get(0).get("BEGIN_TIME"),insList.get(0).get("END_TIME")});
				if(count==0){ //时间段里面没有记录则新增数据
					//取出有效的IPQC检测项目
					String ipqcSql = "select * from T_QM_IPQC_ITEM where QII_EFFECTIVE_FLAG ='Y' ";
					List<Map<String, Object>> ipqcList = modelService.listDataSql(ipqcSql);
					if(ipqcList!=null&&ipqcList.size()>0){
						//取出系统默认用户sys001
						String userSql = "select t.* from SY_USER t WHERE t.login_name='sys001' ";
						List<UserDto> user = modelService.listSql(userSql, null, null, null, null, new UserDto());
						int num = ipqcList.size();
						//生成IPQC单号
						String docNum = getIpqcNo(user.get(0).getDeptId(),"IPQC","",modelService);
						//插入ipqc单据信息
						TableDataMapExt ipqc = new TableDataMapExt();
						ipqc.setTableName("T_QM_IPQC_DOC");
						CommMethod.addSysDefCol(ipqc.getColMap(), user.get(0));
						ipqc.getColMap().put("QID_DOC_NUM", docNum);
						ipqc.getColMap().put("QID_STATUS", "1");
						ipqc.getColMap().put("QID_COMMENT", "系统生成");
						ipqc.getColMap().put("QID_RECORD_EMP", user.get(0).getId());
						ipqc.getColMap().put("QID_RECORD_DATE", DateUtil.getCurDate());
						modelService.save(ipqc);
						//插入ipqc明细信息
						TableDataMapExt ipqcDet = new TableDataMapExt();
						ipqcDet.setTableName("T_QM_IPQC_DETAIL");
						for(int i=0;i<num;i++){
							ipqcDet.getColMap().clear();
							CommMethod.addSysDefCol(ipqcDet.getColMap(), user.get(0));
							ipqcDet.getColMap().put("QID_DOC_NUM", docNum);
							ipqcDet.getColMap().put("QID_ITEM_CODE", ipqcList.get(i).get("QII_ITEM_CODE"));
							ipqcDet.getColMap().put("QID_ITEM_NAME", ipqcList.get(i).get("QII_ITEM_NAME"));
							ipqcDet.getColMap().put("QID_ITEM_TYPE", ipqcList.get(i).get("QII_ITEM_TYPE"));
							ipqcDet.getColMap().put("QID_TEST_CONTENT", ipqcList.get(i).get("QII_TEST_CONTENT"));
							modelService.save(ipqcDet);
						}
					}
				}
			}
		} catch (Exception e) {
			log.error(e);
			throw new Exception();
		}
	}
	
	@SuppressWarnings("unchecked")
	public String getIpqcNo(String dataAuth,String prefix,String dispatchSn,ModelService modelService){
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

}
