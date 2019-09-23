package com.more.mes.smt.maintenance;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.OperResult;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.ValidateFuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * @Title 周转筐编码校验
 * @Description 周转筐编码的唯一性和条码规则校验
 * @ClassName NoTagAdd
 * @author LSP
 * @version 1.0 developer 2018-3-19 created
 * @see NoTagAdd
 * @since 2018-3-19
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class NoTagAdd implements ValidateFuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public OperResult valJavaFun(String formId, Map pareMap, ModelService modelService, ModelAction modelAction, Object... arg4)
  {
    try
    {
      // 获取
      HttpServletRequest request = modelAction.getRequest();

      // 页面类型
      String pageType = request.getParameter("type");
      // 周转筐类型
      String tagType = StringUtils.toString(pareMap.get("TURN_OVER_TYPE"));
      // 周转筐编码
      String tagCode = StringUtils.toString(pareMap.get("TURN_OVER_SN"));
      // 周转库数量
      String tagNum = StringUtils.toString(pareMap.get("MAX_NUM"));
      //组织机构
      String auth = request.getSession().getAttribute("mcDataAuth").toString();
      
      
      String sql="SELECT ID FROM T_CO_BARCODE_ROUL WHERE TBR_DEFAULT=? AND TBR_TYPE=? AND DATA_AUTH=?";
      
      Map<String, String> map = modelService.queryForMap(sql, new Object[]{"Y","9",auth});
      
      if (null==map)
      {
        return new OperResult(false, modelAction.getText("没有周转筐编码规则"));
      }
      
      // 存储过程验证
      String funRes = getFunRes(tagCode,map.get("ID"),auth, modelService);

      if (funRes.startsWith("NG:"))
      {
        return new OperResult(false, modelAction.getText(funRes.substring(3)));
      }

      if (pageType.equals("add"))// 新增界面
      {
        // 结果集
        List<Map> onlyByAllAdd = getOnlyByAllAdd(modelService, tagCode,auth);
        if (!onlyByAllAdd.isEmpty())
        {
          return new OperResult(false, modelAction.getText("周转筐编码已存在"));
        }

      }
      else if (pageType.equals("edit"))// 修改界面
      {
        // 本条数据ID
        String dataId = request.getParameter("dataId");
        // 结果集
        List<Map> onlyByAllUpdate = getOnlyByAllUpdate(modelService, tagCode, dataId,auth);
        if (!onlyByAllUpdate.isEmpty())
        {
          return new OperResult(false, modelAction.getText("周转筐编码已存在"));
        }

      }
      else
      {
        return new OperResult(false, modelAction.getText("页面状态异常"));
      }

    }
    catch (Exception e)
    {
      log.debug(e);
      return new OperResult(false, modelAction.getText("周转筐校验异常"));
    }

    return new OperResult(true);
  }

  /**
   * <b>校验编码SN</b>
   * 
   * @param tagCode
   *          周转筐编码
   * @param modelService
   * @return
   */
  public String getFunRes(String tagCode,String ID,String dataAuth, ModelService modelService) {
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3};
    int[] outplace = { 4, 5, 6, 7, 8, 9, 10,11};
    List<Object> list = new ArrayList<Object>();
    list.add(dataAuth);
    list.add(tagCode);
    list.add(ID);
    
    //list.add("11ded5cf89d7498f87ff2bf8e4974e00");
    List outType = new ArrayList<Object>();
    outType.add("String");
    outType.add("String");
    outType.add("String");
    outType.add("String");
    outType.add("String");
    outType.add("String");
    outType.add("String");
    outType.add("String");
    pf.setClassName("P_C_CHECK_SN_RULE");// 存储过程的名字
    pf.setInPlace(inPlace);// 存储过程中in
    pf.setOutPlace(outplace); // 存储过程中out
    pf.setValArgs(list);// 存储过程中输入的参数
    pf.setTotalLen(list.size() + outType.size());// 总个数
    pf.setOutValType(outType);// 输出的参数
    List<Object> relist = modelService.procComm(pf);// 接收返回值
    String res = StringUtils.toString(relist.get(7));
    if ("OK".equalsIgnoreCase(res))
    {
      return "OK";
    }
    return res;
  }

  /**
   * <b>新增：查询:T_CO_TURN_OVER_BASKET 条件：周转筐编码.</b>
   * 
   * @param tagCode
   *          周转筐编码
   * @return
   */
  public List<Map> getOnlyByAllAdd(ModelService modelService, String tagCode,String auth)
  {
    List<Map> sList = new ArrayList<Map>();

    String sql = "SELECT ID FROM T_CO_TURN_OVER_BASKET WHERE TURN_OVER_SN = ? and DATA_AUTH=? ";

    sList = modelService.listDataSql(sql, new Object[] {tagCode,auth});

    return sList;
  }

  /**
   * <b>修改：查询:T_CO_TURN_OVER_BASKET 条件：周转筐编码.</b>
   * 
   * @param tagCode
   *          周转筐编码
   * @param dataId
   *          本数据id
   * @return
   */
  public List<Map> getOnlyByAllUpdate(ModelService modelService, String tagCode, String dataId,String auth)
  {
    List<Map> sList = new ArrayList<Map>();

    String sql = "SELECT ID FROM T_CO_TURN_OVER_BASKET WHERE TURN_OVER_SN = ? AND ID <> ? and DATA_AUTH=? ";

    sList = modelService.listDataSql(sql, new Object[] {tagCode, dataId,auth});

    return sList;
  }
}
