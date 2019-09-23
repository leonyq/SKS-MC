package com.more.mes.labelmanage.template;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.orm.hibernate3.HibernateTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.SpringContextUtil;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import com.more.mes.common.method.MCConstants;

/**
 * @Title 从本地选择.zip文件添加标签模板
 * @Description 〈功能详细描述〉
 * @ClassName AddTemplate
 * @author csh
 * @version 1.0 developer 2018-3-29 created
 * @see AddZipTemplate
 * @since 2018-3-29
 * @Copyright: Copyright (c) 2018
 * @Company: morelean
 */
public class AddZipTemplate implements FuncService
{
  private final Log log = LogFactory.getLog(this.getClass());

  @Override
  public String exeFunc(ModelAction modelAction, ModelService modelService)
  {
    String iframeId = modelAction.getRequest().getParameter("iframeId");
    String extensionName = modelAction.getUpFileFileName().substring(
      modelAction.getUpFileFileName().lastIndexOf(".") + 1);
    if (!"zip".equals(extensionName.toLowerCase()))
    {
      throw new BussException(modelAction.getText("请选择正确的.zip文件"));
    }
    File file = modelAction.getUpFile();
    String dataAuth = CommMethod.getSessionUser().getDeptId();

    HibernateTransactionManager tran = (HibernateTransactionManager)SpringContextUtil.getBean("transactionManager");
    DefaultTransactionDefinition def = new DefaultTransactionDefinition();
    def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRES_NEW);
    TransactionStatus status = null;

