package com.more.mes.smt.qualityTest.service.oracle;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.common.method.CommMethodMc;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.ReadProperties;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;

/**
 * ajax保存品质校验-让步接收判定信息
 * 
 * @author development
 */
public class AjaxSaveConcessionResult implements FuncService
{

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    HttpServletRequest request = modelAction.getRequest();
    Map<String, String> map = new HashMap<String, String>();
    try
    {
      String checkNo = request.getParameter("checkNo");// 检验单号
      String id = request.getParameter("dataId");
      String concessionResult = request.getParameter("paraMapObj.QII_CONCESSION_RESULT");// 让步接收判定
      String concessionMemo = request.getParameter("paraMapObj.QII_CONCESSION_MEMO");// 让步接收说明
      String dataAuth = request.getParameter("paraMapObj._DATA_AUTH");// 组织机构

      String qualitySql = "select QII_FILE_SAVE_NAME,QII_CONNECT_DOC from T_QM_INSPECT_INFO where id = ?";
      List<Map> qualityList = modelService.listDataSql(qualitySql, new Object[] {id});
      String connDoc = (String)qualityList.get(0).get("QII_CONNECT_DOC");
      String myFileName = (String)qualityList.get(0).get("QII_FILE_SAVE_NAME");
      // 修改检验单母本信息表
      TableDataMapExt quality = new TableDataMapExt();
      quality.setTableName("T_QM_INSEPCT_PARENT_INFO");
      CommMethod.editSysDefCol(quality.getColMap(), modelAction.getUser());
      String res = editState(connDoc, checkNo, concessionResult,dataAuth, modelService);
      if (!res.equals("OK"))
      {
        return modelAction.alertParentInfo(res);
      }
      ArrayList<Object> paraList = new ArrayList<Object>();
      if (concessionResult.equals("3"))
      { // 让步接收
        // 检验审核修改仓库库存物料状态
        //String res = editState(connDoc, checkNo, concessionResult, modelService);
        //if (!res.equals("OK"))
        //{
        //  return modelAction.alertParentInfo(res);
        //}
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
      //else if ("4".equals(concessionResult))
      //{
        // 部分接收
        //String res = editState(connDoc, checkNo, concessionResult, modelService);
        //if (!res.equals("OK"))
        //{
        //  return modelAction.alertParentInfo(res);
        //}
      //}
      String fileName = null;
      String realName = null; // 文件原有名称
      String fileAddress = null;
      float fileSize = 0;
      FileInputStream fis = null;
      FileOutputStream fos = null;
      if (modelAction.getUpFile() != null)
      {
        // 先删除原有文件
        String str = modelAction.getRequest().getSession().getServletContext().getRealPath(
          "up_load/comm/qualityTest/" + myFileName);
        File myFile = new File(str);
        if (myFile.exists())
        {
          myFile.delete();
        }
        realName = modelAction.getUpFileFileName(); // 文件名称
        fileName = realName.substring(realName.lastIndexOf(".") + 1);
        fileName = StringUtils.getUUID() + "." + fileName; // 文件存放名称
        fileAddress = "qualityTest"; // 文件存放路径
        String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath(
          "up_load/comm/qualityTest");
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
          "up_load/comm/qualityTest/" + fileName);
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

      // 修改品质检验单信息表
      ArrayList<Object> paraList2 = new ArrayList<Object>();
      TableDataMapExt qualityTest = new TableDataMapExt();
      qualityTest.setTableName("T_QM_INSPECT_INFO");
      CommMethod.editSysDefCol(qualityTest.getColMap(), modelAction.getUser());
      // qualityTest.setSqlWhere(" and QII_INSPECT_SN = '" + checkNo + "'");
      qualityTest.setSqlWhere(" and QII_INSPECT_SN = ? AND DATA_AUTH=?");
      paraList2.add(checkNo);
      paraList2.add(dataAuth);
      qualityTest.setSqlWhereArgs(paraList2);
      
      qualityTest.getColMap().put("QII_INSEPCT_RESULT", concessionResult);
      qualityTest.getColMap().put("QII_CONCESSION_MEMO", concessionMemo);
      if (dataAuth != null)
      {
        qualityTest.getColMap().put("DATA_AUTH", dataAuth);
      }
      if (realName != null)
      {
        qualityTest.getColMap().put("QII_FILE_NAME", realName);
        qualityTest.getColMap().put("QII_FILE_SAVE_NAME", fileName);
        qualityTest.getColMap().put("QII_FILE_PATH", fileAddress);
        qualityTest.getColMap().put("QII_FILE_SIZE", fileSize);
      }
      modelService.edit(qualityTest);

      String sql = "select QII_INSEPCT_RESULT from T_QM_INSPECT_INFO where id = ?";
      List<Map> sList = modelService.listDataSql(sql, new Object[] {id});
      modelAction.setAjaxList(sList);
      String alertMsg1 = modelAction.getText("保存成功");
      map.put("alertMsg", (String)msgPopData(modelAction, alertMsg1).get("alertMsg"));
      map.put("title", (String)msgPopData(modelAction, alertMsg1).get("title"));
      map.put("width", (String)msgPopData(modelAction, alertMsg1).get("width"));
      map.put("height", (String)msgPopData(modelAction, alertMsg1).get("height"));
      map.put("time", (String)msgPopData(modelAction, alertMsg1).get("time"));
      map.put("returnMsg", "addSucc");
      modelAction.setAjaxMap(map);
    }
    catch (Exception e)
    {
      log.error(e);
      map.put("returnMsg", "addError");
    }

    return BaseActionSupport.AJAX;
  }

  @SuppressWarnings("unchecked")
  private Map msgPopData(ModelAction modelAction, String alertMsg)
  {
    Map map = new HashMap<String, Object>();
    String title = ReadProperties.getPorpertie("constant.properties", "PROMPT_TITLE");
    title = modelAction.getText(title);
    String width = ReadProperties.getPorpertie("constant.properties", "PROMPT_WIDTH");
    String height = ReadProperties.getPorpertie("constant.properties", "PROMPT_HEIGHT");
    String time = ReadProperties.getPorpertie("constant.properties", "PROMPT_TIME");
    map.put("title", title);
    map.put("width", width);
    map.put("height", height);
    map.put("time", time);
    map.put("alertMsg", alertMsg);
    return map;
  }

  @SuppressWarnings("unchecked")
  public String editState(String connDoc, String docNum, String concessionResult,
                          String dataAuth,ModelService modelService)
  {
    String userId = StringUtils.toString(CommMethod.getSessionUser().getId());
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3,4,5};
    int[] outplace = {6};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(connDoc);
    list.add(docNum);
    list.add(concessionResult);
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
