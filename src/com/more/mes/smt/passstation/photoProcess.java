package com.more.mes.smt.passstation;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import com.more.fw.core.base.core.action.BaseActionSupport;
import com.more.fw.core.common.method.DateUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import com.more.fw.core.sysfa.usermessage.model.ProFuncDto;
import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.BussException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.dto.TableDataMapExt;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;
import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
/**
 *  
 * @author development
 *
 */
public class photoProcess implements FuncService {

    private final Log log = LogFactory.getLog(this.getClass());

    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
        HttpServletRequest request = modelAction.getRequest();
        
        //String workcenter = request.getParameter("workcenter");
        String path = request.getSession().getServletContext().getRealPath("/");
        String dir="up_load/comm/photoInfo/"+
        		DateUtil.formatDate(DateUtil.getCurDate(),"yyyy")+"/"+DateUtil.formatDate(DateUtil.getCurDate(),"MM")+
                "/"+DateUtil.formatDate(DateUtil.getCurDate(),"dd");
        /*String sql=" SELECT VALUE FROM SY_DICT_VAL WHERE DICT_CODE='PHOTO_IP' AND CODE=? ";
        List<Map> mList=modelService.listDataSql(sql,new Object[]{workcenter});
        if(mList!=null&&mList.size()>0){
            //"http://192.168.28.200:8080/N2/plf/page/fp/img/logo_blue.png"
            //mList.get(0).get("VALUE").toString()
            File mFile=downloadFile(mList.get(0).get("VALUE").toString(),path+dir,modelAction);
            if(mFile!=null){
                modelAction.setAjaxString(StringUtils.replace(mFile.getPath(),path,""));
            }
        }*/
        //复制文件夹内容到指定目录
        try {
        	File[] file = (new File("/Photo")).listFiles();
            int num = file.length;
            List<String> list = new ArrayList<String>();
            for(int i=0;i<num;i++){ 
            	if(file[i].isFile()&&ImageIO.read(file[i])!=null){
            		FileInputStream input = new FileInputStream("/Photo/"+file[i].getName());
            		String uid = StringUtils.getUUID();
            		File file1 = new File(path + dir+"/"+uid+".jpg");
                    if (!file1.getParentFile().exists()) {
                        file1.getParentFile().mkdirs();
                    }
            		FileOutputStream output = new FileOutputStream(path + dir +"/"+uid+".jpg"); 
            		byte[] b = new byte[1024 * 5]; 
            		int len; 
            		while ( (len = input.read(b)) != -1) { 
            		output.write(b, 0, len); 
            		} 
            		output.flush(); 
            		output.close(); 
            		input.close();
            		list.add(dir +"\\"+uid+".jpg");
            	}
            }
            for(int i=0;i<num;i++){
            	if(file[i].isFile()&&ImageIO.read(file[i])!=null){
            		file[i].delete();
            	}
            }
            modelAction.setAjaxString("OK");
            modelAction.setAjaxList(list);
		} catch (IOException e) {
			modelAction.setAjaxString("NG:"+e.getMessage());
            e.printStackTrace();
		}
        return BaseActionSupport.AJAX;
    }
    
    /**
     *
     * @param urlPath
     *            下载路径
     * @param downloadDir
     *            下载存放目录
     * @return 返回下载文件
     */
    public File downloadFile(String urlPath, String downloadDir,ModelAction modelAction) {
        File file = null;
        try {
            // 统一资源
            URL url = new URL(urlPath);
            // 连接类的父类，抽象类
            URLConnection urlConnection = url.openConnection();
            // http的连接类
            HttpURLConnection httpURLConnection = (HttpURLConnection) urlConnection;
            // 设定请求的方法，默认是GET
            httpURLConnection.setRequestMethod("GET");
            // 设置字符编码
            httpURLConnection.setRequestProperty("Charset", "UTF-8");
            // 打开到此 URL 引用的资源的通信链接（如果尚未建立这样的连接）。
            httpURLConnection.connect();

            // 文件大小
            int fileLength = httpURLConnection.getContentLength();

            // 文件名
            String filePathUrl = httpURLConnection.getURL().getFile();
            String fileFullName = filePathUrl.substring(filePathUrl.lastIndexOf(File.separatorChar) + 1);

            System.out.println("file length---->" + fileLength);

            URLConnection con = url.openConnection();
  
            BufferedInputStream bin = new BufferedInputStream(httpURLConnection.getInputStream());
         
             String temp[] = fileFullName.split("/"); /**split里面必须是正则表达式，"\\"的作用是对字符串转义*/

            String fileName = temp[temp.length-1];


            String path = downloadDir + File.separatorChar + StringUtils.getUUID()+".jpg"; 
            file = new File(path);
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            OutputStream out = new FileOutputStream(file);
            int size = 0;
            int len = 0;
            byte[] buf = new byte[1024];
            while ((size = bin.read(buf)) != -1) {
                len += size;
                out.write(buf, 0, size);
                // 打印下载百分比
                // System.out.println("下载了-------> " + len * 100 / fileLength +
                // "%\n");
            }
            bin.close();
            out.close();
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            modelAction.setAjaxString("NG:"+e.getMessage());
            e.printStackTrace(); 
        } catch (IOException e) {
            // TODO Auto-generated catch block
            modelAction.setAjaxString("NG:"+e.getMessage());
            e.printStackTrace(); 
        } finally {
            return file;
        }

    }
  
}
