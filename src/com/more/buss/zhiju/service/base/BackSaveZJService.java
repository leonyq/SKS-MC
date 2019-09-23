package com.more.buss.zhiju.service.base;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 制具-归还
 * @author development
 *
 */
public class BackSaveZJService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub

    HttpServletRequest request = modelAction.getRequest();
    String cfoId = request.getParameter("cfo_id");
    String assisType = request.getParameter("assis_type");
    String cfoOpeator = request.getParameter("paraMap1@0#CFO_OPEATOR");
    String cfiMemo = request.getParameter("paraMap1@0#CFI_MEMO");// 领用和归还都有这个字段？？？

    String cfoLeftTop = request.getParameter("paraMap1@0#CFO_LEFT_TOP");
    String cfoRightTop = request.getParameter("paraMap1@0#CFO_RIGHT_TOP");
    String cfoLeftLower = request.getParameter("paraMap1@0#CFO_LEFT_LOWER");
    String cfoRightLower = request.getParameter("paraMap1@0#CFO_RIGHT_LOWER");
    String cfoMiddle = request.getParameter("paraMap1@0#CFO_MIDDLE");
    
    String cfoTinckness = request.getParameter("paraMap1@0#CFO_TINCKNESS").equals("")?"0":request.getParameter("paraMap1@0#CFO_TINCKNESS");
    String cfoFlatness = request.getParameter("paraMap1@0#CFO_FLATNESS").equals("")?"0":request.getParameter("paraMap1@0#CFO_FLATNESS");
    
    String nowDate = DateUtil.formatDate(DateUtil.getCurDate(), "yyyy-MM-dd HH:mm:ss");
    String cfoItemCuruser = request.getParameter("paraMap1@0#CFO_ITEM_CURUSER");
    String cfoFixSn = request.getParameter("paraMap1@0#CFO_FIX_SN");
    String cfoItemCode = request.getParameter("paraMap1@0#CFO_ITEM_CODE");
    String loginName = request.getParameter("loginName");
    //String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");
    String dataAuth = request.getParameter("_DATA_AUTH");// 组织机构
    
    int rightTop = Integer.valueOf(cfoRightTop).intValue();
    int leftTop = Integer.valueOf(cfoLeftTop).intValue();
    int middle = Integer.valueOf(cfoMiddle).intValue();
    int leftLower = Integer.valueOf(cfoLeftLower).intValue();
    int rightLower = Integer.valueOf(cfoRightLower).intValue();
    int[] a =new int[]{rightTop,leftLower,rightLower,leftTop,middle};
    Arrays.sort(a);
    int strainDis =a[4]-a[0];
    String cfiStrainDis = strainDis+"";//张力差异
    TableDataMapExt cfo = new TableDataMapExt();
    //CommMethod.addSysDefCol(cfo.getColMap(), modelAction.getUser());
    cfo.setTableName("T_CO_FIX_OPERATE_LOG");

   
   cfo.getColMap().put("CFO_FIX_SN", cfoFixSn);
    cfo.getColMap().put("CFO_ITEM_CODE", cfoItemCode);
   cfo.getColMap().put("id", CommMethod.getUuId());
    cfo.getColMap().put("CFO_ITEM_TYPE", assisType);
    cfo.getColMap().put("CFO_OPEATOR", cfoOpeator);
    cfo.getColMap().put("CFO_OPERATE_TIME", DateUtil.parseDate(nowDate, "yyyy-MM-dd HH:mm:ss"));
    cfo.getColMap().put("CFI_MEMO", cfiMemo);
    cfo.getColMap().put("CFO_OPERATE_TYPE", "2");
    cfo.getColMap().put("CFO_ITEM_CURUSER", loginName);
    cfo.getColMap().put("DATA_AUTH", dataAuth);
