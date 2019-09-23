package com.more.mes.smt.wmssparekmanager;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
 * 根据选择的入库单的物料料号获取入库详细信息
 * 
 * @author development
 */
public class EditSpareInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {//
    HttpServletRequest request = modelAction.getRequest();
    String itemSn = request.getParameter("itemSn");
    String itemCode = request.getParameter("itemCode");
    String itemNum = request.getParameter("paraMapObj.WSI_ITEM_NUM");
    String productDate = request.getParameter("paraMapObj.WSI_PRODUCE_DATE");// 生产日期
    String stockCode = request.getParameter("STORAGE_CODES");//库位SN
    String whCode = request.getParameter("WH_CODES");//仓库SN
    String memo = request.getParameter("paraMapObj.WSI_MEMO");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    String formId = request.getParameter("formId");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    try
    {

      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      List listParam = new ArrayList(); 
      String detailSql = "SELECT T.WSI_ITEM_NUM FROM T_WMS_SPARE_INFO T WHERE T.WSI_ITEM_SN=? AND T.DATA_AUTH=? ";
      List<Map<String, Object>> result = modelService.listDataSql(detailSql, new Object[] {itemSn,dataAuth});
      if (result != null && !result.isEmpty())
      {
        int detailNum = Integer.parseInt(StringUtils.toString(result.get(0).get("WSI_ITEM_NUM")));
        // 修改备品明细信息
        TableDataMapExt detailInfo = new TableDataMapExt();
        detailInfo.setTableName("T_WMS_SPARE_INFO");
        detailInfo.setSqlWhere(" and WSI_ITEM_SN=? and data_auth=?");
        listParam.add(itemSn);
        listParam.add(dataAuth);
        detailInfo.setSqlWhereArgs(listParam);
        CommMethod.editSysDefCol(detailInfo.getColMap(), modelAction.getUser());
        detailInfo.getColMap().put("WSI_ITEM_NUM", Integer.parseInt(itemNum));
        if (!productDate.equals(""))
        {
          detailInfo.getColMap().put("WSI_PRODUCE_DATE", sdf1.parse(productDate));// 交货日期
        }
        
        if (StringUtils.isNotBlank(whCode)) {
            detailInfo.getColMap().put("WSI_STOCK_SN", stockCode);//库位SN
        	detailInfo.getColMap().put("WSI_WH_CODE", whCode);//仓库SN
        }
        detailInfo.getColMap().put("WSI_MEMO", memo);
        if (dataAuth != null)
        {
          detailInfo.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.edit(detailInfo);

        String spareSql = "SELECT T.* FROM T_WMS_SPARE_TOTAL T WHERE T.WST_ITEM_CODE=? AND T.DATA_AUTH=?";
        List<Map<String, Object>> result1 = modelService.listDataSql(spareSql,
          new Object[] {itemCode,dataAuth});
        int stockNum = Integer.parseInt(StringUtils.toString(result1.get(0).get("WST_STOCK_NUM")));
        int singleNum = Integer.parseInt(StringUtils.toString(result1.get(0).get("WST_SINGLE_NUM")));
        int tempNum = stockNum - detailNum + Integer.parseInt(itemNum);
        int tempNum2 = singleNum - detailNum + Integer.parseInt(itemNum);
        // 修改备品汇总信息
        TableDataMapExt totalInfo = new TableDataMapExt();
        List listParam2 = new ArrayList(); 
        totalInfo.setTableName("T_WMS_SPARE_TOTAL");
        totalInfo.setSqlWhere(" and WST_ITEM_CODE=? and DATA_AUTH=? ");
        listParam2.add(itemCode);
        listParam2.add(dataAuth);
        totalInfo.setSqlWhereArgs(listParam2);
        CommMethod.editSysDefCol(totalInfo.getColMap(), modelAction.getUser());
        totalInfo.getColMap().put("WST_STOCK_NUM", tempNum);
        totalInfo.getColMap().put("WST_SINGLE_NUM", tempNum2);
        if (dataAuth != null)
        {
          totalInfo.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.edit(totalInfo);
      }
    }catch (NumberFormatException e) {
		// TODO: handle exception
    	log.error(e);
        throw new BussException(modelAction.getText("格式转换错误"), e);
	}
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("修改失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("修改成功"), isCloseWin);
  }

}
