package com.more.mes.smt.qualityTest.service.pg;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 获取物料/产品信息
 * 
 * @author development
 */
public class AjaxRevokeInfoService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = CommMethodMc.getDataAuthBySession(request);
    String dataId = request.getParameter("dataId");
    String[] dataIds = dataId.split(",", -1);
    String inspectSn = request.getParameter("inspectSn");
    String[] inspectSns = inspectSn.split(",", -1);

    int idLengt = dataIds.length - 1;
    try
    {
      for (int i = 0; i < idLengt; i++ )
      {
        ArrayList<Object> paraList = new ArrayList<Object>();
        TableDataMapExt examineMap = new TableDataMapExt();
        examineMap.setTableName("T_QM_INSPECT_INFO");

        // examineMap.setSqlWhere("and ID='" + dataIds[i] + "'");
        examineMap.setSqlWhere(" and ID= ? ");
        paraList.add(dataIds[i]);
        examineMap.setSqlWhereArgs(paraList);

        examineMap.getColMap().put("QII_LIST_FLAG", "5");// 状态(1-待检 ，2-检验中，3-检验完成 ，4-已审核， 5-撤销)
        examineMap.getColMap().put("QII_CANCEL_TIME", DateUtil.getCurDate());// 撤销时间
        examineMap.getColMap().put("QII_CANCEL_EMP", CommMethod.getSessionUser().getId());// 撤销人

        modelService.edit(examineMap);

        ArrayList<Object> paraList2 = new ArrayList<Object>();
        TableDataMapExt revokeMap = new TableDataMapExt();
        revokeMap.setTableName("T_QM_INSEPCT_PARENT_INFO");

        revokeMap.setSqlWhere(" and QIP_INSPECT_SN= ? and DATA_AUTH=?");
        paraList2.add(inspectSns[i]);
        paraList2.add(dataAuth);
        revokeMap.setSqlWhereArgs(paraList2);

        // revokeMap.setSqlWhere("and QIP_INSPECT_SN='" + inspectSns[i] + "'");
        revokeMap.getColMap().put("QIP_TEST_FLAG", "3");// 检验状态(1-已检验，2-未检验，3-已撤销)

        modelService.edit(revokeMap);
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保存失败"), e);
    }

    return BaseActionSupport.AJAX;
  }

}
