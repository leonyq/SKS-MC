package com.more.mes.smt.icburn;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 *  IC烧录 新增
 * 
 * @author development
 *
 */
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

public class SaveBurnInfo implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    // TODO Auto-generated method stub
    HttpServletRequest request = modelAction.getRequest();
    String dataAuth = request.getParameter("_DATA_AUTH");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");
    if (StringUtils.isBlank(formId))
    {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    try
    {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      String auth = modelAction.getRequest().getSession().getAttribute("mcDataAuth").toString();
      String itemSn = request.getParameter("paraMap1@0#IB_ITEM_SN");// 物料SN
      String workStation = request.getParameter("paraMap1@0#IB_WORKSTATION_SN");// 工作中心
      String moNum = request.getParameter("paraMap1@0#IB_MO_NUMBER");// 制令单号
      String ibNum = request.getParameter("paraMap1@0#IB_NUM");// 数量
      String memo = request.getParameter("paraMap1@0#IB_REMARK");// 备注
      String describe = request.getParameter("paraMap1@0#IB_FILE");// 烧录描述
      
      String sql1 ="select MSI_ITEM_SN  from T_MID_SPOT_ITEM_INFO where MSI_ITEM_SN=? and data_auth=? ";
      
      List counts = modelService.listDataSql(sql1, new Object[] {itemSn,auth});
      
      if (counts.size()==0)
      {
        String res = checkItemSn(itemSn,auth, modelService);
        if (!"OK".equals(res))
        {
          return modelAction.alertParentInfo(res);
        }
      }      
      
      
      /*
      String sql = "select IB_ITEM_SN from T_WIP_IC_BURN_INFO where IB_ITEM_SN=?";

      int count = modelService.execSql(sql, new Object[] {itemSn});

      if (count != 0)
      {
        return modelAction.alertParentInfo(modelAction.getText("物料SN已存在"));
      }
      String pictureName = null;// 名称
      String realName = null;// 原有名称
      String picturePath = null;// 路径
      float fileSize = 0;
      FileInputStream fis = null;
      FileOutputStream fos = null;
      // InputStream is = null;
      byte[] b = null;
      if (modelAction.getUpFile() != null)
      {
        realName = modelAction.getUpFileFileName();// 原有名称
        pictureName = realName.substring(realName.lastIndexOf(".") + 1);
        pictureName = StringUtils.getUUID() + "." + pictureName;
        picturePath = "IcBurnInfo";// 存放路径
        String realPath = modelAction.getRequest().getSession().getServletContext().getRealPath(
          "up_load/comm/IcBurnInfo");

        fis = new FileInputStream(modelAction.getUpFile());
        fileSize = fis.available();
        // 上传文件到服务器
        File file = modelAction.getUpFile();
        File file2 = new File(realPath);
        if (!file2.exists() && !file2.isDirectory())// 文件夹不存在则创建
        {
          file2.mkdir();
        }
        // 上传文件
        String realPath1 = modelAction.getRequest().getSession().getServletContext().getRealPath(
          "up_load/comm/IcBurnInfo" + pictureName);
        fos = new FileOutputStream(realPath1);
        BufferedInputStream bf = new BufferedInputStream(new FileInputStream(file));
        b = new byte[1024];
        int wite = bf.read(b);
        if (wite != -1)
        {
          fos.write(b, 0, wite);
          fos.flush();
          wite = bf.read(b);
        }
      }
      */
      TableDataMapExt dExt  = new TableDataMapExt();
      dExt.setTableName("T_WIP_IC_BURN_INFO");
      CommMethod.addSysDefCol(dExt.getColMap(), modelAction.getUser());
      dExt.getColMap().put("IB_ITEM_SN", itemSn);
      dExt.getColMap().put("IB_WORKSTATION_SN", workStation);
      dExt.getColMap().put("IB_MO_NUMBER", moNum);
      dExt.getColMap().put("IB_NUM", Integer.valueOf(ibNum));
      dExt.getColMap().put("IB_REMARK", memo);
      dExt.getColMap().put("IB_FILE", describe);
      dExt.getColMap().put("IB_BURN_EMP", CommMethod.getSessionUser().getId());// 作业员
      dExt.getColMap().put("IB_BURN_TIME", sdf1.parse(sdf1.format(new Date())));
      if (null!=dataAuth)
      {
        dExt.getColMap().put("DATA_AUTH", dataAuth);
      }
      /*
      if (realName!=null)
      {
        dExt.getColMap().put("IB_FILE_NAME", realName);
        dExt.getColMap().put("IB_FILE_PATH", picturePath);
        dExt.getColMap().put("IB_FILE_SIZE", fileSize);
        
      }
      */
      modelService.save(dExt);
    }
    catch (Exception e)
    {
      // TODO: handle exception
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    }

    return modelAction.reloadIframeByIds(iframeId, modelAction.getText("新增成功"), isCloseWin);
  }
  @SuppressWarnings("unchecked")
  public String checkItemSn(String itemSn,String auth, ModelService modelService)
  {
    String item [] = itemSn.split("\\$");
    String itemNum = item[0];
    String res = "";
    ProFuncDto pf = new ProFuncDto();
    int[] inPlace = {1, 2, 3,4};
    int[] outplace = { 5,6};
    List<Object> list = new ArrayList<Object>();
    List<Object> outType = new ArrayList<Object>();
    list.add(auth);
    list.add("1");
    list.add("itemNum");
    list.add("");
    outType.add("String");
    outType.add("String");
    pf.setClassName("P_C_GET_SN_RULEID");// 获取条码规则ID
    pf.setInPlace(inPlace);// 存储过程中in
    pf.setOutPlace(outplace); // 存储过程中out
    pf.setValArgs(list);// 存储过程中输入的参数
    pf.setTotalLen(list.size() + outType.size());// 总个数
    pf.setOutValType(outType);// 输出的参数
    List<Object> relist = modelService.procComm(pf);// 接收返回值
    String ruleId = (String)relist.get(0); // 条码规则ID
    res = (String)relist.get(1); // 结果
    if (!"OK".equals(res))
    {
      return res;
    }
    else
    {
      ProFuncDto pf2 = new ProFuncDto();
      int[] inPlace2 = {1, 2,3};
      int[] outplace2 = { 4, 5, 6, 7, 8, 9, 10,11};
      List<Object> list2 = new ArrayList<Object>();
      List<Object> outType2 = new ArrayList<Object>();
      list2.add(auth);
      list2.add(itemSn);
      list2.add(ruleId);
      outType2.add("String");
      outType2.add("String");
      outType2.add("String");
      outType2.add("String");
      outType2.add("String");
      outType2.add("String");
      outType2.add("String");
      outType2.add("String");
      pf2.setClassName("P_C_CHECK_SN_RULE");// 校验物料SN
      pf2.setInPlace(inPlace2);// 存储过程中in
      pf2.setOutPlace(outplace2); // 存储过程中out
      pf2.setValArgs(list2);// 存储过程中输入的参数
      pf2.setTotalLen(list2.size() + outType2.size());// 总个数
      pf2.setOutValType(outType2);// 输出的参数
      List<Object> relist2 = modelService.procComm(pf2);// 接收返回值
      res = (String)relist2.get(7); // 结果
      return res;
    }
  }
}
