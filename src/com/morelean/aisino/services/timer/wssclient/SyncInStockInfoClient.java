package com.morelean.aisino.services.timer.wssclient;

	import java.text.SimpleDateFormat;
	import java.util.ArrayList;
	import java.util.Calendar;
	import java.util.Date;
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
	 * @ClassName:syncInStockInfoCore
	 * @Description: 入库信息同步至ERP
	 *                                                                                         
	 *     	 	涉及表：                                                                           
	 *               SELECT * FROM T_WMS_RECEIVE_DOC;(入库单据表)                                   
	 *               SELECT * FROM T_WMS_RECEIVE_ITEM;(入库料号详情表)                                
	 *               SELECT * FROM T_WMS_RECEIVE_DETAIL;(入库物料SN详情表)                            
	 *               SELECT * FROM T_WMS_DOC_INFO;(单据信息表)                                      
	 *     1.目前定为所有入库回传数据调用ERP统一接口，通过单据类型区分具体ERP业务                                             
	 *     2.单据号为MES系统内单据号，单据号+物料行号确定唯一记录                                                      
	 *     3.入库单据类型包括采购入库、销售退货、生产退料、完工入库、其他入库等                                                 
	 *     4.采购入库：关联单号为采购单号                                                                    
	 *     5.销售退货：关联单号为销售订单                                                                    
	 *     6.生产退料：关联单号为工单号，需要同时回传工序信息                                                          
	 *     7.完工入库：关联单号为工单号，需要同时回传工序信息                                                          
	 *     8.其他入库：无关联单号，需回传部门代码和账户别名                                                           
	 *     9.需记录接口返回结果                                                                         
	 * @author:mmz
	 * @version:1.0
	 * @since 2018年4月12日下午4:29:50
	 * @Copyright: Copyright (c) 2018
	 * @Company: morelean
	 */
	public class SyncInStockInfoClient implements IJobx{
		
		private final Log log = LogFactory.getLog(this.getClass());

		private ModelService modelService = (ModelService)SpringContextUtil.getBean("modelService");
		@SuppressWarnings("unchecked")
		@Override
		public void exec(Args arg0) throws Exception {
			try {
				int i = 0 ;
				System.out.println(i);
				i++;
			} catch (Exception e) {
				log.error("mmz:com.morelean.aisino.services.timer.wssclient:"+e);
				throw new Exception();
			}
			
		}
		
		@SuppressWarnings("unchecked")
		public String getOutNo(String dataAuth,String prefix,String dispatchSn,ModelService modelService){
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
