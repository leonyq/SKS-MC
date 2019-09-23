package com.more.mcmes.projectrel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.more.fw.core.base.core.action.ModelAction;
import com.more.fw.core.common.exception.AppException;
import com.more.fw.core.common.method.CommMethod;
import com.more.fw.core.common.method.Constants;
import com.more.fw.core.common.method.StringUtils;
import com.more.fw.core.dbo.model.service.ModelService;
import com.more.fw.core.dbo.model.service.impl.base.FuncService;

public class excelImpProject  implements FuncService {
    private final Log log = LogFactory.getLog(this.getClass());
    private int defNum=1;

    @SuppressWarnings("unchecked")
    @Override
    public String exeFunc(ModelAction modelAction, ModelService modelService) {
      
       int totalrow,totalcells;
       File f;
       HSSFWorkbook wk;
       HSSFSheet sheet;
       HSSFRow row_zero,row;
       HSSFCell cell_zero,cell;
       XSSFWorkbook xwk;
       XSSFSheet xsheet;
       XSSFRow xrow_zero,xrow;
       XSSFCell xcell_zero,xcell;
      ArrayList<Map<String, String>> datalist= new ArrayList<Map<String, String>>();
      ArrayList<String> keylist = new ArrayList<String>();
      InputStream input = null;
      String key = new String();
      String value = new String();
      Map<String, String> map; 
  
    
     
       f = modelAction.getUpFile();
       String suffix = modelAction.getUpFileFileName();
      try {
       int l =suffix.length();
       String str = suffix.substring(suffix.lastIndexOf("."),l); 
       log.error("前端file信息>>>>"+str);
       input = new FileInputStream(f);//将获取的文件转化为流
       
      if(str.equals(".xls")){//判断文件类型，当文件类型为。xls时
        wk = new HSSFWorkbook(input);
        for(int numsheet=0;numsheet<wk.getNumberOfSheets();numsheet++){
          sheet = wk.getSheetAt(numsheet);
          if(sheet == null){
            continue;
          }       
          totalrow = sheet.getLastRowNum();
          //读取第一行的key值
          row_zero = sheet.getRow(0);
          if(row_zero!=null){
                  totalcells = row_zero.getLastCellNum();
                    for(int c_0=0;c_0<totalcells;c_0++){
                    //  cell_zero = row_zero.getCell(c_0);
                    	cell_zero = row_zero.createCell(c_0);
                      key = cell_zero.toString();//key
                      keylist.add(key);
                    }
          }
          //读取每一行的具体数据  从第三行开始
                for(int rowNum=defNum;rowNum<totalrow+1;rowNum++){
                  map = new HashMap<String, String>();
                  row = sheet.getRow(rowNum);
                  if(row!=null){
                    
                    totalcells = row.getLastCellNum();
                    //读取列 从第一列开始
                    for(int c=0;c<totalcells;c++){
                      cell = row.getCell(c);
                      if(cell!=null){
                        cell.setCellType(cell.CELL_TYPE_STRING);
                        value = cell.toString().replace("\n", "").replace("\r", "");//value
                      }else{
                        value = "null";
                      }
                      map.put(keylist.get(c), value); 
                    }
                    datalist.add(map);
                  } 
                }
        } 
      }else if(str.equals(".xlsx")){
      
       xwk = new XSSFWorkbook(input);
        for(int numsheet=0;numsheet<xwk.getNumberOfSheets();numsheet++){
          xsheet = xwk.getSheetAt(numsheet);
          if(xsheet == null){
            continue;
          }       
          totalrow = xsheet.getLastRowNum();
          //读取第一行的key值
          xrow_zero = xsheet.getRow(0);
          if(xrow_zero!=null){
                  totalcells = xrow_zero.getLastCellNum();
                    for(short c_0=0;c_0<totalcells;c_0++){
                      xcell_zero = xrow_zero.getCell(c_0);
                      key = StringUtils.toString(xcell_zero);//key
                      keylist.add(key);
                    }
            
          }
          //读取xrow 从第2行开始
                for(int rowNum=defNum;rowNum<totalrow+1;rowNum++){
                  map = new HashMap<String, String>();
                  xrow = xsheet.getRow(rowNum);
                  if(xrow!=null){
                    
                    totalcells = xrow.getLastCellNum();
                    //读取列 从第一列开始
                    for(short c=0;c<totalcells;c++){
                      xcell = xrow.getCell(c);
                      if(xcell!=null){

                        xcell.setCellType(xcell.CELL_TYPE_STRING);
                        value = xcell.toString().replace("\n", "").replace("\r", "");//value 

                        value = StringUtils.toString(xcell);//value 

                      }else{
                        value = "null";
                      }
                      map.put(keylist.get(c), value.trim()); 
                    }
                    datalist.add(map);
                  } 
                }
        } 
        
      }else{
        throw new AppException("文件上传类型错误！");
      }
            
    } catch (FileNotFoundException e) {
       log.error("file文件问题>>>>"+e.getMessage());
      e.printStackTrace();
    } catch (IOException e) {
       log.error("file读写异常>>>>"+e.getMessage());
      e.printStackTrace();
    }

        /*HttpServletRequest request = modelAction.getRequest();
        List<Map<String, String>> resData = new ArrayList<Map<String, String>>();
        String dataId = modelAction.getDataId();
        try{
          // ExcelOpt excelopt = new ExcelOpt();
          List<Map<String, String>> excelData = readExcel(modelAction, modelService);
          
          for (Map map : excelData){
             Set s = map.keySet();
             Iterator<String> it = s.iterator();

          while (it.hasNext()) {
        	 String key=it.next();
             String value = (String)map.get(key);
        	 return modelAction.alertParentInfo(key+":"+value);
        	}
          }*/
          
        catch (Exception e){
           log.error("导入异常>>>>"+e.getMessage());
           return modelAction.alertParentInfo((modelAction.getText("文件格式不正确"+f)));
        }
        //  return addParentData(modelAction, CommMethod.bean2Json(resData));
          return modelAction.alertParentInfo("结束");
    }
  
  
   public String addParentData(ModelAction modelAction, String jsonData)
  {
    StringBuffer content = new StringBuffer();
    content.append("<script>");
    //content.append("try{");
    content.append("window.parent.addParentData('");
    content.append(jsonData);
    content.append("');");
    //content.append("}catch(e){alert(\"");
    //content.append("ERROR");
    //content.append("\");}");
    content.append("</script>");
    modelAction.outHtml(content.toString(), Constants.CHARACTER_ENCODING_UTF_8);
    return null;
  } 