/*
    TableDataMapExt fixOprate = new TableDataMapExt();
    CommMethod.addSysDefCol(fixOprate.getColMap(), modelAction.getUser());
    fixOprate.setTableName("T_CO_FIX_OPERATE_LOG");
    fixOprate.setSqlWhere("and id='" + cfo_id + "'");
    @SuppressWarnings("unchecked")
    Map<String, String> fixMap = fixOprate.getColMap();
    fixOprate.getColMap().put("CFO_OPEATOR", cfoOpeator);
    fixOprate.getColMap().put("CFI_MEMO", cfiMemo);
    //fixMap.put("CFO_OPEATOR", cfoOpeator);
   // fixMap.put("CFI_MEMO", cfiMemo);
    String dataAuth = request.getParameter("_DATA_AUTH");   
    if(dataAuth!=null){
     // fixMap.put("DATA_AUTH", dataAuth);// 组织结构
      fixOprate.getColMap().put("DATA_AUTH", dataAuth);
    } 
    */
    List<Object> sqlWList = new ArrayList<Object>();
    TableDataMapExt fixTrue = new TableDataMapExt();// 更新制具信息表
    fixTrue.setTableName("T_CO_FIXTURE_INFO");
    @SuppressWarnings("unchecked")
    Map<String, String> cfiMap = fixTrue.getColMap();
    fixTrue.setSqlWhere(" and ID=? ");
    sqlWList.add(cfoId);
    fixTrue.setSqlWhereArgs(sqlWList); 
    //cfiMap.put("CFI_FIX_STATUS", "0");
    fixTrue.getColMap().put("CFI_FIX_STATUS", "0");
    fixTrue.getColMap().put("CFI_ROHS_FLAG", "Y");
    if ("2".equals(assisType))
    {
      fixTrue.getColMap().put("CFI_LEFT_TOP", leftTop);
      fixTrue.getColMap().put("CFI_RIGHT_TOP", rightTop);
      fixTrue.getColMap().put("CFI_LEFT_LOWER", leftLower);
      fixTrue.getColMap().put("CFI_RIGHT_LOWER", rightLower);
      fixTrue.getColMap().put("CFI_MIDDLE", middle);
      fixTrue.getColMap().put("CFI_TINCKNESS", Double.valueOf(cfoTinckness));
      fixTrue.getColMap().put("CFI_FLATNESS", Integer.valueOf(cfoFlatness));
      fixTrue.getColMap().put("CFI_STRAIN_DIS", strainDis);
    /*  cfiMap.put("CFI_LEFT_TOP", cfoLeftTop);
      cfiMap.put("CFI_RIGHT_TOP", cfoRightTop);
      cfiMap.put("CFI_LEFT_LOWER", cfoLeftLower);
      cfiMap.put("CFI_RIGHT_LOWER", cfoRightLower);
      cfiMap.put("CFI_MIDDLE", cfoMiddle);
      cfiMap.put("CFI_TINCKNESS", cfoTinckness);
      cfiMap.put("CFI_FLATNESS", cfoFlatness);
      cfiMap.put("CFI_STRAIN_DIS", CFI_STRAIN_DIS);*/
    }else {
      fixTrue.getColMap().put("CFI_LEFT_TOP", leftTop);
      fixTrue.getColMap().put("CFI_RIGHT_TOP", rightTop);
      fixTrue.getColMap().put("CFI_LEFT_LOWER", leftLower);
      fixTrue.getColMap().put("CFI_RIGHT_LOWER", rightLower);
      fixTrue.getColMap().put("CFI_MIDDLE", middle);
      fixTrue.getColMap().put("CFI_TINCKNESS", Double.valueOf(cfoTinckness));
      fixTrue.getColMap().put("CFI_FLATNESS", Integer.valueOf(cfoFlatness));
      fixTrue.getColMap().put("CFI_STRAIN_DIS", strainDis);
    }
        
    try
    {
      modelService.save(cfo);
      modelService.edit(fixTrue);

    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("归还失败"), e);
    }
    
    String iframeId = modelAction.getRequest().getParameter("iframeId");
    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("归还成功"), isCloseWin);
  }
}
