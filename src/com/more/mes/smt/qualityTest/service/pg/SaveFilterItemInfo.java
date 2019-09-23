package com.more.mes.smt.qualityTest.service.pg;

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
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * 保存筛选的信息
 * 
 * @author development
 */
public class SaveFilterItemInfo implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");
    try
    {
      String insepctResult = request.getParameter("result");// 判定结果
      String checkNo = request.getParameter("checkNo");// 检验单号
      String sql = "select QII_CONNECT_DOC from T_QM_INSPECT_INFO where QII_INSPECT_SN= ? and DATA_AUTH=?";

      List<Map> pList = modelService.listDataSql(sql, new Object[] {checkNo,dataAuth});
      String connDoc = (String)pList.get(0).get("QII_CONNECT_DOC");
      // 修改检验单母本信息表
      TableDataMapExt quality = new TableDataMapExt();
      quality.setTableName("T_QM_INSEPCT_PARENT_INFO");
      ArrayList<Object> paraList = new ArrayList<Object>();
      if (insepctResult.equals("3"))
      { // 让步接收
        CommMethod.editSysDefCol(quality.getColMap(), modelAction.getUser());
        // quality.setSqlWhere(" and QIP_INSPECT_SN='" + checkNo + "'");
        quality.setSqlWhere(" and QIP_INSPECT_SN = ? and DATA_AUTH=?");
        paraList.add(checkNo);
        paraList.add(dataAuth);
        quality.setSqlWhereArgs(paraList);
        quality.getColMap().put("QIP_TEST_RESULT", "1");
        quality.getColMap().put("QIP_CONCESSION_FLAG", "Y");
        if (dataAuth != null)
        {
          quality.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.edit(quality);
      }
      else if (insepctResult.equals("4"))
      { // 部分接收
        String[] sels = request.getParameterValues("isSelect1");
        // 检验审核修改仓库库存物料状态
        String res = editState(connDoc, checkNo,dataAuth, modelService);
        if (!res.equals("OK"))
        {
          return modelAction.alertParentInfo(res);
        }
        for (int i = 0; i < sels.length; i++ )
        {
          ArrayList<Object> paraList2 = new ArrayList<Object>();
          CommMethod.editSysDefCol(quality.getColMap(), modelAction.getUser());
          //quality.setSqlWhere(" and ID='" + sels[i] + "'");
          quality.setSqlWhere(" and ID=? ");
          paraList2.add(sels[i]);
          quality.setSqlWhereArgs(paraList2);
          
          quality.getColMap().put("QIP_TEST_RESULT", "1");
          quality.getColMap().put("QIP_CONCESSION_FLAG", "Y");
          if (dataAuth != null)
          {
            quality.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.edit(quality);
        }
      }
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("筛选失败"), e);
    }
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("筛选成功"), "0");
  }

  @SuppressWarnings("unchecked")
  public String editState(String connDoc, String docNum,String dataAuth, ModelService modelService)
  {
    String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3,4,5};
    int[] outplace = {6};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(connDoc);
    list.add(docNum);
    list.add("4");
    list.add(userId);
    list.add(dataAuth);
    outType.add("String");
    pf.setClassName("P_C_CHANGE_ITEM_STATUS");// 检验审核修改仓库库存物料状态
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
