package com.more.mes.smt.deliverinfo;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

/**
 * 新增交付信息
 * @author Administrator
 *
 */
public class AddDeliverInfo implements FuncService{
	
	private final Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	@Override
	public String exeFunc(ModelAction modelAction, ModelService modelService) {
		HttpServletRequest request = modelAction.getRequest();
	    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
	    String formId = request.getParameter("formId");
	    if (StringUtils.isBlank(formId))
	    {
	      formId = request.getParameter("formIds");
	    }
	    String iframeId = request.getParameter("iframeId");
	    try {
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String projectId = request.getParameter("paraMap1@0#TWD_PROJECT");
			String unit = request.getParameter("paraMap1@0#TWD_UNIT");
			String sclh = request.getParameter("paraMap1@0#TWD_SCLH");
			String cpxh = request.getParameter("paraMap1@0#TWD_CPXH");
			String num = request.getParameter("paraMap1@0#TWD_NUM");
			String content = request.getParameter("paraMap1@0#TWD_CONTENT");
			String deliverDate = request.getParameter("paraMap1@0#TWD_DELIVER_DATE");
			String qualityNo = request.getParameter("paraMap1@0#TWD_QUALITY_NO");
			String memo = request.getParameter("paraMap1@0#TWD_MEMO");
			String docNo = getPoNo(modelService);
			TableDataMapExt receive = new TableDataMapExt();
		 	receive.setTableName("T_WIP_DELIVER");
		 	CommMethod.addSysDefCol(receive.getColMap(), modelAction.getUser());
			receive.getColMap().put("TWD_NO", docNo.replace("JF", ""));
			receive.getColMap().put("TWD_PROJECT", projectId);
			receive.getColMap().put("TWD_UNIT", unit);
			receive.getColMap().put("TWD_SCLH", sclh);
			receive.getColMap().put("TWD_CPXH", cpxh);
			receive.getColMap().put("TWD_NUM", num);
			receive.getColMap().put("TWD_CONTENT", content);
			//receive.getColMap().put("TWD_DELIVER_DATE", sdf.parse(deliverDate));
			receive.getColMap().put("TWD_QUALITY_NO", qualityNo);
			receive.getColMap().put("TWD_MEMO", memo);
			modelService.save(receive);
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("新增失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}
	
	@SuppressWarnings("unchecked")
	public String getPoNo(ModelService modelService){
		ProFuncDto pf = new ProFuncDto();
		int[] inPlace = {1};
	    int[] outplace = {2, 3};
	    List<Object> list = new ArrayList<Object>();
	    List<Object> outType = new ArrayList<Object>();
	    list.add("JF");
	    outType.add("String");
	    outType.add("String");
	    pf.setClassName("P_C_GET_DELIVER_SN");//生成检验单号
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
