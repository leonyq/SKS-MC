package com.more.mes.labelmanage.template;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate3.HibernateTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.mes.common.method.MCConstants;
import com.more.mes.labelmanage.tools.JsonTools;

/**
 * @Title 标签模板同步公用类
 * @Description 〈功能详细描述〉
 * @ClassName AddTemplate
 * @author csh
 * @version 1.0 developer 2018-3-29 created
 * @see SynchroTemplateAction
 * @since 2018-3-29
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class SynchroTemplateAction
{
  private final Log log = LogFactory.getLog(this.getClass());

  public Map synchroTemplate(String dataAuth, ModelService modelService)
  {

    HibernateTransactionManager tran = (HibernateTransactionManager)SpringContextUtil.getBean("transactionManager");
    DefaultTransactionDefinition def = new DefaultTransactionDefinition();
    def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRES_NEW);
    TransactionStatus status = null;
    String loginName = null;
    String pwd = null;
    String url = null;
    Map<String, Object> ajaxMap = new HashMap<String, Object>();
    URL restURL;

    String pathSql = "select  t.vr_class, t.vr_value from t_sys_parameter_ini t where t.vr_class = ? "
      + " and t.data_auth=? ";
    Map pathMap = modelService.queryForMap(pathSql,
      new Object[] {MCConstants.TEMPLATE_LABEL_PATH_PREFIX,dataAuth});
    if (null != pathMap && !pathMap.isEmpty())
    {
      url = pathMap.get("vr_value") + MCConstants.TEMPLATE_LABEL_PATH;
    }
    else
    {
      ajaxMap.put("res", "error");
      ajaxMap.put("msg", CommMethod.getText("访问标签云接口出错"));
      return ajaxMap;
    }

    //String userSql = "select  t.vr_class, t.vr_value from t_sys_parameter_ini t where t.vr_class in('"
      //               + MCConstants.LABBEL_LOGINNAME + "', '" + MCConstants.LABBEL_PWD + "') and t.data_auth=?";
      String userSql = "select  t.vr_class, t.vr_value from t_sys_parameter_ini t where t.vr_class in(?,?) and t.data_auth=?";
    List userLs = modelService.listDataSql(userSql, new Object[] {MCConstants.LABBEL_LOGINNAME ,MCConstants.LABBEL_PWD,dataAuth});
    if (null != userLs && !userLs.isEmpty())
    {
      int userLen = userLs.size();
      Map userMap = null;
      Map userInfoMap = new HashMap<String, Object>();
      for (int i = 0; i < userLen; i++ )
      {
        userMap = (Map)userLs.get(i);
        userInfoMap.put(userMap.get("VR_CLASS"), userMap.get("VR_VALUE"));
      }
      loginName = StringUtils.toString(userInfoMap.get(MCConstants.LABBEL_LOGINNAME));
      pwd = StringUtils.toString(userInfoMap.get(MCConstants.LABBEL_PWD));
    }
    else
    {
      ajaxMap.put("res", "error");
      ajaxMap.put("msg", CommMethod.getText("未查询到标签云用户信息"));
      return ajaxMap;
    }

    if (null != url && StringUtils.isNotBlank(loginName) && StringUtils.isNotBlank(pwd))
    {
      InputStream bReader = null;
      try
      {
        status = tran.getTransaction(def);
        restURL = new URL(url + "&FALG=getId&LOGIN_NAME=" + loginName + "&PWD=" + pwd);
        HttpURLConnection conn = (HttpURLConnection)restURL.openConnection();
        // 请求方式
        conn.setRequestMethod("POST");
        // 设置是否从httpUrlConnection读入，默认情况下是true;
        conn.setDoOutput(true);
        // allowUserInteraction 如果为 true，则在允许用户交互（例如弹出一个验证对话框）的上下文中对此 URL 进行检查。
        conn.setAllowUserInteraction(false);
        conn.setRequestProperty("Charset", "utf-8");

        String resultStr = "";
        bReader = conn.getInputStream();
        StringBuilder builder = new StringBuilder();
        byte[] buffer = new byte[1024];
        int len = -1;
        while (-1 != (len = bReader.read(buffer)))
        {
          builder.append(new String(buffer, 0, len, "UTF-8"));
        }
        resultStr = builder.toString();

        // log.error("同步模板 流接收数据---" + resultStr);
        if (StringUtils.isNotBlank(resultStr))
        {
          JSONObject jasonObject = JSONObject.fromObject(resultStr);
          Map<String, Object> map = JsonTools.parseJSON2Map(resultStr);
          String res = StringUtils.toString(map.get("RES"));
          if (MCConstants.SUCCESS_VAL.equals(res))
          {
            String path = StringUtils.toString(map.get("projectPath"));
            String paths = StringUtils.toString(map.get("projectPaths"));
            List<Map<String, Object>> datalsArrays = (List<Map<String, Object>>)jasonObject.get("temDataLs"); // 用户下模板的id及修改时间
            if (null != datalsArrays && !datalsArrays.isEmpty())
            {
              //String temSql = "SELECT T.ID,T.EDIT_TIME,T.SAMPLE_MAP FROM ML_TEMPLATE T WHERE T.DATA_AUTH = ? "; // 查询本地
              //List temIdLs = modelService.listDataSql(temSql, new Object[] {dataAuth.trim()});
              String temSql = "SELECT T.ID,T.EDIT_TIME,T.SAMPLE_MAP FROM ML_TEMPLATE T "; // 查询本地
              List temIdLs = modelService.listDataSql(temSql);
              String temId = null;
              String temEditTimeStr = null;
              String sampleMap = null;
              Date editTime = null;
              Map oldTemMap = new HashMap<String, Date>();
              SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
              if (null != temIdLs && !temIdLs.isEmpty())
              {
                int size = temIdLs.size();
                Map temMap = null;
                for (int i = 0; i < size; i++ )
                {
                  temMap = (Map)temIdLs.get(i);
                  temId = StringUtils.toString(temMap.get("ID"));
                  temEditTimeStr = StringUtils.toString(temMap.get("EDIT_TIME"));
                  sampleMap = StringUtils.toString(temMap.get("SAMPLE_MAP"));
                  editTime = sdf.parse(temEditTimeStr);
                  oldTemMap.put(temId, editTime);
                  oldTemMap.put("SAMPLE_MAP_" + temId, sampleMap);
                }
              }

              List<Map<String, Object>> temLsArrays = null;
              List<Map<String, Object>> dataItemLsArrays = null;
              List<Map<String, Object>> mprLsArrays = null;
              TableDataMapExt dataMapExt = null;
              Date oldTime = null;
              Map dataMap = null;
              String imgPath = null;
              String imgName = null;
              String dowmRes = null;
              String dataItemSql = "SELECT T.PICTURE_FLAG,T.PICTURE_PATH FROM ML_DATA_ITEMS T WHERE T.TEMPLATE_ID = ? ";
              List<Map<String, Object>> dataItemLs = null;
              for (Map temMap : datalsArrays)
              {
                temId = StringUtils.toString(temMap.get("ID"));
                temEditTimeStr = StringUtils.toString(temMap.get("EDIT_TIME"));
                editTime = sdf.parse(temEditTimeStr);
                oldTime = (Date)oldTemMap.get(temId);
                if (StringUtils.isNotBlank(oldTemMap.get(temId))
                    && editTime.getTime() != oldTime.getTime())
                {
                  // 删除标签模板 ML_TEMPLATE
                  dataMapExt = new TableDataMapExt();
                  dataMapExt.setTableName("ML_TEMPLATE");
                  dataMapExt.setSqlWhere(" AND ID = '" + temId + "' ");
                  modelService.del(dataMapExt);
                  // 删除标签模板样例图
                  deleteFile(Constants.getWEB_ROOT_PATH()
                    + StringUtils.toString(oldTemMap.get("SAMPLE_MAP_" + temId)));
                  
                  // 删除数据项信息 ML_DATA_ITEMS
                  dataItemLs = modelService.listDataSql(dataItemSql, new Object[] {temId});
                  if (null != dataItemLs && !dataItemLs.isEmpty())
                  {
                    for (Map dataItemMap : dataItemLs)
                    {
                      if ("Y".equals(dataItemMap.get("PICTURE_FLAG")))
                      {
                        // 删除标签模板数据项图
                        deleteFile(Constants.getWEB_ROOT_PATH()
                          + MCConstants.DATAITEMPIC_PATH_FW + dataItemMap.get("PICTURE_PATH"));

                      }
                    }
                  }
                  dataMapExt = new TableDataMapExt();
                  dataMapExt.setTableName("ML_DATA_ITEMS");
                  dataMapExt.setSqlWhere(" AND TEMPLATE_ID = '" + temId + "' ");
                  modelService.del(dataMapExt);

                  // 删除包装规则 ML_PACKAGING_RULES
                  dataMapExt = new TableDataMapExt();
                  dataMapExt.setTableName("ML_PACKAGING_RULES");
                  dataMapExt.setSqlWhere(" AND ITEM_LABEL_ID = '" + temId + "' ");
                  modelService.del(dataMapExt);
                  
                }
                if (StringUtils.isBlank(oldTemMap.get(temId))
                    || editTime.getTime() > oldTime.getTime())
                {
                  restURL = new URL(url + "&LOGIN_NAME=" + loginName + "&PWD=" + pwd + "&TEMID="
                                    + temId.trim());
                  conn = (HttpURLConnection)restURL.openConnection();
                  conn.setRequestMethod("POST");
                  // 设置是否从httpUrlConnection读入，默认情况下是true;
                  // conn.setDoOutput(true);
                  // allowUserInteraction 如果为 true，则在允许用户交互（例如弹出一个验证对话框）的上下文中对此 URL 进行检查。
                  conn.setAllowUserInteraction(false);

                  bReader = conn.getInputStream();
                  resultStr = "";
                  builder = new StringBuilder();
                  buffer = new byte[1024];
                  len = -1;
                  while (-1 != (len = bReader.read(buffer)))
                  {
                    builder.append(new String(buffer, 0, len, "UTF-8"));
                  }

                  resultStr = builder.toString();
                  if (StringUtils.isNotBlank(resultStr))
                  {
                    jasonObject = JSONObject.fromObject(resultStr);
                    res = StringUtils.toString(map.get("RES"));
                    if (MCConstants.SUCCESS_VAL.equals(res))
                    {
                      // 标签模板信息
                      temLsArrays = (List<Map<String, Object>>)jasonObject.get("temLs");
                      if (null != temLsArrays && !temLsArrays.isEmpty())
                      {
                        for (Map temLsMap : temLsArrays)
                        {
                          if (null != temLsMap && !temLsMap.isEmpty())
                          {
                            for (Object key : temLsMap.keySet())
                            {
                              if ("null".equals(temLsMap.get(key).toString()))
                              {
                                temLsMap.put(key, "");
                              }else{
                                  if("LABEL_LENGTH".equals(key) || "LABEL_WIDTH".equals(key) || "label_length".equals(key) || "label_width".equals(key)){
                                      BigDecimal two1 = new BigDecimal(temLsMap.get(key).toString());
                                      temLsMap.put(key, two1);
                                  }
                              }
                            }
                            dataMapExt = new TableDataMapExt();
                            dataMapExt.setTableName("ML_TEMPLATE");
                            dataMap = dataMapExt.getColMap();
                            dataMap.putAll(temLsMap);
                            dataMap.put("DATA_AUTH", dataAuth);
                            dataMap.put("LABELCSS", StringUtils.toString(temLsMap.get("LABELCSS")));
                            dataMap.put("CREATE_TIME",
                              sdf.parse(temLsMap.get("CREATE_TIME").toString()));
                            dataMap.put("EDIT_TIME",
                              sdf.parse(temLsMap.get("EDIT_TIME").toString()));
                            if(StringUtils.isNotBlank(temLsMap.get("LABEL_LENGTH"))){
                                dataMap.put("LABEL_LENGTH", StringUtils.toInteger(temLsMap.get("LABEL_LENGTH").toString()));
                            }else{
                          	  dataMap.remove("LABEL_LENGTH");
                            }
                            if(StringUtils.isNotBlank(temLsMap.get("LABEL_WIDTH"))){
                                dataMap.put("LABEL_WIDTH", StringUtils.toInteger(temLsMap.get("LABEL_WIDTH").toString()));
                            }else{
                          	  dataMap.remove("LABEL_WIDTH");
                            }
                            modelService.save(dataMapExt);

                            if (StringUtils.isNotBlank(temLsMap.get("SAMPLE_MAP")))
                            {
                              imgPath = Constants.getWEB_ROOT_PATH() +  MCConstants.TEMPLATE_IMG_PATH;
                              imgName = temLsMap.get("SAMPLE_MAP").toString().substring(
                                temLsMap.get("SAMPLE_MAP").toString().lastIndexOf("/") + 1);
                              dowmRes = download(path + "/" + temLsMap.get("SAMPLE_MAP"), imgName,
                                imgPath);
                              if (MCConstants.ERROR_VAL.equals(dowmRes))
                              {
                                tran.rollback(status);
                                ajaxMap.put("res", "error");
                                ajaxMap.put("msg", CommMethod.getText("同步样例图出错"));
                                return ajaxMap;
                              }
                            }
                          }
                        }
                      }
                      // 数据项名称信息
                      dataItemLsArrays = (List<Map<String, Object>>)jasonObject.get("dataItemLs");
                      if (null != dataItemLsArrays && !dataItemLsArrays.isEmpty())
                      {
                        for (Map temLsMap : dataItemLsArrays)
                        {
                          if (null != temLsMap && !temLsMap.isEmpty())
                          {
                            for (Object key : temLsMap.keySet())
                            {
                              if ("null".equals(temLsMap.get(key).toString()))
                              {
                                temLsMap.put(key, "");
                              }
                            }
                            dataMapExt = new TableDataMapExt();
                            dataMapExt.setTableName("ML_DATA_ITEMS");
                            dataMap = dataMapExt.getColMap();
                            dataMap.putAll(temLsMap);
                            dataMap.put("DATA_AUTH", dataAuth);
                            dataMap.put("CREATE_TIME",
                              sdf.parse(temLsMap.get("CREATE_TIME").toString()));
                            dataMap.put("EDIT_TIME",
                              sdf.parse(temLsMap.get("EDIT_TIME").toString()));
                            modelService.save(dataMapExt);

                            if ("Y".equals(temLsMap.get("PICTURE_FLAG"))
                                && StringUtils.isNotBlank(temLsMap.get("PICTURE_PATH")))
                            {
                              imgPath = Constants.getWEB_ROOT_PATH() + MCConstants.DATAITEMPIC_PATH;
                              imgName = temLsMap.get("PICTURE_PATH").toString();
                              dowmRes = download(
                                path + MCConstants.DATAITEMPIC_PATH_FW
                                  + temLsMap.get("PICTURE_PATH"), imgName, imgPath);
                              if (MCConstants.ERROR_VAL.equals(dowmRes))
                              {
                                ajaxMap.put("res", "error");
                                ajaxMap.put("msg", CommMethod.getText("同步数据项图出错"));
                                return ajaxMap;
                              }
                            }
                          }
                        }
                      }

                      // 包装规则
                      mprLsArrays = (List<Map<String, Object>>)jasonObject.get("mprLs");
                      if (null != mprLsArrays && !mprLsArrays.isEmpty())
                      {
                        for (Map mprLsMap : mprLsArrays)
                        {
                          if (null != mprLsMap && !mprLsMap.isEmpty())
                          {
                            for (Object key : mprLsMap.keySet())
                            {
                              if ("null".equals(mprLsMap.get(key).toString()))
                              {
                                mprLsMap.put(key, "");
                              }
                            }
                            dataMapExt = new TableDataMapExt();
                            dataMapExt.setTableName("ML_PACKAGING_RULES");
                            dataMap = dataMapExt.getColMap();
                            dataMap.putAll(mprLsMap);
                            dataMap.put("DATA_AUTH", dataAuth);
                            dataMap.put("CREATE_TIME",
                              sdf.parse(mprLsMap.get("CREATE_TIME").toString()));
                            dataMap.put("EDIT_TIME",
                              sdf.parse(mprLsMap.get("EDIT_TIME").toString()));
                            modelService.save(dataMapExt);

                          }
                        }
                      }
                    }
                  }

                }
              }

            }
            else
            {
              ajaxMap.put("res", "error");
              ajaxMap.put("msg", CommMethod.getText("未查询到用户相关标签模板"));
              return ajaxMap;
            }

          }
          else if (MCConstants.ERROR_VAL.equals(res))
          {
            ajaxMap.put("res", "error");
            ajaxMap.put("msg", CommMethod.getText("用户认证未通过"));
            return ajaxMap;
          }
          else
          {
            ajaxMap.put("res", "error");
            ajaxMap.put("msg", CommMethod.getText("获取标签模板数据异常"));
            return ajaxMap;
          }

        }

        tran.commit(status);
      }
      catch (Exception e)
      {
        tran.rollback(status);
        log.error("同步模板出错------", e);
        ajaxMap.put("res", "error");
        ajaxMap.put("msg", CommMethod.getText("同步模板出错"));
        return ajaxMap;
      }
      finally
      {
        try
        {
          if (bReader != null)
          {
            bReader.close();
          }
        }
        catch (IOException e)
        {
          log.error("同步模板关闭流出错------", e);
          ajaxMap.put("res", "error");
          ajaxMap.put("msg", CommMethod.getText("同步模板关闭流出错"));
          return ajaxMap;
        }
      }

      ajaxMap.put("res", "success");
      return ajaxMap;
    }
    else
    {
      ajaxMap.put("res", "error");
      ajaxMap.put("msg", CommMethod.getText("用户信息为空"));
      return ajaxMap;
    }
  }

  public static String download(String urlString, String fileName, String savePath) {
    OutputStream os = null;
    InputStream is = null;
    try
    {
      // 构造URL
      URL url = new URL(urlString);
      // 打开连接
      URLConnection con = url.openConnection();
      // 设置请求超时为5s
      con.setConnectTimeout(5 * 1000);
      if (((HttpURLConnection)con).getResponseCode() < 400)
      {
        // 输入流
        is = con.getInputStream();

        if (null != is)
        {
          // 1K的数据缓冲
          byte[] bs = new byte[1024];
          // 读取到的数据长度
          int len;
          // 输出的文件流
          File sf = new File(savePath);
          if (!sf.exists())
          {
            sf.mkdirs();
          }
          os = new FileOutputStream(sf.getPath() + "\\" + fileName);
          // 开始读取
          while ((len = is.read(bs)) != -1)
          {
            os.write(bs, 0, len);
          }
        }
      }
    }
    catch (Exception e)
    {
      return "NG";
    }
    finally
    {
      // 完毕，关闭所有链接
      try
      {
        if (null != os)
        {
          os.close();
        }
        if (null != is)
        {
          is.close();
        }
      }
      catch (Exception e2)
      {
        return "NG";
      }
    }
    return "OK";
  }

  /**
   * 删除单个文件
   * 
   * @param sPath
   *          被删除文件path
   * @return 删除成功返回true，否则返回false
   */
  public boolean deleteFile(String sPath)
  {
    boolean flag = false;
    File file = new File(sPath);
    // 路径为文件且不为空则进行删除
    if (file.isFile() && file.exists())
    {
      file.delete();
      flag = true;
    }
    return flag;
  }
}
