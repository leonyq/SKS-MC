package com.more.mes.smt.ipqcdoc;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * IPQC获取明细信息--IPQC单据信息保存
 * 
 * @author wzy
 */
public class SaveDetailInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("_DATA_AUTH");
    String isclosewin = request.getParameter("isCloseWin");
    String formid = request.getParameter("formId");
    if (null == formid)
    {
      formid = request.getParameter("formIds");
    }

    String iframeId = request.getParameter("iframeId");

    try
    {
      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String userId = CommMethod.getSessionUser().getId();// 记录人
      String memo = request.getParameter("paraMap1@0#QID_COMMENT");// 备注
      String qidDocNum = getIpqcNo(dataAuth, "IPQC", "", modelService);// 编号
      String[] qiiItemCode = request.getParameterValues("QII_ITEM_CODE");// 明细代码
      String[] qiiItemName = request.getParameterValues("QII_ITEM_NAME");// 明细名称
      String[] qiiItemType = request.getParameterValues("QII_ITEM_TYPE");// 明细类型
      String[] qiiTestContent = request.getParameterValues("QII_TEST_CONTENT");// 明细内容

      TableDataMapExt savaExt = new TableDataMapExt();

      savaExt.setTableName("T_QM_IPQC_DOC");

      CommMethod.addSysDefCol(savaExt.getColMap(), modelAction.getUser());

      savaExt.getColMap().put("QID_COMMENT", memo);
      savaExt.getColMap().put("QID_STATUS", "1");
      savaExt.getColMap().put("QID_DOC_NUM", qidDocNum);
      savaExt.getColMap().put("QID_RECORD_EMP", userId);
      savaExt.getColMap().put("QID_RECORD_DATE", DateUtil.getCurDate());

      if (StringUtils.isNotBlank(dataAuth))
      {
        savaExt.getColMap().put("DATA_AUTH", dataAuth);
      }
      modelService.save(savaExt);

      TableDataMapExt addExt = new TableDataMapExt();
      addExt.setTableName("T_QM_IPQC_DETAIL");
      int itemCode = qiiItemCode.length;
      for (int i = 0; i < itemCode; i++ )
      {
        addExt.getColMap().clear();
        CommMethod.addSysDefCol(addExt.getColMap(), modelAction.getUser());
        addExt.getColMap().put("QID_DOC_NUM", qidDocNum);
        addExt.getColMap().put("QID_ITEM_CODE", qiiItemCode[i]);
        addExt.getColMap().put("QID_ITEM_NAME", qiiItemName[i]);
        addExt.getColMap().put("QID_ITEM_TYPE", qiiItemType[i]);
        addExt.getColMap().put("QID_TEST_CONTENT", qiiTestContent[i]);
        if (StringUtils.isNotBlank(dataAuth))
        {
          savaExt.getColMap().put("DATA_AUTH", dataAuth);
        }
        modelService.save(addExt);
      }

    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }

    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isclosewin);
  }

  @SuppressWarnings("unchecked")
  public String getIpqcNo(String dataAuth, String prefix, String dispatchSn,
                          ModelService modelService)
  {
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
    pf.setClassName("P_C_GET_DOC_NO");// 生成检验单号
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
