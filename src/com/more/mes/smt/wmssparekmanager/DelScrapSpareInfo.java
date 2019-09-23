package com.more.mes.smt.wmssparekmanager;

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
 * 删除采购入库信息
 * 
 * @author development
 */
public class DelScrapSpareInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));
    List<Object> sqlWList= new ArrayList<Object>();
    List<Object> sqlWList2= new ArrayList<Object>();
    try
    {
      String delId = request.getParameter("delId");// 需要删除的id
      if (StringUtils.isBlank(delId)) {
		return modelAction.alertParentInfo(modelAction.getText("ID为空"));
	}
      String[] strArray = delId.split(",");
      // 判断删除的id有没有明细
      for (int i = 0; i < strArray.length; i++ )
      {
        String getStockInfoSql = "SELECT T.* FROM T_WMS_SPARE_INFO T WHERE T.ID=? AND T.DATA_AUTH=? ";
        List<Map<String, Object>> result = modelService.listDataSql(getStockInfoSql,
          new Object[] {strArray[i],dataAuth});
        if (result==null||result.size()<1) {
        	return modelAction.alertParentInfo(modelAction.getText("无库存明细"));
		}
        int delNum = Integer.parseInt(StringUtils.toString(result.get(0).get("WSI_ITEM_NUM")));

        String spareSql = "SELECT T.* FROM T_WMS_SPARE_TOTAL T WHERE T.WST_ITEM_CODE=? AND T.DATA_AUTH=? ";
        List<Map<String, Object>> result2 = modelService.listDataSql(spareSql,
          new Object[] {result.get(0).get("WSI_ITEM_CODE"),dataAuth});
        if (result2 != null && !result2.isEmpty())
        {
          // 修改个体数量
          int stockNum = Integer.parseInt(StringUtils.toString(result2.get(0).get("WST_STOCK_NUM")));
          int singleNum = Integer.parseInt(StringUtils.toString(result2.get(0).get(
            "WST_SINGLE_NUM")));
          int tempNum1 = stockNum - delNum;
          int tempNum2 = singleNum - delNum;

          TableDataMapExt totalInfo = new TableDataMapExt();
          totalInfo.setTableName("T_WMS_SPARE_TOTAL");
          totalInfo.setSqlWhere(" and WST_ITEM_CODE=? and data_auth=? ");
          sqlWList.add(result.get(0).get("WSI_ITEM_CODE"));
          sqlWList.add(dataAuth);
          totalInfo.setSqlWhereArgs(sqlWList);
          CommMethod.editSysDefCol(totalInfo.getColMap(), modelAction.getUser());
          totalInfo.getColMap().put("WST_STOCK_NUM", tempNum1);
          totalInfo.getColMap().put("WST_SINGLE_NUM", tempNum2);
          modelService.edit(totalInfo);
        }
        TableDataMapExt delwms = new TableDataMapExt();
        delwms.setTableName("T_WMS_SPARE_INFO");
        delwms.setSqlWhere(" and ID=? and data_auth=? ");
        sqlWList2.add(strArray[i]);
        sqlWList2.add(dataAuth);
        delwms.setSqlWhereArgs(sqlWList2);
        modelService.del(delwms);
        sqlWList.clear();
        sqlWList2.clear();
      }
      // 判断并删除库存汇总表数据
      String delSql = "DELETE FROM T_WMS_SPARE_TOTAL T WHERE T.WST_STOCK_NUM=0 AND T.DATA_AUTH=? ";
      modelService.execSql(delSql,new Object[] {dataAuth});
    }catch (NumberFormatException e) {
		// TODO: handle exception
    	log.error(e);
    	throw new BussException(modelAction.getText("格式转换错误"), e);
	}
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("删除失败"), e);
    }
    return modelAction.reloadParent(modelAction.getText("删除成功"));
  }

}
