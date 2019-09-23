package com.more.mes.smt.usermanager.employeereward;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

/**
 * 保存新增的奖惩信息
 * 
 * @author development
 */
public class SaveReward1 implements FuncService {

  private final Log log = LogFactory.getLog(this.getClass());

  @SuppressWarnings("unchecked")
  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService) {
    HttpServletRequest request = modelAction.getRequest();
    //String dataAuth = request.getParameter("_DATA_AUTH");
    String dataAuth = String.valueOf(modelAction.getRequest().getSession().getAttribute("mcDataAuth"));//组织机构
    String rewardCode = request.getParameter("paraMap1@0#REWARD_CODE");
    String isCloseWin = request.getParameter("isCloseWin");// 是否关闭窗口
    String formId = request.getParameter("formId");

    // 判断奖惩编码是否已经存在
    String sql = "select T.REWARD_CODE "
        + " from T_USER_REWARD T where T.REWARD_CODE=? and T.DATA_AUTH=?";
    List list = modelService.listDataSql(sql, new Object[] { rewardCode ,dataAuth});
    if (list != null && !list.isEmpty()) {
      return modelAction
          .alertParentInfo((modelAction.getText("奖惩编码已存在！")));
    }

    if (StringUtils.isBlank(formId)) {
      formId = request.getParameter("formIds");
    }
    String iframeId = request.getParameter("iframeId");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String rewardDate = request.getParameter("paraMap1@0#REWARD_DATE");// 奖惩日期
    String rewardUserId = request.getParameter("paraMap1@0#REWARD_USER_ID");// 记录人
    String rewardName = request.getParameter("paraMap1@0#REWARD_NAME");// 奖惩名称
    String rewardType = request.getParameter("paraMap1@0#REWARD_TYPE");// 奖惩类型
    String rewardContent = request.getParameter("paraMap1@0#REWARD_CONTENT");// 奖惩内容
    String remark = request.getParameter("paraMap1@0#REMARK");// 备注

    String userIds = request.getParameter("ids");// 奖惩员工ID
    
    String[] ids = userIds.split(",");

    int rewardCount = ids.length;// 奖惩员工数

    TableDataMapExt itemMap = new TableDataMapExt();

    // 保存奖惩信息到T_USER_REWARD表
    itemMap.setTableName("T_USER_REWARD");

    CommMethod.addSysDefCol(itemMap.getColMap(), modelAction.getUser());
    itemMap.getColMap().put("REWARD_CODE", rewardCode);
    itemMap.getColMap().put("REWARD_USER_ID", rewardUserId);
    itemMap.getColMap().put("REWARD_NAME", rewardName);
    itemMap.getColMap().put("REWARD_TYPE", rewardType);
    itemMap.getColMap().put("REWARD_CONTENT", rewardContent);
    itemMap.getColMap().put("REMARK", remark);
    itemMap.getColMap().put("REWARD_COUNT", rewardCount);

    String fileName = null;
    String realName = null; // 文件原有名称
    String fileAddress = null;
    float fileSize = 0;
    FileInputStream fis = null;
    FileOutputStream fos = null;
    
    try {
      itemMap.getColMap().put("REWARD_DATE", sdf.parse(rewardDate));
      if (modelAction.getUpFile() != null) {
        realName = modelAction.getUpFileFileName(); // 文件名称
        fileName = realName.substring(realName.lastIndexOf(".") + 1);
        fileName = StringUtils.getUUID() + "." + fileName; // 文件存放名称
        fileAddress = "rewardFile"; // 文件存放路径
        String realPath = modelAction.getRequest().getSession()
            .getServletContext()
            .getRealPath("up_load"+Constants.SEPARATOR+"comm"+Constants.SEPARATOR+"rewardFile");
        fis = new FileInputStream(modelAction.getUpFile());
        fileSize = fis.available(); // 文件大小
        // 上传文件到服务器
        File file = modelAction.getUpFile();
        File file1 = new File(realPath);
        if (!file1.exists() && !file1.isDirectory()) { // 判断文件夹是否存在，不存在则创建
          file1.mkdir();
        }
        // 上传文件
        String realPath1 = modelAction.getRequest().getSession()
            .getServletContext()
            .getRealPath("up_load"+Constants.SEPARATOR+"comm"+Constants.SEPARATOR+"rewardFile"+Constants.SEPARATOR + fileName);
        fos = new FileOutputStream(realPath1);
        BufferedInputStream bf = new BufferedInputStream(
            new FileInputStream(file));
        byte[] bt = new byte[1024];
        int n = bf.read(bt);
        while (n != -1) {
          fos.write(bt, 0, n);
          fos.flush();
          n = bf.read(bt);
        }
      }

      if (StringUtils.isNotBlank(dataAuth)) {
        itemMap.getColMap().put("DATA_AUTH", dataAuth);
      }
      if (StringUtils.isNotBlank(realName)) {
        itemMap.getColMap().put("REWARD_FILE_NAME", realName);
        itemMap.getColMap().put("REWARD_FILE_REAL_NAME", fileName);
        itemMap.getColMap().put("REWARD_FILE_PATH", fileAddress);
        itemMap.getColMap().put("REWARD_FILE_SIZE", fileSize);
      }

      modelService.save(itemMap);

      // 查询奖惩ID
      String getIdSql = "SELECT T.ID  "
          + " FROM T_USER_REWARD T WHERE T.REWARD_CODE=? and T.DATA_AUTH=?";
      List<Map> idList = modelService.listDataSql(getIdSql,
          new Object[] { rewardCode ,dataAuth});
      String rewardId = null;
      if(null!=idList && idList.size()>0) {
    	  rewardId = StringUtils.toString(idList.get(0).get("ID"));
      }
      

      // 保存奖惩员工信息到T_USER_REWARD_USER表

      for (int i = 0; i < ids.length; i++) {
        itemMap = new TableDataMapExt();
        itemMap.clear();
        itemMap.setTableName("T_USER_REWARD_USER");
        CommMethod.addSysDefCol(itemMap.getColMap(),
            modelAction.getUser());
        itemMap.getColMap().put("REWARD_ID", rewardId);
        itemMap.getColMap().put("USER_ID",
            ids[i].substring(ids[i].lastIndexOf("_") + 1));
        modelService.save(itemMap);
      }

    } catch (Exception e) {
      log.error(e);
      throw new BussException(modelAction.getText("新增失败"), e);
    } finally {
      try {
        if (fis != null) {
          fis.close();
        }
      } catch (Exception e) {
          log.error(e);
      }
      
      try {
        if (fos != null) {
          fos.close();
        }
      } catch (Exception e2) {
        log.error(e2);
      }
    }
    return modelAction.reloadIframeByIds(iframeId,
        modelAction.getText("新增成功"), isCloseWin);
  }
}