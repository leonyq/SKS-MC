package com.more.mes.smt.testitem.service;

import java.util.List;
import java.util.Map;

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
 * @Description 品质检测项目新增
 * @ClassName DelTestItemService
 * @author csj
 * @Company: morelean
 */
public class SaveTestItemService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    String itemSN = request.getParameter("paraMap1@0#QTI_ITEM_SN"); // 项目代码
    String itemName = request.getParameter("paraMap1@0#QTI_ITEM_NAME"); // 项目名称
    String itemDefault = request.getParameter("paraMap1@0#QTI_DEFAULT_FLAG"); // 默认标志
    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");// 是否关闭窗口
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String sql = "select id from T_QM_TEST_ITEM where QTI_ITEM_SN=? and DATA_AUTH=? ";
    List list1 = modelService.listDataSql(sql, new Object[] {itemSN,dataAuth});
    if (list1 != null && !list1.isEmpty())
    {
      return modelAction.alertParentInfo((modelAction.getText("项目代码")+ itemSN+modelAction.getText("已存在，请更换")));
    }

    String sql2 = "select id from T_QM_TEST_ITEM where QTI_ITEM_NAME=? and DATA_AUTH=? ";
    List list2 = modelService.listDataSql(sql2, new Object[] {itemName,dataAuth});
    if (list2 != null && !list2.isEmpty())
    {
      return modelAction.alertParentInfo((modelAction.getText("项目名称")+ itemName+modelAction.getText("已存在，请更换")));
    }

    if ("Y".equals(itemDefault))
    {
      /*
       * String sql3 = "select id from T_QM_TEST_ITEM where rownum=1 and QTI_DEFAULT_FLAG='Y'";
       * List list3 = modelService.listDataSql(sql3); if (list3 != null && !list3.isEmpty()) {
       * return modelAction.alertParentInfo((modelAction.getText("已存在默认的检测项目,请更换"))); }
       */
    }
    else
    {
      itemDefault = "N";
    }

    String itemStep = request.getParameter("paraMap1@0#QTI_TEST_STEP");
    String itemType = request.getParameter("paraMap1@0#QTI_ITEM_TYPE");
    String itemClass = request.getParameter("paraMap1@0#QTI_ITEM_CLASS");
    String itemMaxVal = request.getParameter("paraMap1@0#QTI_ITEM_MAXVALUE");
    String itemMinVal = request.getParameter("paraMap1@0#QTI_ITEM_MINVALUE");
    String itemMethod = request.getParameter("paraMap1@0#QTI_TEST_METHOD");
    String itemSeq = request.getParameter("paraMap1@0#QTI_TEST_SEQ");
    String itemContent = request.getParameter("paraMap1@0#QTI_TEST_CONTENT");
    String itemUnit = request.getParameter("paraMap1@0#QTI_ITEM_UNIT");

    TableDataMapExt td = new TableDataMapExt();
    td.setTableName("T_QM_TEST_ITEM");
    CommMethod.addSysDefCol(td.getColMap(), modelAction.getUser());
    // td.setSqlWhere("and ID='" + cfiId + "'");
    Map<String, Object> itemMap = td.getColMap();
    itemMap.put("QTI_ITEM_SN", itemSN);
    itemMap.put("QTI_ITEM_NAME", itemName);
    itemMap.put("QTI_TEST_STEP", itemStep);
    itemMap.put("QTI_ITEM_TYPE", itemType);
    itemMap.put("QTI_ITEM_CLASS", itemClass);
    if(StringUtils.isNotEmpty(itemMaxVal)){
    	itemMap.put("QTI_ITEM_MAXVALUE", Double.parseDouble(itemMaxVal));
    }
    if(StringUtils.isNotEmpty(itemMinVal)){
    	itemMap.put("QTI_ITEM_MINVALUE", Double.parseDouble(itemMinVal));
    }
    itemMap.put("QTI_TEST_METHOD", itemMethod);
    itemMap.put("QTI_DEFAULT_FLAG", itemDefault);
    if(StringUtils.isNotEmpty(itemSeq)){
    	itemMap.put("QTI_TEST_SEQ", Integer.parseInt(itemSeq));
    }
    itemMap.put("QTI_TEST_CONTENT", itemContent);
    itemMap.put("QTI_ITEM_UNIT", itemUnit);
    if (dataAuth != null)
    {
      itemMap.put("DATA_AUTH", dataAuth);// 组织结构
    }

    try
    {
      modelService.save(td);
    }
    catch (NumberFormatException e) {
		// TODO: handle exception
    	return modelAction.alertParentInfo("格式转换失败");
	}
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保存失败"), e);
    }
    // modelService.addComm(request, modelAction.getCurrUser(), modelAction);
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("保存成功"), isCloseWin);
  }
}
