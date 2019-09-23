package com.more.mes.smt.wmspoinfo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;



import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.mes.smt.getsnhttp.service.GetSnService;

/**
 * 保存采购单的到货计划
 * @author development
 *
 */
public class SavePoReceiveInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
	    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
	    String formId = request.getParameter("formId");
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");	
	    	String wpdPo = request.getParameter("poNo");//采购单号
	    	String wpiReceiveTime = request.getParameter("paraMapObj.WPI_RECEIVE_TIME");//到货时间
	    	String wpiSupCode = request.getParameter("supCode");//供应商
	    	String wpiMemo = request.getParameter("wpiMemo");//备注
			String itemArr = request.getParameter("itemArr");
			JSONArray jsonArr = JSONArray.fromObject(itemArr);
			int num = jsonArr.size();
			//String WRD_DOC_NUM = getReceiveNo(dataAuth,"DJ02","",modelService);//入库单号
			GetSnService gss = new GetSnService();
            String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
            String wrdDocNum = gss.getSnForDocNum("DJ02", "", userId,dataAuth);
            if (wrdDocNum.indexOf("NG") != -1)
            {
              return modelAction.alertParentInfo(wrdDocNum);
            }
			
			
			//增加仓库单据信息表数据
			TableDataMapExt wms = new TableDataMapExt();
		 	wms.setTableName("T_WMS_DOC_INFO");
		 	CommMethod.addSysDefCol(wms.getColMap(), modelAction.getUser());
		 	wms.getColMap().put("WDI_DOC_NUM", wrdDocNum);
		 	wms.getColMap().put("WDI_STATUS", "1");
		 	wms.getColMap().put("WDI_URGENT_FLAG", "N");
		 	wms.getColMap().put("WDI_SUP_CODE", wpiSupCode);
		 	wms.getColMap().put("WDI_DOC_TYPE", "DJ02");
		 	wms.getColMap().put("WDI_CREATE_MAN", CommMethod.getSessionUser().getId());
		 	wms.getColMap().put("WDI_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
		 	wms.getColMap().put("WDI_MEMO", wpiMemo);
		 	if(dataAuth!=null){
				wms.getColMap().put("DATA_AUTH", dataAuth);
		    }
		 	modelService.save(wms);
		 	//插入入库单信息
		 	TableDataMapExt receive = new TableDataMapExt();
		 	receive.setTableName("T_WMS_RECEIVE_DOC");
		 	CommMethod.addSysDefCol(receive.getColMap(), modelAction.getUser());
		 	receive.getColMap().put("WRD_DOC_NUM", wrdDocNum);
		 	receive.getColMap().put("WRD_DOC_TYPE", "DJ02");
		 	receive.getColMap().put("WRD_STATUS", "1");
		 	receive.getColMap().put("WRD_SUP_CODE", wpiSupCode);
		 	if(!wpiReceiveTime.equals("")){
		 		receive.getColMap().put("WPD_DELIVERY_DATE", sdf2.parse(wpiReceiveTime));
		 	}
		 	receive.getColMap().put("WRD_URGENT_FLAG", "N");
		 	receive.getColMap().put("WRD_MEMO", wpiMemo);
		 	receive.getColMap().put("WRD_CREATE_MAN", CommMethod.getSessionUser().getId());
		 	receive.getColMap().put("WRD_CREATE_TIME", sdf1.parse(sdf1.format(new Date())));
		 	if(dataAuth!=null){
		 		receive.getColMap().put("DATA_AUTH", dataAuth);
		    }
		 	modelService.save(receive);
		 	//插入入库单物料信息
		 	TableDataMapExt receive1 = new TableDataMapExt();
		 	receive1.setTableName("T_WMS_RECEIVE_ITEM");
			for(int i=0;i<num;i++){
				JSONArray jsonArr1 = JSONArray.fromObject(jsonArr.get(i));
				int num1 = jsonArr1.size();
				receive1.getColMap().clear();
		 		CommMethod.addSysDefCol(receive1.getColMap(), modelAction.getUser());
		 		receive1.getColMap().put("WRI_DOC_NUM", wrdDocNum);
			 	receive1.getColMap().put("WRI_STATUS", "1");
				for(int j=0;j<num1;j++){
					JSONObject entity = jsonArr1.optJSONObject(j);
					if(entity.get("CI_ITEM_CODE")!=null){
						receive1.getColMap().put("WRI_ITEM_CODE", entity.get("CI_ITEM_CODE"));
					}
					if(entity.get("WPD_ITEM_SEQ")!=null){
						receive1.getColMap().put("WRI_ITEM_SEQ", Integer.parseInt(entity.get("WPD_ITEM_SEQ").toString()));
					}
					if(entity.get("issuedNum")!=null){
						receive1.getColMap().put("WRI_PLAN_NUM", Integer.parseInt(entity.get("issuedNum").toString()));
					}
					if(entity.get("GIFT_NUM")!=null){
						receive1.getColMap().put("WRI_GIFT_NUM", Integer.parseInt(entity.get("GIFT_NUM").toString()));
					}
					if(entity.get("wmsSelect")!=null){
						receive1.getColMap().put("WRI_WH_CODE", entity.get("wmsSelect"));
					}
					if(entity.get("WPD_DELIVERY_DATE")!=null){
						if(!entity.get("WPD_DELIVERY_DATE").equals("")){
				 			receive1.getColMap().put("WRI_DELIVERY_DATE", sdf2.parse((String) entity.get("WPD_DELIVERY_DATE")));
				 		}
					}
				}
				receive1.getColMap().put("WRI_PACK_NUM", 0);
		 		receive1.getColMap().put("WRI_CONNECT_DOC", wpdPo);
		 		if(dataAuth!=null){
		 			receive1.getColMap().put("DATA_AUTH", dataAuth);
			    }
		 		modelService.save(receive1);
			}
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("保存失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), isCloseWin);
	}
	
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

}
