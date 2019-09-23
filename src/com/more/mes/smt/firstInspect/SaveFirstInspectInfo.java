package com.more.mes.smt.firstInspect;

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

/**
 * 保存首检新增内容
 * @author Administrator
 *
 */
public class SaveFirstInspectInfo implements FuncService{
	
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
			String TFI_TYPE = request.getParameter("paraMap1@0#TFI_TYPE");
			String TFI_PRODUCT_SN = request.getParameter("paraMap1@0#TFI_PRODUCT_SN");
			String TFI_PROJECT_ID = request.getParameter("paraMap1@0#TFI_PROJECT_ID");
			String TFI_MKDH = request.getParameter("paraMap1@0#TFI_MKDH");
			String TFI_MKJD = request.getParameter("paraMap1@0#TFI_MKJD");
			String TFI_MKBB = request.getParameter("paraMap1@0#TFI_MKBB");
			String TFI_GROUP = request.getParameter("paraMap1@0#TFI_GROUP");
			//明细
			String TFG_TEST_FACE = request.getParameter("paraMap1@0#TFG_TEST_FACE");
			if(StringUtils.isBlank(TFG_TEST_FACE)){
				TFG_TEST_FACE = "";
			}
			String TFG_TEST_RESULT = request.getParameter("paraMap1@0#TFG_TEST_RESULT");
			String TFI_TEST_CONTENT = request.getParameter("paraMap1@0#TFI_TEST_CONTENT");
			String CONTENT = request.getParameter("paraMap1@0#TFG_CONTENT");
			if(StringUtils.isBlank(CONTENT)){
				CONTENT = "";
			}else{
				TFI_TEST_CONTENT = CONTENT + "："+TFI_TEST_CONTENT;
			}
			//保存主表信息
			TableDataMapExt receive = new TableDataMapExt();
		 	receive.setTableName("T_XA_FIRST_INSPECT");
		 	CommMethod.addSysDefCol(receive.getColMap(), modelAction.getUser());
		 	
		 	receive.getColMap().put("TFI_PRODUCT_SN", TFI_PRODUCT_SN);
		 	receive.getColMap().put("TFI_PROJECT_ID", TFI_PROJECT_ID);
		 	receive.getColMap().put("TFI_MKDH", TFI_MKDH);
		 	receive.getColMap().put("TFI_MKJD", TFI_MKJD);
		 	receive.getColMap().put("TFI_MKBB", TFI_MKBB);
		 	receive.getColMap().put("TFI_TYPE", TFI_TYPE);
		 	modelService.save(receive);
		 	//保存明细信息
			TableDataMapExt group = new TableDataMapExt();
			group.setTableName("T_XA_FIRST_GROUP");
		 	CommMethod.addSysDefCol(group.getColMap(), modelAction.getUser());
		 	group.getColMap().put("TFG_PROJECT_ID", TFI_PROJECT_ID);
		 	group.getColMap().put("TFG_GROUP", TFI_GROUP);
		 	group.getColMap().put("TFG_TEST_FACE", TFG_TEST_FACE);
		 	group.getColMap().put("TFG_TEST_RESULT", TFG_TEST_RESULT);
		 	group.getColMap().put("TFG_TEST_CONTENT", TFI_TEST_CONTENT);
		 	group.getColMap().put("TFG_TYPE", TFI_TYPE);
		 	modelService.save(group);
		} catch (Exception e) {
			log.error(e);
		    throw new BussException(modelAction.getText("新增失败"), e);
		}
	    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
	}

}
