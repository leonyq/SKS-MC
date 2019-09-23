package com.more.mes.smt.qualityTest.service.oracle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class SaveMulitSampleDetailService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = CommMethodMc.getDataAuthBySession(request);
    Map<String, String> map = new HashMap<String, String>();
    String inspectSn = request.getParameter("inspectSn");
    String qipSn = request.getParameter("qipSn");
    // 样本数据
    String mulitSampleInfoStr = request.getParameter("mulitSampleInfo");// 每条样本子集SN的检测数据 格式为
    // 样本子集SN,01.04.1254$10$5877001,1,2,。。。|样本子集SN,01.04.1254$10$5877002,1,3,...
    String[] mulitSampleInfo = mulitSampleInfoStr.split("&&", -1);
    try
    {
      for (int i = 0; i < mulitSampleInfo.length; i++ )
      {
        String[] tempStr = mulitSampleInfo[i].split(",", -1);
        String mulitSampleSn = tempStr[0];
        mulitSampleSn.replace(" ", "");
        String id = tempStr[1];
        String itemType = tempStr[2];
        String itemSn = tempStr[3];
        String itemName = tempStr[4];
        String itemClass = tempStr[5];
        String itenUnit = tempStr[6];
        String maxVal = tempStr[7];
        String minVal = tempStr[8];
        String actualVal = tempStr[9];
        String testRe = tempStr[10];
        String errorCode = tempStr[11];
        String errorDec = tempStr[12];
        String errorGrade = tempStr[13];
        String errorNum = tempStr[14];
        String testMethod = tempStr[15];
        String testContent = tempStr[16];
        String memo = tempStr[17];

        TableDataMapExt insItemMap = new TableDataMapExt();
        insItemMap.setTableName("T_QM_INSPECT_ITEM_INFO");

        if (!"".equals(id))
        {
          // 修改
          ArrayList<Object> paraList = new ArrayList<Object>();
          // insItemMap.setSqlWhere(" and ID='" + id + "' and QII_SN='" + qipSn + "'");
          insItemMap.setSqlWhere(" and ID = ? and QII_SN = ? ");
          paraList.add(id);
          paraList.add(qipSn);
          insItemMap.setSqlWhereArgs(paraList);
          
          insItemMap.getColMap().put("QII_ITEM_CLASS", itemClass);// 值域（0范围值，1固定值，2状态值）
          insItemMap.getColMap().put("QII_ACTUAL_VALUE", actualVal);// 实际值
          insItemMap.getColMap().put("QII_ERROR_NUM", errorNum);// 不良数量
          insItemMap.getColMap().put("QII_TEST_RESULT", testRe);// 检测结果(1-OK，2-NG)
          insItemMap.getColMap().put("QII_ERROR_CODE", errorCode);// 不良代码
          insItemMap.getColMap().put("QII_ERROR_GRADE", errorGrade);// 缺陷等级（1-轻缺陷，2-重缺陷，3-致命缺陷）
          insItemMap.getColMap().put("QII_MEMO", memo);// 备注
          if (dataAuth != null)
          {
              insItemMap.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.edit(insItemMap);
        }
        else
        {
          // 保存
          CommMethod.addSysDefCol(insItemMap.getColMap(), modelAction.getUser());
          insItemMap.getColMap().put("QII_SN", qipSn);// 样本SN
          insItemMap.getColMap().put("QII_INSPECT_SN", inspectSn);// 检验单号
          insItemMap.getColMap().put("QII_ITEM_SN", itemSn);// 项目代码
          insItemMap.getColMap().put("QII_ITEM_NAME", itemName);// 项目名称
          insItemMap.getColMap().put("QII_ITEM_TYPE", itemType);// 项目类型
          insItemMap.getColMap().put("QII_ITEM_CLASS", itemClass);// 值域（0范围值，1固定值，2状态值）
          insItemMap.getColMap().put("QII_ITEM_UNIT", itenUnit);// 单位
          insItemMap.getColMap().put("QII_ITEM_MAXVALUE", maxVal);// 上限值
          insItemMap.getColMap().put("QII_ITEM_MINVALUE", minVal);// 下限值
          insItemMap.getColMap().put("QII_ACTUAL_VALUE", actualVal);// 实际值
          insItemMap.getColMap().put("QII_TEST_RESULT", testRe);// 检测结果(1-OK，2-NG)
          insItemMap.getColMap().put("QII_ERROR_CODE", errorCode);// 不良代码
          insItemMap.getColMap().put("QII_ERROR_GRADE", errorGrade);// 缺陷等级（1-轻缺陷，2-重缺陷，3-致命缺陷）
          insItemMap.getColMap().put("QII_ERROR_NUM", errorNum);// 不良数量
          insItemMap.getColMap().put("QII_TEST_METHOD", testMethod);// 检测方法
          insItemMap.getColMap().put("QII_TEST_CONTENT", testContent);// 检测内容
          insItemMap.getColMap().put("QII_MEMO", memo);// 备注
          insItemMap.getColMap().put("QII_SUBSET_SN", mulitSampleSn);// 样本子集SN
          if (dataAuth != null)
          {
              insItemMap.getColMap().put("DATA_AUTH", dataAuth);
          }
          modelService.save(insItemMap);
        }

      }

    }
    catch (Exception e)
    {
      log.error(e);
      map.put("TESTFLAG", "FAIL");
      // throw new BussException(modelAction.getText("保存失败"), e);
    }
    modelAction.setAjaxMap(map);
    return BaseActionSupport.AJAX;
  }
}