  /**
  * 读取Excel数据
  */
   /*public List<Map<String, String>> readExcel(ModelAction modelaction, ModelService modelservice) {
    int totalrow,totalcells;
    File f;
    HSSFWorkbook wk;
    HSSFSheet sheet;
    HSSFRow row_zero,row;
    HSSFCell cell_zero,cell;
    XSSFWorkbook xwk;
    XSSFSheet xsheet;
    XSSFRow xrow_zero,xrow;
    XSSFCell xcell_zero,xcell;
    try {
      input = new FileInputStream(f);//将获取的文件转化为流
      if(str.equals(".xls")){//判断文件类型，当文件类型为。xls时
        wk = new HSSFWorkbook(input);
        for(int numsheet=0;numsheet<wk.getNumberOfSheets();numsheet++){
          sheet = wk.getSheetAt(numsheet);
          if(sheet == null){
            continue;
          }       
          totalrow = sheet.getLastRowNum();
          //读取第一行的key值
          row_zero = sheet.getRow(0);
          if(row_zero!=null){
                  totalcells = row_zero.getLastCellNum();
                    for(short c_0=0;c_0<totalcells;c_0++){
                      cell_zero = row_zero.getCell(c_0);
                      key = cell_zero.toString();//key
                      keylist.add(key);
                    }
          }
          //读取每一行的具体数据  从第三行开始
                for(int rowNum=defNum;rowNum<totalrow+1;rowNum++){
                  map = new HashMap<String, String>();
                  row = sheet.getRow(rowNum);
                  if(row!=null){
                    
                    totalcells = row.getLastCellNum();
                    //读取列 从第一列开始
                    for(short c=0;c<totalcells;c++){
                      cell = row.getCell(c);
                      if(cell!=null){
                        cell.setCellType(cell.CELL_TYPE_STRING);
                        value = cell.toString().replace("\n", "").replace("\r", "");//value
                      }else{
                        value = "null";
                      }
                      map.put(keylist.get(c), value); 
                    }
                    datalist.add(map);
                  } 
                }
        } 
      }else if(str.equals(".xlsx")){
        xwk = new XSSFWorkbook(input);
        for(int numsheet=0;numsheet<xwk.getNumberOfSheets();numsheet++){
          xsheet = xwk.getSheetAt(numsheet);
          if(xsheet == null){
            continue;
          }       
          totalrow = xsheet.getLastRowNum();
          //读取第一行的key值
          xrow_zero = xsheet.getRow(0);
          if(xrow_zero!=null){
                  totalcells = xrow_zero.getLastCellNum();
                    for(short c_0=0;c_0<totalcells;c_0++){
                      xcell_zero = xrow_zero.getCell(c_0);
                      key = StringUtils.toString(xcell_zero);//key
                      keylist.add(key);
                    }
            
          }
          //读取xrow 从第2行开始
                for(int rowNum=defNum;rowNum<totalrow+1;rowNum++){
                  map = new HashMap<String, String>();
                  xrow = xsheet.getRow(rowNum);
                  if(xrow!=null){
                    
                    totalcells = xrow.getLastCellNum();
                    //读取列 从第一列开始
                    for(short c=0;c<totalcells;c++){
                      xcell = xrow.getCell(c);
                      if(xcell!=null){

                        xcell.setCellType(xcell.CELL_TYPE_STRING);
                        value = xcell.toString().replace("\n", "").replace("\r", "");//value 

                        value = StringUtils.toString(xcell);//value 

                      }else{
                        value = "null";
                      }
                      map.put(keylist.get(c), value.trim()); 
                    }
                    datalist.add(map);
                    
                  } 
                }
        } 
        
      }else{
        throw new AppException("文件上传类型错误！");
      }
            
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
    ArrayList<Map<String, String>> datalist= new ArrayList<Map<String, String>>();
    ArrayList<String> keylist = new ArrayList<String>();
    InputStream input = null;
    String key = new String();
    String value = new String();
    Map<String, String> map; 
    //f = modelaction.getUpFile();
    String filepath = modelaction.getRequest().getParameter("filepath");
    f = new File(filepath);
    //String suffix = modelaction.getUpFileFileName();
    int l =filepath.length();
    String str = filepath.substring(filepath.lastIndexOf("."));   
  
     
    try {
      input = new FileInputStream(f);//将获取的文件转化为流
      if(str.equals(".xls")){//判断文件类型，当文件类型为。xls时
        wk = new HSSFWorkbook(input);
        for(int numsheet=0;numsheet<wk.getNumberOfSheets();numsheet++){
          sheet = wk.getSheetAt(numsheet);
          if(sheet == null){
            continue;
          }       
          totalrow = sheet.getLastRowNum();
          //读取第一行的key值
          row_zero = sheet.getRow(0);
          if(row_zero!=null){
                  totalcells = row_zero.getLastCellNum();
                    for(short c_0=0;c_0<totalcells;c_0++){
                      cell_zero = row_zero.getCell(c_0);
                      key = cell_zero.toString();//key
                      keylist.add(key);
                    }
          }
          //读取每一行的具体数据  从第三行开始
                for(int rowNum=defNum;rowNum<totalrow+1;rowNum++){
                  map = new HashMap<String, String>();
                  row = sheet.getRow(rowNum);
                  if(row!=null){
                    
                    totalcells = row.getLastCellNum();
                    //读取列 从第一列开始
                    for(short c=0;c<totalcells;c++){
                      cell = row.getCell(c);
                      if(cell!=null){
                        cell.setCellType(cell.CELL_TYPE_STRING);
                        value = cell.toString().replace("\n", "").replace("\r", "");//value
                      }else{
                        value = "null";
                      }
                      map.put(keylist.get(c), value); 
                    }
                    datalist.add(map);
                  } 
                }
        } 
      }else if(str.equals(".xlsx")){
        xwk = new XSSFWorkbook(input);
        for(int numsheet=0;numsheet<xwk.getNumberOfSheets();numsheet++){
          xsheet = xwk.getSheetAt(numsheet);
          if(xsheet == null){
            continue;
          }       
          totalrow = xsheet.getLastRowNum();
          //读取第一行的key值
          xrow_zero = xsheet.getRow(0);
          if(xrow_zero!=null){
                  totalcells = xrow_zero.getLastCellNum();
                    for(short c_0=0;c_0<totalcells;c_0++){
                      xcell_zero = xrow_zero.getCell(c_0);
                      key = StringUtils.toString(xcell_zero);//key
                      keylist.add(key);
                    }
            
          }
          //读取xrow 从第2行开始
                for(int rowNum=defNum;rowNum<totalrow+1;rowNum++){
                  map = new HashMap<String, String>();
                  xrow = xsheet.getRow(rowNum);
                  if(xrow!=null){
                    
                    totalcells = xrow.getLastCellNum();
                    //读取列 从第一列开始
                    for(short c=0;c<totalcells;c++){
                      xcell = xrow.getCell(c);
                      if(xcell!=null){

                        xcell.setCellType(xcell.CELL_TYPE_STRING);
                        value = xcell.toString().replace("\n", "").replace("\r", "");//value 

                        value = StringUtils.toString(xcell);//value 

                      }else{
                        value = "null";
                      }
                      map.put(keylist.get(c), value.trim()); 
                    }
                    datalist.add(map);
                    
                  } 
                }
        } 
        
      }else{
        throw new AppException("文件上传类型错误！");
      }
            
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
    return datalist;
        }*/
	

}