    String filePath = null;
    String mPath = null;
    String fileName = null;
    OutputStream os = null;
    InputStream is = null;
    InputStream bReader = null;
    File sf = null;
    if (null != file)
    {
      try
      {
        status = tran.getTransaction(def);

        is = new FileInputStream(file);
        if (null != is)
        {
          // 1K的数据缓冲
          byte[] bs = new byte[1024];
          // 读取到的数据长度
          int len;
          // 输出的文件流
          sf = new File(
            modelAction.getRequest().getSession().getServletContext().getRealPath(
              MCConstants.TEMPLATE_INTERIL_PATH));
          if (!sf.exists())
          {
            sf.mkdirs();
          }
          log.error("同步模板 流接收数据&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&---" + sf.getPath() + Constants.SEPARATOR + modelAction.getUpFileFileName());
          os = new FileOutputStream(sf.getPath() + Constants.SEPARATOR + modelAction.getUpFileFileName());
          // 开始读取
          while ((len = is.read(bs)) != -1)
          {
            os.write(bs, 0, len);
          }

          filePath = modelAction.getRequest().getSession().getServletContext().getRealPath(
            MCConstants.TEMPLATE_INTERIL_PATH)
                     + Constants.SEPARATOR + modelAction.getUpFileFileName();
          mPath = modelAction.getRequest().getSession().getServletContext().getRealPath(
            MCConstants.TEMPLATE_INTERIL_PATH);
          fileName = modelAction.getUpFileFileName().substring(0,
            (modelAction.getUpFileFileName().length() - 4));
          // 解压文件
          unZip(filePath, mPath, fileName);

          // 获取文件中数据信息
          String resultStr = "";
          File resFile = new File(mPath + Constants.SEPARATOR + fileName + Constants.SEPARATOR + fileName + Constants.SEPARATOR +"interil.txt");
          bReader = new FileInputStream(resFile);
          StringBuilder builder = new StringBuilder();
          byte[] buffer = new byte[1024*100];
          len = -1;
          while (-1 != (len = bReader.read(buffer)))
          {
            //builder.append(new String(buffer, 0, len, "UTF-8"));
            builder.append(new String(buffer, 0, len));
          }
          resultStr = builder.toString();

          /*
           File resFile = new File(mPath + "/" + fileName + "/" + fileName + "/interil.txt");
           bReader = new FileInputStream(resFile); StringBuilder builder = new StringBuilder();
           byte[] buffer = new byte[1024*100]; len = -1; while (-1 != (len =
           bReader.read(buffer))) { //builder.append(new String(buffer, 0, len, "UTF-8"));
           builder.append(new String(buffer, 0, len)); } resultStr = builder.toString();

          br = new BufferedReader(new InputStreamReader(new FileInputStream(mPath + "/" + fileName
                                                                            + "/" + fileName
                                                                            + "/interil.txt"),
            "UTF-8"));
          String line = null;
          while ((line = br.readLine()) != null)
          {
            stringBuffer.append(line);
          }
          resultStr = stringBuffer.toString();
           */
          log.error("同步模板 流接收数据---" + resultStr);
          if (StringUtils.isNotBlank(resultStr))
          {
            JSONObject jasonObject = JSONObject.fromObject(java.net.URLDecoder.decode(java.net.URLDecoder.decode(resultStr, "UTF-8"), "UTF-8"));
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            List<Map<String, Object>> temLsArrays = null;
            List<Map<String, Object>> dataItemLsArrays = null;
            List<Map<String, Object>> mprLsArrays = null;
            TableDataMapExt dataMapExt = null;
            Map dataMap = null;

            //jasonObject = JSONObject.fromObject(resultStr);
            // 标签模板信息
            temLsArrays = (List<Map<String, Object>>)jasonObject.get("temLs");
            if (null != temLsArrays && !temLsArrays.isEmpty())
            {
              String dataItemSql = "SELECT T.PICTURE_FLAG,T.PICTURE_PATH FROM ML_DATA_ITEMS T WHERE T.TEMPLATE_ID = ? "; 
              List<Map<String, Object>> dataItemLs = null;
              String temSql = "SELECT T.ID,T.SAMPLE_MAP FROM ML_TEMPLATE T WHERE T.DATA_AUTH = ? "; 
              List temIdLs = modelService.listDataSql(temSql, new Object[] {dataAuth.trim()});
              String temId = null;
              String sampleMap = null;
              Date editTime = null;
              Map oldTemMap = new HashMap<String, Date>();
              if (null != temIdLs && !temIdLs.isEmpty())
              {
                int size = temIdLs.size();
                Map temMap = null;
                for (int i = 0; i < size; i++ )
                {
                  temMap = (Map)temIdLs.get(i);
                  temId = StringUtils.toString(temMap.get("ID"));
                  sampleMap = StringUtils.toString(temMap.get("SAMPLE_MAP"));
                  oldTemMap.put(temId, sampleMap);
                }
              }
              
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

                  // 删除标签模板  ML_TEMPLATE
                  dataMapExt = new TableDataMapExt();
                  dataMapExt.setTableName("ML_TEMPLATE");
                  dataMapExt.setSqlWhere(" AND ID = '" + StringUtils.toString(temLsMap.get("ID"))
                                         + "' ");
                  modelService.del(dataMapExt);
                  //删除标签模板样例图
                  deleteFile(modelAction.getRequest().getSession().getServletContext().getRealPath(StringUtils.toString(oldTemMap.get(temLsMap.get("ID")))));

                  // 删除数据项信息  ML_DATA_ITEMS
                  dataItemLs = modelService.listDataSql(dataItemSql, new Object[] {temLsMap.get("ID")});
                  if (null!=dataItemLs && !dataItemLs.isEmpty())
                  {
                    for (Map dataItemMap : dataItemLs)
                    {
                      if ("Y".equals(dataItemMap.get("PICTURE_FLAG")))
                      {
                        //删除标签模板数据项图
                        deleteFile(modelAction.getRequest().getSession().getServletContext().getRealPath(MCConstants.DATAITEMPIC_PATH + dataItemMap.get("PICTURE_PATH")));
                        
                      }
                    }
                  }
                  dataMapExt = new TableDataMapExt();
                  dataMapExt.setTableName("ML_DATA_ITEMS");
                  dataMapExt.setSqlWhere(" AND TEMPLATE_ID = '"
                                         + StringUtils.toString(temLsMap.get("ID")) + "' ");
                  modelService.del(dataMapExt);

                  // 删除包装规则  ML_PACKAGING_RULES 
                  dataMapExt = new TableDataMapExt();
                  dataMapExt.setTableName("ML_PACKAGING_RULES");
                  dataMapExt.setSqlWhere(" AND ITEM_LABEL_ID = '"
                                         + StringUtils.toString(temLsMap.get("ID")) + "' ");
                  modelService.del(dataMapExt);
                  
                  dataMapExt = new TableDataMapExt();
                  dataMapExt.setTableName("ML_TEMPLATE");
                  dataMap = dataMapExt.getColMap();
                  dataMap.putAll(temLsMap);
                  dataMap.put("DATA_AUTH", dataAuth);
                  dataMap.put("LABELCSS", StringUtils.toString(temLsMap.get("LABELCSS")));
                  dataMap.put("CREATE_TIME", sdf.parse(temLsMap.get("CREATE_TIME").toString()));
                  dataMap.put("EDIT_TIME", sdf.parse(temLsMap.get("EDIT_TIME").toString()));
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
                      }else{
                           if("LABEL_LENGTH".equals(key) || "LABEL_WIDTH".equals(key) || "label_length".equals(key) || "label_width".equals(key)){
                                BigDecimal two1 = new BigDecimal(temLsMap.get(key).toString());
                                temLsMap.put(key, two1);
                            }
                        }
                    }
                    dataMapExt = new TableDataMapExt();
                    dataMapExt.setTableName("ML_DATA_ITEMS");
                    dataMap = dataMapExt.getColMap();
                    dataMap.putAll(temLsMap);
                    dataMap.put("DATA_AUTH", dataAuth);
                    dataMap.put("CREATE_TIME", sdf.parse(temLsMap.get("CREATE_TIME").toString()));
                    dataMap.put("EDIT_TIME", sdf.parse(temLsMap.get("EDIT_TIME").toString()));
                    modelService.save(dataMapExt);

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
                      
              // 获取文件中图片信息
              String sourcePath = mPath + Constants.SEPARATOR + fileName + Constants.SEPARATOR + fileName + Constants.SEPARATOR + "img"+ Constants.SEPARATOR +"img";
              String newpath = modelAction.getRequest().getSession().getServletContext().getRealPath(MCConstants.TEMPLATE_IMG_PATH);
              copyDir(sourcePath, newpath);
              sourcePath = mPath + Constants.SEPARATOR + fileName + Constants.SEPARATOR + fileName + Constants.SEPARATOR +"img"+ Constants.SEPARATOR +"dataItemPic";
              newpath = modelAction.getRequest().getSession().getServletContext().getRealPath(MCConstants.DATAITEMPIC_PATH);
              copyDir(sourcePath, newpath);

              tran.commit(status);
            }else{
              tran.rollback(status);
              log.error("同步模板出错------");
              throw new BussException(modelAction.getText("标签模板信息为空"));
            }
          }


        }
      }
      catch (Exception e)
      {
        tran.rollback(status);
        log.error("同步模板出错------", e);
        throw new BussException(modelAction.getText("同步模板出错"));
      }
      finally
      {
        try
        {
          if (os != null)
          {
            os.close();
          }
          if (bReader != null)
          {
            bReader.close();
          }
          if (is != null)
          {
            is.close();
          }
          if (null != filePath)
          {
            deleteFile(filePath);
          }
          if (null != mPath && null != fileName)
          {
            deleteDirectory(mPath + Constants.SEPARATOR + fileName);
          }
        }
        catch (IOException e)
        {
          log.error("同步模板关闭流出错------", e);
          throw new BussException(modelAction.getText("同步模板关闭流出错"));
        }
      }
      return modelAction.reloadIframeById(iframeId, modelAction.getText("同步模板成功"));
    }
    else
    {
      throw new BussException(modelAction.getText("同步模板出错"));
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
          os = new FileOutputStream(sf.getPath() + Constants.SEPARATOR + fileName);
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
   * 解压Zip文件
   * 
   * @param path
   *          文件目录
   */
  public void unZip(String path, String merchantUnZipPath, String fileDate)
  {
    String filePath = path + Constants.SEPARATOR + fileDate + ".zip";

    File file = new File(path);

    ZipFile zipFile = null;
    try
    {
      zipFile = new ZipFile(file, Charset.forName("UTF-8"));// 设置编码格式
      Enumeration e = zipFile.entries();
      while (e.hasMoreElements())
      {
        ZipEntry zipEntry = (ZipEntry)e.nextElement(); 
        //String name = zipEntry.getName().replaceAll("\\\\", Constants.SEPARATOR);
        //String name = zipEntry.getName();
        String name = null;
        String os = System.getProperty("os.name");
        if (os != null && os.toLowerCase().indexOf("linux") > -1) {
            name = zipEntry.getName().replaceAll("\\\\", Constants.SEPARATOR);
        } else {
            name = zipEntry.getName();
        }
        if (zipEntry.isDirectory())
        {
          name = name.substring(0, name.length() - 1);
          File file2 = new File(merchantUnZipPath + Constants.SEPARATOR + name);
          file2.mkdirs();
        }
        else
        {
          File file2 = new File(merchantUnZipPath + Constants.SEPARATOR + fileDate + Constants.SEPARATOR
                                + name);
          file2.getParentFile().mkdirs();
          file2.createNewFile();
          InputStream in = zipFile.getInputStream(zipEntry);
          FileOutputStream out = new FileOutputStream(file2);
          int length = 0;
          byte[] readByte = new byte[1024];
          try
          {
            while ((length = in.read(readByte, 0, 1024)) != -1)
            {
              out.write(readByte, 0, length);
            }
          }
            
          /*File file2 = new File(merchantUnZipPath + Constants.SEPARATOR + fileDate + Constants.SEPARATOR
                                + name);
          file2.getParentFile().mkdirs();
          file2.createNewFile();
          InputStream in = zipFile.getInputStream(zipEntry);
          InputStreamReader inputStreamReader = new InputStreamReader(in);
          FileOutputStream out = new FileOutputStream(file2);
          int length = 0;
          //byte[] readByte = new byte[1024];
          char[] bytes = new char[12];
          
          try
          {
        	String str = null;
            while ((length = inputStreamReader.read(bytes)) != -1)
            {
              str = new String(bytes,0,length);
              out.write(str.getBytes());
              out.flush();
            }
          }*/
          catch (Exception e2)
          {
            log.error("解压文件失败!", e2);
          }
          finally
          {
            try
            {
              if (out != null)
              {
                out.close();
              }
              if (in != null)
              {
                in.close();
              }

            }
            catch (Exception e1)
            {
              log.error("解压文件出错", e1);
            }
          }
        }
      }

    }
    catch (IOException e)
    {
      log.error("解压文件不存在!", e);
    }finally{
      try
      {
        if (null != zipFile)
        {
          zipFile.close();//如果不加上这句话，解压完删除不了
        }
      }
      catch (Exception e1)
      {
        log.error("解压文件出错", e1);
      }
    }
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

  /**
   * 删除目录以及目录下的文件
   * 
   * @param sPath
   *          被删除目录的路径
   * @return 目录删除成功返回true，否则返回false
   */
  public boolean deleteDirectory(String sPath)
  {
    // 如果sPath不以文件分隔符结尾，自动添加文件分隔符
    if (!sPath.endsWith(Constants.SEPARATOR))
    {
      sPath = sPath + Constants.SEPARATOR;
    }
    File dirFile = new File(sPath);
    // 如果dir对应的文件不存在，或者不是一个目录，则退出
    if (!dirFile.exists() || !dirFile.isDirectory())
    {
      return false;
    }
    boolean flag = true;
    // 删除文件夹下的所有文件(包括子目录)
    File[] files = dirFile.listFiles();
    for (int i = 0; i < files.length; i++ )
    {
      // 删除子文件
      if (files[i].isFile())
      {
        flag = deleteFile(files[i].getAbsolutePath());
        if (!flag) break;
      } // 删除子目录
      else
      {
        flag = deleteDirectory(files[i].getAbsolutePath());
        if (!flag) break;
      }
    }
    if (!flag) return false;
    // 删除当前目录
      return dirFile.delete();
  }

  /**
   * @Description: 复制文件夹
   * @param sourcePath
   * @param newPath
   * @throws IOException
   *           void
   * @throws
   */
  public void copyDir(String sourcePath, String newPath)
    throws IOException
  {
    File file = new File(sourcePath);
    String[] filePath = file.list();

    if (!(new File(newPath)).exists())
    {
      (new File(newPath)).mkdirs();
    }

    if (null!=filePath)
    {
      for (int i = 0; i < filePath.length; i++ )
      {
        if ((new File(sourcePath + Constants.SEPARATOR + filePath[i])).isDirectory())
        {
          copyDir(sourcePath + Constants.SEPARATOR + filePath[i], newPath + Constants.SEPARATOR + filePath[i]);
        }

        if (new File(sourcePath + Constants.SEPARATOR + filePath[i]).isFile())
        {
          copyFile(sourcePath + Constants.SEPARATOR + filePath[i], newPath + Constants.SEPARATOR + filePath[i]);
        }

      }
    }
    
  }

  /**
   * @Description: 复制文件
   * @param oldPath
   * @param newPath
   * @throws
   */
  public void copyFile(String oldPath, String newPath) {
    File oldFile = null;
    File file = null;
    FileInputStream in = null;
    FileOutputStream out = null;
    try
    {
      oldFile = new File(oldPath);
      file = new File(newPath);
      in = new FileInputStream(oldFile);
      out = new FileOutputStream(file);
      
    
      byte[] buffer = new byte[2097152];

      while ((in.read(buffer)) != -1)
      {
        out.write(buffer);
      }
    }
    catch (Exception e)
    {
      log.error("复制文件出错", e);
    }finally{
      try
      {
        if (null != out)
        {
          out.close();
        }
        if (null != in)
        {
          in.close();
        }
      }
      catch (Exception e2)
      {
        log.error("复制文件关闭流出错", e2);
      }
      
    }
    

  }
}
