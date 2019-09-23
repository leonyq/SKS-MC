package com.more.mes.smt.qualityTest.service.pg;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.fw.core.common.method.CommMethod;

/**
 * 获取物料/产品信息
 * 
 * @author development
 */
public class AjaxExamineInfoService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = CommMethodMc.getDataAuthBySession(request);
    String dataId = request.getParameter("dataId");
    String resStr = request.getParameter("res");
    String docStr = request.getParameter("doc");
    String insnStr = request.getParameter("insnStr");
    String[] dataIds = dataId.split(",", -1);
    String[] resStrs = resStr.split(",", -1);
    String[] docStrs = docStr.split(",", -1);
    String[] insnStrs = insnStr.split(",", -1);

    int idLengt = dataIds.length - 1;
    try
    {
      for (int i = 0; i < idLengt; i++ )
      {
        TableDataMapExt examineMap = new TableDataMapExt();
        examineMap.setTableName("T_QM_INSPECT_INFO");

        // 调用检验审核修改仓库库存物料状态存储过程
        String res = changeStatus(docStrs[i], insnStrs[i],dataAuth, modelService);
        if (!res.equals("OK"))
        {
          return modelAction.alertParentInfo(res);
        }
        else
        {
          ArrayList<Object> paraList = new ArrayList<Object>();
          // examineMap.setSqlWhere("and ID='" + dataIds[i]) + "'");
          examineMap.setSqlWhere(" and ID= ? ");
          paraList.add(dataIds[i]);
          examineMap.setSqlWhereArgs(paraList);

          examineMap.getColMap().put("QII_LIST_FLAG", "4");// 状态(1-待检 ，2-检验中，3-检验完成 ，4-已审核， 5-撤销)
          examineMap.getColMap().put("QII_REVIEW_TIME", DateUtil.getCurDate());// 审核时间
          examineMap.getColMap().put("QII_REVIEW_EMP", CommMethod.getSessionUser().getId());// 审核人

          modelService.edit(examineMap);
        }

      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("保存失败"), e);
    }

    return BaseActionSupport.AJAX;
  }

  public String changeStatus(String doc, String inSn,String dataAuth, ModelService modelService)
  {
    String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3 ,4,5};
    int[] outplace = {6};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(doc);
    list.add(inSn);
    list.add("1");
    list.add(userId);
    list.add(dataAuth);
    outType.add("String");
    pf.setClassName("P_C_CHANGE_ITEM_STATUS");// 获取辅料制具条码规则id
    pf.setInPlace(inPlace);// 存储过程中in
    pf.setOutPlace(outplace); // 存储过程中out
    pf.setValArgs(list);// 存储过程中输入的参数
    pf.setTotalLen(list.size() + outType.size());// 总个数
    pf.setOutValType(outType);// 输出的参数
    List<Object> relist = modelService.procComm(pf);// 接收返回值
    String res = (String)relist.get(0); // 结果
    return res;
  }

}
