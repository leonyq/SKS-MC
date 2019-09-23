package com.more.mes.smt.qualityTest.service.pg;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.common.method.DateUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

public class SaveInspectInfoService implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = CommMethodMc.getDataAuthBySession(request);
    String infoId = request.getParameter("infoId");
    String docStr = null;
	String insnStr = null;
    String atmoPressure = request.getParameter("paraMapObj.QII_ATMOSPHERIC_PRESSURE");// 大气压
    String temerature = request.getParameter("paraMapObj.QII_TEMPERATURE");// 温度
    String humidity = request.getParameter("paraMapObj.QII_HUMIDITY");// 湿度

    String inspectBasis = request.getParameter("paraMapObj.QII_INSEPCT_BASIS");// 检验依据
    String memo = request.getParameter("paraMapObj.QII_MEMO");// 备注
    String inspectRes = request.getParameter("paraMapObj.QII_INSEPCT_RESULT");// 判定结果
    String autoFlag = request.getParameter("autoFlag");// 自动判定
    if (inspectRes == null || StringUtils.isBlank(inspectRes))
    {
      inspectRes = request.getParameter("inspectRes");// 系统判定 判定结果
    }
    String testStatus = request.getParameter("testStatus");// 检验状态
    ArrayList<Object> paraList = new ArrayList<Object>();
    TableDataMapExt tdMap = new TableDataMapExt();
    tdMap.setTableName("T_QM_INSPECT_INFO");
    // tdMap.setSqlWhere("and ID='" + infoId + "'");
    tdMap.setSqlWhere(" and ID=? ");
    paraList.add(infoId);
    tdMap.setSqlWhereArgs(paraList);
    int atmoPressureNum = 0;
    if (!StringUtils.isBlank(atmoPressure))
    {
      atmoPressureNum = Integer.parseInt(atmoPressure);
    }
    int temeratureNum = 0;
    if (!StringUtils.isBlank(temerature))
    {
      temeratureNum = Integer.parseInt(temerature);
    }
    int humidityNum = 0;
    if (!StringUtils.isBlank(humidity))
    {
      humidityNum = Integer.parseInt(humidity);
    }

    tdMap.getColMap().put("QII_ATMOSPHERIC_PRESSURE", atmoPressureNum);
    tdMap.getColMap().put("QII_TEMPERATURE", temeratureNum);
    tdMap.getColMap().put("QII_HUMIDITY", humidityNum);
    tdMap.getColMap().put("QII_INSEPCT_BASIS", inspectBasis);
    tdMap.getColMap().put("QII_MEMO", memo);
    tdMap.getColMap().put("QII_INSEPCT_RESULT", inspectRes);
    tdMap.getColMap().put("QII_LIST_FLAG", testStatus);
    tdMap.getColMap().put("QII_INSEPCT_TIME", DateUtil.getCurDate());
    tdMap.getColMap().put("QII_INSEPCT_EMP", CommMethod.getSessionUser().getId());

    if ("Y".equals(autoFlag))
    {
      tdMap.getColMap().put("QII_LIST_FLAG", "4");
      tdMap.getColMap().put("QII_REVIEW_EMP", CommMethod.getSessionUser().getId());
      tdMap.getColMap().put("QII_REVIEW_TIME", DateUtil.getCurDate());
      docStr = request.getParameter("paraMapObj.QII_CONNECT_DOC");// 关联单号
      insnStr = request.getParameter("insnStr");// 检验单号
      String res = changeStatus(docStr, insnStr,dataAuth, modelService);
      if (!res.equals("OK"))
      {
        return modelAction.alertParentInfo(res);
      }
    }

    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    try
    {

      String fileName = null;
      String realName = null; // 文件原有名称
      String fileAddress = null;
      float fileSize = 0;
      FileInputStream fis = null;
      FileOutputStream fos = null;
      if (modelAction.getUpFile() != null)
      {
        realName = modelAction.getUpFileFileName(); // 文件名称
        fileName = realName.substring(realName.lastIndexOf(".") + 1);
        fileName = StringUtils.getUUID() + "." + fileName; // 文件存放名称
        fileAddress = "QIIFile"; // 文件存放路径
        String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath(
          "up_load/comm/QIIFile");
        fis = new FileInputStream(modelAction.getUpFile());
        fileSize = fis.available(); // 文件大小
        // 上传文件到服务器
        File file = modelAction.getUpFile();
        File file1 = new File(realPath);
        if (!file1.exists() && !file1.isDirectory())
        { // 判断文件夹是否存在，不存在则创建
          file1.mkdir();
        }
        // 上传文件
        String realPath1 = modelAction.getRequest().getSession().getServletContext().getRealPath(
          "up_load/comm/QIIFile/" + fileName);
        fos = new FileOutputStream(realPath1);
        BufferedInputStream bf = new BufferedInputStream(new FileInputStream(file));
        byte[] bt = new byte[1024];
        int n = bf.read(bt);
        while (n != -1)
        {
          fos.write(bt, 0, n);
          fos.flush();
          n = bf.read(bt);
        }
      }

      // 保存文件信息
      if (realName != null)
      {
        tdMap.getColMap().put("QII_FILE_NAME", realName);
        tdMap.getColMap().put("QII_FILE_SAVE_NAME", fileName);
        tdMap.getColMap().put("QII_FILE_PATH", fileAddress);
        tdMap.getColMap().put("QII_FILE_SIZE", fileSize);
      }

      // 保存修改的信息
      modelService.edit(tdMap);
      //修改库存查询的检验时间
	  List<Object> sqlWhere = new ArrayList<Object>();
	  sqlWhere.add(docStr);
	  TableDataMapExt tdMap2 = new TableDataMapExt();
	  tdMap2.setTableName("T_WMS_STOCK_INFO");
	  tdMap2.setSqlWhere(" AND WSI_DOC_NUM = ? and DATA_AUTH=?");
	  sqlWhere.add(dataAuth);
	  tdMap2.setSqlWhereArgs(sqlWhere);
	  tdMap2.getColMap().put("WSI_TEST_TIME", DateUtil.getCurDate());
	  modelService.edit(tdMap2);
    }
    catch (Exception e)
    {
      log.error(e);
      throw new BussException(modelAction.getText("编辑失败"), e);
    }
    String isCloseWin = modelAction.getRequest().getParameter("isCloseWin");
    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("编辑成功"), "0");
  }

  public String changeStatus(String doc, String inSn,String dataAuth, ModelService modelService)
  {
    String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = { 1, 2 ,3, 4, 5};
	int[] outplace = { 6 };
	List<Object> list = new ArrayList<Object>();
	List<Object> outType = new ArrayList<Object>();
	list.add(doc);
	list.add(inSn);
	list.add("");
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
